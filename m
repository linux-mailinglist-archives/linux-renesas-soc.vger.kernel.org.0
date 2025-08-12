Return-Path: <linux-renesas-soc+bounces-20438-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E79F1B23C2D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 Aug 2025 01:03:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CC31E7A2625
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Aug 2025 23:02:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B6731DF27F;
	Tue, 12 Aug 2025 23:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="khMOnPES"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A63E1ADC69
	for <linux-renesas-soc@vger.kernel.org>; Tue, 12 Aug 2025 23:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755039819; cv=none; b=hOIm7YDy/iPy6LhfKzKW16m8wv+z7wpxVACc9aLdsW7DhGZE5Gu5+pF1yzfFeQwbMIDD8JjAWRW5ZdttbuoaUlGDt2mLMzwb1veQzIzCL6Q/KanZuEko5+9iHTbZqSN9RVT+UN6HEcZMzBmP3ZA/8RDoQWvF3u7TQjkC2zdrF7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755039819; c=relaxed/simple;
	bh=VRv1jXFt3sKEvYMFP43CMG9d9XBJqAZusC2e1jKArW4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=CaqaWPQiZ7aE+IZzXi5GcTa6skuBB/I2bqq7FPRqfOvUR6qRUZ5H5wKKc4K0gm6za8PCvSz0YNRFT4xlVgcbrLq1O/bd+3GxpEryuZsSdtJ4+0qdtzu4LCT0PPcufkld0fhdUkKCdS/mKbmRfEQWHGzxEe1NKFT/S0gvMjGQook=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=khMOnPES; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755039817; x=1786575817;
  h=date:from:to:cc:subject:message-id;
  bh=VRv1jXFt3sKEvYMFP43CMG9d9XBJqAZusC2e1jKArW4=;
  b=khMOnPESGxAndBfbmynVFYqBaZPXWSqqry/SKV+4TY5LfBOfYVqmp6gZ
   xV6TrgKEX85nUMCOq/ANJiiseQb1vtyPb0iLq8guOn2MIGafnhUN2FdTs
   04mQWkHImD9TtMJMHrfeoIKD4hWrh0Z2b9warciv0z858/i0W5ic4wWcW
   dFT9rjwUgSeJkbkWzU1ggwUvM32PnGfecsqq1LzeqWiLjNmHghKC7iv26
   l4xpg7ZSD1z2sSt4enOj0sT55qie+ebmPVcnQHmzDN1KZ67WmUzbvsSLz
   iLj0UcVTt4/0HFfggQkXO5sgc3CFOfp60vnt0rkkOl9ZTwbfgM/SCuYCF
   w==;
X-CSE-ConnectionGUID: 42hJOXS9SUiAWSmIgvC/yQ==
X-CSE-MsgGUID: falzBaa0Tm63y6UgPaRTog==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="57389216"
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; 
   d="scan'208";a="57389216"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2025 16:03:36 -0700
X-CSE-ConnectionGUID: iwdHqDB2SduBKPJ15zNbnA==
X-CSE-MsgGUID: /YyAQZHlSN2El4VweXe4yg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; 
   d="scan'208";a="190015574"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 12 Aug 2025 16:03:35 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uly1G-0009NA-1r;
	Tue, 12 Aug 2025 23:03:17 +0000
Date: Wed, 13 Aug 2025 07:02:03 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-dts-for-v6.18] BUILD SUCCESS
 256feb5be482315a91c1bd1a1808276f57ef76dd
Message-ID: <202508130757.qBekbtIO-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-dts-for-v6.18
branch HEAD: 256feb5be482315a91c1bd1a1808276f57ef76dd  ARM: dts: renesas: r7s72100: Add boot phase tags

elapsed time: 886m

configs tested: 13
configs skipped: 118

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
arm               allmodconfig    gcc-15.1.0
arm                allnoconfig    clang-22
arm               allyesconfig    gcc-15.1.0
arm    randconfig-001-20250812    clang-22
arm    randconfig-002-20250812    clang-22
arm    randconfig-003-20250812    gcc-14.3.0
arm    randconfig-004-20250812    gcc-10.5.0
arm64             allmodconfig    clang-19
arm64              allnoconfig    gcc-15.1.0
arm64  randconfig-001-20250812    gcc-8.5.0
arm64  randconfig-002-20250812    gcc-8.5.0
arm64  randconfig-003-20250812    gcc-14.3.0
arm64  randconfig-004-20250812    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

