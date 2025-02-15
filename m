Return-Path: <linux-renesas-soc+bounces-13181-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B3C8CA36A0C
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 15 Feb 2025 01:43:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7AE40168FEE
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 15 Feb 2025 00:43:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC7374C8F;
	Sat, 15 Feb 2025 00:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UqBYPCd4"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8FC4FC0A
	for <linux-renesas-soc@vger.kernel.org>; Sat, 15 Feb 2025 00:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739580219; cv=none; b=DidlQpTJntC7Aqy/9dr3zrHRgEgIr51ZncZthZeB69xvox9+8u6T6dl9PwN9LrwZBLfEOnUmCoOvpoMdsKoex0QMLXeHd9TAV/MnxE36yKAZq9whBMwjZqO6VVIpGCe0Ztm4o9al7f4tP36FEiZX9Iq/5m4SYnYOvcEzt5Gx0mk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739580219; c=relaxed/simple;
	bh=dWDtt3SbT4aPZYBW+mbhX9UHb6RyvQm2mqxWR6JIfH4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=NM6os4H2J7Tp+ogknvfOdz6wxaCVK1wx0FSZ/nQqny6izkstcs/Rlp80yO6pgNt76CiQdlSvlUCpYjXaFWoSC697Xv8hFgqgzc0pzD6CXRktUfnqOAqmaSIcZp2fYr+EF9bxS7xS1W8jUa08zdt6aflSfOfZ3FlnFrjII0U408c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UqBYPCd4; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739580218; x=1771116218;
  h=date:from:to:cc:subject:message-id;
  bh=dWDtt3SbT4aPZYBW+mbhX9UHb6RyvQm2mqxWR6JIfH4=;
  b=UqBYPCd4wdG5cW+u3FX7rfbLwgLeSJ4bDqk1enXUOredMVV+Rigy704R
   WfLkVdPjGBfO2IuCgr5fEQozv4MQFCmvqACjra0VvYt4HLitoRgsqiSkM
   Vti8XyTKLDsIp3oZzmDEAfDR6Jaw7YY73nPjz2BU5pS6vJj1jYkTJE5WT
   DGY/YGjAjwuUDybZV9DHstogNaMzt9bzo2CLbUKt/QOO8VJM00ox7mDzT
   FNqq3xAC9fLRa/zD9Oz5l748bXBsiROSlOf9Vgn8NRwWVJwtf/GRwH0P1
   /KPYm6p2oLQG01bvtHWNfjAFfj3IPE4nKNKIxLIqTbB9b6DJlSOwHF5xw
   w==;
X-CSE-ConnectionGUID: mEViHfxyTqGPK3lGyZ3omA==
X-CSE-MsgGUID: TiGY5zgKTcOqGVCQ8fBgYw==
X-IronPort-AV: E=McAfee;i="6700,10204,11345"; a="27937557"
X-IronPort-AV: E=Sophos;i="6.13,287,1732608000"; 
   d="scan'208";a="27937557"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2025 16:43:37 -0800
X-CSE-ConnectionGUID: HBap5b1VRIaapUpmKklbqg==
X-CSE-MsgGUID: WPHIRZjhSh2ax+P9aKVeeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,287,1732608000"; 
   d="scan'208";a="113457984"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 14 Feb 2025 16:43:37 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tj6HO-001AKx-1J;
	Sat, 15 Feb 2025 00:43:34 +0000
Date: Sat, 15 Feb 2025 08:43:07 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-dts-for-v6.15] BUILD SUCCESS
 3989937e697ba02848e3299c5b0c979c10811f55
Message-ID: <202502150800.8rnI5jEr-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-dts-for-v6.15
branch HEAD: 3989937e697ba02848e3299c5b0c979c10811f55  arm64: dts: renesas: rzg2: Add boot phase tags

Warning ids grouped by kconfigs:

recent_errors
`-- arm64-randconfig-051-20250215
    |-- arch-arm64-boot-dts-renesas-r9a07g044l2-remi-pi.dtb::compatible:oneOf-conditional-failed-one-must-be-fixed:
    |-- arch-arm64-boot-dts-renesas-r9a07g044l2-remi-pi.dtb::failed-to-match-any-schema-with-compatible:myir-remi-pi-renesas-r9a07g044l2-renesas-r9a07g044
    |-- arch-arm64-boot-dts-renesas-r9a08g045s33-smarc-pmod1-type-3a.dtb:clock-controller:power-domain-cells:was-expected
    |-- arch-arm64-boot-dts-renesas-r9a09g047e57-smarc.dtb:watchdog:compatible:oneOf-conditional-failed-one-must-be-fixed:
    |-- arch-arm64-boot-dts-renesas-r9a09g057h48-kakip.dtb::compatible:oneOf-conditional-failed-one-must-be-fixed:
    `-- arch-arm64-boot-dts-renesas-r9a09g057h48-kakip.dtb::failed-to-match-any-schema-with-compatible:yuridenki-kakip-renesas-r9a09g057h48-renesas-r9a09g057

elapsed time: 931m

configs tested: 11
configs skipped: 107

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
arm               allmodconfig    gcc-14.2.0
arm               allyesconfig    gcc-14.2.0
arm    randconfig-001-20250214    clang-16
arm    randconfig-002-20250214    gcc-14.2.0
arm    randconfig-003-20250214    clang-21
arm    randconfig-004-20250214    gcc-14.2.0
arm64             allmodconfig    clang-18
arm64  randconfig-001-20250214    gcc-14.2.0
arm64  randconfig-002-20250214    gcc-14.2.0
arm64  randconfig-003-20250214    gcc-14.2.0
arm64  randconfig-004-20250214    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

