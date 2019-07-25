source $DIRNAME/spacefish_test_setup.fish

function setup
	spacefish_test_setup
	mock aws \* 0
	set -g AWS_VAULT user1
end

test "Prints section when AWS_VAULT is set"
	(
		set_color --bold
		echo -n "AWS-Vault "
		set_color normal
		set_color --bold ff8700
		echo -n "☁️  user1"
		set_color normal
		set_color --bold
		echo -n " "
		set_color normal
	) = (__sf_section_aws_vault)
end

test "Doesn't print the section when AWS_VAULT isn't set"
	(
		set --erase AWS_VAULT
	) = (__sf_section_aws_vault)
end

test "Doesn't print the section when AWS_VAULT is set to \"default\""
	(
		set AWS_VAULT default
	) = (__sf_section_aws_vault)
end

test "Changing SPACEFISH_AWS_VAULT_SYMBOL changes the displayed character"
	(
		set SPACEFISH_AWS_VAULT_SYMBOL "· "

		set_color --bold
		echo -n "AWS-Vault "
		set_color normal
		set_color --bold ff8700
		echo -n "· user1"
		set_color normal
		set_color --bold
		echo -n " "
		set_color normal
	) = (__sf_section_aws_vault)
end

test "Changing SPACEFISH_AWS_VAULT_PREFIX changes the character prefix"
	(
		set sf_exit_code 0
		set SPACEFISH_AWS_VAULT_PREFIX ·

		set_color --bold
		echo -n "·"
		set_color normal
		set_color --bold ff8700
		echo -n "☁️  user1"
		set_color normal
		set_color --bold
		echo -n " "
		set_color normal
	) = (__sf_section_aws_vault)
end

test "Changing SPACEFISH_AWS_VAULT_SUFFIX changes the character suffix"
	(
		set sf_exit_code 0
		set SPACEFISH_AWS_VAULT_SUFFIX ·

		set_color --bold
		echo -n "AWS-Vault "
		set_color normal
		set_color --bold ff8700
		echo -n "☁️  user1"
		set_color normal
		set_color --bold
		echo -n "·"
		set_color normal
	) = (__sf_section_aws_vault)
end

test "doesn't display the section when SPACEFISH_AWS_VAULT_SHOW is set to \"false\""
	(
		set SPACEFISH_AWS_VAULT_SHOW false
	) = (__sf_section_aws_vault)
end
