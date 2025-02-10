Return-Path: <linux-renesas-soc+bounces-13030-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F1289A2FC76
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Feb 2025 22:46:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7201A1679C3
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Feb 2025 21:46:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A32C17BCE;
	Mon, 10 Feb 2025 21:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KmuOq77t"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 587F426460A
	for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Feb 2025 21:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739223986; cv=none; b=FHfwQu7G7nyOTpr3MnZKPLVF3J/GXsk4GBx3yjJRmq4gzsoESYKQJCh+4RiiQcRjX+2zbQQp0HocU+TzWKNm/SbX0ES/GAE/jVAI5OTkyb5I5K7z4CwlHB26u9MzGCJ+zn1QEufVVtZMWSephSto5mDL3EcU5HeCM7ni5SYokwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739223986; c=relaxed/simple;
	bh=+Fi+Kv/cubag9JcyxVZY4NGqck9Ztm8LLiJ2UGxw5u8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=coFuB+0Vvws4X75vUWEFDNKSJUR+bq3yJcpffK7pHa8lFLhE+4BOc2X52UVMsetEL3t3a5eEdmj4ktHMrTdChowMl/nIHwV8+qD3BkumwEYfjXM8DHpyVyPTfNiRFG291yKqML62apXFLkOFwfNt8cihJEXZHEaVhUgNjdCvCTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KmuOq77t; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739223984; x=1770759984;
  h=date:from:to:cc:subject:message-id;
  bh=+Fi+Kv/cubag9JcyxVZY4NGqck9Ztm8LLiJ2UGxw5u8=;
  b=KmuOq77tfJZYJ+GGag6vOyWkB5UKzdSN8KZLv9UGFTvIVG/0No0nhNdt
   MZ+JgoiujtSAzr+Pgm5vGXS7kdhPSCOngWou3GGNs2/n54/YiIx0MWbXT
   K9hUIsp/RvjAOvLFdzPCzBLyP6BftM+RGpqsZ3vFI/IZBWqWpRte+wBEo
   TQR53sZ4ObwM8tNtOMOrONRAz16SUsgxLStShrvVxTp86nBpvprMqc4cl
   IhjtmG4YS/sjOyTP4xd4KMeu1aXsrrjhUf7PRXsUr5QDkufrsK3ZjJMt3
   Jduef9Q2CSwlhPrihlI1sG1pq7N71l+xh00Sw0EIk2nN2d0jcRzHEaqIt
   A==;
X-CSE-ConnectionGUID: 8ZPgFIRuRMSBbF1PVzlPJg==
X-CSE-MsgGUID: QE+wX+aGS3CCUHp+5Xr5zw==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="27425845"
X-IronPort-AV: E=Sophos;i="6.13,275,1732608000"; 
   d="scan'208";a="27425845"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 13:46:23 -0800
X-CSE-ConnectionGUID: rqqHACqSS5KLAnH8D+iqaQ==
X-CSE-MsgGUID: zGaET51oQfyK4SN9DWz9dw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="117231793"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 10 Feb 2025 13:46:22 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1thbbf-0013RZ-2T;
	Mon, 10 Feb 2025 21:46:19 +0000
Date: Tue, 11 Feb 2025 05:45:31 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-dts-for-v6.15] BUILD SUCCESS
 85172055debf4b3f261c60f5ef168ca9891b0efe
Message-ID: <202502110524.Xp0uWwOn-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-dts-for-v6.15
branch HEAD: 85172055debf4b3f261c60f5ef168ca9891b0efe  arm64: dts: renesas: white-hawk-csi-dsi: Use names for CSI-2 data line orders

Unverified Warning (likely false positive, kindly check if interested):

    arch/arm64/boot/dts/renesas/r9a07g044l2-remi-pi.dtb: /: compatible: 'oneOf' conditional failed, one must be fixed:
    arch/arm64/boot/dts/renesas/r9a07g044l2-remi-pi.dtb: /: failed to match any schema with compatible: ['myir,remi-pi', 'renesas,r9a07g044l2', 'renesas,r9a07g044']

Warning ids grouped by kconfigs:

recent_errors
|-- arm64-randconfig-051-20250210
|   |-- arch-arm64-boot-dts-renesas-r9a08g045s33-smarc-pmod1-type-3a.dtb:clock-controller:power-domain-cells:was-expected
|   |-- arch-arm64-boot-dts-renesas-r9a09g047e57-smarc.dtb:watchdog:compatible:oneOf-conditional-failed-one-must-be-fixed:
|   |-- arch-arm64-boot-dts-renesas-r9a09g057h48-kakip.dtb::compatible:oneOf-conditional-failed-one-must-be-fixed:
|   `-- arch-arm64-boot-dts-renesas-r9a09g057h48-kakip.dtb::failed-to-match-any-schema-with-compatible:yuridenki-kakip-renesas-r9a09g057h48-renesas-r9a09g057
|-- arm64-randconfig-052-20250210
|   |-- arch-arm64-boot-dts-renesas-r9a07g044l2-remi-pi.dtb::compatible:oneOf-conditional-failed-one-must-be-fixed:
|   |-- arch-arm64-boot-dts-renesas-r9a07g044l2-remi-pi.dtb::failed-to-match-any-schema-with-compatible:myir-remi-pi-renesas-r9a07g044l2-renesas-r9a07g044
|   |-- arch-arm64-boot-dts-renesas-r9a08g045s33-smarc-pmod1-type-3a.dtb:clock-controller:power-domain-cells:was-expected
|   |-- arch-arm64-boot-dts-renesas-r9a09g047e57-smarc.dtb:watchdog:compatible:oneOf-conditional-failed-one-must-be-fixed:
|   |-- arch-arm64-boot-dts-renesas-r9a09g057h48-kakip.dtb::compatible:oneOf-conditional-failed-one-must-be-fixed:
|   `-- arch-arm64-boot-dts-renesas-r9a09g057h48-kakip.dtb::failed-to-match-any-schema-with-compatible:yuridenki-kakip-renesas-r9a09g057h48-renesas-r9a09g057
|-- arm64-randconfig-053-20250210
|   |-- arch-arm64-boot-dts-renesas-r9a08g045s33-smarc-pmod1-type-3a.dtb:clock-controller:power-domain-cells:was-expected
|   |-- arch-arm64-boot-dts-renesas-r9a09g047e57-smarc.dtb:watchdog:compatible:oneOf-conditional-failed-one-must-be-fixed:
|   |-- arch-arm64-boot-dts-renesas-r9a09g057h48-kakip.dtb::compatible:oneOf-conditional-failed-one-must-be-fixed:
|   `-- arch-arm64-boot-dts-renesas-r9a09g057h48-kakip.dtb::failed-to-match-any-schema-with-compatible:yuridenki-kakip-renesas-r9a09g057h48-renesas-r9a09g057
|-- arm64-randconfig-054-20250210
|   |-- arch-arm64-boot-dts-renesas-r9a08g045s33-smarc-pmod1-type-3a.dtb:clock-controller:power-domain-cells:was-expected
|   |-- arch-arm64-boot-dts-renesas-r9a09g047e57-smarc.dtb:watchdog:compatible:oneOf-conditional-failed-one-must-be-fixed:
|   |-- arch-arm64-boot-dts-renesas-r9a09g057h48-kakip.dtb::compatible:oneOf-conditional-failed-one-must-be-fixed:
|   `-- arch-arm64-boot-dts-renesas-r9a09g057h48-kakip.dtb::failed-to-match-any-schema-with-compatible:yuridenki-kakip-renesas-r9a09g057h48-renesas-r9a09g057
`-- arm64-randconfig-055-20250210
    |-- arch-arm64-boot-dts-renesas-r9a08g045s33-smarc-pmod1-type-3a.dtb:clock-controller:power-domain-cells:was-expected
    |-- arch-arm64-boot-dts-renesas-r9a09g047e57-smarc.dtb:watchdog:compatible:oneOf-conditional-failed-one-must-be-fixed:
    |-- arch-arm64-boot-dts-renesas-r9a09g057h48-kakip.dtb::compatible:oneOf-conditional-failed-one-must-be-fixed:
    `-- arch-arm64-boot-dts-renesas-r9a09g057h48-kakip.dtb::failed-to-match-any-schema-with-compatible:yuridenki-kakip-renesas-r9a09g057h48-renesas-r9a09g057

elapsed time: 726m

configs tested: 5
configs skipped: 120

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
arm64             allmodconfig    clang-18
arm64  randconfig-001-20250210    gcc-14.2.0
arm64  randconfig-002-20250210    clang-21
arm64  randconfig-003-20250210    clang-21
arm64  randconfig-004-20250210    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

