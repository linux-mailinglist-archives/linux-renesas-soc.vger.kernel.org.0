Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 89B115ED36E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Sep 2022 05:22:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230038AbiI1DWL (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 27 Sep 2022 23:22:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229736AbiI1DWK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 27 Sep 2022 23:22:10 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C089A3868D
        for <linux-renesas-soc@vger.kernel.org>; Tue, 27 Sep 2022 20:22:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1664335326; x=1695871326;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=fM9nGCfsYIJ8QldTGxFWeLyWfPLTFxJb8CCigvTgMso=;
  b=gYd0u3AlE9+0CmUHbh+MVeH+I/86yTtXYKtAqtlxk2LztpqeCh3Bxbct
   ehENwfQ5KJ6L6akpTrfjixKCdVN2tAgxPh80OgTShtyn2udWWEXE3Q7qw
   mkWW4Fj7hXl9RYv24DXnZStDB+BQ1jbSr3634izXWksxc1cwjZ0P3gJUS
   sKzQzreyk1PGUjB1M/v0EKXvjDvCvGmecqzIZAIFNCD10eeCMqEo7i+Nd
   9Ga04n3I4iG6by+ITPbiWCrFtt0MU3rHDb9R/L0nk1q7ThMrs7DQhOzZu
   nSSg9ydSXliuW96vyqz2OEzND29oCerszwOm6KHypxzkOVw4bDAR1ZKcg
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10483"; a="301469622"
X-IronPort-AV: E=Sophos;i="5.93,350,1654585200"; 
   d="scan'208";a="301469622"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2022 20:22:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10483"; a="572877375"
X-IronPort-AV: E=Sophos;i="5.93,350,1654585200"; 
   d="scan'208";a="572877375"
Received: from lkp-server02.sh.intel.com (HELO dfa2c9fcd321) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 27 Sep 2022 20:22:04 -0700
Received: from kbuild by dfa2c9fcd321 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1odNe7-0001ue-35;
        Wed, 28 Sep 2022 03:22:03 +0000
Date:   Wed, 28 Sep 2022 11:21:14 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:master] BUILD REGRESSION
 4bab94d9de7ebc326162bb803ed4e31048c1e4e7
Message-ID: <6333bdaa.m41J54ZBYLUAza6B%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git master
branch HEAD: 4bab94d9de7ebc326162bb803ed4e31048c1e4e7  [LOCAL] arm64: renesas: defconfig: Update renesas_defconfig

Error/Warning reports:

https://lore.kernel.org/linux-renesas-soc/202209280333.uubA0fRd-lkp@intel.com
https://lore.kernel.org/linux-renesas-soc/202209280343.s0XBfwUL-lkp@intel.com
https://lore.kernel.org/linux-renesas-soc/202209280415.NMslOpAO-lkp@intel.com
https://lore.kernel.org/llvm/202209280425.miMuYXaD-lkp@intel.com

Error/Warning: (recently discovered and may have been fixed)

drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc.c:4624:25: error: 'struct dc_debug_options' has no member named 'extended_blank_optimization'
drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_link_dp.c:2276:66: error: 'const struct dc_debug_options' has no member named 'fixed_vs_aux_delay_config_wa'
drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_link_dp.c:5041:33: error: 'struct dc_debug_options' has no member named 'lttpr_mode_override'
drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_link_dp.c:5316:28: error: 'const struct dc_debug_options' has no member named 'aux_wake_wa'
drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_stream.c:411:92: error: 'struct dc_debug_options' has no member named 'exit_idle_opt_for_cursor_updates'
drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dmub_psr.c:363:75: error: 'struct dc_debug_options' has no member named 'psr_power_use_phy_fsm'
drivers/gpu/drm/amd/amdgpu/../display/dc/dcn31/dcn31_resource.c:857:59: warning: missing braces around initializer [-Wmissing-braces]
drivers/gpu/drm/amd/amdgpu/../display/dc/dcn32/dcn32_resource.c:744:48: warning: excess elements in struct initializer
drivers/gpu/drm/amd/amdgpu/../display/dc/dcn32/dcn32_resource_helpers.c:49:18: warning: unused variable 'bytes_per_pixel' [-Wunused-variable]
drivers/gpu/drm/amd/amdgpu/../display/dc/dcn32/dcn32_resource_helpers.c:53:18: warning: unused variable 'bytes_in_mall' [-Wunused-variable]
drivers/gpu/drm/amd/amdgpu/../display/dc/dcn32/dcn32_resource_helpers.c:54:18: warning: unused variable 'num_mblks' [-Wunused-variable]
drivers/gpu/drm/amd/amdgpu/../display/dc/dcn32/dcn32_resource_helpers.c:55:18: warning: unused variable 'cache_lines_per_plane' [-Wunused-variable]
drivers/gpu/drm/amd/amdgpu/../display/dc/dcn32/dcn32_resource_helpers.c:56:18: warning: unused variable 'i' [-Wunused-variable]
drivers/gpu/drm/amd/amdgpu/../display/dc/dcn32/dcn32_resource_helpers.c:56:25: warning: unused variable 'j' [-Wunused-variable]
drivers/gpu/drm/amd/amdgpu/../display/dc/dcn32/dcn32_resource_helpers.c:60:9: warning: ISO C90 forbids mixed declarations and code [-Wdeclaration-after-statement]
drivers/gpu/drm/amd/amdgpu/../display/dc/dcn32/dcn32_resource_helpers.c:63:18: warning: unused variable 'mblk_height' [-Wunused-variable]
drivers/gpu/drm/amd/amdgpu/../display/dc/dcn32/dcn32_resource_helpers.c:66:18: warning: unused variable 'full_vp_height_blk_aligned' [-Wunused-variable]
drivers/gpu/drm/amd/amdgpu/../display/dc/dcn32/dcn32_resource_helpers.c:67:18: warning: unused variable 'mall_alloc_width_blk_aligned' [-Wunused-variable]
drivers/gpu/drm/amd/amdgpu/../display/dc/dcn32/dcn32_resource_helpers.c:68:18: warning: unused variable 'mall_alloc_height_blk_aligned' [-Wunused-variable]
drivers/gpu/drm/amd/amdgpu/../display/dc/dcn321/dcn321_resource.c:746:48: warning: excess elements in struct initializer
drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/smu_v13_0.c:223:1: error: version control conflict marker in file
drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/smu_v13_0_0_ppt.c:397:1: error: version control conflict marker in file
drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/smu_v13_0_0_ppt.c:401:9: error: 'ret' undeclared (first use in this function); did you mean 'rect'?
drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/smu_v13_0_0_ppt.c:414:31: warning: unused variable 'adev' [-Wunused-variable]
drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/smu_v13_0_0_ppt.c:427:10: error: 'table' undeclared (first use in this function)
drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/smu_v13_0_0_ppt.c:427:18: error: 'combo_pptable' undeclared (first use in this function); did you mean 'pmd_pgtable'?
drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/smu_v13_0_0_ppt.c:428:10: error: 'size' undeclared (first use in this function); did you mean 'ksize'?
drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/smu_v13_0_0_ppt.c:433:12: error: redefinition of 'smu_v13_0_0_setup_pptable'
drivers/gpu/drm/amd/amdgpu/amdgpu_device.c:2465:1: error: version control conflict marker in file
drivers/gpu/drm/amd/amdgpu/amdgpu_display.c:42:1: error: version control conflict marker in file
drivers/gpu/drm/i915/display/icl_dsi.c:1850:39: error: 'gen11_dsi_host_ops' defined but not used [-Werror=unused-const-variable=]
drivers/gpu/drm/i915/display/icl_dsi.c:1850:39: warning: 'gen11_dsi_host_ops' defined but not used [-Wunused-const-variable=]
drivers/gpu/drm/i915/display/icl_dsi.c:1864:13: error: 'icl_dphy_param_init' defined but not used [-Werror=unused-function]
drivers/gpu/drm/i915/display/icl_dsi.c:2079:1: error: version control conflict marker in file
drivers/gpu/drm/i915/display/icl_dsi.c:2086:18: error: 'struct intel_dsi' has no member named 'dcs_cabc_ports'
drivers/gpu/drm/i915/display/intel_backlight.c:21:1: error: version control conflict marker in file
drivers/gpu/drm/i915/display/intel_backlight.c:69:20: error: implicit declaration of function 'scale' [-Werror=implicit-function-declaration]
drivers/gpu/drm/i915/display/intel_bios.c:1619:13: error: 'parse_dsi_backlight_ports' defined but not used [-Werror=unused-function]
drivers/gpu/drm/i915/display/intel_bios.c:1623:19: error: unused variable 'port_bc' [-Werror=unused-variable]
drivers/gpu/drm/i915/display/intel_bios.c:1623:19: warning: unused variable 'port_bc' [-Wunused-variable]
drivers/gpu/drm/i915/display/intel_bios.c:1625:1: error: version control conflict marker in file
drivers/gpu/drm/i915/display/intel_bios.c:2149:1: error: ISO C90 forbids mixed declarations and code [-Werror=declaration-after-statement]
drivers/gpu/drm/i915/display/intel_bios.c:2149:1: warning: ISO C90 forbids mixed declarations and code [-Wdeclaration-after-statement]
drivers/gpu/drm/i915/display/intel_bios.c:2191:11: error: invalid storage class for function 'map_ddc_pin'
drivers/gpu/drm/i915/display/intel_bios.c:2214:31: error: 'cnp_ddc_pin_map' undeclared (first use in this function); did you mean 'icp_ddc_pin_map'?
drivers/gpu/drm/i915/display/intel_bios.c:2230:18: error: invalid storage class for function 'get_port_by_ddc_pin'
drivers/gpu/drm/i915/display/intel_bios.c:2248:13: error: invalid storage class for function 'sanitize_ddc_pin'
drivers/gpu/drm/i915/display/intel_bios.c:2296:18: error: invalid storage class for function 'get_port_by_aux_ch'
drivers/gpu/drm/i915/display/intel_bios.c:2314:13: error: invalid storage class for function 'sanitize_aux_ch'
drivers/gpu/drm/i915/display/intel_bios.c:2346:11: error: invalid storage class for function 'dvo_port_type'
drivers/gpu/drm/i915/display/intel_bios.c:2379:18: error: invalid storage class for function '__dvo_port_to_port'
drivers/gpu/drm/i915/display/intel_bios.c:2398:18: error: invalid storage class for function 'dvo_port_to_port'
drivers/gpu/drm/i915/display/intel_bios.c:2474:12: error: invalid storage class for function 'parse_bdb_230_dp_max_link_rate'
drivers/gpu/drm/i915/display/intel_bios.c:2497:12: error: invalid storage class for function 'parse_bdb_216_dp_max_link_rate'
drivers/gpu/drm/i915/display/intel_bios.c:2512:12: error: invalid storage class for function '_intel_bios_dp_max_link_rate'
drivers/gpu/drm/i915/display/intel_bios.c:2523:12: error: invalid storage class for function '_intel_bios_dp_max_lane_count'
drivers/gpu/drm/i915/display/intel_bios.c:2531:13: error: invalid storage class for function 'sanitize_device_type'
drivers/gpu/drm/i915/display/intel_bios.c:2553:1: error: invalid storage class for function 'intel_bios_encoder_supports_crt'
drivers/gpu/drm/i915/display/intel_bios.c:2578:1: error: invalid storage class for function 'intel_bios_encoder_supports_edp'
drivers/gpu/drm/i915/display/intel_bios.c:2584:12: error: invalid storage class for function '_intel_bios_hdmi_level_shift'
drivers/gpu/drm/i915/display/intel_bios.c:2592:12: error: invalid storage class for function '_intel_bios_max_tmds_clock'
drivers/gpu/drm/i915/display/intel_bios.c:2616:13: error: invalid storage class for function 'is_port_valid'
drivers/gpu/drm/i915/display/intel_bios.c:2629:13: error: invalid storage class for function 'print_ddi_port'
drivers/gpu/drm/i915/display/intel_bios.c:2686:13: error: invalid storage class for function 'parse_ddi_port'
drivers/gpu/drm/i915/display/intel_bios.c:2721:13: error: invalid storage class for function 'has_ddi_port_info'
drivers/gpu/drm/i915/display/intel_bios.c:2726:13: error: invalid storage class for function 'parse_ddi_ports'
drivers/gpu/drm/i915/display/intel_bios.c:2744:1: error: invalid storage class for function 'parse_general_definitions'
drivers/gpu/drm/i915/display/intel_bios.c:2844:1: error: invalid storage class for function 'init_vbt_defaults'
drivers/gpu/drm/i915/display/intel_bios.c:2869:1: error: invalid storage class for function 'init_vbt_panel_defaults'
drivers/gpu/drm/i915/display/intel_bios.c:2880:1: error: invalid storage class for function 'init_vbt_missing_defaults'
drivers/gpu/drm/i915/display/intel_bios.c:2936:33: error: invalid storage class for function 'get_bdb_header'
drivers/gpu/drm/i915/display/intel_bios.c:2992:27: error: invalid storage class for function 'spi_oprom_get_vbt'
drivers/gpu/drm/i915/display/intel_bios.c:3049:27: error: invalid storage class for function 'oprom_get_vbt'
drivers/gpu/drm/i915/display/intel_bios.c:3118:6: error: 'intel_bios_init' defined but not used [-Werror=unused-function]
drivers/gpu/drm/i915/display/intel_bios.c:3167:9: error: implicit declaration of function 'parse_compression_parameters' [-Werror=implicit-function-declaration]
drivers/gpu/drm/i915/display/intel_bios.c:3183:6: error: 'intel_bios_init_panel' defined but not used [-Werror=unused-function]
drivers/gpu/drm/i915/display/intel_bios.c:3201:9: error: implicit declaration of function 'parse_mipi_config' [-Werror=implicit-function-declaration]
drivers/gpu/drm/i915/display/intel_bios.c:3202:9: error: implicit declaration of function 'parse_mipi_sequence' [-Werror=implicit-function-declaration]
drivers/gpu/drm/i915/display/intel_bios.c:3209:6: error: 'intel_bios_driver_remove' defined but not used [-Werror=unused-function]
drivers/gpu/drm/i915/display/intel_bios.c:3226:6: error: 'intel_bios_fini_panel' defined but not used [-Werror=unused-function]
drivers/gpu/drm/i915/display/intel_bios.c:3249:6: error: 'intel_bios_is_tv_present' defined but not used [-Werror=unused-function]
drivers/gpu/drm/i915/display/intel_bios.c:3292:6: error: 'intel_bios_is_lvds_present' defined but not used [-Werror=unused-function]
drivers/gpu/drm/i915/display/intel_bios.c:3341:6: error: 'intel_bios_is_port_present' defined but not used [-Werror=unused-function]
drivers/gpu/drm/i915/display/intel_bios.c:3356:6: error: 'intel_bios_is_port_edp' defined but not used [-Werror=unused-function]
drivers/gpu/drm/i915/display/intel_bios.c:3364:13: error: invalid storage class for function 'intel_bios_encoder_supports_dp_dual_mode'
drivers/gpu/drm/i915/display/intel_bios.c:3383:6: error: 'intel_bios_is_port_dp_dual_mode' defined but not used [-Werror=unused-function]
drivers/gpu/drm/i915/display/intel_bios.c:3399:6: error: 'intel_bios_is_dsi_present' defined but not used [-Werror=unused-function]
drivers/gpu/drm/i915/display/intel_bios.c:3432:13: error: invalid storage class for function 'fill_dsc'
drivers/gpu/drm/i915/display/intel_bios.c:3497:6: error: 'intel_bios_get_dsc_params' defined but not used [-Werror=unused-function]
drivers/gpu/drm/i915/display/intel_bios.c:3533:1: error: 'intel_bios_is_port_hpd_inverted' defined but not used [-Werror=unused-function]
drivers/gpu/drm/i915/display/intel_bios.c:3553:1: error: 'intel_bios_is_lspcon_present' defined but not used [-Werror=unused-function]
drivers/gpu/drm/i915/display/intel_bios.c:3569:1: error: 'intel_bios_is_lane_reversal_needed' defined but not used [-Werror=unused-function]
drivers/gpu/drm/i915/display/intel_bios.c:3577:13: error: 'intel_bios_port_aux_ch' defined but not used [-Werror=unused-function]
drivers/gpu/drm/i915/display/intel_bios.c:3671:5: error: 'intel_bios_max_tmds_clock' defined but not used [-Werror=unused-function]
drivers/gpu/drm/i915/display/intel_bios.c:3680:5: error: 'intel_bios_hdmi_level_shift' defined but not used [-Werror=unused-function]
drivers/gpu/drm/i915/display/intel_bios.c:3688:5: error: 'intel_bios_encoder_dp_boost_level' defined but not used [-Werror=unused-function]
drivers/gpu/drm/i915/display/intel_bios.c:3693:16: error: implicit declaration of function 'translate_iboost' [-Werror=implicit-function-declaration]
drivers/gpu/drm/i915/display/intel_bios.c:3696:5: error: 'intel_bios_encoder_hdmi_boost_level' defined but not used [-Werror=unused-function]
drivers/gpu/drm/i915/display/intel_bios.c:3704:5: error: 'intel_bios_dp_max_link_rate' defined but not used [-Werror=unused-function]
drivers/gpu/drm/i915/display/intel_bios.c:3712:5: error: 'intel_bios_dp_max_lane_count' defined but not used [-Werror=unused-function]
drivers/gpu/drm/i915/display/intel_bios.c:3720:5: error: 'intel_bios_alternate_ddc_pin' defined but not used [-Werror=unused-function]
drivers/gpu/drm/i915/display/intel_bios.c:3731:6: error: 'intel_bios_encoder_supports_typec_usb' defined but not used [-Werror=unused-function]
drivers/gpu/drm/i915/display/intel_bios.c:3736:6: error: 'intel_bios_encoder_supports_tbt' defined but not used [-Werror=unused-function]
drivers/gpu/drm/i915/display/intel_bios.c:3742:1: error: 'intel_bios_encoder_data_lookup' defined but not used [-Werror=unused-function]
drivers/gpu/drm/i915/display/intel_bios.c:3745:1: error: expected declaration or statement at end of input
drivers/gpu/drm/i915/display/intel_bw.c:468:39: error: unused variable 'bi' [-Werror=unused-variable]
drivers/gpu/drm/i915/display/intel_bw.c:468:39: warning: unused variable 'bi' [-Wunused-variable]
drivers/gpu/drm/i915/display/intel_bw.c:471:21: error: unused variable 'j' [-Werror=unused-variable]
drivers/gpu/drm/i915/display/intel_bw.c:471:21: warning: unused variable 'j' [-Wunused-variable]
drivers/gpu/drm/i915/display/intel_bw.c:476:1: error: version control conflict marker in file
drivers/gpu/drm/i915/display/intel_bw.c:486:25: error: expected '}' before 'else'
drivers/gpu/drm/i915/display/intel_bw.c:490:17: error: 'bi' undeclared (first use in this function); did you mean 'i'?
drivers/gpu/drm/i915/display/intel_bw.c:493:22: error: 'j' undeclared (first use in this function)
drivers/gpu/drm/i915/display/intel_bw.c:504:37: error: 'clpchgroup' undeclared (first use in this function); did you mean 'clperchgroup'?
drivers/gpu/drm/i915/display/intel_bw.c:531:9: error: expected identifier or '(' before 'if'
drivers/gpu/drm/i915/display/intel_bw.c:533:9: error: expected identifier or '(' before 'else'
drivers/gpu/drm/i915/display/intel_bw.c:536:9: error: expected identifier or '(' before 'return'
drivers/gpu/drm/i915/display/intel_bw.c:537:1: error: expected identifier or '(' before '}' token
drivers/gpu/drm/i915/display/vlv_dsi.c:1938:1: error: version control conflict marker in file
drivers/gpu/drm/i915/display/vlv_dsi.c:1945:18: error: 'struct intel_dsi' has no member named 'dcs_cabc_ports'
drivers/gpu/drm/i915/display/vlv_dsi.c:2017:1: error: label 'err' defined but not used [-Werror=unused-label]
drivers/gpu/drm/i915/display/vlv_dsi.c:2017:1: warning: label 'err' defined but not used [-Wunused-label]
drivers/gpu/drm/i915/display/vlv_dsi.c:213:39: error: 'intel_dsi_host_ops' defined but not used [-Werror=unused-const-variable=]
drivers/gpu/drm/i915/display/vlv_dsi.c:213:39: warning: 'intel_dsi_host_ops' defined but not used [-Wunused-const-variable=]
drivers/gpu/drm/i915/intel_pm.c:3579:13: error: 'ilk_initial_watermarks' defined but not used [-Werror=unused-function]
drivers/gpu/drm/i915/intel_pm.c:3592:13: error: 'ilk_optimize_watermarks' defined but not used [-Werror=unused-function]
drivers/gpu/drm/i915/intel_pm.c:3608:13: error: 'ilk_pipe_wm_get_hw_state' defined but not used [-Werror=unused-function]
drivers/gpu/drm/i915/intel_pm.c:3682:13: error: 'vlv_read_wm_values' defined but not used [-Werror=unused-function]
drivers/gpu/drm/i915/intel_pm.c:3761:28: error: unused variable 'crtc' [-Werror=unused-variable]
drivers/gpu/drm/i915/intel_pm.c:3761:28: warning: unused variable 'crtc' [-Wunused-variable]
drivers/gpu/drm/i915/intel_pm.c:3765:1: error: version control conflict marker in file
drivers/gpu/drm/i915/intel_pm.c:3770:18: error: 'new_bw_state' undeclared (first use in this function); did you mean 'intel_bw_state'?
drivers/gpu/drm/i915/intel_pm.c:3773:21: error: 'old_mask' undeclared (first use in this function); did you mean 'field_mask'?
drivers/gpu/drm/i915/intel_pm.c:3773:31: error: 'new_mask' undeclared (first use in this function); did you mean 'next_task'?
drivers/gpu/drm/i915/intel_pm.c:3781:9: error: implicit declaration of function 'icl_pcode_restrict_qgv_points' [-Werror=implicit-function-declaration]
drivers/gpu/drm/i915/intel_pm.c:3795:14: error: implicit declaration of function 'intel_has_sagv' [-Werror=implicit-function-declaration]
drivers/gpu/drm/i915/intel_pm.c:3799:17: error: implicit declaration of function 'icl_sagv_pre_plane_update'; did you mean 'intel_sagv_pre_plane_update'? [-Werror=implicit-function-declaration]
drivers/gpu/drm/i915/intel_pm.c:3801:17: error: implicit declaration of function 'skl_sagv_pre_plane_update'; did you mean 'intel_sagv_pre_plane_update'? [-Werror=implicit-function-declaration]
drivers/gpu/drm/i915/intel_pm.c:3819:17: error: implicit declaration of function 'icl_sagv_post_plane_update'; did you mean 'intel_sagv_post_plane_update'? [-Werror=implicit-function-declaration]
drivers/gpu/drm/i915/intel_pm.c:3821:17: error: implicit declaration of function 'skl_sagv_post_plane_update'; did you mean 'intel_sagv_post_plane_update'? [-Werror=implicit-function-declaration]
drivers/gpu/drm/i915/intel_pm.c:3911:21: error: invalid use of undefined type 'const struct intel_bw_state'
drivers/gpu/drm/i915/intel_pm.c:3929:30: error: assignment to 'struct intel_bw_state *' from 'int' makes pointer from integer without a cast [-Werror=int-conversion]
drivers/gpu/drm/i915/intel_pm.c:3929:30: warning: assignment to 'struct intel_bw_state *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
drivers/gpu/drm/i915/intel_pm.c:3929:32: error: implicit declaration of function 'intel_atomic_get_bw_state'; did you mean 'intel_atomic_get_dbuf_state'? [-Werror=implicit-function-declaration]
drivers/gpu/drm/i915/intel_pm.c:3933:30: error: assignment to 'const struct intel_bw_state *' from 'int' makes pointer from integer without a cast [-Werror=int-conversion]
drivers/gpu/drm/i915/intel_pm.c:3933:30: warning: assignment to 'const struct intel_bw_state *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
drivers/gpu/drm/i915/intel_pm.c:3933:32: error: implicit declaration of function 'intel_atomic_get_old_bw_state'; did you mean 'intel_atomic_get_old_dbuf_state'? [-Werror=implicit-function-declaration]
drivers/gpu/drm/i915/intel_pm.c:3936:37: error: invalid use of undefined type 'struct intel_bw_state'
drivers/gpu/drm/i915/intel_pm.c:4159:20: error: assignment to 'struct intel_crtc_state *' from 'int' makes pointer from integer without a cast [-Werror=int-conversion]
drivers/gpu/drm/i915/intel_pm.c:4159:20: warning: assignment to 'struct intel_crtc_state *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
drivers/gpu/drm/i915/intel_pm.c:4159:22: error: implicit declaration of function 'intel_atomic_get_crtc_state'; did you mean 'intel_atomic_get_dbuf_state'? [-Werror=implicit-function-declaration]
drivers/gpu/drm/i915/intel_pm.c:4181:12: warning: 'skl_compute_wm_params' used but never defined
drivers/gpu/drm/i915/intel_pm.c:4184:63: warning: 'struct skl_wm_params' declared inside parameter list will not be visible outside of this definition or declaration
drivers/gpu/drm/i915/intel_pm.c:4187:13: warning: 'skl_compute_plane_wm' used but never defined
drivers/gpu/drm/i915/intel_pm.c:4204:30: error: storage size of 'wp' isn't known
drivers/gpu/drm/i915/intel_pm.c:4204:30: error: unused variable 'wp' [-Werror=unused-variable]
drivers/gpu/drm/i915/intel_pm.c:4204:30: warning: unused variable 'wp' [-Wunused-variable]
drivers/gpu/drm/i915/intel_pm.c:4214:50: error: 'struct drm_i915_private' has no member named 'wm'; did you mean 'wq'?
drivers/gpu/drm/i915/intel_pm.c:4261:13: error: 'skl_pipe_ddb_get_hw_state' defined but not used [-Werror=unused-function]
drivers/gpu/drm/i915/intel_pm.c:5119:8: error: unknown type name 'uint_fixed_16_16_t'
drivers/gpu/drm/i915/intel_pm.c:5127:24: error: 'FP_16_16_MAX' undeclared (first use in this function)
drivers/gpu/drm/i915/intel_pm.c:5130:15: error: implicit declaration of function 'div_fixed16' [-Werror=implicit-function-declaration]
drivers/gpu/drm/i915/intel_pm.c:5133:23: error: implicit declaration of function 'add_fixed16_u32' [-Werror=implicit-function-declaration]
drivers/gpu/drm/i915/intel_pm.c:5164:24: error: implicit declaration of function 'u32_to_fixed16' [-Werror=implicit-function-declaration]
drivers/gpu/drm/i915/intel_pm.c:5178:1: error: conflicting types for 'skl_compute_wm_params'; have 'int(const struct intel_crtc_state *, int,  const struct drm_format_info *, u64,  unsigned int,  u32,  struct skl_wm_params *, int)' {aka 'int(const struct intel_crtc_state *, int,  const struct drm_format_info *, long long unsigned int,  unsigned int,  unsigned int,  struct skl_wm_params *, int)'}
drivers/gpu/drm/i915/intel_pm.c:5190:14: error: implicit declaration of function 'intel_format_info_is_yuv_semiplanar'; did you mean 'drm_format_info_is_yuv_semiplanar'? [-Werror=implicit-function-declaration]
drivers/gpu/drm/i915/intel_pm.c:5196:11: error: invalid use of undefined type 'struct skl_wm_params'
drivers/gpu/drm/i915/intel_pm.c:5219:13: error: implicit declaration of function 'drm_rotation_90_or_270' [-Werror=implicit-function-declaration]
drivers/gpu/drm/i915/intel_pm.c:5238:13: error: implicit declaration of function 'skl_needs_memory_bw_wa' [-Werror=implicit-function-declaration]
drivers/gpu/drm/i915/intel_pm.c:5262:30: error: implicit declaration of function 'mul_u32_fixed16' [-Werror=implicit-function-declaration]
drivers/gpu/drm/i915/intel_pm.c:5265:27: error: implicit declaration of function 'fixed16_to_u32_round_up' [-Werror=implicit-function-declaration]
drivers/gpu/drm/i915/intel_pm.c:5289:38: error: implicit declaration of function 'intel_plane_pixel_rate' [-Werror=implicit-function-declaration]
drivers/gpu/drm/i915/intel_pm.c:5290:38: error: passing argument 7 of 'skl_compute_wm_params' from incompatible pointer type [-Werror=incompatible-pointer-types]
drivers/gpu/drm/i915/intel_pm.c:5310:13: error: conflicting types for 'skl_compute_plane_wm'; have 'void(const struct intel_crtc_state *, struct intel_plane *, int,  unsigned int,  const struct skl_wm_params *, const struct skl_wm_level *, struct skl_wm_level *)'
drivers/gpu/drm/i915/intel_pm.c:5340:51: error: invalid use of undefined type 'const struct skl_wm_params'
drivers/gpu/drm/i915/intel_pm.c:5345:19: error: implicit declaration of function 'skl_wm_method2'; did you mean 'skl_wm_method1'? [-Werror=implicit-function-declaration]
drivers/gpu/drm/i915/intel_pm.c:5351:35: error: implicit declaration of function 'max_fixed16' [-Werror=implicit-function-declaration]
drivers/gpu/drm/i915/intel_pm.c:5359:51: error: implicit declaration of function 'min_fixed16' [-Werror=implicit-function-declaration]
drivers/gpu/drm/i915/intel_pm.c:5387:17: error: implicit declaration of function 'div_round_up_fixed16' [-Werror=implicit-function-declaration]
drivers/gpu/drm/i915/intel_pm.c:5425:41: error: implicit declaration of function 'mul_round_up_u32_fixed16' [-Werror=implicit-function-declaration]
drivers/gpu/drm/i915/intel_pm.c:5453:51: error: 'struct drm_i915_private' has no member named 'sagv_block_time_us'
drivers/gpu/drm/i915/intel_pm.c:5472:38: error: passing argument 5 of 'skl_compute_plane_wm' from incompatible pointer type [-Werror=incompatible-pointer-types]
drivers/gpu/drm/i915/intel_pm.c:5566:30: error: storage size of 'wm_params' isn't known
drivers/gpu/drm/i915/intel_pm.c:5566:30: error: unused variable 'wm_params' [-Werror=unused-variable]
drivers/gpu/drm/i915/intel_pm.c:5566:30: warning: unused variable 'wm_params' [-Wunused-variable]
drivers/gpu/drm/i915/intel_pm.c:6258:1: error: 'skl_compute_wm' defined but not used [-Werror=unused-function]
drivers/gpu/drm/i915/intel_pm.c:6294:13: error: redefinition of 'ilk_compute_wm_config'
drivers/gpu/drm/i915/intel_pm.c:6312:13: error: redefinition of 'ilk_program_watermarks'
drivers/gpu/drm/i915/intel_pm.c:6344:13: error: redefinition of 'ilk_initial_watermarks'
drivers/gpu/drm/i915/intel_pm.c:6357:13: error: redefinition of 'ilk_optimize_watermarks'
drivers/gpu/drm/i915/intel_pm.c:6439:45: error: 'struct drm_i915_private' has no member named 'dbuf'
drivers/gpu/drm/i915/intel_pm.c:6572:13: error: redefinition of 'ilk_pipe_wm_get_hw_state'
drivers/gpu/drm/i915/intel_pm.c:6620:13: error: redefinition of 'g4x_read_wm_values'
drivers/gpu/drm/i915/intel_pm.c:6646:13: error: redefinition of 'vlv_read_wm_values'
drivers/gpu/drm/i915/intel_pm.c:6722:6: error: redefinition of 'g4x_wm_get_hw_state'
include/linux/minmax.h:36:9: error: first argument to '__builtin_choose_expr' not a constant

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
|-- arc-randconfig-r043-20220926
|   |-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu13-smu_v13_0.c:error:version-control-conflict-marker-in-file
|   |-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu13-smu_v13_0_0_ppt.c:error:combo_pptable-undeclared-(first-use-in-this-function)
|   |-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu13-smu_v13_0_0_ppt.c:error:redefinition-of-smu_v13_0_0_setup_pptable
|   |-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu13-smu_v13_0_0_ppt.c:error:ret-undeclared-(first-use-in-this-function)
|   |-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu13-smu_v13_0_0_ppt.c:error:size-undeclared-(first-use-in-this-function)
|   |-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu13-smu_v13_0_0_ppt.c:error:table-undeclared-(first-use-in-this-function)
|   |-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu13-smu_v13_0_0_ppt.c:error:version-control-conflict-marker-in-file
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_device.c:error:version-control-conflict-marker-in-file
|   `-- drivers-gpu-drm-amd-amdgpu-amdgpu_display.c:error:version-control-conflict-marker-in-file
|-- ia64-allmodconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu13-smu_v13_0.c:error:version-control-conflict-marker-in-file
|   |-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu13-smu_v13_0_0_ppt.c:error:combo_pptable-undeclared-(first-use-in-this-function)
|   |-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu13-smu_v13_0_0_ppt.c:error:redefinition-of-smu_v13_0_0_setup_pptable
|   |-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu13-smu_v13_0_0_ppt.c:error:ret-undeclared-(first-use-in-this-function)
|   |-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu13-smu_v13_0_0_ppt.c:error:size-undeclared-(first-use-in-this-function)
|   |-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu13-smu_v13_0_0_ppt.c:error:table-undeclared-(first-use-in-this-function)
|   |-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu13-smu_v13_0_0_ppt.c:error:version-control-conflict-marker-in-file
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_device.c:error:version-control-conflict-marker-in-file
|   `-- drivers-gpu-drm-amd-amdgpu-amdgpu_display.c:error:version-control-conflict-marker-in-file
|-- ia64-buildonly-randconfig-r002-20220925
|   |-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu13-smu_v13_0.c:error:version-control-conflict-marker-in-file
|   |-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu13-smu_v13_0_0_ppt.c:error:combo_pptable-undeclared-(first-use-in-this-function)
|   |-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu13-smu_v13_0_0_ppt.c:error:redefinition-of-smu_v13_0_0_setup_pptable
|   |-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu13-smu_v13_0_0_ppt.c:error:ret-undeclared-(first-use-in-this-function)
|   |-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu13-smu_v13_0_0_ppt.c:error:size-undeclared-(first-use-in-this-function)
|   |-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu13-smu_v13_0_0_ppt.c:error:table-undeclared-(first-use-in-this-function)
|   |-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu13-smu_v13_0_0_ppt.c:error:version-control-conflict-marker-in-file
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_device.c:error:version-control-conflict-marker-in-file
|   `-- drivers-gpu-drm-amd-amdgpu-amdgpu_display.c:error:version-control-conflict-marker-in-file
|-- loongarch-buildonly-randconfig-r006-20220925
|   |-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu13-smu_v13_0.c:error:version-control-conflict-marker-in-file
|   |-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu13-smu_v13_0_0_ppt.c:error:combo_pptable-undeclared-(first-use-in-this-function)
|   |-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu13-smu_v13_0_0_ppt.c:error:redefinition-of-smu_v13_0_0_setup_pptable
|   |-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu13-smu_v13_0_0_ppt.c:error:ret-undeclared-(first-use-in-this-function)
|   |-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu13-smu_v13_0_0_ppt.c:error:size-undeclared-(first-use-in-this-function)
|   |-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu13-smu_v13_0_0_ppt.c:error:table-undeclared-(first-use-in-this-function)
|   |-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu13-smu_v13_0_0_ppt.c:error:version-control-conflict-marker-in-file
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_device.c:error:version-control-conflict-marker-in-file
|   `-- drivers-gpu-drm-amd-amdgpu-amdgpu_display.c:error:version-control-conflict-marker-in-file
|-- m68k-buildonly-randconfig-r005-20220925
|   |-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu13-smu_v13_0.c:error:version-control-conflict-marker-in-file
|   |-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu13-smu_v13_0_0_ppt.c:error:combo_pptable-undeclared-(first-use-in-this-function)
|   |-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu13-smu_v13_0_0_ppt.c:error:redefinition-of-smu_v13_0_0_setup_pptable
|   |-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu13-smu_v13_0_0_ppt.c:error:ret-undeclared-(first-use-in-this-function)
|   |-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu13-smu_v13_0_0_ppt.c:error:size-undeclared-(first-use-in-this-function)
|   |-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu13-smu_v13_0_0_ppt.c:error:table-undeclared-(first-use-in-this-function)
|   |-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu13-smu_v13_0_0_ppt.c:error:version-control-conflict-marker-in-file
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_device.c:error:version-control-conflict-marker-in-file
|   `-- drivers-gpu-drm-amd-amdgpu-amdgpu_display.c:error:version-control-conflict-marker-in-file
clang_recent_errors
|-- x86_64-randconfig-a012-20220926
|   |-- drivers-gpu-drm-i915-display-icl_dsi.c:error:no-member-named-dcs_cabc_ports-in-struct-intel_dsi
|   |-- drivers-gpu-drm-i915-display-icl_dsi.c:error:use-of-undeclared-identifier-I
|   |-- drivers-gpu-drm-i915-display-icl_dsi.c:error:version-control-conflict-marker-in-file
|   |-- drivers-gpu-drm-i915-display-intel_backlight.c:error:expected-after-top-level-declarator
|   |-- drivers-gpu-drm-i915-display-intel_backlight.c:error:implicit-declaration-of-function-__intel_backlight_enable-is-invalid-in-C99-Werror-Wimplicit-function-declaration
|   |-- drivers-gpu-drm-i915-display-intel_backlight.c:error:implicit-declaration-of-function-i9xx_get_backlight-is-invalid-in-C99-Werror-Wimplicit-function-declaration
|   |-- drivers-gpu-drm-i915-display-intel_backlight.c:error:implicit-declaration-of-function-intel_has_quirk-is-invalid-in-C99-Werror-Wimplicit-function-declaration
|   |-- drivers-gpu-drm-i915-display-intel_backlight.c:error:implicit-declaration-of-function-lpt_set_backlight-is-invalid-in-C99-Werror-Wimplicit-function-declaration
|   |-- drivers-gpu-drm-i915-display-intel_backlight.c:error:implicit-declaration-of-function-pch_get_backlight-is-invalid-in-C99-Werror-Wimplicit-function-declaration
|   |-- drivers-gpu-drm-i915-display-intel_backlight.c:error:implicit-declaration-of-function-scale-is-invalid-in-C99-Werror-Wimplicit-function-declaration
|   |-- drivers-gpu-drm-i915-display-intel_backlight.c:error:implicit-declaration-of-function-scale_hw_to_user-is-invalid-in-C99-Werror-Wimplicit-function-declaration
|   |-- drivers-gpu-drm-i915-display-intel_backlight.c:error:unknown-type-name-I
|   |-- drivers-gpu-drm-i915-display-intel_backlight.c:error:use-of-undeclared-identifier-QUIRK_BACKLIGHT_PRESENT
|   |-- drivers-gpu-drm-i915-display-intel_backlight.c:error:use-of-undeclared-identifier-bxt_disable_backlight
|   |-- drivers-gpu-drm-i915-display-intel_backlight.c:error:use-of-undeclared-identifier-bxt_enable_backlight
|   |-- drivers-gpu-drm-i915-display-intel_backlight.c:error:use-of-undeclared-identifier-bxt_get_backlight
|   |-- drivers-gpu-drm-i915-display-intel_backlight.c:error:use-of-undeclared-identifier-bxt_set_backlight
|   |-- drivers-gpu-drm-i915-display-intel_backlight.c:error:use-of-undeclared-identifier-cnp_disable_backlight
|   |-- drivers-gpu-drm-i915-display-intel_backlight.c:error:use-of-undeclared-identifier-cnp_enable_backlight
|   |-- drivers-gpu-drm-i915-display-intel_backlight.c:error:use-of-undeclared-identifier-intel_backlight_device_ops
|   |-- drivers-gpu-drm-i915-display-intel_backlight.c:error:version-control-conflict-marker-in-file
|   |-- drivers-gpu-drm-i915-display-intel_bios.c:error:use-of-undeclared-identifier-I
|   |-- drivers-gpu-drm-i915-display-intel_bios.c:error:version-control-conflict-marker-in-file
|   |-- drivers-gpu-drm-i915-display-intel_bw.c:error:use-of-undeclared-identifier-I
|   |-- drivers-gpu-drm-i915-display-intel_bw.c:error:version-control-conflict-marker-in-file
|   |-- drivers-gpu-drm-i915-display-vlv_dsi.c:error:no-member-named-dcs_cabc_ports-in-struct-intel_dsi
|   |-- drivers-gpu-drm-i915-display-vlv_dsi.c:error:use-of-undeclared-identifier-I
|   |-- drivers-gpu-drm-i915-display-vlv_dsi.c:error:version-control-conflict-marker-in-file
|   |-- drivers-gpu-drm-i915-intel_pm.c:error:implicit-declaration-of-function-icl_pcode_restrict_qgv_points-is-invalid-in-C99-Werror-Wimplicit-function-declaration
|   |-- drivers-gpu-drm-i915-intel_pm.c:error:implicit-declaration-of-function-icl_sagv_post_plane_update-is-invalid-in-C99-Werror-Wimplicit-function-declaration
|   |-- drivers-gpu-drm-i915-intel_pm.c:error:implicit-declaration-of-function-icl_sagv_pre_plane_update-is-invalid-in-C99-Werror-Wimplicit-function-declaration
|   |-- drivers-gpu-drm-i915-intel_pm.c:error:implicit-declaration-of-function-intel_atomic_get_bw_state-is-invalid-in-C99-Werror-Wimplicit-function-declaration
|   |-- drivers-gpu-drm-i915-intel_pm.c:error:implicit-declaration-of-function-intel_atomic_get_old_bw_state-is-invalid-in-C99-Werror-Wimplicit-function-declaration
|   |-- drivers-gpu-drm-i915-intel_pm.c:error:implicit-declaration-of-function-intel_has_sagv-is-invalid-in-C99-Werror-Wimplicit-function-declaration
|   |-- drivers-gpu-drm-i915-intel_pm.c:error:implicit-declaration-of-function-skl_sagv_post_plane_update-is-invalid-in-C99-Werror-Wimplicit-function-declaration
|   |-- drivers-gpu-drm-i915-intel_pm.c:error:implicit-declaration-of-function-skl_sagv_pre_plane_update-is-invalid-in-C99-Werror-Wimplicit-function-declaration
|   |-- drivers-gpu-drm-i915-intel_pm.c:error:incomplete-definition-of-type-struct-intel_bw_state
|   |-- drivers-gpu-drm-i915-intel_pm.c:error:use-of-undeclared-identifier-I
|   |-- drivers-gpu-drm-i915-intel_pm.c:error:use-of-undeclared-identifier-new_bw_state
|   |-- drivers-gpu-drm-i915-intel_pm.c:error:use-of-undeclared-identifier-new_mask
|   |-- drivers-gpu-drm-i915-intel_pm.c:error:use-of-undeclared-identifier-old_mask
|   |-- drivers-gpu-drm-i915-intel_pm.c:error:version-control-conflict-marker-in-file
|   |-- drivers-gpu-drm-i915-intel_pm.c:warning:incompatible-integer-to-pointer-conversion-assigning-to-const-struct-intel_bw_state-from-int
|   `-- drivers-gpu-drm-i915-intel_pm.c:warning:incompatible-integer-to-pointer-conversion-assigning-to-struct-intel_bw_state-from-int
`-- x86_64-randconfig-a013-20220926
    `-- drivers-gpu-drm-i915-intel_pm.c:error:incompatible-integer-to-pointer-conversion-assigning-to-struct-intel_bw_state-from-int-Werror-Wint-conversion

elapsed time: 726m

configs tested: 63
configs skipped: 2

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
sh                               allmodconfig
mips                             allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
arc                                 defconfig
x86_64                          rhel-8.3-func
s390                             allmodconfig
arm                                 defconfig
x86_64                    rhel-8.3-kselftests
x86_64                           allyesconfig
alpha                               defconfig
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
arm                              allyesconfig
x86_64                           rhel-8.3-kvm
s390                                defconfig
arm64                            allyesconfig
s390                             allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
x86_64               randconfig-a002-20220926
x86_64               randconfig-a001-20220926
x86_64               randconfig-a003-20220926
i386                                defconfig
x86_64               randconfig-a004-20220926
x86_64               randconfig-a006-20220926
x86_64               randconfig-a005-20220926
m68k                             allyesconfig
i386                          randconfig-a001
i386                             allyesconfig
arc                  randconfig-r043-20220925
i386                          randconfig-a003
i386                          randconfig-a005
riscv                randconfig-r042-20220925
arc                  randconfig-r043-20220926
s390                 randconfig-r044-20220925
ia64                             allmodconfig

clang tested configs:
x86_64               randconfig-a015-20220926
x86_64               randconfig-a012-20220926
x86_64               randconfig-a014-20220926
x86_64               randconfig-a013-20220926
x86_64               randconfig-a011-20220926
x86_64               randconfig-a016-20220926
i386                 randconfig-a011-20220926
i386                 randconfig-a013-20220926
i386                 randconfig-a016-20220926
i386                          randconfig-a002
hexagon              randconfig-r045-20220925
hexagon              randconfig-r041-20220926
i386                 randconfig-a012-20220926
hexagon              randconfig-r045-20220926
i386                          randconfig-a006
i386                 randconfig-a015-20220926
hexagon              randconfig-r041-20220925
i386                          randconfig-a004
i386                 randconfig-a014-20220926
riscv                randconfig-r042-20220926
s390                 randconfig-r044-20220926

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
