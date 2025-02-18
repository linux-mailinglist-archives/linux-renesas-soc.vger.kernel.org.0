Return-Path: <linux-renesas-soc+bounces-13301-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 22EE1A3AB3D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Feb 2025 22:41:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DA2ED1664CC
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Feb 2025 21:41:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05F431D5AD3;
	Tue, 18 Feb 2025 21:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Vt/d17Lc"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B35FA1D5165
	for <linux-renesas-soc@vger.kernel.org>; Tue, 18 Feb 2025 21:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739914901; cv=none; b=bIIXnUA1B4MJ2wXC1c2j0dDJYpZnV2c4KI+4O2r4XfxHLpEPVqVYcM+ICywcOTMfOJeCFRWEnCvxBpf9VCthemaZt1VNYvfiTDa9uvGnRQm/ZElU7tLVqNkt7s4rP4xM+0pJPPfwmBFI0hXIW9Ee4chqmkCDTuVNeBClYQBzLtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739914901; c=relaxed/simple;
	bh=+g2JQHK48qz0KypJ7sBB1KY2sUwRlGcJHHBbqPvjQZ4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=QL8izwVpfS4gqQRal+JMKuf75g3NH0copZBx8PRNCDH9Jl8aoxKOd4HYMqSXUzClVZFXPZFvAY1d/Rim9VTC/d9TG1iFChnkBtIBoK6hUSDE19TnHx4vtoLrwtuR8lqeUePkGPuAudx4r/ZvNkFws4X0L6K9shJHp8cul+pZ4XY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Vt/d17Lc; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739914900; x=1771450900;
  h=date:from:to:cc:subject:message-id;
  bh=+g2JQHK48qz0KypJ7sBB1KY2sUwRlGcJHHBbqPvjQZ4=;
  b=Vt/d17LcqdN/c8Pj2u4U/DcftfPNBwF8/2CAHbEIidIZ5ptSAREIC743
   yX6NTYaAFNceDHJNrGDTLbh4eLIQX7O26zNrP1nE/1MvjPCSP57GjQ7Ga
   ebzNs7gq5FFP7HNAdFfdj8LbzzQumB+gy7/2JY1Y2rEYSygjLz9sqVVXT
   rDh72RQiMmrhmPebEiJGwQCR+RXF/t76zbtdwioWoXJtM2zdAOc8tbhRg
   Woyj0jxmbhobQXJw+GllWkgBdQ9+Xpi3WbvCyafgQZkEjCc56RCUAIUv1
   9M8j/t8imDWAXMVpMBbaUbkOE4D2P1KLcKVz6gkVzJCAzR6xlwAGDhD38
   Q==;
X-CSE-ConnectionGUID: SwRLVjV2SVS2LRsYLy51rQ==
X-CSE-MsgGUID: WoBL6MYPQUGDKZDe/CC/bQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="52040322"
X-IronPort-AV: E=Sophos;i="6.13,296,1732608000"; 
   d="scan'208";a="52040322"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2025 13:41:40 -0800
X-CSE-ConnectionGUID: manMQvjnSnalzt274ysWHg==
X-CSE-MsgGUID: i78DLlijSRmUmmwDUZ5nhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="114998162"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 18 Feb 2025 13:41:39 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tkVLQ-0000uJ-2U;
	Tue, 18 Feb 2025 21:41:33 +0000
Date: Wed, 19 Feb 2025 05:40:46 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-dts-for-v6.15] BUILD SUCCESS
 e5bfc2c5a2e6b4dbb3103cce7004557492dd47cd
Message-ID: <202502190540.SPs9K5kA-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-dts-for-v6.15
branch HEAD: e5bfc2c5a2e6b4dbb3103cce7004557492dd47cd  arm64: dts: renesas: r9a08g045: Add OPP table

elapsed time: 732m

configs tested: 11
configs skipped: 107

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
arm               allmodconfig    gcc-14.2.0
arm               allyesconfig    gcc-14.2.0
arm    randconfig-001-20250218    gcc-14.2.0
arm    randconfig-002-20250218    gcc-14.2.0
arm    randconfig-003-20250218    gcc-14.2.0
arm    randconfig-004-20250218    clang-21
arm64             allmodconfig    clang-18
arm64  randconfig-001-20250218    clang-21
arm64  randconfig-002-20250218    clang-21
arm64  randconfig-003-20250218    gcc-14.2.0
arm64  randconfig-004-20250218    clang-16

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

