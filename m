Return-Path: <linux-renesas-soc+bounces-14316-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DAFA3A5E57D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Mar 2025 21:39:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 567FD3ADC89
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Mar 2025 20:38:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D7DD1EE005;
	Wed, 12 Mar 2025 20:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X5FkI7Om"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD90F1C695
	for <linux-renesas-soc@vger.kernel.org>; Wed, 12 Mar 2025 20:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741811946; cv=none; b=dCuohDIFhDgTy8Kmw8iMaJAnP6Aqp0Q/wQqHa9vvBqq8BZTmt+UAJ/iBStqXgwe+BIPhb+37QArrPFAzbfMCxPSyxUOgkagcnN9DvuYk8SLGl1cKwuhY0Tjq4gUPAG4c+AohfChadJWG+kPK+s5gZ7GqOc8BhankgfrHNfbOn0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741811946; c=relaxed/simple;
	bh=fuud/qEr1JmjdwuuKcdXNrklEvmkrlS1GEnfwp+XZBo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ZAnGzCYkwx+55mpaJ77MUOld8iKuApCilHeBTxLUe5GLw2wpInV5TuV2uty6QBF+lPt+yM/SRuqA81RJTt3I/xEgI+0qB2AvzIjcbaK8X0PNthpS73BsoS29T+LWOreT0LUrWBVkt9Ch3QXpBPu6Yba+hUIlf1TScvoNHxXjLpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X5FkI7Om; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741811945; x=1773347945;
  h=date:from:to:cc:subject:message-id;
  bh=fuud/qEr1JmjdwuuKcdXNrklEvmkrlS1GEnfwp+XZBo=;
  b=X5FkI7OmYnKMxB8sJRTUv8rz3tHE9cWbE6mU1WF0jbjmwhVH2IMDCel9
   SH6sHs/XjGTHb8/9uei/jydGW6IuOUsrQ2cuUDtlnyJ6elVbff4GqnMtn
   2GqcE19hj+IpN7+9gNcw+gKLk4LSXPl/iBHMnLc3iDghxFSey/jNNn1pg
   jacNA62kq8Z8wFwRSZvzuHZVGzgmcpkV7Kf8cnLlbVQAx9sFC5fB/ErZz
   h+bzdzSD0I+jIMbHDEHRPY5xIqDk7hxDKvDRHZ518mbFjx36Sig4xI1QV
   mKh8sBMTHwQoAGdEf+Xq9r/wcbWEgmW/9YszShaKGlo29rzqkMnR4wtCu
   w==;
X-CSE-ConnectionGUID: XYK7T5TmTby057maF8RmuA==
X-CSE-MsgGUID: I8I9XdwNQx+NkIFhxv0XRg==
X-IronPort-AV: E=McAfee;i="6700,10204,11371"; a="68269288"
X-IronPort-AV: E=Sophos;i="6.14,242,1736841600"; 
   d="scan'208";a="68269288"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2025 13:39:04 -0700
X-CSE-ConnectionGUID: iNVHNKPSRL6VlqR1QgN8bA==
X-CSE-MsgGUID: zjksc2JcRnOWqiUavKwWjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,242,1736841600"; 
   d="scan'208";a="120730889"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 12 Mar 2025 13:39:02 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tsSqn-0008t1-0b;
	Wed, 12 Mar 2025 20:38:52 +0000
Date: Thu, 13 Mar 2025 04:37:20 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:fixes] BUILD SUCCESS
 379c590113ce46f605439d4887996c60ab8820cc
Message-ID: <202503130414.pBa4okMc-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git fixes
branch HEAD: 379c590113ce46f605439d4887996c60ab8820cc  ARM: shmobile: smp: Enforce shmobile_smp_* alignment

elapsed time: 723m

configs tested: 15
configs skipped: 120

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
arc               allmodconfig    gcc-13.2.0
arc               allyesconfig    gcc-13.2.0
arc    randconfig-001-20250312    gcc-13.2.0
arc    randconfig-002-20250312    gcc-13.2.0
arm               allmodconfig    gcc-14.2.0
arm               allyesconfig    gcc-14.2.0
arm    randconfig-001-20250312    clang-19
arm    randconfig-002-20250312    clang-21
arm    randconfig-003-20250312    clang-19
arm    randconfig-004-20250312    clang-21
arm64             allmodconfig    clang-18
arm64  randconfig-001-20250312    clang-21
arm64  randconfig-002-20250312    gcc-14.2.0
arm64  randconfig-003-20250312    gcc-14.2.0
arm64  randconfig-004-20250312    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

