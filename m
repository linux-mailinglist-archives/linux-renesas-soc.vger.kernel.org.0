Return-Path: <linux-renesas-soc+bounces-14152-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EDA9AA56D6D
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  7 Mar 2025 17:19:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C84673A8034
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  7 Mar 2025 16:18:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9BAB239096;
	Fri,  7 Mar 2025 16:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NYXMRifY"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CCB5238D22
	for <linux-renesas-soc@vger.kernel.org>; Fri,  7 Mar 2025 16:18:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741364309; cv=none; b=IjVtVUYFf0+j1mQMnmAd0o+5r6mU/zlkpjo0hv4IyIqO2kNOXFx6ngvqJjG89tdunZQZM61Wpc++BeNr+zDha4/rOBEWo36BRJqd5q9SDR5n8h+B5wDREEZenTaHsh8Yljv9Z8svfym6n7wdwhz7z5gbZdP/4hOq/cmZ9WXJBLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741364309; c=relaxed/simple;
	bh=KYaLeD3QVkoprNdQUt7dpXW6r0MlCTRmV7g24F3ttQs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=WYKJNRcEbFUrtHV+3EyzBkz9AMQ42vd2eKejgpKVBmUQNikg79xe3wsQk+Rnn7XH28I9WUFmDh4Q/YZtSMXL6hp4lHNqR3WPpSIBh4miOI3WPcj7+vWYMUiNk/TwhvXzM3P65TWr84T1QlEbJujMbMFW6wSfEbxt+aT2pzSrQfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NYXMRifY; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741364308; x=1772900308;
  h=date:from:to:cc:subject:message-id;
  bh=KYaLeD3QVkoprNdQUt7dpXW6r0MlCTRmV7g24F3ttQs=;
  b=NYXMRifY+TnBF+xZGwJtndUCC+l84dSR78oM9oM/76nKPh4+vJR6v9WB
   oCmRr5IWaO23zHXTK+N4KOJwSxyoMVoqBBRPhF8aEkW0k/2taAemXJEMa
   pI3rwwb5bj73G1QUk670ww1rm2dL+GpwBR007hL+fm89wDAZ0pThKjUou
   u7U/PHHpYv+vT3sUbiew1xCz0gj7WTgS5CHdGpAdbgU0gthcsB1WkMOOK
   n1L8bdRS+TcnKuFVLpFt1A2Vg81/kl6QOffqKFrwbpPqpdV7nMOrnbry+
   cTCwjFMP/V553H+viPnoT/yBHfJATy1b754Xxp6VJmEUieoAU8p813ZSb
   g==;
X-CSE-ConnectionGUID: RPryTBsTSHu4pCEjoprVlQ==
X-CSE-MsgGUID: +Y1/gMvEQYCG3+MeVN9KNw==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="29997647"
X-IronPort-AV: E=Sophos;i="6.14,229,1736841600"; 
   d="scan'208";a="29997647"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2025 08:18:28 -0800
X-CSE-ConnectionGUID: 7lixBJg4QwmPMj2qDGKaYg==
X-CSE-MsgGUID: X+fnMIzvTqK5Ao5cQ3cHCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="119890775"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 07 Mar 2025 08:18:27 -0800
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tqaP2-0000k3-1y;
	Fri, 07 Mar 2025 16:18:24 +0000
Date: Sat, 08 Mar 2025 00:17:38 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-dts-for-v6.15] BUILD SUCCESS
 8bf8ad268e46403c7140ea5aaa85e9c659117dbc
Message-ID: <202503080032.zsQ7x2ag-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-dts-for-v6.15
branch HEAD: 8bf8ad268e46403c7140ea5aaa85e9c659117dbc  arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Enable Mali-G31

elapsed time: 1456m

configs tested: 10
configs skipped: 119

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
arm                allnoconfig    clang-17
arm    randconfig-001-20250307    clang-21
arm    randconfig-002-20250307    gcc-14.2.0
arm    randconfig-003-20250307    clang-19
arm    randconfig-004-20250307    clang-21
arm64              allnoconfig    gcc-14.2.0
arm64  randconfig-001-20250307    gcc-14.2.0
arm64  randconfig-002-20250307    clang-15
arm64  randconfig-003-20250307    gcc-14.2.0
arm64  randconfig-004-20250307    clang-15

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

