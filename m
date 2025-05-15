Return-Path: <linux-renesas-soc+bounces-17119-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 75674AB7CCE
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 May 2025 07:04:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 593997A4F35
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 May 2025 05:02:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31AA822576D;
	Thu, 15 May 2025 05:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kDLGb+W2"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F40610FD;
	Thu, 15 May 2025 05:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747285445; cv=none; b=djyKaS1DfwopvOOwigpsIDp9qQOo+Z2INc+qgHE8eJ9IgLlBBGUJDmfiHH6uPr9r89LPQ8ZeMkC4IwQn0JAGXdu7oHf5vO3S7iYUOw0AZWWujOs5IerOaoNr6w9cvWCA6usmR6jDMZLpQTN06+wGRg+ptW15usW4s3FumCxtlfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747285445; c=relaxed/simple;
	bh=A1DT69l4hCTQvl+W6lgZGKWwC2Lyi1FbgKgW9qNW6d0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b569JsmIQpZl51jryv4k7UN0VtCPDSEVjCTYZNlVAJ4D4FejD62xaCciUef3eKdaH8E5SE2oSbx6qm922/wcVFh6AQ243katlF+XwctpEORVacgONo+R+8yDWwwuqsP9Mtd22GNxXzjMqTTA11w8U3mc2ZjctM03uZSKlx9bozw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kDLGb+W2; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747285443; x=1778821443;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=A1DT69l4hCTQvl+W6lgZGKWwC2Lyi1FbgKgW9qNW6d0=;
  b=kDLGb+W2qX7YnzT2+JTHmndxFxHMFE5sII2nXdGIYmnTBcho/iq+TJda
   PMGxTv8gOch0mDyFo5SnwHhwvP4VKXe53aqkgRCTtlwOnK3Uc25bqCFe1
   eL+HQoO4eOtdCAv4BoQu8A2hRdAaK/nOOAUuCN6v78L0ZAZ1UdbV3L5ZF
   +ddznUaX3Pni9pFFUHv64OLveANWGyFDniRzxqlRU6P5uAlsAEwA068bL
   YeaugYHIK3hKiK8LpTVu+pFnwqEst6UthMD45IXKMSGAXpNLdvAojUWne
   cvZ+3xCqyUkbtNswTeqQSO1dApJwyWOkmtQOp7Iczy3tL+MpaOpgWHxD7
   Q==;
X-CSE-ConnectionGUID: ppP16AqiQj6NdMc26YEUHw==
X-CSE-MsgGUID: 8i+GVE7uTIeACnQg9pIR3g==
X-IronPort-AV: E=McAfee;i="6700,10204,11433"; a="66759275"
X-IronPort-AV: E=Sophos;i="6.15,290,1739865600"; 
   d="scan'208";a="66759275"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2025 22:04:02 -0700
X-CSE-ConnectionGUID: pHVw2Ts6Ta6UMMsXsSi9uQ==
X-CSE-MsgGUID: +zLoQS0sS7ia7mtfmnifEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,290,1739865600"; 
   d="scan'208";a="138754815"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 14 May 2025 22:03:58 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uFQl9-000Hwd-1P;
	Thu, 15 May 2025 05:03:55 +0000
Date: Thu, 15 May 2025 13:03:07 +0800
From: kernel test robot <lkp@intel.com>
To: Prabhakar <prabhakar.csengg@gmail.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Chris Brandt <chris.brandt@renesas.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v3 2/2] clocksource/drivers/renesas-ostm: Unconditionally
 enable reprobe support
Message-ID: <202505151255.rCHp8Bvu-lkp@intel.com>
References: <20250506103152.109525-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250506103152.109525-3-prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi Prabhakar,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tip/timers/core]
[also build test WARNING on robh/for-next linus/master v6.15-rc6 next-20250514]
[cannot apply to daniel-lezcano/clockevents/next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Prabhakar/dt-bindings-timer-renesas-ostm-Document-RZ-V2N-R9A09G056-support/20250506-223636
base:   tip/timers/core
patch link:    https://lore.kernel.org/r/20250506103152.109525-3-prabhakar.mahadev-lad.rj%40bp.renesas.com
patch subject: [PATCH v3 2/2] clocksource/drivers/renesas-ostm: Unconditionally enable reprobe support
config: hexagon-randconfig-001-20250513 (https://download.01.org/0day-ci/archive/20250515/202505151255.rCHp8Bvu-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250515/202505151255.rCHp8Bvu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505151255.rCHp8Bvu-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/clocksource/renesas-ostm.c:235:34: warning: unused variable 'ostm_of_table' [-Wunused-const-variable]
     235 | static const struct of_device_id ostm_of_table[] = {
         |                                  ^~~~~~~~~~~~~
   1 warning generated.


vim +/ostm_of_table +235 drivers/clocksource/renesas-ostm.c

3a3e9f23c2cae9 Biju Das 2021-11-12  234  
3a3e9f23c2cae9 Biju Das 2021-11-12 @235  static const struct of_device_id ostm_of_table[] = {
3a3e9f23c2cae9 Biju Das 2021-11-12  236  	{ .compatible = "renesas,ostm", },
3a3e9f23c2cae9 Biju Das 2021-11-12  237  	{ /* sentinel */ }
3a3e9f23c2cae9 Biju Das 2021-11-12  238  };
3a3e9f23c2cae9 Biju Das 2021-11-12  239  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

