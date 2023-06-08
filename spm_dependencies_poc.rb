$spm_dependencies_by_pod = {}
class Pod::Specification
  def spm_dependency(url: ,requirement: ,product_name:)
    @spm_dependencies ||= []
    @spm_dependencies << { url: url, requirement: requirement, product_name: product_name}

    $spm_dependencies_by_pod[self.name] = @spm_dependencies
  end
end

def log(msg)
  puts(" => {SPM} #{msg}")
end

module PodFileWithSpmDependencies
  def add_spm_to_target(project, target, url, requirement, product_name)
    pkg_class = Xcodeproj::Project::Object::XCRemoteSwiftPackageReference
    ref_class = Xcodeproj::Project::Object::XCSwiftPackageProductDependency
    pkg = project.root_object.package_references.find { |p| p.class == pkg_class && p.repositoryURL == url }
    if !pkg
      pkg = project.new(pkg_class)
      pkg.repositoryURL = url
      pkg.requirement = requirement
      log(" Requirement: #{requirement}")
      project.root_object.package_references << pkg
    end
    ref = target.package_product_dependencies.find { |r| r.class == ref_class && r.package == pkg && r.product_name == product_name }
    if !ref
      ref = project.new(ref_class)
      ref.package = pkg
      ref.product_name = product_name
      target.package_product_dependencies << ref
    end
  end
  
  def clean_spm_dependencies_from_target(project)
    # TODO: only clear the ones that are not in the podfile anymore
    project.root_object.package_references.delete_if { |pkg| pkg.class == Xcodeproj::Project::Object::XCRemoteSwiftPackageReference }
  end

  def post_install!(installer)
    super

    project = installer.pods_project

    log 'Cleaning old SPM dependencies from Pods project'
    clean_spm_dependencies_from_target(project)
    log 'Adding SPM dependencies to Pods project'
    $spm_dependencies_by_pod.each do |pod_name, dependencies|
      dependencies.each do |spm_spec|
        log "Adding SPM dependency #{spm_spec[:product_name]}"
        add_spm_to_target(
          project,
          project.targets.find { |t| t.name == pod_name},
          spm_spec[:url],
          spm_spec[:requirement],
          spm_spec[:product_name]
        )
      end
    end
  end
end

class Pod::Podfile
  prepend PodFileWithSpmDependencies
end