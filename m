Return-Path: <linux-renesas-soc+bounces-23986-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DEB48C27B90
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 01 Nov 2025 11:14:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C44AD3A486D
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  1 Nov 2025 10:14:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 886782135B9;
	Sat,  1 Nov 2025 10:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hJLicvFj"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DBB220C463
	for <linux-renesas-soc@vger.kernel.org>; Sat,  1 Nov 2025 10:14:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761992083; cv=none; b=iHz9vEE7O1r2gBkCp6gy0KWeVwmXyLUBmMSq5rJyDjdyimIoraWGJ35UqsTpUX4TRbH9tvFt/Du/UheBfTL/7V9EgdXNDOdX7ATrCffRLSJNjCUjk83tnhCMbWp3CKd7EVhFFtZh5yYT1O1xbwYKCoX6hTByFUfAyiPIuyrW3gY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761992083; c=relaxed/simple;
	bh=leAjR2TTRKnldK8y0yZN5h2NTkra5jscpQIOVvjuQPQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=dutnMTnshGDWFpWEgeeAIAcuNaSAZuggkXMxypQws3Lmr6tBEnw2vqOaEZqKAxd+PVl01DtBNRY6UlL59UMB9iSUVcryv6yoemrGq6+ac9qIxuOLnolHjZ5b9E55mlJuhhOKZ8L42kuSFQRfSAW/cHmjN9fAenS2UPu/YdxZkTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hJLicvFj; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761992081; x=1793528081;
  h=date:from:to:cc:subject:message-id;
  bh=leAjR2TTRKnldK8y0yZN5h2NTkra5jscpQIOVvjuQPQ=;
  b=hJLicvFjmyKwwmcoRmJ2zsOY3oFDjzZp2WupK0tcrv2eue5brpwhUuNz
   2BNtTO0WhoTcxn08waCNk3pppQhEiHZassXEle06t47bIEdpeeSzjSeSd
   AHyJOcsg4HVM56uiKR8k+zbsEKUQ26tUmny9JgBpGKQklob8Fgu1ridSn
   7k78K0D3y//5uI9n4duS5PAJWVCMmEhWDBGFkdKBhA2+jGk7SJkcZV7QH
   xjItojmiZ+PKg2gDryQ27YKyqTnE6eJwktTd5NJKL1Z+K6R4gUWapw5Yj
   tu2wY+ftnHd62S3USdiLkghYjQ1xOCN7BYPkMcLQ+2CnY5zq7TQHeeeMi
   w==;
X-CSE-ConnectionGUID: Cy2DI4cmQTCC7CK9IkYncQ==
X-CSE-MsgGUID: OOGtOOHOTvSpHr68u+5Yjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11599"; a="63345336"
X-IronPort-AV: E=Sophos;i="6.19,271,1754982000"; 
   d="scan'208";a="63345336"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2025 03:14:40 -0700
X-CSE-ConnectionGUID: doLhEtDKRt6Q2dQ67b0RNg==
X-CSE-MsgGUID: SJLtvzxwRpOGb4cpsxYjBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,271,1754982000"; 
   d="scan'208";a="186121318"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 01 Nov 2025 03:14:40 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vF8d3-000O6x-2z;
	Sat, 01 Nov 2025 10:14:37 +0000
Date: Sat, 01 Nov 2025 18:14:07 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-dts-for-v6.19] BUILD SUCCESS
 9d22a34a016313137b9e534a918f1f9aa790aa69
Message-ID: <202511011801.OqFa5HMh-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-dts-for-v6.19
branch HEAD: 9d22a34a016313137b9e534a918f1f9aa790aa69  arm64: dts: renesas: sparrow-hawk: Fix full-size DP connector node name and labels

elapsed time: 1475m

configs tested: 23
configs skipped: 158

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
arm                    allnoconfig    clang-22
arm             mvebu_v7_defconfig    clang-22
arm        randconfig-001-20251031    gcc-14.3.0
arm        randconfig-002-20251031    clang-22
arm        randconfig-003-20251031    gcc-11.5.0
arm        randconfig-004-20251031    clang-22
arm             spear3xx_defconfig    clang-17
arm             spear6xx_defconfig    clang-22
arm             vexpress_defconfig    gcc-15.1.0
arm64                  allnoconfig    gcc-15.1.0
arm64                 allyesconfig    clang-22
hexagon    randconfig-001-20251101    clang-19
hexagon    randconfig-002-20251101    clang-19
loongarch  randconfig-001-20251101    clang-19
loongarch  randconfig-002-20251101    clang-19
nios2      randconfig-001-20251101    clang-19
nios2      randconfig-002-20251101    clang-19
parisc     randconfig-001-20251101    clang-20
parisc     randconfig-002-20251101    clang-20
powerpc    randconfig-001-20251101    clang-20
powerpc    randconfig-002-20251101    clang-20
powerpc64  randconfig-001-20251101    clang-20
powerpc64  randconfig-002-20251101    clang-20

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

