Return-Path: <linux-renesas-soc+bounces-23342-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 32B87BF3CA9
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Oct 2025 23:54:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 42B5D4E4104
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Oct 2025 21:54:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C632C226D16;
	Mon, 20 Oct 2025 21:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Rqz8VjCK"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BAF91E51FA
	for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Oct 2025 21:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760997280; cv=none; b=LgWcOQ7r9SNDKlTw0+EpjvhJfZMR4nJGGlUXKPrHmVmY98+h5Z5RXVNRJvDusarvxO9H73F+ZqnAInGV80OVzhGnc3ucGGKi4t7aJpEvP9Bb/tVpXt4CSblLwfojux3eTMnWSt3+UOJYYxht2+KQh8AnW6s47BvnBDXyiDudh/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760997280; c=relaxed/simple;
	bh=T3g/ICUFt8WJmfbBv0dVOl+pbbEOJHtdDtOlcS/jBFY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mHwHzUDMXj1NfEHHVU2Msnn68znOhCjAaDHPwh5cdQty1OLzL1EWV98p/Yh9/QPc5Whsi0r0sey+FghZnVgRluGw98Py1uEpT1HVtub9LahSISJUCnmjvuleNAzcZLHrhl9idibT4pQK56+ASPlMXx3X8ziQDr2Ow7zLkR/d1uo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Rqz8VjCK; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760997279; x=1792533279;
  h=date:from:to:cc:subject:message-id;
  bh=T3g/ICUFt8WJmfbBv0dVOl+pbbEOJHtdDtOlcS/jBFY=;
  b=Rqz8VjCKS50/jXy0vUqQIfhgQUo3OBbead62B5bLzp3RRCpYPguYTQY/
   PlvmYkbZoDO+6cMcUuK59dNzeBh93P/zC/h5iJVx2pAmXmXxObjJffZoV
   zecom732I3l8l3Mf9kOGtCE/rCL15cJeGiBuZ2Mdr4HyoTZyOjkG4cW5N
   pT/C6rY4wCSLJ4R2z7yD7mZJXhzNqHo6dn0qMI6p3+7Hhb58OwLM031Bm
   DIQ3tt+8riw+rp0a8nCuSU2QCCvPfU3YJBifOkrI5OQiB2eE7ZjACh902
   e0rNEP5RtQJ6CPnFuTaL3KZNVkGj5hsksb1aDgAccgvA4uZFyVOBCv73k
   Q==;
X-CSE-ConnectionGUID: yO/592fNTwCxlUdUNhOoVw==
X-CSE-MsgGUID: MwIvysKuQtaRh1vhUNxBRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="50693022"
X-IronPort-AV: E=Sophos;i="6.19,243,1754982000"; 
   d="scan'208";a="50693022"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2025 14:54:38 -0700
X-CSE-ConnectionGUID: 12xru+0hRWOWcbSb9jGS5g==
X-CSE-MsgGUID: VHCeq26uT4SzBN53ADYYkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,243,1754982000"; 
   d="scan'208";a="220590625"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 20 Oct 2025 14:54:37 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vAxpr-000ABZ-19;
	Mon, 20 Oct 2025 21:54:35 +0000
Date: Tue, 21 Oct 2025 05:53:42 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:next] BUILD SUCCESS
 c0286bfda2287aec42e8c1a77d0edeb8dc87e852
Message-ID: <202510210536.yDmtjNAF-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git next
branch HEAD: c0286bfda2287aec42e8c1a77d0edeb8dc87e852  Merge branch 'renesas-arm-defconfig-for-v6.19' into renesas-next

elapsed time: 727m

configs tested: 13
configs skipped: 118

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
arm               allmodconfig    gcc-15.1.0
arm                allnoconfig    clang-22
arm               allyesconfig    gcc-15.1.0
arm    randconfig-001-20251020    gcc-14.3.0
arm    randconfig-002-20251020    clang-22
arm    randconfig-003-20251020    clang-22
arm    randconfig-004-20251020    clang-22
arm64             allmodconfig    clang-19
arm64              allnoconfig    gcc-15.1.0
arm64  randconfig-001-20251020    clang-22
arm64  randconfig-002-20251020    gcc-12.5.0
arm64  randconfig-003-20251020    gcc-8.5.0
arm64  randconfig-004-20251020    gcc-10.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

