Return-Path: <linux-renesas-soc+bounces-18320-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E474AD9A34
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 14 Jun 2025 07:25:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 741EF189E712
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 14 Jun 2025 05:25:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C97DA51C5A;
	Sat, 14 Jun 2025 05:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jDc/2Upa"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23B832E11DB
	for <linux-renesas-soc@vger.kernel.org>; Sat, 14 Jun 2025 05:25:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749878706; cv=none; b=l6la3tbsTXX609QflGzi5jFCcT1JGlmDM84Scf6ViifS4UCKlVGbttbiDl/IFrhva1YVQZcHQzzhqrR1mtYaderVe8lMlBYF/88Rx5A/J7pYixB6CoEawB3Q5vF2aKBKzp63FoNbqyGrvx1IYit5tEBDUCe3VLfWQClVyPkOyVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749878706; c=relaxed/simple;
	bh=7FIP+nfupMn95PVpJPHpEi5mFHhJzAbfSHT/a/w8NF8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=MrFOCSBUOp1opbLHVkJsY9sSdBLaTpLNP9OHx4juqxkcHBoKR4c9KFQ4owQfU/5RzxwwEeLImMztu6CCHmN3HLSi+KZNKf+n5qN0QeZ+CDyaqR6ISpfSfi9e4uQgz18SN1f7qWqEM1eN/kJOD1/Yzw8To/MLx/xj9wqSAB6ReVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jDc/2Upa; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749878705; x=1781414705;
  h=date:from:to:cc:subject:message-id;
  bh=7FIP+nfupMn95PVpJPHpEi5mFHhJzAbfSHT/a/w8NF8=;
  b=jDc/2UpaPK+5HMF7EdE4o6E7EIhnXWmB56XpMUb2P6tjO/oXV/1urRQU
   sI5nssqaoMf7PikXdCQlfthjb0Wtd71YVVMDYZPM3MAnNGrOTZGp+0NcE
   EZEzH5S8NTzveCVWzdtpY/dzSM+omPpfVxMPv2mTipM9sQ+LjoClDsr4Z
   FM5++BGEm34qF9nudz/vozTFtLWhztrz0D1h4YrUsKzQIk99qih/eGrf/
   9o3OamKDIAxuubpAxxMqlBwbeMOGzqBHS8nFJQeiae7JzEZX20Uo4MOAI
   j2ECai//Ct5bFAztfALg0nW/Xm3Hi/0oyhLFvbDR1aCZgcYGS3vowP5S7
   A==;
X-CSE-ConnectionGUID: dEihKVFiReG2/BHt0ZoW/g==
X-CSE-MsgGUID: PO0V/tQZRpWMhnRkPQdnhA==
X-IronPort-AV: E=McAfee;i="6800,10657,11463"; a="52016887"
X-IronPort-AV: E=Sophos;i="6.16,235,1744095600"; 
   d="scan'208";a="52016887"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2025 22:25:04 -0700
X-CSE-ConnectionGUID: 4O5w2wRhTrmPTT/DNun/Nw==
X-CSE-MsgGUID: Zoc1YRr4RZq9p5ho+y6Rcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,235,1744095600"; 
   d="scan'208";a="152769096"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 13 Jun 2025 22:25:04 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uQJO1-000DKA-07;
	Sat, 14 Jun 2025 05:25:01 +0000
Date: Sat, 14 Jun 2025 13:24:57 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-dts-for-v6.17] BUILD SUCCESS
 9d07ff19f068eb508c1bbaa8ba652b0a8a544eb5
Message-ID: <202506141345.6daDi0p2-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-dts-for-v6.17
branch HEAD: 9d07ff19f068eb508c1bbaa8ba652b0a8a544eb5  arm64: dts: renesas: Add bootph-all to sysinfo EEPROM on R-Car Gen3

Unverified Warning (likely false positive, kindly check if interested):

    arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dtb: usb-phy@15800200 (renesas,usb2-phy-r9a09g056): compatible: 'oneOf' conditional failed, one must be fixed:
    arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dtb: usb20phy-reset@15830000 (renesas,r9a09g056-usb2phy-reset): compatible: ['renesas,r9a09g056-usb2phy-reset', 'renesas,r9a09g057-usb2phy-reset'] is too long
    arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dtb: usb20phy-reset@15830000 (renesas,r9a09g056-usb2phy-reset): compatible:0: 'renesas,r9a09g057-usb2phy-reset' was expected
    arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dtb: usb@15820000 (renesas,usbhs-r9a09g056): compatible: 'oneOf' conditional failed, one must be fixed:

Warning ids grouped by kconfigs:

recent_errors
`-- arm64-randconfig-051-20250614
    |-- arch-arm64-boot-dts-renesas-r9a09g056n48-rzv2n-evk.dtb:usb-(renesas-usbhs-r9a09g056):compatible:oneOf-conditional-failed-one-must-be-fixed:
    |-- arch-arm64-boot-dts-renesas-r9a09g056n48-rzv2n-evk.dtb:usb-phy-(renesas-usb2-phy-r9a09g056):compatible:oneOf-conditional-failed-one-must-be-fixed:
    |-- arch-arm64-boot-dts-renesas-r9a09g056n48-rzv2n-evk.dtb:usb20phy-reset-(renesas-r9a09g056-usb2phy-reset):compatible:renesas-r9a09g056-usb2phy-reset-renesas-r9a09g057-usb2phy-reset-is-too-long
    `-- arch-arm64-boot-dts-renesas-r9a09g056n48-rzv2n-evk.dtb:usb20phy-reset-(renesas-r9a09g056-usb2phy-reset):compatible:renesas-r9a09g057-usb2phy-reset-was-expected

elapsed time: 1154m

configs tested: 13
configs skipped: 120

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
arm               allmodconfig    gcc-15.1.0
arm                allnoconfig    clang-21
arm               allyesconfig    gcc-15.1.0
arm    randconfig-001-20250613    clang-21
arm    randconfig-002-20250613    clang-20
arm    randconfig-003-20250613    gcc-8.5.0
arm    randconfig-004-20250613    clang-21
arm64             allmodconfig    clang-19
arm64              allnoconfig    gcc-15.1.0
arm64  randconfig-001-20250613    gcc-15.1.0
arm64  randconfig-002-20250613    clang-21
arm64  randconfig-003-20250613    clang-21
arm64  randconfig-004-20250613    gcc-15.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

