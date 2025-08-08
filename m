Return-Path: <linux-renesas-soc+bounces-20162-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A0DA4B1EB19
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  8 Aug 2025 17:05:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8F2F418C1C0B
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  8 Aug 2025 15:01:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93ED4283FFA;
	Fri,  8 Aug 2025 14:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PdJvEX6A"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C06B828134F;
	Fri,  8 Aug 2025 14:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754664970; cv=none; b=duHKMqGHmUAX3TcDskNWuFyk7EutDLs6Gl60WjLe6oK7awrG9OVNI8gnZQW/8a6TZwYzOzl7LTMPVc3i1xUV4LPrLYBYlomRuTIg/Ib5S78vSBm1PZ5vDEhWLGOdUv9iYiX3zMYLB44z/YDalscY0T+/mm8NxU8jCwyJXz4FW98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754664970; c=relaxed/simple;
	bh=9cmQQnt+5Vh9t9k0T6ZjOC/Hqj03S1Kl6bmJEzpiMNY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uOBzPSr65rA7pvOXRKgqBn0VFAFqYtnAgP2CiiNazsiNS6q2p/9ccFbFpYFJ2C1UfBY+jBsXDq0BqtdXEAtACCEALlukmubGRtqTfudhpiKQXlCP+6aR6qj8rPBuxfYUbfv3LXQiIKeWlVVZgxIyqMC4F+hCS4vA8wJDNYLHeEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PdJvEX6A; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754664969; x=1786200969;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9cmQQnt+5Vh9t9k0T6ZjOC/Hqj03S1Kl6bmJEzpiMNY=;
  b=PdJvEX6AU1BcP2vlKtY/mBjbb+YhaVBwQ8ZC3zJsSHA8fr9xzcnxb7+V
   AQ0bgqLeB/qZPx7Q+EcYtNGW6o4yQPGoxUFRUp+QaRXg6UrehT6nRttDO
   AzYlkhaeP/HvFUHPSuBFDaup9BOalfjq9byGu8VdAZ3VWuQMnlz4qQGIa
   J2mIF20AG7Ttb5aEQqqQdaLGWDRi23xiQ8hBC2vmrz+SvMyylLvpHrkzK
   Jk+0JsPoQJi3vjs1d/6cDG2BiCeg9ixVTOLhQkxiiJZBLR8x4Yh7c5esk
   DznsRSmsyW5I5zkz4dqhUIIPYbSWz+2NoVbQtCn1XlKAqbLORkUP/8js+
   w==;
X-CSE-ConnectionGUID: bm1N5uvVQaWr75REM5l8cg==
X-CSE-MsgGUID: EghfGIO6Sd22M+fh4tlLXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11515"; a="68379123"
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; 
   d="scan'208";a="68379123"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2025 07:56:08 -0700
X-CSE-ConnectionGUID: X6Yod+yjSSeDE8W/x5Ojgg==
X-CSE-MsgGUID: VWgRjysaSEilNZcCFOMK9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; 
   d="scan'208";a="164583186"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 08 Aug 2025 07:56:06 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ukOVn-000420-0B;
	Fri, 08 Aug 2025 14:56:03 +0000
Date: Fri, 8 Aug 2025 22:55:19 +0800
From: kernel test robot <lkp@intel.com>
To: Wolfram Sang <wsa-dev@sang-engineering.com>,
	linux-renesas-soc@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Wolfram Sang <wsa-dev@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH 4/4] arm64: dts: renesas: rzg3e-smarc-som: Enable I3C
Message-ID: <202508082259.wdaPWdYV-lkp@intel.com>
References: <20250807151434.5241-10-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250807151434.5241-10-wsa+renesas@sang-engineering.com>

Hi Wolfram,

kernel test robot noticed the following build errors:

[auto build test ERROR on geert-renesas-devel/next]
[also build test ERROR on linus/master next-20250808]
[cannot apply to v6.16]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Wolfram-Sang/arm64-dts-renesas-r9a08g045-Add-I3C-node/20250807-231733
base:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git next
patch link:    https://lore.kernel.org/r/20250807151434.5241-10-wsa%2Brenesas%40sang-engineering.com
patch subject: [PATCH 4/4] arm64: dts: renesas: rzg3e-smarc-som: Enable I3C
config: arm64-randconfig-001-20250808 (https://download.01.org/0day-ci/archive/20250808/202508082259.wdaPWdYV-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250808/202508082259.wdaPWdYV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508082259.wdaPWdYV-lkp@intel.com/

All errors (new ones prefixed by >>):

>> Error: arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi:127.1-5 Label or path i3c not found
   FATAL ERROR: Syntax error parsing input tree

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

