Return-Path: <linux-renesas-soc+bounces-20657-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 294E6B2B320
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 Aug 2025 23:00:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CC6AD68703B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 Aug 2025 20:58:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A46611D9324;
	Mon, 18 Aug 2025 20:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SqeA82r9"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20E8F221FB4
	for <linux-renesas-soc@vger.kernel.org>; Mon, 18 Aug 2025 20:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755550653; cv=none; b=OysZvzbAFEM5IyxBHZ0eooxebkPVOw/5vM0CiVjgQ3iIfEsuTAPhDtmmW/uDLEI1zk64bET/94hY7yVDehwep/w8NMyF2hiD7kbG7+E1g0SgOoDT1JeJhpD9VhRISW9EMgt2axiV4Q7HhJmeZQQLDgqBvi3EpTSWMu1CUj5W4Zw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755550653; c=relaxed/simple;
	bh=1WSH/RzmVIMlQw+uco3CufGxLoFxP45ILZ18plseQ+0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=i84PRfLWVSwtYrKUhHrOdVnKjUrS3qrOLajm0timOKZ4FKz20OK8PGF/H5nm2hukWKhe3afGMJl9fC5m3OnKt6/6Gb4KKeLclxtw3kF0hQ28vNANyY2xUNpFuildKSbzh3ajm+LwDNSEtGEwG3Cfwbo/TaKmxyk40dtpm+4gkb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SqeA82r9; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755550652; x=1787086652;
  h=date:from:to:cc:subject:message-id;
  bh=1WSH/RzmVIMlQw+uco3CufGxLoFxP45ILZ18plseQ+0=;
  b=SqeA82r9IVHIKW6aeMXhU6EXjZ0gymXruVPATEWVu/FO1FTJcblHXsvd
   J4zgrz4RatscaGFntG2gu+kW2BByb7inPPVZ5bGscCnYrV8v3d3pafSwY
   4BuItn7WqRpUAgXkgAQIYdG1XKMWK8GQgmkkvz573FBkI97cR6Be1iaet
   QDFe2vIPBtrJO4XPbO/AoOxJtsiYat74mBp8i8uUOh7CXEl4Cg6TVK3K4
   EYBsbXbiKDO7RN9hwcodg/yAiXKEAa6VJ4X5ifdlgdiB+GoIuDk9Tu221
   CfEMzR8+dr0ePPchh9UFDYQoHuvCLChGor5+ld/3dt5qIGmJ5vMDY02Mm
   A==;
X-CSE-ConnectionGUID: 0NukMUbyRqmDwU53FW6U8g==
X-CSE-MsgGUID: ySrZOTgRQiSt9IfkzU88xQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11526"; a="57713944"
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; 
   d="scan'208";a="57713944"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2025 13:57:31 -0700
X-CSE-ConnectionGUID: BpoSfewCR02Zmai2rJwRUg==
X-CSE-MsgGUID: AgkRTnhpT/CDay/+1hRv+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; 
   d="scan'208";a="167291364"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 18 Aug 2025 13:57:31 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uo6us-000GCh-2W;
	Mon, 18 Aug 2025 20:57:20 +0000
Date: Tue, 19 Aug 2025 04:56:07 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-dts-for-v6.18] BUILD SUCCESS
 9471de64c9cc15a74e11eaa0c6156fe866ec11c3
Message-ID: <202508190401.wTjMw969-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-dts-for-v6.18
branch HEAD: 9471de64c9cc15a74e11eaa0c6156fe866ec11c3  arm64: dts: renesas: sparrow-hawk: Update thermal trip points

elapsed time: 730m

configs tested: 13
configs skipped: 118

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
arm               allmodconfig    gcc-15.1.0
arm                allnoconfig    clang-22
arm               allyesconfig    gcc-15.1.0
arm    randconfig-001-20250818    gcc-12.5.0
arm    randconfig-002-20250818    clang-22
arm    randconfig-003-20250818    clang-18
arm    randconfig-004-20250818    gcc-10.5.0
arm64             allmodconfig    clang-19
arm64              allnoconfig    gcc-15.1.0
arm64  randconfig-001-20250818    gcc-11.5.0
arm64  randconfig-002-20250818    gcc-12.5.0
arm64  randconfig-003-20250818    gcc-8.5.0
arm64  randconfig-004-20250818    clang-22

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

