Return-Path: <linux-renesas-soc+bounces-15550-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 43728A8009C
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Apr 2025 13:33:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 664F644597F
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Apr 2025 11:23:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BB2F265CDD;
	Tue,  8 Apr 2025 11:23:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cic+lxgc"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7045F263C78
	for <linux-renesas-soc@vger.kernel.org>; Tue,  8 Apr 2025 11:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744111429; cv=none; b=PssXjYqZOx3NIq7F3VNxCbCGZ0ohh92M89QxJwiIRdBCjASmSTtSKPfA9jPypLDA04TKFcYVsY9t/QWMmm0PK37KDKHANiDH0Yz7v5zC8TqEy0MBMO0+CIyx8RIU6EnkTkYPBRlRokD8wiwpTpTdiqRdOaI3a3GvqaLmkM1JZ+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744111429; c=relaxed/simple;
	bh=aKZ9MMjFUVC8eIbcdf1Do9rDMI6hE7777FBVHi0CJXI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=YBf5BB60fpZg3iiVEbZR1xXo03uVwn8b5iRubneRw23Kws+EWDNn6/pLYWG02dgGDs1DWkudlMczkI7bIf9p/SOvYpBttjYM9fuVqtavIOySB7k6CbYWeeH5XCyvj7RT+5scvG6mhly0Reb2i2R/SiYiYFOZwF6HM9xzk0c7lFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cic+lxgc; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744111427; x=1775647427;
  h=date:from:to:cc:subject:message-id;
  bh=aKZ9MMjFUVC8eIbcdf1Do9rDMI6hE7777FBVHi0CJXI=;
  b=cic+lxgcyzkhYmsmfHA/iTOGDHpih9VHHmHxMHy0dGcOq/YQvTh8M5/J
   d+Beae5Gv52uLf83oCn3UvrPhNpg1V8xOqsVV1uOSVyAhmQjW2SZoCApt
   /fwhvnC7lC3b+J5+YomKvSztRQtFz4zoPcsQWblwRpssCi/VaPW7sqL8e
   xUZIGnF3mdDr6ovT8dKe2hlldQ/ario1R9r5cDipLLbAYeD4HfhLWvJog
   sEVCMmb4xPzY1LBEbOnjdeBmhGcjxGvhbfeGtKQuvrgBk5wUgf13n6gsX
   8cdkgiT4GQSlHvtOlCE7FdRDmy732GtY+9D88hJ/Xd/637vNFc4F+AlQZ
   w==;
X-CSE-ConnectionGUID: uWtgwJKuRACUkbNbIFXxow==
X-CSE-MsgGUID: GnLKP1rCQZCOCa85PTZG5w==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="62939509"
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; 
   d="scan'208";a="62939509"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2025 04:23:46 -0700
X-CSE-ConnectionGUID: rfb5zgF1R1W7SThGgkn3EA==
X-CSE-MsgGUID: PtTLr7K5QKO0dce4K+0D7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; 
   d="scan'208";a="151423429"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 08 Apr 2025 04:23:45 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u273P-0004wZ-0F;
	Tue, 08 Apr 2025 11:23:43 +0000
Date: Tue, 08 Apr 2025 19:22:53 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:next] BUILD SUCCESS
 16e65793bd2ff6b4fe80e3ca8c42486d45304666
Message-ID: <202504081944.LJvMpW7s-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git next
branch HEAD: 16e65793bd2ff6b4fe80e3ca8c42486d45304666  Merge branch 'renesas-dts-for-v6.16' into renesas-next

elapsed time: 1469m

configs tested: 6
configs skipped: 127

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
arm64             allmodconfig    clang-19
arm64              allnoconfig    gcc-14.2.0
arm64  randconfig-001-20250407    clang-21
arm64  randconfig-002-20250407    gcc-6.5.0
arm64  randconfig-003-20250407    gcc-8.5.0
arm64  randconfig-004-20250407    clang-15

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

