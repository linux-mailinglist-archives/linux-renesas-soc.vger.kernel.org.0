Return-Path: <linux-renesas-soc+bounces-26569-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 7631CD0D962
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 10 Jan 2026 18:01:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B22433003FC6
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 10 Jan 2026 17:01:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D28332517AF;
	Sat, 10 Jan 2026 17:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XLHRzXoN"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F8251DF273
	for <linux-renesas-soc@vger.kernel.org>; Sat, 10 Jan 2026 17:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768064471; cv=none; b=BWGARnpz4fOUapKD6LvLkRLFY7Q9+15yvcGbHnMzpj3oKF3MyTde9VLktPOxAKEjFE0j0NlUdFQPM49D3UXsiaEPBxVADZ51SiAK05SPu8C/T5SXNDkL8uTtt+G2VbZ/6QpBfhnd5fH0LO96wSWygoMOEBU9XeIV8zSxeYyF5W8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768064471; c=relaxed/simple;
	bh=Ki1hkWfhGMJwrkysIt1n4II5Lzln5hC9pTzWGBZ4b6c=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ZxPhbq8MiDc7F3iwHmOOjU6OxF4nKxnpMAg70qIcjevH9mRFukhb0jFkLlJ3QenS9SCwr4DYK+hqWJ3T9clYln15CxCFMe9VB+64f7VEg5BKX1opwhGlfLPAYBWWeJXXlItUQi1QVmCmqUYXROqlqw+H4nd1AVSkz8IWSSh9tnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XLHRzXoN; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768064471; x=1799600471;
  h=date:from:to:cc:subject:message-id;
  bh=Ki1hkWfhGMJwrkysIt1n4II5Lzln5hC9pTzWGBZ4b6c=;
  b=XLHRzXoNws60Bu0aX90V/GKrAjujYxTwgEuijWWWAprfWuxYPjwQaw8z
   SZtUxSm0NZQX3m2qQQsuZW4akL9XNQgvTy6aQNVIp6HBJ7Zch9cVkyECa
   JJPdcEbx4w6R7SynMV2NvPkeGwDf8q9jnlH4xX+f8E+rWqo5s21vZKZ+6
   LGRwRpVmfzx/amuwmibBdosN0gLhFAUiH2fcapj9y+7uP5J73JR3qI67p
   /2zpSeJNyUEMx6PoJfK3eTEZa680LP/9oDXKGnn7BGpv8dbSQjKGu94iT
   GoUWXvXQWVscubcsWP0vree06wZJMgBVCeN59VXP2kaLDkOnBlhwYhmfW
   Q==;
X-CSE-ConnectionGUID: 5Z2DIIssQ3GBJEoKcH0PQA==
X-CSE-MsgGUID: WNle30+jQMOr7EA7wUBePg==
X-IronPort-AV: E=McAfee;i="6800,10657,11667"; a="86995324"
X-IronPort-AV: E=Sophos;i="6.21,215,1763452800"; 
   d="scan'208";a="86995324"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2026 09:01:10 -0800
X-CSE-ConnectionGUID: vw4nXZtVRdKeComUG0M/Qg==
X-CSE-MsgGUID: f23wwAFmS1aX0Bt5yPnIXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,215,1763452800"; 
   d="scan'208";a="203637325"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 10 Jan 2026 09:01:09 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vecKo-000000008tQ-1UG9;
	Sat, 10 Jan 2026 17:01:06 +0000
Date: Sun, 11 Jan 2026 01:00:55 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-arm-defconfig-for-v6.20] BUILD
 SUCCESS 898a23193bd860234342eef6ebcc00e9199e3513
Message-ID: <202601110149.9yY6GES8-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-arm-defconfig-for-v6.20
branch HEAD: 898a23193bd860234342eef6ebcc00e9199e3513  ARM: shmobile: defconfig: Refresh for v6.19-rc1

elapsed time: 7368m

configs tested: 10
configs skipped: 51

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
arc        allmodconfig    gcc-15.2.0
arc        allyesconfig    gcc-15.2.0
arm         allnoconfig    clang-22
arm        allyesconfig    gcc-15.2.0
arm64      allmodconfig    clang-19
arm64       allnoconfig    gcc-15.1.0
loongarch  allmodconfig    clang-19
m68k       allyesconfig    gcc-15.2.0
riscv      allmodconfig    clang-22
riscv      allyesconfig    clang-16

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

