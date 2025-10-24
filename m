Return-Path: <linux-renesas-soc+bounces-23587-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 64BBCC069F8
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Oct 2025 16:10:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 24AB83A1B48
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Oct 2025 14:10:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23BB031A570;
	Fri, 24 Oct 2025 14:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cjpbB+sP"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 750B828489B
	for <linux-renesas-soc@vger.kernel.org>; Fri, 24 Oct 2025 14:10:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761315042; cv=none; b=qqfNnoUzNyKeYe2OJ4XVixTZNtGGpUyvNnXpOH++5+VrZADM7PslMRHqFxTZpHQVFxkfvb62wtx6HmTVkYd7k0SRWNJjyiG2Nrc33w6VTj3u6pNS0l/4cqdBrcR7oLtifyPKHQp/0m1h3sVE+FEJ6Wg7hIJmUyrW/yYJQzpeq2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761315042; c=relaxed/simple;
	bh=pcsTlMQbWR1gWi5sjKCuio6dvAVEwYtJrX2WFHlRj9w=;
	h=Date:From:To:Cc:Subject:Message-ID; b=AUq0wl/tsyMYr4Kk0KVemPwzY4MIdnkr9Ce8NgwtQutc5OKM4187M3En1UWv8Sg5W8DFPJPfyy6w0r8MbOwhQAo/KekyyiyS1qI4sm51QjRjcYSIigbpC/3Jq5jgW6l45cW7JRJYSECwWIyO5PRrmmnO/BCj4safy6izOoQQYug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cjpbB+sP; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761315040; x=1792851040;
  h=date:from:to:cc:subject:message-id;
  bh=pcsTlMQbWR1gWi5sjKCuio6dvAVEwYtJrX2WFHlRj9w=;
  b=cjpbB+sPLOe4ZqX2wsMOPWEw6IcNifeFyuiYg2TFJfeOUrEmWJD1HpMe
   N1om7GIaMNFwl7x5UZpODl4a+1a78Cok7GoVA9nA3I/4qOBzs5oiBPn8t
   Hsx2nXz7cBTpkeBxD2p8XwckbmDmQY5us/w2ohWYH9k8qFwMf+cr5fj30
   qjnEStBA1JBu0BkXzmHFWk+ZCW67Nvt6rYHHV5Z9+zDRPTDcYs/m+Mp0C
   eJ17jORiQPWJGnaU3mW66OB6mzssHxcr6Nhqjzzpp1zOsgyZLg8P0pXq8
   hlNU3KKzhzC2ttCDdgC34sz+w8XpCBjWjZGV7NWVmeg+hizi6aSkypF0O
   A==;
X-CSE-ConnectionGUID: 5Iqtl5UjRq2aewnT7kQbTQ==
X-CSE-MsgGUID: r6ZKBAiiRVOh96+hvdmBug==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="73785796"
X-IronPort-AV: E=Sophos;i="6.19,252,1754982000"; 
   d="scan'208";a="73785796"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2025 07:10:40 -0700
X-CSE-ConnectionGUID: kpXbCNdUTdmHnuzJ6MZo6w==
X-CSE-MsgGUID: 38HTvK4KQKWYPMrXY2YYfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,252,1754982000"; 
   d="scan'208";a="183613988"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 24 Oct 2025 07:10:39 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vCIV2-000EXt-2B;
	Fri, 24 Oct 2025 14:10:36 +0000
Date: Fri, 24 Oct 2025 22:10:30 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-dts-for-v6.19] BUILD SUCCESS
 WITH UNVERIFIED WARNING 08b1e69d08203e31c1c8819203040516683e40a4
Message-ID: <202510242223.5rodgjK0-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-dts-for-v6.19
branch HEAD: 08b1e69d08203e31c1c8819203040516683e40a4  arm64: dts: renesas: r8a77961: Add GX6250 GPU node

Unverified Warning (likely false positive, kindly check if interested):

    arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-rpi-display-2-5in.dtb: dsi@fed80000 (renesas,r8a779g0-dsi-csi2-tx): '#address-cells', '#size-cells', 'panel@0' do not match any of the regexes: '^pinctrl-[0-9]+$'
    arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-rpi-display-2-7in.dtb: dsi@fed80000 (renesas,r8a779g0-dsi-csi2-tx): '#address-cells', '#size-cells', 'panel@0' do not match any of the regexes: '^pinctrl-[0-9]+$'

Warning ids grouped by kconfigs:

recent_errors
|-- arm64-randconfig-051-20251024
|   |-- arch-arm64-boot-dts-renesas-r8a779g3-sparrow-hawk-rpi-display-5in.dtb:dsi-fed80000-(renesas-r8a779g0-dsi-csi2-tx):address-cells-size-cells-panel-do-not-match-any-of-the-regexes:pinctrl
|   `-- arch-arm64-boot-dts-renesas-r8a779g3-sparrow-hawk-rpi-display-7in.dtb:dsi-fed80000-(renesas-r8a779g0-dsi-csi2-tx):address-cells-size-cells-panel-do-not-match-any-of-the-regexes:pinctrl
`-- arm64-randconfig-052-20251024
    |-- arch-arm64-boot-dts-renesas-r8a779g3-sparrow-hawk-rpi-display-5in.dtb:dsi-fed80000-(renesas-r8a779g0-dsi-csi2-tx):address-cells-size-cells-panel-do-not-match-any-of-the-regexes:pinctrl
    `-- arch-arm64-boot-dts-renesas-r8a779g3-sparrow-hawk-rpi-display-7in.dtb:dsi-fed80000-(renesas-r8a779g0-dsi-csi2-tx):address-cells-size-cells-panel-do-not-match-any-of-the-regexes:pinctrl

elapsed time: 1188m

configs tested: 13
configs skipped: 117

tested configs:
arm               allmodconfig    gcc-15.1.0
arm                allnoconfig    clang-22
arm               allyesconfig    gcc-15.1.0
arm    randconfig-001-20251024    clang-20
arm    randconfig-002-20251024    gcc-15.1.0
arm    randconfig-003-20251024    clang-22
arm    randconfig-004-20251024    clang-22
arm64             allmodconfig    clang-19
arm64              allnoconfig    gcc-15.1.0
arm64  randconfig-001-20251024    gcc-8.5.0
arm64  randconfig-002-20251024    clang-16
arm64  randconfig-003-20251024    gcc-13.4.0
arm64  randconfig-004-20251024    clang-17

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

