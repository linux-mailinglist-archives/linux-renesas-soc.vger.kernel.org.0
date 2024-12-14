Return-Path: <linux-renesas-soc+bounces-11340-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A7FF09F1E48
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 14 Dec 2024 12:34:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 65639167C9F
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 14 Dec 2024 11:34:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65969186287;
	Sat, 14 Dec 2024 11:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gHUfR81H"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 696B616DEB3
	for <linux-renesas-soc@vger.kernel.org>; Sat, 14 Dec 2024 11:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734176066; cv=none; b=VezaL3BNGCuzvN7HTao3W6rwWbC5rCqqs6c5USTQkjAFiuV5r0SladhLIE/Ffky/2GcGSxP7TqS1uFA0VVXrOC4CQN4XrYnuRxAKGdusYLPADhMLdFLK8NnSU/WAYJDItzkNu6CVGMYnkUvyg1jwyauCa2uQebtNEFGeS/lAiXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734176066; c=relaxed/simple;
	bh=qgcoNFgwhKXi4W9tlgzsjrwGtXXp2wOVRGspGQw6bHw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=dWrURtuZHe7jnRpC2vhydGUeCH6BCQGvoBKDG991alU3kNl5nNjy7oMQn55Ti1ObXhKBGDXd/0HYkVll95eXDVAO3GLi+P4h5xIPm1OXmkoMRVx6jESCgnmvltIEstripIwBYgrcONMXK1wP+qYDA2Yy/pwn+HJRn+l3utM9Tgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gHUfR81H; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734176064; x=1765712064;
  h=date:from:to:cc:subject:message-id;
  bh=qgcoNFgwhKXi4W9tlgzsjrwGtXXp2wOVRGspGQw6bHw=;
  b=gHUfR81Hh/+t6A8PB6dWn3FpI6nuefBtQO1RJbaGN5KY6VlTHOm8T5rZ
   r0D5gnIj68xDkh7LYdZAeTXwUrl53nAD0WjU2FsXABP7kOUb+C6gxSxsr
   eS8S/384UrYKbpMiopVoDbW2pK8ZlMyQkz1BxHBLvtkrMA5d9RqF1EmEx
   Wq6fnx6Jbxs7k/Exa5kdg8a4j8HGMOzxIeUBuZfq/hXEBEqRXNge9Yool
   gD1+FJR5XEkdPdwLdwAMLK6EK9kspRrAHuI1B8ulEPG+JPJSPVchtWCLS
   aSNCopwe5PtvCWCSx+mq2DbUPAtkX0nscLbmAzLjeEweH0MC6R/7fBjhg
   Q==;
X-CSE-ConnectionGUID: yfjhy8rVT1KicsSxZYF47Q==
X-CSE-MsgGUID: cz5Y9r4ZS6e2OHQL/VbKqw==
X-IronPort-AV: E=McAfee;i="6700,10204,11285"; a="34763025"
X-IronPort-AV: E=Sophos;i="6.12,234,1728975600"; 
   d="scan'208";a="34763025"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2024 03:34:24 -0800
X-CSE-ConnectionGUID: Vj/1TNU4S0SwmAjmIPIrxg==
X-CSE-MsgGUID: 8eDmOtp9R+iFAHP+aZxk4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="134111566"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 14 Dec 2024 03:34:23 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tMQPc-000CsV-2Q;
	Sat, 14 Dec 2024 11:34:20 +0000
Date: Sat, 14 Dec 2024 19:33:54 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-arm-defconfig-for-v6.14] BUILD
 SUCCESS a40f02b2923b6d58e76cfef760b8ed61a00f1d53
Message-ID: <202412141948.x14U04Ic-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-arm-defconfig-for-v6.14
branch HEAD: a40f02b2923b6d58e76cfef760b8ed61a00f1d53  arm64: defconfig: Enable R9A09G047 SoC

elapsed time: 1450m

configs tested: 8
configs skipped: 113

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
arm    randconfig-001-20241213    clang-16
arm    randconfig-002-20241213    clang-18
arm    randconfig-003-20241213    gcc-14.2.0
arm    randconfig-004-20241213    clang-18
arm64  randconfig-001-20241213    gcc-14.2.0
arm64  randconfig-002-20241213    gcc-14.2.0
arm64  randconfig-003-20241213    clang-18
arm64  randconfig-004-20241213    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

