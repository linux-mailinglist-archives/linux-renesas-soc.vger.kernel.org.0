Return-Path: <linux-renesas-soc+bounces-12748-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C82CA22CAC
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Jan 2025 12:44:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E5D877A262E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Jan 2025 11:43:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2075B1DE88B;
	Thu, 30 Jan 2025 11:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mrBk9KjH"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFF7C7482
	for <linux-renesas-soc@vger.kernel.org>; Thu, 30 Jan 2025 11:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738237469; cv=none; b=JK77Isw/fm296/QO1r4JMdnbEz/U0cpG0W9EtTdGyxzraUZ6t8V8syevF16RmnV0QY2cWm25fS0i3jDrLDgAK/VS+hS9fFZd1Z3XzW5YQ/f9SsNKAs9vU3gShK0NYddBLFK7wcvZLKptxTbY4BxxUGtAV1eGnaNPTSZmO3P83u0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738237469; c=relaxed/simple;
	bh=WsqX20LWTewJlrSVf0UT72z8u3xa/mprPP1wWf1TOZA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=LI84IjTgfWFa7E4lfHeJEHfXjtBE7b0C1axXMXdEnSeUstOQylUoF9NIkr31kUblV+wnohsjRINMSqupy+Its3bPhPbt9YEKDg4bbmvGellB4hLLFK/8NnLd5IS/bJljOXR8k1pUkuFni9MFmPlkYfVJYBbuR3R1MJ0FiCQG5JE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mrBk9KjH; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738237467; x=1769773467;
  h=date:from:to:cc:subject:message-id;
  bh=WsqX20LWTewJlrSVf0UT72z8u3xa/mprPP1wWf1TOZA=;
  b=mrBk9KjH1B3Fq+XncogDZ2nr+E0JQQmH0UeeLt0OJClAqNC2TSloB9LE
   SZT1IGyzaQLWGn3oiNorrajbAeJ1iEDY40yeoEy1La8aV8kIX+EdyZx8E
   if8IfEVrAsLWhQfVgHdSG+3MrxVzQia/rP0DBp/FcrVG//tRWZ85jxcKV
   vTJtFzQoZfxQfouE10hclZZEbJqXQ665RG6MP9wSf35jLSGxrEtMGlMV5
   6rCaT4uKEteO1ByASvsvm5gL4qxh+BUBoYqLPa7hoA1jMHk7DuFbWqlCR
   xJguI8Lccg2muLHVft+REc4ZQ3TgZAbbV+HuK3ZYbfG1STrvkAvA0kxQS
   Q==;
X-CSE-ConnectionGUID: H9/0RVBCTzCsJLooWuGGnQ==
X-CSE-MsgGUID: 2rZPDphJQjeDQfgETK2EeA==
X-IronPort-AV: E=McAfee;i="6700,10204,11331"; a="38680652"
X-IronPort-AV: E=Sophos;i="6.13,245,1732608000"; 
   d="scan'208";a="38680652"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2025 03:44:26 -0800
X-CSE-ConnectionGUID: tAv/vVaQTIu32oADgXp5ww==
X-CSE-MsgGUID: jB5lidFQSI+Qx9WohxPjQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="140187117"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 30 Jan 2025 03:44:26 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tdSy7-000k17-1q;
	Thu, 30 Jan 2025 11:44:23 +0000
Date: Thu, 30 Jan 2025 19:43:55 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-arm-defconfig-for-v6.15] BUILD
 SUCCESS 1683e7cdf1766a96002559db5ddf7e47808d941d
Message-ID: <202501301949.ai0SKu0D-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-arm-defconfig-for-v6.15
branch HEAD: 1683e7cdf1766a96002559db5ddf7e47808d941d  ARM: shmobile: defconfig: Supplement DTB with ATAG information

elapsed time: 1080m

configs tested: 18
configs skipped: 112

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                  allnoconfig    gcc-14.2.0
arc                    allnoconfig    gcc-14.2.0
arm                   allmodconfig    gcc-14.2.0
arm                    allnoconfig    clang-17
arm                    allnoconfig    gcc-14.2.0
arm                   allyesconfig    gcc-14.2.0
arm        randconfig-001-20250130    gcc-14.2.0
arm        randconfig-002-20250130    clang-20
arm        randconfig-003-20250130    gcc-14.2.0
arm        randconfig-004-20250130    clang-20
arm64                  allnoconfig    gcc-14.2.0
arm64      randconfig-001-20250130    clang-20
arm64      randconfig-002-20250130    gcc-14.2.0
arm64      randconfig-003-20250130    clang-20
arm64      randconfig-004-20250130    gcc-14.2.0
csky                   allnoconfig    gcc-14.2.0
hexagon                allnoconfig    gcc-14.2.0
loongarch              allnoconfig    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

