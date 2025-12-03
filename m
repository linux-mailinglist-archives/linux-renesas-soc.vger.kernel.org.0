Return-Path: <linux-renesas-soc+bounces-25517-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A759C9DAFC
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 03 Dec 2025 04:58:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id CDE9A4E123B
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Dec 2025 03:58:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5798231827;
	Wed,  3 Dec 2025 03:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E5yXYu2q"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 836602609C5
	for <linux-renesas-soc@vger.kernel.org>; Wed,  3 Dec 2025 03:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764734295; cv=none; b=uR94/zieoE+IPu0ZHpuP9WtT29uGRB/T5YDjUTJ8+mGN+jHmiJ3PjH0yihjzZ++mMc1L5ZVvFsWYcSumh9p95Uiv9JtWqEXidvhaOKcPoD+3S6TbTjbpaXhX5OjVCXW/TBJR1YYKyOFjTzT4YG83sFufxu4tEEeNrHyZxz6ziLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764734295; c=relaxed/simple;
	bh=J8QX9n8Nk1pNILx+taP2RUbXj5dh456BJusKWzlc+m8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MGXzPa4DXaN6Zshp8g96jd+E82a+qFLHLvs/aZpU9jYU+5filIBvUWcC8eIGtUII0lPANuQmZP0PAAj02ZgwptM9EQ0T3BJVS6QexXd6avzwsuyxuFcIeI3TMtYtO9uJW/+yrfPy7w694Lmm1opOheiZmkr5z+NGVI+QWjO3BOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E5yXYu2q; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764734293; x=1796270293;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=J8QX9n8Nk1pNILx+taP2RUbXj5dh456BJusKWzlc+m8=;
  b=E5yXYu2qZmqvArrPcrUMDcTvJ7oKfwmnnStTbJfcP6Qx/0W3d32fmxul
   nZAIotG9qN4qAKE6tVh0jDkK33qcZH/CM6L6eGgChjNxK1hEHuPfkleI2
   R+K2FKdyIGsilsrOYeuDvSoyT5BDpGdSN76Tn5a1UbiVTog3e/9Yh5hgi
   dsTRGe3DuRSP/GtSFHg/upwKPeTceoUJ4bh37t3DxP4Zd8xuHMaAPAvSB
   mxsd+qDFr9/JgAXpS0hnBL7uecsdWWltWU18/FGbNx4w5zkT1rlOpNFEn
   ZMgP014MmHNrYIDSwD++KZFPQSSdr5cwOpQI7HegsGpkYgX4urtChoCFG
   w==;
X-CSE-ConnectionGUID: hMwJP057S7yjPnaQlxw0uA==
X-CSE-MsgGUID: YSAmIxZvSceCc3MaZFuMRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="70577436"
X-IronPort-AV: E=Sophos;i="6.20,244,1758610800"; 
   d="scan'208";a="70577436"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2025 19:58:13 -0800
X-CSE-ConnectionGUID: YLTxVTOlTcqlqIKmSK6C4A==
X-CSE-MsgGUID: uWv3V0+DR1ifTgdaRaQ4vw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,244,1758610800"; 
   d="scan'208";a="198730890"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 02 Dec 2025 19:58:11 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQe0G-00000000AXJ-3GFP;
	Wed, 03 Dec 2025 03:58:08 +0000
Date: Wed, 3 Dec 2025 11:57:40 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Airlie <airlied@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [geert-renesas-drivers:master 13/54]
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c:2668:18: error: no member named
 'discovery_bin' in 'struct amdgpu_mman'
Message-ID: <202512031131.3SHPwR3x-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git master
head:   997d056cf6640ed0a7e540650b94ae0c48d06b5b
commit: 6d0165b3a934a81e4c646c51fb650329af2f76da [13/54] Merge remote-tracking branch 'drm/drm-next' into renesas-drivers
config: powerpc64-randconfig-002-20251203 (https://download.01.org/0day-ci/archive/20251203/202512031131.3SHPwR3x-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 734a912d0f025559fcf76bde9aaaeb0383c1625a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251203/202512031131.3SHPwR3x-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512031131.3SHPwR3x-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/amdgpu_device.c:2668:18: error: no member named 'discovery_bin' in 'struct amdgpu_mman'
    2668 |                 if (adev->mman.discovery_bin)
         |                     ~~~~~~~~~~ ^
   1 error generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for CAN_DEV
   Depends on [n]: NETDEVICES [=n] && CAN [=y]
   Selected by [y]:
   - CAN [=y] && NET [=y]


vim +2668 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c

25263da37693c7 Alex Deucher      2022-07-19  2623  
e3ecdffac9ccdb Alex Deucher      2018-03-15  2624  /**
e3ecdffac9ccdb Alex Deucher      2018-03-15  2625   * amdgpu_device_parse_gpu_info_fw - parse gpu info firmware
e3ecdffac9ccdb Alex Deucher      2018-03-15  2626   *
e3ecdffac9ccdb Alex Deucher      2018-03-15  2627   * @adev: amdgpu_device pointer
e3ecdffac9ccdb Alex Deucher      2018-03-15  2628   *
e3ecdffac9ccdb Alex Deucher      2018-03-15  2629   * Parses the asic configuration parameters specified in the gpu info
a567db808ec948 Randy Dunlap      2024-11-27  2630   * firmware and makes them available to the driver for use in configuring
e3ecdffac9ccdb Alex Deucher      2018-03-15  2631   * the asic.
e3ecdffac9ccdb Alex Deucher      2018-03-15  2632   * Returns 0 on success, -EINVAL on failure.
e3ecdffac9ccdb Alex Deucher      2018-03-15  2633   */
e2a75f88c3ad4b Alex Deucher      2017-04-27  2634  static int amdgpu_device_parse_gpu_info_fw(struct amdgpu_device *adev)
e2a75f88c3ad4b Alex Deucher      2017-04-27  2635  {
e2a75f88c3ad4b Alex Deucher      2017-04-27  2636  	const char *chip_name;
e2a75f88c3ad4b Alex Deucher      2017-04-27  2637  	int err;
e2a75f88c3ad4b Alex Deucher      2017-04-27  2638  	const struct gpu_info_firmware_header_v1_0 *hdr;
e2a75f88c3ad4b Alex Deucher      2017-04-27  2639  
ab4fe3e1f910a7 Huang Rui         2017-06-05  2640  	adev->firmware.gpu_info_fw = NULL;
ab4fe3e1f910a7 Huang Rui         2017-06-05  2641  
e2a75f88c3ad4b Alex Deucher      2017-04-27  2642  	switch (adev->asic_type) {
e2a75f88c3ad4b Alex Deucher      2017-04-27  2643  	default:
e2a75f88c3ad4b Alex Deucher      2017-04-27  2644  		return 0;
e2a75f88c3ad4b Alex Deucher      2017-04-27  2645  	case CHIP_VEGA10:
e2a75f88c3ad4b Alex Deucher      2017-04-27  2646  		chip_name = "vega10";
e2a75f88c3ad4b Alex Deucher      2017-04-27  2647  		break;
3f76dcedb30383 Alex Deucher      2017-09-01  2648  	case CHIP_VEGA12:
3f76dcedb30383 Alex Deucher      2017-09-01  2649  		chip_name = "vega12";
3f76dcedb30383 Alex Deucher      2017-09-01  2650  		break;
2d2e5e7e530722 Alex Deucher      2017-05-09  2651  	case CHIP_RAVEN:
54f78a7655e207 Alex Deucher      2020-05-15  2652  		if (adev->apu_flags & AMD_APU_IS_RAVEN2)
54c4d17e98db7a Feifei Xu         2018-01-04  2653  			chip_name = "raven2";
54f78a7655e207 Alex Deucher      2020-05-15  2654  		else if (adev->apu_flags & AMD_APU_IS_PICASSO)
741deade2a704a Alex Deucher      2018-09-13  2655  			chip_name = "picasso";
54c4d17e98db7a Feifei Xu         2018-01-04  2656  		else
2d2e5e7e530722 Alex Deucher      2017-05-09  2657  			chip_name = "raven";
2d2e5e7e530722 Alex Deucher      2017-05-09  2658  		break;
65e60f6e06e55e Le Ma             2019-07-09  2659  	case CHIP_ARCTURUS:
65e60f6e06e55e Le Ma             2019-07-09  2660  		chip_name = "arcturus";
65e60f6e06e55e Le Ma             2019-07-09  2661  		break;
42b325e5ec3965 Xiaojie Yuan      2018-12-17  2662  	case CHIP_NAVI12:
9e2096baab9add Lijo Lazar        2025-10-10  2663  		if (adev->discovery.bin)
514678da56da08 Alex Deucher      2025-07-30  2664  			return 0;
42b325e5ec3965 Xiaojie Yuan      2018-12-17  2665  		chip_name = "navi12";
42b325e5ec3965 Xiaojie Yuan      2018-12-17  2666  		break;
fa819e3a7c1ee9 Alex Deucher      2025-06-27  2667  	case CHIP_CYAN_SKILLFISH:
7fa666ab07ba9e Alex Deucher      2025-11-26 @2668  		if (adev->mman.discovery_bin)
7fa666ab07ba9e Alex Deucher      2025-11-26  2669  			return 0;
fa819e3a7c1ee9 Alex Deucher      2025-06-27  2670  		chip_name = "cyan_skillfish";
fa819e3a7c1ee9 Alex Deucher      2025-06-27  2671  		break;
e2a75f88c3ad4b Alex Deucher      2017-04-27  2672  	}
e2a75f88c3ad4b Alex Deucher      2017-04-27  2673  
a777c9d70adce6 Yang Wang         2024-05-30  2674  	err = amdgpu_ucode_request(adev, &adev->firmware.gpu_info_fw,
ea5d49349894a7 Mario Limonciello 2024-12-03  2675  				   AMDGPU_UCODE_OPTIONAL,
a777c9d70adce6 Yang Wang         2024-05-30  2676  				   "amdgpu/%s_gpu_info.bin", chip_name);
e2a75f88c3ad4b Alex Deucher      2017-04-27  2677  	if (err) {
e2a75f88c3ad4b Alex Deucher      2017-04-27  2678  		dev_err(adev->dev,
a777c9d70adce6 Yang Wang         2024-05-30  2679  			"Failed to get gpu_info firmware \"%s_gpu_info.bin\"\n",
a777c9d70adce6 Yang Wang         2024-05-30  2680  			chip_name);
e2a75f88c3ad4b Alex Deucher      2017-04-27  2681  		goto out;
e2a75f88c3ad4b Alex Deucher      2017-04-27  2682  	}
e2a75f88c3ad4b Alex Deucher      2017-04-27  2683  
ab4fe3e1f910a7 Huang Rui         2017-06-05  2684  	hdr = (const struct gpu_info_firmware_header_v1_0 *)adev->firmware.gpu_info_fw->data;
e2a75f88c3ad4b Alex Deucher      2017-04-27  2685  	amdgpu_ucode_print_gpu_info_hdr(&hdr->header);
e2a75f88c3ad4b Alex Deucher      2017-04-27  2686  
e2a75f88c3ad4b Alex Deucher      2017-04-27  2687  	switch (hdr->version_major) {
e2a75f88c3ad4b Alex Deucher      2017-04-27  2688  	case 1:
e2a75f88c3ad4b Alex Deucher      2017-04-27  2689  	{
e2a75f88c3ad4b Alex Deucher      2017-04-27  2690  		const struct gpu_info_firmware_v1_0 *gpu_info_fw =
ab4fe3e1f910a7 Huang Rui         2017-06-05  2691  			(const struct gpu_info_firmware_v1_0 *)(adev->firmware.gpu_info_fw->data +
e2a75f88c3ad4b Alex Deucher      2017-04-27  2692  								le32_to_cpu(hdr->header.ucode_array_offset_bytes));
e2a75f88c3ad4b Alex Deucher      2017-04-27  2693  
cc375d8c524895 Tianci.Yin        2020-06-03  2694  		/*
a567db808ec948 Randy Dunlap      2024-11-27  2695  		 * Should be dropped when DAL no longer needs it.
cc375d8c524895 Tianci.Yin        2020-06-03  2696  		 */
cc375d8c524895 Tianci.Yin        2020-06-03  2697  		if (adev->asic_type == CHIP_NAVI12)
ec51d3facd3eb2 Xiaojie Yuan      2019-09-11  2698  			goto parse_soc_bounding_box;
ec51d3facd3eb2 Xiaojie Yuan      2019-09-11  2699  
b5ab16bf64347e Alex Deucher      2017-05-11  2700  		adev->gfx.config.max_shader_engines = le32_to_cpu(gpu_info_fw->gc_num_se);
b5ab16bf64347e Alex Deucher      2017-05-11  2701  		adev->gfx.config.max_cu_per_sh = le32_to_cpu(gpu_info_fw->gc_num_cu_per_sh);
b5ab16bf64347e Alex Deucher      2017-05-11  2702  		adev->gfx.config.max_sh_per_se = le32_to_cpu(gpu_info_fw->gc_num_sh_per_se);
b5ab16bf64347e Alex Deucher      2017-05-11  2703  		adev->gfx.config.max_backends_per_se = le32_to_cpu(gpu_info_fw->gc_num_rb_per_se);
e2a75f88c3ad4b Alex Deucher      2017-04-27  2704  		adev->gfx.config.max_texture_channel_caches =
b5ab16bf64347e Alex Deucher      2017-05-11  2705  			le32_to_cpu(gpu_info_fw->gc_num_tccs);
b5ab16bf64347e Alex Deucher      2017-05-11  2706  		adev->gfx.config.max_gprs = le32_to_cpu(gpu_info_fw->gc_num_gprs);
b5ab16bf64347e Alex Deucher      2017-05-11  2707  		adev->gfx.config.max_gs_threads = le32_to_cpu(gpu_info_fw->gc_num_max_gs_thds);
b5ab16bf64347e Alex Deucher      2017-05-11  2708  		adev->gfx.config.gs_vgt_table_depth = le32_to_cpu(gpu_info_fw->gc_gs_table_depth);
b5ab16bf64347e Alex Deucher      2017-05-11  2709  		adev->gfx.config.gs_prim_buffer_depth = le32_to_cpu(gpu_info_fw->gc_gsprim_buff_depth);
e2a75f88c3ad4b Alex Deucher      2017-04-27  2710  		adev->gfx.config.double_offchip_lds_buf =
b5ab16bf64347e Alex Deucher      2017-05-11  2711  			le32_to_cpu(gpu_info_fw->gc_double_offchip_lds_buffer);
b5ab16bf64347e Alex Deucher      2017-05-11  2712  		adev->gfx.cu_info.wave_front_size = le32_to_cpu(gpu_info_fw->gc_wave_size);
51fd0370677733 Hawking Zhang     2017-06-09  2713  		adev->gfx.cu_info.max_waves_per_simd =
51fd0370677733 Hawking Zhang     2017-06-09  2714  			le32_to_cpu(gpu_info_fw->gc_max_waves_per_simd);
51fd0370677733 Hawking Zhang     2017-06-09  2715  		adev->gfx.cu_info.max_scratch_slots_per_cu =
51fd0370677733 Hawking Zhang     2017-06-09  2716  			le32_to_cpu(gpu_info_fw->gc_max_scratch_slots_per_cu);
51fd0370677733 Hawking Zhang     2017-06-09  2717  		adev->gfx.cu_info.lds_size = le32_to_cpu(gpu_info_fw->gc_lds_size);
48321c3dde79f7 Harry Wentland    2019-05-07  2718  		if (hdr->version_minor >= 1) {
35c2e91059cbef Hawking Zhang     2018-06-13  2719  			const struct gpu_info_firmware_v1_1 *gpu_info_fw =
35c2e91059cbef Hawking Zhang     2018-06-13  2720  				(const struct gpu_info_firmware_v1_1 *)(adev->firmware.gpu_info_fw->data +
35c2e91059cbef Hawking Zhang     2018-06-13  2721  									le32_to_cpu(hdr->header.ucode_array_offset_bytes));
35c2e91059cbef Hawking Zhang     2018-06-13  2722  			adev->gfx.config.num_sc_per_sh =
35c2e91059cbef Hawking Zhang     2018-06-13  2723  				le32_to_cpu(gpu_info_fw->num_sc_per_sh);
35c2e91059cbef Hawking Zhang     2018-06-13  2724  			adev->gfx.config.num_packer_per_sc =
35c2e91059cbef Hawking Zhang     2018-06-13  2725  				le32_to_cpu(gpu_info_fw->num_packer_per_sc);
35c2e91059cbef Hawking Zhang     2018-06-13  2726  		}
ec51d3facd3eb2 Xiaojie Yuan      2019-09-11  2727  
ec51d3facd3eb2 Xiaojie Yuan      2019-09-11  2728  parse_soc_bounding_box:
ec51d3facd3eb2 Xiaojie Yuan      2019-09-11  2729  		/*
ec51d3facd3eb2 Xiaojie Yuan      2019-09-11  2730  		 * soc bounding box info is not integrated in disocovery table,
258620d0b36f5a Alex Deucher      2020-05-28  2731  		 * we always need to parse it from gpu info firmware if needed.
ec51d3facd3eb2 Xiaojie Yuan      2019-09-11  2732  		 */
48321c3dde79f7 Harry Wentland    2019-05-07  2733  		if (hdr->version_minor == 2) {
48321c3dde79f7 Harry Wentland    2019-05-07  2734  			const struct gpu_info_firmware_v1_2 *gpu_info_fw =
48321c3dde79f7 Harry Wentland    2019-05-07  2735  				(const struct gpu_info_firmware_v1_2 *)(adev->firmware.gpu_info_fw->data +
48321c3dde79f7 Harry Wentland    2019-05-07  2736  									le32_to_cpu(hdr->header.ucode_array_offset_bytes));
48321c3dde79f7 Harry Wentland    2019-05-07  2737  			adev->dm.soc_bounding_box = &gpu_info_fw->soc_bounding_box;
48321c3dde79f7 Harry Wentland    2019-05-07  2738  		}
e2a75f88c3ad4b Alex Deucher      2017-04-27  2739  		break;
e2a75f88c3ad4b Alex Deucher      2017-04-27  2740  	}
e2a75f88c3ad4b Alex Deucher      2017-04-27  2741  	default:
e2a75f88c3ad4b Alex Deucher      2017-04-27  2742  		dev_err(adev->dev,
e2a75f88c3ad4b Alex Deucher      2017-04-27  2743  			"Unsupported gpu_info table %d\n", hdr->header.ucode_version);
e2a75f88c3ad4b Alex Deucher      2017-04-27  2744  		err = -EINVAL;
e2a75f88c3ad4b Alex Deucher      2017-04-27  2745  		goto out;
e2a75f88c3ad4b Alex Deucher      2017-04-27  2746  	}
e2a75f88c3ad4b Alex Deucher      2017-04-27  2747  out:
e2a75f88c3ad4b Alex Deucher      2017-04-27  2748  	return err;
e2a75f88c3ad4b Alex Deucher      2017-04-27  2749  }
e2a75f88c3ad4b Alex Deucher      2017-04-27  2750  

:::::: The code at line 2668 was first introduced by commit
:::::: 7fa666ab07ba9e08f52f357cb8e1aad753e83ac6 drm/amdgpu: fix cyan_skillfish2 gpu info fw handling

:::::: TO: Alex Deucher <alexander.deucher@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

