Return-Path: <linux-renesas-soc+bounces-6913-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2562591CE8A
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 29 Jun 2024 20:26:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8FC311F21BB5
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 29 Jun 2024 18:26:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19A8A8288D;
	Sat, 29 Jun 2024 18:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eewXBesX"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9908200AF
	for <linux-renesas-soc@vger.kernel.org>; Sat, 29 Jun 2024 18:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719685584; cv=none; b=POdHP15ABG5BCP3icQFQX1s+gaX2bMknzT5He9x3mBQJRrmv7nk/CS23Qvzxv48RXK1j++dpaoXOYCcFEEqrppHcQbPpncasjJI7YRo3+5HMXKT/QFYNhGZXxNBKiIc3+dn5LOcIrk+REM3lbBEWjU5jhU7SvhtxsKsSNyJ2IYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719685584; c=relaxed/simple;
	bh=kvn170d5wIPsy0DbP1AFW9gLcahCpjD4hTRj6cWGdfA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ogk85bMCW7yrhY3qjLjL7R/zaB+/eVORejRMqLfs6YnKZPjO6pA3Y6lo1Tmu4qut+smZKHw1p5KYezd3fHEp/stSfi1CYjy+ZJ59/BUumPxVgk6gHYOMpFqKhYjw24R1a/aruShGrvXSF3zktQRkorTcbLHBafig+bqdZnMkfwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eewXBesX; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719685582; x=1751221582;
  h=date:from:to:cc:subject:message-id;
  bh=kvn170d5wIPsy0DbP1AFW9gLcahCpjD4hTRj6cWGdfA=;
  b=eewXBesXEUjnDxwIHhO6sxWqyrINCWzEqU6YcmUrVeRZxMcub38jA9fo
   knUSRgFkAZhPzctGrkf0c3feBJpyTLmvbRsoz3WVNkEZ571D8zBIiZojz
   KCLO7gMfdQ1UZ77z9X7EQHzqRSp2boSbCOYb7kZihSvd/DO30KnHLQ70C
   jWfxHNex/g02AapmJepI4bv2jpRJT3aL4zKNwilsu1fHT4h9zMb9iLsjC
   fZtYp8Ytaw0RgRwU3BwpzmJhTQk9jkAjBj0ewTSe5hGG1DwrIg8faokoq
   eqqz9gJZik7yyNhwEP5FigvHcJ4IuSu7DLlP6TzR5cPsMtfqwmC2862ck
   A==;
X-CSE-ConnectionGUID: LPbdWtzkQVuFjXdYjXUWJw==
X-CSE-MsgGUID: wYO8gUp3TuePH1DzB7/Kww==
X-IronPort-AV: E=McAfee;i="6700,10204,11118"; a="20669452"
X-IronPort-AV: E=Sophos;i="6.09,172,1716274800"; 
   d="scan'208";a="20669452"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2024 11:26:21 -0700
X-CSE-ConnectionGUID: BlZMEpKFRM6jkZjzvSORzg==
X-CSE-MsgGUID: bcIk4pyYQyyME0AdoYUALA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,172,1716274800"; 
   d="scan'208";a="45081440"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 29 Jun 2024 11:26:20 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sNcmA-000K7y-1g;
	Sat, 29 Jun 2024 18:26:18 +0000
Date: Sun, 30 Jun 2024 02:25:44 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:topic/arch-timer-hyp-virt-v1] BUILD
 SUCCESS 110a242924eea09b9c0e3624e401ee42c6776035
Message-ID: <202406300243.oZWVe8Af-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git topic/arch-timer-hyp-virt-v1
branch HEAD: 110a242924eea09b9c0e3624e401ee42c6776035  arm64: dts: renesas: Add interrupt-names to arch timer nodes

elapsed time: 6112m

configs tested: 8
configs skipped: 196

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
arm                          collie_defconfig   gcc-13.2.0
arm                     davinci_all_defconfig   clang-19
arm                                 defconfig   clang-14
arm                           h3600_defconfig   gcc-13.2.0
arm                      integrator_defconfig   clang-19
arm                          ixp4xx_defconfig   gcc-13.2.0
arm                    vt8500_v6_v7_defconfig   gcc-13.2.0
arm64                               defconfig   gcc-13.2.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

