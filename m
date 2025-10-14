Return-Path: <linux-renesas-soc+bounces-22986-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 18B29BD76CE
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Oct 2025 07:31:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 75D2218A2688
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Oct 2025 05:32:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71FA81C1AAA;
	Tue, 14 Oct 2025 05:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QHFf3abY"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56A5113DBA0
	for <linux-renesas-soc@vger.kernel.org>; Tue, 14 Oct 2025 05:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760419914; cv=none; b=ZAl5hs42SkaSxiVyavdOK90blm8Nxa4v5fEygcdplhB4G5mCe0fhpemDMpW7avfsEcPXfFwyjILvxt0D0mP0Gim+Ek3jLAXutfiX6C/CkTypbB4zVM16RmM/87R22UpfzUfl2kErAPxa+7AYqWowpBOJU8CQTSd1+qmp9xlBRWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760419914; c=relaxed/simple;
	bh=bT8sXR28AEau7rLmTjlvNomonhtrxltB5NH68WUojfk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=aiLgx/lzEtJreW9TchwTyn1qTDn7f8q3VCtzJEP4DLGKeAgtzettrBUxM+KcuzaXFE++de1wLccOcKIxBMRjZw4iiL+HF5o+OE1m63IuGtjJioKDp0udJoKKWkuwKFyrKaX65aQnHxJdnQt8cOiX+0WkGI2z7bh7uZ9Sw4ogrE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QHFf3abY; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760419912; x=1791955912;
  h=date:from:to:cc:subject:message-id;
  bh=bT8sXR28AEau7rLmTjlvNomonhtrxltB5NH68WUojfk=;
  b=QHFf3abYPsVfmk7PzCQngqxpjdBjR0MQpnoDNHnjt1ej9qatlhid/sgx
   XxMFZXiFRJb+V350AqlTCc818de6SuXqDtmB/LUydfA+mU0rrRnQeoXGN
   bN7LuepvTcpjYV73DokTXJLnDK0AoALjTymXEpEmh+rn3u2eBkG0SE4W0
   ft3BHVhLS50WVFzc8Ykct75c2Q67ZNZRzghjLRimYK3ZxHQoACHJdGKlt
   SEvEug6EucY19S03e341kvmG6IYOKf6FkWuYkXER1KjfaT2nP1JU0B48u
   9omjBNjqUeFrKBjSRoqnn1a2Aq3vNpAXwzsVG+RfCNPTI6SGYnGaNC0au
   w==;
X-CSE-ConnectionGUID: Kt8IRkWBS2m31KrQ/Hhvuw==
X-CSE-MsgGUID: 03pqM1YoQdejwmmxE9c1kg==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="80207600"
X-IronPort-AV: E=Sophos;i="6.19,227,1754982000"; 
   d="scan'208";a="80207600"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2025 22:31:52 -0700
X-CSE-ConnectionGUID: 94pgZEJxRB6FXPv9bvRQuw==
X-CSE-MsgGUID: XfVUleKsQeuFVX3Lg4ZAPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,227,1754982000"; 
   d="scan'208";a="182563934"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 13 Oct 2025 22:31:50 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v8XcJ-0002Oj-0M;
	Tue, 14 Oct 2025 05:31:00 +0000
Date: Tue, 14 Oct 2025 13:10:20 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-dts-for-v6.19] BUILD SUCCESS
 847d0527af0032f107f8ac7f83056e6722ef2de4
Message-ID: <202510141312.QLFqlj3W-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-dts-for-v6.19
branch HEAD: 847d0527af0032f107f8ac7f83056e6722ef2de4  arm64: dts: renesas: r9a09g087: Add Cortex-A55 PMU node

Unverified Warning (likely false positive, kindly check if interested):

    arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-rpi-display-2-5in.dtb: dsi@fed80000 (renesas,r8a779g0-dsi-csi2-tx): '#address-cells', '#size-cells', 'panel@0' do not match any of the regexes: '^pinctrl-[0-9]+$'
    arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-rpi-display-2-7in.dtb: dsi@fed80000 (renesas,r8a779g0-dsi-csi2-tx): '#address-cells', '#size-cells', 'panel@0' do not match any of the regexes: '^pinctrl-[0-9]+$'

Warning ids grouped by kconfigs:

recent_errors
|-- arm64-randconfig-051-20251014
|   |-- arch-arm64-boot-dts-renesas-r8a779g3-sparrow-hawk-rpi-display-5in.dtb:dsi-fed80000-(renesas-r8a779g0-dsi-csi2-tx):address-cells-size-cells-panel-do-not-match-any-of-the-regexes:pinctrl
|   `-- arch-arm64-boot-dts-renesas-r8a779g3-sparrow-hawk-rpi-display-7in.dtb:dsi-fed80000-(renesas-r8a779g0-dsi-csi2-tx):address-cells-size-cells-panel-do-not-match-any-of-the-regexes:pinctrl
|-- arm64-randconfig-052-20251014
|   |-- arch-arm64-boot-dts-renesas-r8a779g3-sparrow-hawk-rpi-display-5in.dtb:dsi-fed80000-(renesas-r8a779g0-dsi-csi2-tx):address-cells-size-cells-panel-do-not-match-any-of-the-regexes:pinctrl
|   `-- arch-arm64-boot-dts-renesas-r8a779g3-sparrow-hawk-rpi-display-7in.dtb:dsi-fed80000-(renesas-r8a779g0-dsi-csi2-tx):address-cells-size-cells-panel-do-not-match-any-of-the-regexes:pinctrl
|-- arm64-randconfig-053-20251014
|   |-- arch-arm64-boot-dts-renesas-r8a779g3-sparrow-hawk-rpi-display-5in.dtb:dsi-fed80000-(renesas-r8a779g0-dsi-csi2-tx):address-cells-size-cells-panel-do-not-match-any-of-the-regexes:pinctrl
|   `-- arch-arm64-boot-dts-renesas-r8a779g3-sparrow-hawk-rpi-display-7in.dtb:dsi-fed80000-(renesas-r8a779g0-dsi-csi2-tx):address-cells-size-cells-panel-do-not-match-any-of-the-regexes:pinctrl
|-- arm64-randconfig-054-20251014
|   |-- arch-arm64-boot-dts-renesas-r8a779g3-sparrow-hawk-rpi-display-5in.dtb:dsi-fed80000-(renesas-r8a779g0-dsi-csi2-tx):address-cells-size-cells-panel-do-not-match-any-of-the-regexes:pinctrl
|   `-- arch-arm64-boot-dts-renesas-r8a779g3-sparrow-hawk-rpi-display-7in.dtb:dsi-fed80000-(renesas-r8a779g0-dsi-csi2-tx):address-cells-size-cells-panel-do-not-match-any-of-the-regexes:pinctrl
`-- arm64-randconfig-055-20251014
    |-- arch-arm64-boot-dts-renesas-r8a779g3-sparrow-hawk-rpi-display-5in.dtb:dsi-fed80000-(renesas-r8a779g0-dsi-csi2-tx):address-cells-size-cells-panel-do-not-match-any-of-the-regexes:pinctrl
    `-- arch-arm64-boot-dts-renesas-r8a779g3-sparrow-hawk-rpi-display-7in.dtb:dsi-fed80000-(renesas-r8a779g0-dsi-csi2-tx):address-cells-size-cells-panel-do-not-match-any-of-the-regexes:pinctrl

elapsed time: 911m

configs tested: 13
configs skipped: 118

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
arm               allmodconfig    gcc-15.1.0
arm                allnoconfig    clang-22
arm               allyesconfig    gcc-15.1.0
arm    randconfig-001-20251013    gcc-10.5.0
arm    randconfig-002-20251013    clang-22
arm    randconfig-003-20251013    gcc-12.5.0
arm    randconfig-004-20251013    clang-22
arm64             allmodconfig    clang-19
arm64              allnoconfig    gcc-15.1.0
arm64  randconfig-001-20251013    clang-19
arm64  randconfig-002-20251013    gcc-8.5.0
arm64  randconfig-003-20251013    clang-22
arm64  randconfig-004-20251013    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

