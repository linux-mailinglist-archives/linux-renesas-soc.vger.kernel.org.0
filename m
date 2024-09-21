Return-Path: <linux-renesas-soc+bounces-9011-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D7ED97DED0
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 21 Sep 2024 22:38:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9C1C1280BFC
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 21 Sep 2024 20:38:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0EC53A268;
	Sat, 21 Sep 2024 20:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="mwiz9L17"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74C9218EA2;
	Sat, 21 Sep 2024 20:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.134.164.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726951093; cv=none; b=PqN17R4gYz+wHr/bAxq7sSnOmMoxJDfZ4Nn2oMYBfoQOUDws+G8yd0bjNhiVaa6WSFC2N4UXA8T/wfOuwpo31sborQXxsOHGH0f0yX0VwsQPloN6VbRH4LYtq1RH0QJ7Q/x2plNoYi1yE9FgsjL+WygbxkcGG8KHKXlCbQKL3Mo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726951093; c=relaxed/simple;
	bh=oQ380pLWOmVlI+cKW97VdbWPZYf6WB3D3tbY/yz1qWA=;
	h=Date:From:To:cc:Subject:Message-ID:MIME-Version:Content-Type; b=GnAmBOWnqljhTs/MyfBHg9aZ5pWnpLuBfAC6x1b83NgLs1sbDkyG7ljqaMSrfQty2fpYzsSr7eIShIvBU3W5bOk5/DbGB6iY9jKSOjImAmanEwOMVdXlVYFlyOO+Xa8coBtsF8IexcGcB65bHF98xvmSxRToorP5X2KLY+V1q8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr; spf=pass smtp.mailfrom=inria.fr; dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b=mwiz9L17; arc=none smtp.client-ip=192.134.164.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ja/iDskkbH5a+n5uqZYzrMReWASW34qjNmXYfxMDusw=;
  b=mwiz9L17dOWpBkxKXkrre7XR3GWPkZR1HO8L/Jzh6rYUghxL8OhuIRXc
   pDIlHvOR1C3nRKN7EEGdcJhTFb7Mx1P4Ulv5U98p5inAB2BY6IwMVReMR
   ToxyU66Dks6n3kbHFximByxBZ0Dz/D0sHLh6Vi7Pq+Q5EnKqZhd8aC1zo
   A=;
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.10,247,1719871200"; 
   d="scan'208";a="184375060"
Received: from 231.85.89.92.rev.sfr.net (HELO hadrien) ([92.89.85.231])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2024 22:38:01 +0200
Date: Sat, 21 Sep 2024 22:38:00 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
    Philipp Zabel <p.zabel@pengutronix.de>, 
    Thomas Gleixner <tglx@linutronix.de>, 
    Geert Uytterhoeven <geert+renesas@glider.be>
cc: Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
    linux-kernel@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>, 
    Biju Das <biju.das.jz@bp.renesas.com>, 
    Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH 5/6] irqchip: Add RZ/V2H(P) Interrupt Control Unit (ICU)
 driver (fwd)
Message-ID: <alpine.DEB.2.22.394.2409212234080.3471@hadrien>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

The various returns need a put_device.

julia

---------- Forwarded message ----------
Date: Sun, 22 Sep 2024 04:23:01 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: Re: [PATCH 5/6] irqchip: Add RZ/V2H(P) Interrupt Control Unit (ICU)
    driver

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20240917173249.158920-6-fabrizio.castro.jz@renesas.com>
References: <20240917173249.158920-6-fabrizio.castro.jz@renesas.com>
TO: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
TO: Thomas Gleixner <tglx@linutronix.de>
TO: Philipp Zabel <p.zabel@pengutronix.de>
TO: Geert Uytterhoeven <geert+renesas@glider.be>
CC: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
CC: Magnus Damm <magnus.damm@gmail.com>
CC: linux-kernel@vger.kernel.org
CC: linux-renesas-soc@vger.kernel.org
CC: Chris Paterson <Chris.Paterson2@renesas.com>
CC: Biju Das <biju.das.jz@bp.renesas.com>
CC: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi Fabrizio,

kernel test robot noticed the following build warnings:

[auto build test WARNING on next-20240917]
[cannot apply to tip/irq/core robh/for-next geert-renesas-drivers/renesas-pinctrl geert-renesas-devel/next linus/master v6.11 v6.11-rc7 v6.11-rc6 v6.11]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Fabrizio-Castro/dt-bindings-pinctrl-renesas-rzg2l-pinctrl-Add-interrupt-parent/20240918-013929
base:   next-20240917
patch link:    https://lore.kernel.org/r/20240917173249.158920-6-fabrizio.castro.jz%40renesas.com
patch subject: [PATCH 5/6] irqchip: Add RZ/V2H(P) Interrupt Control Unit (ICU) driver
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: nios2-randconfig-r064-20240922 (https://download.01.org/0day-ci/archive/20240922/202409220454.AW3A9lUC-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202409220454.AW3A9lUC-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/irqchip/irq-renesas-rzv2h.c:452:2-8: ERROR: missing put_device; call of_find_device_by_node on line 445, but without a corresponding object release within this function.
   drivers/irqchip/irq-renesas-rzv2h.c:458:2-8: ERROR: missing put_device; call of_find_device_by_node on line 445, but without a corresponding object release within this function.
   drivers/irqchip/irq-renesas-rzv2h.c:465:2-8: ERROR: missing put_device; call of_find_device_by_node on line 445, but without a corresponding object release within this function.
   drivers/irqchip/irq-renesas-rzv2h.c:470:2-8: ERROR: missing put_device; call of_find_device_by_node on line 445, but without a corresponding object release within this function.
   drivers/irqchip/irq-renesas-rzv2h.c:475:2-8: ERROR: missing put_device; call of_find_device_by_node on line 445, but without a corresponding object release within this function.
   drivers/irqchip/irq-renesas-rzv2h.c:480:2-8: ERROR: missing put_device; call of_find_device_by_node on line 445, but without a corresponding object release within this function.
   drivers/irqchip/irq-renesas-rzv2h.c:502:1-7: ERROR: missing put_device; call of_find_device_by_node on line 445, but without a corresponding object release within this function.
   drivers/irqchip/irq-renesas-rzv2h.c:510:1-7: ERROR: missing put_device; call of_find_device_by_node on line 445, but without a corresponding object release within this function.

vim +452 drivers/irqchip/irq-renesas-rzv2h.c

34d38ea429c8e6 Fabrizio Castro 2024-09-17  435
34d38ea429c8e6 Fabrizio Castro 2024-09-17  436  static int rzv2h_icu_init(struct device_node *node,
34d38ea429c8e6 Fabrizio Castro 2024-09-17  437  				 struct device_node *parent)
34d38ea429c8e6 Fabrizio Castro 2024-09-17  438  {
34d38ea429c8e6 Fabrizio Castro 2024-09-17  439  	struct irq_domain *irq_domain, *parent_domain;
34d38ea429c8e6 Fabrizio Castro 2024-09-17  440  	struct rzv2h_icu_priv *rzv2h_icu_data;
34d38ea429c8e6 Fabrizio Castro 2024-09-17  441  	struct platform_device *pdev;
34d38ea429c8e6 Fabrizio Castro 2024-09-17  442  	struct reset_control *resetn;
34d38ea429c8e6 Fabrizio Castro 2024-09-17  443  	int ret;
34d38ea429c8e6 Fabrizio Castro 2024-09-17  444
34d38ea429c8e6 Fabrizio Castro 2024-09-17 @445  	pdev = of_find_device_by_node(node);
34d38ea429c8e6 Fabrizio Castro 2024-09-17  446  	if (!pdev)
34d38ea429c8e6 Fabrizio Castro 2024-09-17  447  		return -ENODEV;
34d38ea429c8e6 Fabrizio Castro 2024-09-17  448
34d38ea429c8e6 Fabrizio Castro 2024-09-17  449  	parent_domain = irq_find_host(parent);
34d38ea429c8e6 Fabrizio Castro 2024-09-17  450  	if (!parent_domain) {
34d38ea429c8e6 Fabrizio Castro 2024-09-17  451  		dev_err(&pdev->dev, "cannot find parent domain\n");
34d38ea429c8e6 Fabrizio Castro 2024-09-17 @452  		return -ENODEV;
34d38ea429c8e6 Fabrizio Castro 2024-09-17  453  	}
34d38ea429c8e6 Fabrizio Castro 2024-09-17  454
34d38ea429c8e6 Fabrizio Castro 2024-09-17  455  	rzv2h_icu_data = devm_kzalloc(&pdev->dev, sizeof(*rzv2h_icu_data),
34d38ea429c8e6 Fabrizio Castro 2024-09-17  456  				       GFP_KERNEL);
34d38ea429c8e6 Fabrizio Castro 2024-09-17  457  	if (!rzv2h_icu_data)
34d38ea429c8e6 Fabrizio Castro 2024-09-17  458  		return -ENOMEM;
34d38ea429c8e6 Fabrizio Castro 2024-09-17  459
34d38ea429c8e6 Fabrizio Castro 2024-09-17  460  	rzv2h_icu_data->irqchip = &rzv2h_icu_chip;
34d38ea429c8e6 Fabrizio Castro 2024-09-17  461
34d38ea429c8e6 Fabrizio Castro 2024-09-17  462  	rzv2h_icu_data->base = devm_of_iomap(&pdev->dev, pdev->dev.of_node, 0,
34d38ea429c8e6 Fabrizio Castro 2024-09-17  463  					      NULL);
34d38ea429c8e6 Fabrizio Castro 2024-09-17  464  	if (IS_ERR(rzv2h_icu_data->base))
34d38ea429c8e6 Fabrizio Castro 2024-09-17  465  		return PTR_ERR(rzv2h_icu_data->base);
34d38ea429c8e6 Fabrizio Castro 2024-09-17  466
34d38ea429c8e6 Fabrizio Castro 2024-09-17  467  	ret = rzv2h_icu_parse_interrupts(rzv2h_icu_data, node);
34d38ea429c8e6 Fabrizio Castro 2024-09-17  468  	if (ret) {
34d38ea429c8e6 Fabrizio Castro 2024-09-17  469  		dev_err(&pdev->dev, "cannot parse interrupts: %d\n", ret);
34d38ea429c8e6 Fabrizio Castro 2024-09-17  470  		return ret;
34d38ea429c8e6 Fabrizio Castro 2024-09-17  471  	}
34d38ea429c8e6 Fabrizio Castro 2024-09-17  472
34d38ea429c8e6 Fabrizio Castro 2024-09-17  473  	resetn = devm_reset_control_get_exclusive(&pdev->dev, NULL);
34d38ea429c8e6 Fabrizio Castro 2024-09-17  474  	if (IS_ERR(resetn))
34d38ea429c8e6 Fabrizio Castro 2024-09-17  475  		return PTR_ERR(resetn);
34d38ea429c8e6 Fabrizio Castro 2024-09-17  476
34d38ea429c8e6 Fabrizio Castro 2024-09-17  477  	ret = reset_control_deassert(resetn);
34d38ea429c8e6 Fabrizio Castro 2024-09-17  478  	if (ret) {
34d38ea429c8e6 Fabrizio Castro 2024-09-17  479  		dev_err(&pdev->dev, "failed to deassert resetn pin, %d\n", ret);
34d38ea429c8e6 Fabrizio Castro 2024-09-17  480  		return ret;
34d38ea429c8e6 Fabrizio Castro 2024-09-17  481  	}
34d38ea429c8e6 Fabrizio Castro 2024-09-17  482
34d38ea429c8e6 Fabrizio Castro 2024-09-17  483  	pm_runtime_enable(&pdev->dev);
34d38ea429c8e6 Fabrizio Castro 2024-09-17  484  	ret = pm_runtime_resume_and_get(&pdev->dev);
34d38ea429c8e6 Fabrizio Castro 2024-09-17  485  	if (ret < 0) {
34d38ea429c8e6 Fabrizio Castro 2024-09-17  486  		dev_err(&pdev->dev, "pm_runtime_resume_and_get failed: %d\n",
34d38ea429c8e6 Fabrizio Castro 2024-09-17  487  			ret);
34d38ea429c8e6 Fabrizio Castro 2024-09-17  488  		goto pm_disable;
34d38ea429c8e6 Fabrizio Castro 2024-09-17  489  	}
34d38ea429c8e6 Fabrizio Castro 2024-09-17  490
34d38ea429c8e6 Fabrizio Castro 2024-09-17  491  	raw_spin_lock_init(&rzv2h_icu_data->lock);
34d38ea429c8e6 Fabrizio Castro 2024-09-17  492
34d38ea429c8e6 Fabrizio Castro 2024-09-17  493  	irq_domain = irq_domain_add_hierarchy(parent_domain, 0, ICU_NUM_IRQ,
34d38ea429c8e6 Fabrizio Castro 2024-09-17  494  					      node, &rzv2h_icu_domain_ops,
34d38ea429c8e6 Fabrizio Castro 2024-09-17  495  					      rzv2h_icu_data);
34d38ea429c8e6 Fabrizio Castro 2024-09-17  496  	if (!irq_domain) {
34d38ea429c8e6 Fabrizio Castro 2024-09-17  497  		dev_err(&pdev->dev, "failed to add irq domain\n");
34d38ea429c8e6 Fabrizio Castro 2024-09-17  498  		ret = -ENOMEM;
34d38ea429c8e6 Fabrizio Castro 2024-09-17  499  		goto pm_put;
34d38ea429c8e6 Fabrizio Castro 2024-09-17  500  	}
34d38ea429c8e6 Fabrizio Castro 2024-09-17  501
34d38ea429c8e6 Fabrizio Castro 2024-09-17  502  	return 0;
34d38ea429c8e6 Fabrizio Castro 2024-09-17  503
34d38ea429c8e6 Fabrizio Castro 2024-09-17  504  pm_put:
34d38ea429c8e6 Fabrizio Castro 2024-09-17  505  	pm_runtime_put(&pdev->dev);
34d38ea429c8e6 Fabrizio Castro 2024-09-17  506  pm_disable:
34d38ea429c8e6 Fabrizio Castro 2024-09-17  507  	pm_runtime_disable(&pdev->dev);
34d38ea429c8e6 Fabrizio Castro 2024-09-17  508  	reset_control_assert(resetn);
34d38ea429c8e6 Fabrizio Castro 2024-09-17  509
34d38ea429c8e6 Fabrizio Castro 2024-09-17  510  	return ret;
34d38ea429c8e6 Fabrizio Castro 2024-09-17  511  }
34d38ea429c8e6 Fabrizio Castro 2024-09-17  512

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

