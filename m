Return-Path: <linux-renesas-soc+bounces-20655-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CA1AB2B306
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 Aug 2025 22:58:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 40B4E521D1E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 Aug 2025 20:56:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92C5C216E24;
	Mon, 18 Aug 2025 20:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iIhVNzsV"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7FE53451B2
	for <linux-renesas-soc@vger.kernel.org>; Mon, 18 Aug 2025 20:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755550576; cv=none; b=tTdn5avbmtbP4Br0DQ0W17dJDdJTphJwALBEF+3ZtNcog0J1nBxIOmmFrfJMSaW4WaqnNIj5mDbYFScETNPIwjNvsW/Iwm0zPZsZbDPMPY4In2qjaFpGt9VYkAQP75oMJkWp+2A1RUQFMIcAdL80n0GILE6HM5e5y93Zm8KhxA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755550576; c=relaxed/simple;
	bh=3cNTNKMfhzxCs5kjj2FtnNxevjty146ZsA/rZq8yofk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=HTfvl1SiypFoKTiQxGOjgMn/X1I9VDFLUBp6ZW2EglmcjEJAsMTwWAKpqbKAW3Tzuv1CfMQfkwnj7nUEEImAldb2K2KqHsv+vYh2/ZMUNyyvZ+PioXgJQyTyJ4hQr4AftRBBFiHPUceWC9bKSdyNI+APEpwQA9ZNQIQHPsqHzDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iIhVNzsV; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755550575; x=1787086575;
  h=date:from:to:cc:subject:message-id;
  bh=3cNTNKMfhzxCs5kjj2FtnNxevjty146ZsA/rZq8yofk=;
  b=iIhVNzsVETE6VMxUhJaYDvmB7kqqydRjeuusKn4/GmwKiJx6lUUl21fO
   x8R5VvEs1Qq6qHxFgxbDQRCayleZ5rOjB6d65RgMvkE3WlZss9NBFUqey
   2Ip9hBQjW3hN48ANrgiXx3JHAbefAkiRgyh5DkB856o3/0kC3ri1ytOGx
   LQpZNrfHE6knxr11DRAogVh/KW2CaqEGXAd9Z+URGktkg4Rg7gzOzhMRx
   Ihi3yE9me2biDB/Fezmtqy157axyRNZVUflHkjYJIMwmZpNScMj4h6ecF
   jmiEywqy99P2AOFn30fMLKAUMsMdNCQr3kly5G6TCHrwOMJEDPzLoIwfS
   A==;
X-CSE-ConnectionGUID: mXjSx40PQX+SNzqNM2FGMA==
X-CSE-MsgGUID: +YVdxJxTRsCF8+dAmy968g==
X-IronPort-AV: E=McAfee;i="6800,10657,11526"; a="80373284"
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; 
   d="scan'208";a="80373284"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2025 13:56:15 -0700
X-CSE-ConnectionGUID: AnWDS11+RKmuVurJ93eRhg==
X-CSE-MsgGUID: iDYi2O+mSM6Tavg712Doyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; 
   d="scan'208";a="173019048"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 18 Aug 2025 13:56:14 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uo6ti-000GCZ-13;
	Mon, 18 Aug 2025 20:56:08 +0000
Date: Tue, 19 Aug 2025 04:55:08 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:next] BUILD SUCCESS
 eb33590872d1c32a76ef513ad7be58de29d9f921
Message-ID: <202508190402.g93pyI2x-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git next
branch HEAD: eb33590872d1c32a76ef513ad7be58de29d9f921  Merge branch 'renesas-dts-for-v6.18' into renesas-next

elapsed time: 729m

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

