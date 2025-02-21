Return-Path: <linux-renesas-soc+bounces-13463-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 978F5A3F8DB
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Feb 2025 16:34:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 02FBD863A68
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Feb 2025 15:30:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65E531DFE00;
	Fri, 21 Feb 2025 15:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NIYd7s0D"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F41A1A23B7
	for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Feb 2025 15:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740151608; cv=none; b=u8Cth674JUpxPtI/cZRaK/XiIzf52EfI2cfKr5PwdhaihFMLXto8Nxim7NFYg6YdhrUTcuw0jS4XjulCy8FpoOqj0KuAsrhxTY/WMDSlDB1lzZ1uxDIZFLoXnr2WjY7j73uSQrkyQiTxKkyTiYw51YXZdtxSDlDhwGxelf+8HUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740151608; c=relaxed/simple;
	bh=0TKsr+bITdofakx67KHCjWWEdcA6WCECYUCp4bOxd7U=;
	h=Date:From:To:Cc:Subject:Message-ID; b=kA9w8GtAqMq2ul1cCE7mBaKsjdIjxoHh2aN/fPypswHLFCrabPHw2iMBBNHvCIGN6H+sXW/p9WYwnfpXVxBjHPXkM+qmxDzg4D4xmsGH1lxONOiCbK5r7kroUG1NEUI3I4P/7xG51AldQBbhNc83WzZD+XwlJxVQngWKgmkL3zc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NIYd7s0D; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740151606; x=1771687606;
  h=date:from:to:cc:subject:message-id;
  bh=0TKsr+bITdofakx67KHCjWWEdcA6WCECYUCp4bOxd7U=;
  b=NIYd7s0DiBJvsN8sOAK7qpjU3kcC3efhaleOZlF1l1jgOhPeB0xhM3GS
   0jpdZR3KM3PIzx8EiExs3u1tpRjQshQv7ia0dlTZPK0+R8zpjyKkuWFxz
   BeVstM2PeBZp/QztJD2q3mlVwNnFc9dcnMLLQxQIMFdL2yCtuLRjaQJtM
   AlmdbjPAzf3Uxn28sEw2t0OE6a9fVVMMTYeLRh4K/oD80CvdF6FkWmVN+
   wiDWo4JxkPMBHtUdTuXIf4HOjBJI+gjF7oofBjRlDbhPSBtaIgNLvLN82
   LrpfpgcwQ/DHlla+3vsIMYWGVBb6wr7SAXBmoGPFUKaXH8qRU9AsMpEE+
   g==;
X-CSE-ConnectionGUID: 3KnbyBmCS5CBcOBP2pV+ug==
X-CSE-MsgGUID: ps0DV+7qS8m6AER5HGBF4w==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="52403222"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="52403222"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2025 07:26:43 -0800
X-CSE-ConnectionGUID: KXAVHICkTKyfAXOOfFxa8Q==
X-CSE-MsgGUID: 5ckfgeu0TZq/rAh3V/5FbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="146284648"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 21 Feb 2025 07:26:42 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tlUvI-0005el-1y;
	Fri, 21 Feb 2025 15:26:40 +0000
Date: Fri, 21 Feb 2025 23:26:22 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-dts-for-v6.15] BUILD SUCCESS
 34737c14a3a373870034edf15580df3018978861
Message-ID: <202502212317.gIyXQ9V9-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-dts-for-v6.15
branch HEAD: 34737c14a3a373870034edf15580df3018978861  ARM: dts: renesas: r9a06g032: Fix UART dma channel order

elapsed time: 1290m

configs tested: 11
configs skipped: 107

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
arm               allmodconfig    gcc-14.2.0
arm               allyesconfig    gcc-14.2.0
arm    randconfig-001-20250221    gcc-14.2.0
arm    randconfig-002-20250221    clang-19
arm    randconfig-003-20250221    gcc-14.2.0
arm    randconfig-004-20250221    clang-21
arm64             allmodconfig    clang-18
arm64  randconfig-001-20250221    clang-15
arm64  randconfig-002-20250221    clang-21
arm64  randconfig-003-20250221    clang-21
arm64  randconfig-004-20250221    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

