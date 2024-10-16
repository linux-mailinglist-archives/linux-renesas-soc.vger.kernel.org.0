Return-Path: <linux-renesas-soc+bounces-9799-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 75DA29A087A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Oct 2024 13:36:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E4948B22C9C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Oct 2024 11:36:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22388206051;
	Wed, 16 Oct 2024 11:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jyx4IDFU"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A7AB18C33F
	for <linux-renesas-soc@vger.kernel.org>; Wed, 16 Oct 2024 11:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729078573; cv=none; b=mf1rOiro99S8ej2UA9wbEPpxBFpQZ0FhBYEkgoASvvqU2SpDxcUQ9r+/lEVI2ZGHWkia8smsBhSPlaViIq1Slzh2ZkDTxdq//o5xOENZCrthDvjKbAaiLwOsyNzHXEd4xqTdgEc0HcYIrPPERLlbGY8wVZT9TB7Oe52GAS4im+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729078573; c=relaxed/simple;
	bh=+R+JaO5SNkgGA+MZUEF8RijT0Lx27K+DIXHtmpe63F0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=RzfUI7i4VFnJq3DisntJAX+YScI+imQTmMbdkJ+PJ2iYPPpEkWzl5X8lSEpFyCbptUsYHXVYfxaOOtjlCtFXx51Az9Tktct57O30cvFiM5REjCdRN9qp7dvyFI8jLHpRzaPl3rC0dQoz+hfUV32ofCt7fcuUdHiuijV+jjEaxxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jyx4IDFU; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729078571; x=1760614571;
  h=date:from:to:cc:subject:message-id;
  bh=+R+JaO5SNkgGA+MZUEF8RijT0Lx27K+DIXHtmpe63F0=;
  b=jyx4IDFUFwTOexsbUU7sqiiSu3TnpNLO66vIW8wtqpwTI5o6WJL5tVV6
   uThH2DyBufM9D7jlLNdIVUR5wFamW3Mr+g4lBiI5/SuSAoZ0Sr4YF4OCy
   NQyw0v3jVah/6QIVwkm+0tW7WdVFaXuKVhYI61T7oMhGvL69lm8SvqvOc
   VLzSNWqCLgY1Sr+0DdV+FBejvSNLGl+KAAl6GyMcGWrYonnWBZM+WopNf
   gVnAKBOwQWl1dhV7A4D1UQsX2rvdWGfA0oMrzJRR3EX7z5xCDMJU0cZ17
   HfblY1D8D70ygSbz6GTJXKAANyFMVFbgqUtkqIajSQ+KmOxbEs1mjiqyM
   g==;
X-CSE-ConnectionGUID: +FP5LQUGQaKHXPNaUrUjoQ==
X-CSE-MsgGUID: ly/LZgqxTeifEZoDeaJ8ZA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28666374"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="28666374"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2024 04:36:11 -0700
X-CSE-ConnectionGUID: 7I7ZaaAlRq+VoxUOIAdPlQ==
X-CSE-MsgGUID: C648p+eERRqoO+uA1O5TNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,207,1725346800"; 
   d="scan'208";a="78363469"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 16 Oct 2024 04:36:09 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t12Jz-000KqN-1I;
	Wed, 16 Oct 2024 11:36:07 +0000
Date: Wed, 16 Oct 2024 19:35:12 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-dts-for-v6.13] BUILD SUCCESS
 1e03bd2cf0d68a4138f2347bd77ef12b8726d214
Message-ID: <202410161957.fgdNJ5ys-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-dts-for-v6.13
branch HEAD: 1e03bd2cf0d68a4138f2347bd77ef12b8726d214  arm64: dts: renesas: rzg3s-smarc: Use interrupts-extended for gpio-keys

elapsed time: 2983m

configs tested: 1
configs skipped: 68

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
riscv  allnoconfig    gcc-14.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

