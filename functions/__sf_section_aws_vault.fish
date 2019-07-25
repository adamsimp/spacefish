#
# Amazon Web Services (AWS) & AWS-Vault
#
# The AWS Command Line Interface (CLI) is a unified tool to manage AWS services.
# Link: https://aws.amazon.com/cli/

function __sf_section_aws_vault -d "Display the selected aws-vault profile"
	# ------------------------------------------------------------------------------
	# Configuration
	# ------------------------------------------------------------------------------

	__sf_util_set_default SPACEFISH_AWS_VAULT_SHOW true
	__sf_util_set_default SPACEFISH_AWS_VAULT_PREFIX "AWS-Vault "
	__sf_util_set_default SPACEFISH_AWS_VAULT_SUFFIX $SPACEFISH_PROMPT_DEFAULT_SUFFIX
	__sf_util_set_default SPACEFISH_AWS_VAULT_SYMBOL "☁️  "
	__sf_util_set_default SPACEFISH_AWS_VAULT_COLOR ff8700

	# ------------------------------------------------------------------------------
	# Section
	# ------------------------------------------------------------------------------

	# Show the selected AWS_VAULT profile
	[ $SPACEFISH_AWS_VAULT_SHOW = false ]; and return

	# Ensure the aws command is available
	type -q aws; or return

	# Early return if there's no AWS_PROFILE, or it's set to default
	if test -z "$AWS_VAULT" \
		-o "$AWS_VAULT" = "default"
		return
	end

	__sf_lib_section \
		$SPACEFISH_AWS_VAULT_COLOR \
		$SPACEFISH_AWS_VAULT_PREFIX \
		"$SPACEFISH_AWS_VAULT_SYMBOL""$AWS_VAULT" \
		$SPACEFISH_AWS_VAULT_SUFFIX
end
