Return-Path: <linux-renesas-soc+bounces-7716-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E1F0946B15
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  3 Aug 2024 21:41:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2456A281A4A
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  3 Aug 2024 19:41:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 756611CD2C;
	Sat,  3 Aug 2024 19:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wVaBgKLE"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CB1E1865A
	for <linux-renesas-soc@vger.kernel.org>; Sat,  3 Aug 2024 19:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722714080; cv=none; b=uWD33hna4zI486rW6VZIwM4UTzGSPqxm3MqUGLpKArug7OgKdbIoDuiu1k175w1G/zthXDRIffFc5DdMrbPa08KBrDLLjLl0cy9nUDsR5/YCLoGKdHzNzUK+uGfmeiYGZhvVuW/xt8/rszvidbsUQ9RSJCqtQFdTD1yAta1ENyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722714080; c=relaxed/simple;
	bh=QPRArO0MuBSL6Ptc7Qttul93uAgP87NlNurKfzODOU8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UQVlhOGbdKDB3Rw06ZmoA4UZZK+GMN5e5mK3sT8KF3z7N629Q+DguV4GG32ghlIrY69SxMudtbq/jP6iumVvCwRSbziLzpn/FzFJC3++inUWZhCz/sLQHkMtWjjmMxQuDkn7+28KqXQB2z/KJwW+PJR5jtpOB8gwAskLb/oTVP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wVaBgKLE; arc=none smtp.client-ip=209.85.210.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-709340bd54dso2302267a34.1
        for <linux-renesas-soc@vger.kernel.org>; Sat, 03 Aug 2024 12:41:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722714078; x=1723318878; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SXi4FDi/lG1ua7pG911h3uQhY5wW6bTIlHOV/7MkZHY=;
        b=wVaBgKLEQT42+U8RCFB8XDjUeuPm0gVg6bS2UqiYLveDPrfHKjr0eWFR6z0Akqqld2
         Xfc8VIVpP5vId22237DyN2/dDTLtbHoXh+Me+pn/3qJyWe2/vsCi4wi0Zy5Ls+UpmRpA
         Cw0wUTXQ6ESqFIp24YAfRxlk+LXTlAm/uKvRKAK5cHbU9L4c3dtGvln7BQ8f2/f0mC+S
         EmVAJHPcci43YwR+46wm2zQLzNUKISyjhXyi59C9m1FY4WU9m+/s7Hn+drWY2KboplCW
         1qVPt8LJtpVX67Vf/XTSy9fQRmmZJB6WdENe/4W/rpJU2r8GxTyg0YQrS+RaCGjsy0WM
         X9Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722714078; x=1723318878;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SXi4FDi/lG1ua7pG911h3uQhY5wW6bTIlHOV/7MkZHY=;
        b=APqUMqGiJaTKvMbq6Oxt100Otj0jrYT0nE3Ao53Z3J25NnmLeKlnAG9evQax6GoJXi
         KNXWfBdhbXeaeYCoXyaACu6CvEKD4NFSyr1M2Wuc0asfDIePg6WQ/4SiDgNwGOgUu17c
         j7ferK3VK0TBqKCSNHibe1kLg2iEh+xHbCEkP+PXbo9ocQ4Ms4e9e4vHvbCaJ/tTJ4uR
         otbeSZu6l37g70OoOguIL+VbbaAZGmy54Lgp7V1mW6MXDo1wS0RhZxX6TAWQG1s3LSLT
         vNjjWmdrJBINN4FIAtWXXSwecGqOI80cFj/VX8P/MrNrZOUf5q2kYvPq59qyOWvFAIZg
         uHgw==
X-Forwarded-Encrypted: i=1; AJvYcCXuw9ZvuG3+S0TC0cA93VDJmfHo5qsXKr0u8XfPnGqHGKR6m6oAnDtO0VCCPYmF8QXtoMtXKSUBw54UhLSsxoLOORW/CPJq5bXBnW2rD7ohLvI=
X-Gm-Message-State: AOJu0Yzp8JPflJH6DnWx5xzQMlK4MVZkUfyyZRAfbgnjy7uf1UePuhiD
	EEpb2dF97uBUIoHLC/2bcO9uwHiuYdtLrz3fysUSCx9N6/ONCe2rIo+VujAMRl4=
X-Google-Smtp-Source: AGHT+IHlbBi5iVPhTtzyHdf7wzm9eydZUeT0S3ljF/oaqIpQWZBEUb0XOM4K2jmDFZ8rks469IDnKQ==
X-Received: by 2002:a05:6830:6b83:b0:709:373f:fc92 with SMTP id 46e09a7af769-7096feb4f8bmr3742311a34.1.1722714077688;
        Sat, 03 Aug 2024 12:41:17 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:9579:8eb1:34ef:d5d7])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-70a3a769072sm1585908a34.68.2024.08.03.12.41.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Aug 2024 12:41:17 -0700 (PDT)
Date: Sat, 3 Aug 2024 14:41:14 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [geert-renesas-drivers:renesas-clk-for-v6.12 28/29]
 drivers/clk/renesas/rzv2h-cpg.c:269 rzv2h_cpg_register_core_clk() warn:
 passing zero to 'PTR_ERR'
Message-ID: <5256b88a-63e1-4e32-9383-5fc9f9bee0d4@suswa.mountain>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git renesas-clk-for-v6.12
head:   42b54d52ecb7a81998592c2b40f8a963e82ed02e
commit: dd22e56217495e2d392ded86a1e11a908e424e64 [28/29] clk: renesas: Add family-specific clock driver for RZ/V2H(P)
config: parisc-randconfig-r081-20240803 (https://download.01.org/0day-ci/archive/20240803/202408032025.ve2JMaoV-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202408032025.ve2JMaoV-lkp@intel.com/

smatch warnings:
drivers/clk/renesas/rzv2h-cpg.c:269 rzv2h_cpg_register_core_clk() warn: passing zero to 'PTR_ERR'

vim +/PTR_ERR +269 drivers/clk/renesas/rzv2h-cpg.c

dd22e56217495e Lad Prabhakar 2024-07-29  220  static void __init
dd22e56217495e Lad Prabhakar 2024-07-29  221  rzv2h_cpg_register_core_clk(const struct cpg_core_clk *core,
dd22e56217495e Lad Prabhakar 2024-07-29  222  			    struct rzv2h_cpg_priv *priv)
dd22e56217495e Lad Prabhakar 2024-07-29  223  {
dd22e56217495e Lad Prabhakar 2024-07-29  224  	struct clk *clk = ERR_PTR(-EOPNOTSUPP), *parent;
dd22e56217495e Lad Prabhakar 2024-07-29  225  	unsigned int id = core->id, div = core->div;
dd22e56217495e Lad Prabhakar 2024-07-29  226  	struct device *dev = priv->dev;
dd22e56217495e Lad Prabhakar 2024-07-29  227  	const char *parent_name;
dd22e56217495e Lad Prabhakar 2024-07-29  228  	struct clk_hw *clk_hw;
dd22e56217495e Lad Prabhakar 2024-07-29  229  
dd22e56217495e Lad Prabhakar 2024-07-29  230  	WARN_DEBUG(id >= priv->num_core_clks);
dd22e56217495e Lad Prabhakar 2024-07-29  231  	WARN_DEBUG(PTR_ERR(priv->clks[id]) != -ENOENT);
dd22e56217495e Lad Prabhakar 2024-07-29  232  
dd22e56217495e Lad Prabhakar 2024-07-29  233  	switch (core->type) {
dd22e56217495e Lad Prabhakar 2024-07-29  234  	case CLK_TYPE_IN:
dd22e56217495e Lad Prabhakar 2024-07-29  235  		clk = of_clk_get_by_name(priv->dev->of_node, core->name);
dd22e56217495e Lad Prabhakar 2024-07-29  236  		break;
dd22e56217495e Lad Prabhakar 2024-07-29  237  	case CLK_TYPE_FF:
dd22e56217495e Lad Prabhakar 2024-07-29  238  		WARN_DEBUG(core->parent >= priv->num_core_clks);
dd22e56217495e Lad Prabhakar 2024-07-29  239  		parent = priv->clks[core->parent];
dd22e56217495e Lad Prabhakar 2024-07-29  240  		if (IS_ERR(parent)) {
dd22e56217495e Lad Prabhakar 2024-07-29  241  			clk = parent;
dd22e56217495e Lad Prabhakar 2024-07-29  242  			goto fail;
dd22e56217495e Lad Prabhakar 2024-07-29  243  		}
dd22e56217495e Lad Prabhakar 2024-07-29  244  
dd22e56217495e Lad Prabhakar 2024-07-29  245  		parent_name = __clk_get_name(parent);
dd22e56217495e Lad Prabhakar 2024-07-29  246  		clk_hw = devm_clk_hw_register_fixed_factor(dev, core->name,
dd22e56217495e Lad Prabhakar 2024-07-29  247  							   parent_name, CLK_SET_RATE_PARENT,
dd22e56217495e Lad Prabhakar 2024-07-29  248  							   core->mult, div);
dd22e56217495e Lad Prabhakar 2024-07-29  249  		if (IS_ERR(clk_hw))
dd22e56217495e Lad Prabhakar 2024-07-29  250  			clk = ERR_CAST(clk_hw);
dd22e56217495e Lad Prabhakar 2024-07-29  251  		else
dd22e56217495e Lad Prabhakar 2024-07-29  252  			clk = clk_hw->clk;
dd22e56217495e Lad Prabhakar 2024-07-29  253  		break;
dd22e56217495e Lad Prabhakar 2024-07-29  254  	case CLK_TYPE_PLL:
dd22e56217495e Lad Prabhakar 2024-07-29  255  		clk = rzv2h_cpg_pll_clk_register(core, priv, &rzv2h_cpg_pll_ops);
dd22e56217495e Lad Prabhakar 2024-07-29  256  		break;
dd22e56217495e Lad Prabhakar 2024-07-29  257  	default:
dd22e56217495e Lad Prabhakar 2024-07-29  258  		goto fail;
dd22e56217495e Lad Prabhakar 2024-07-29  259  	}
dd22e56217495e Lad Prabhakar 2024-07-29  260  
dd22e56217495e Lad Prabhakar 2024-07-29  261  	if (IS_ERR_OR_NULL(clk))
dd22e56217495e Lad Prabhakar 2024-07-29  262  		goto fail;

Generally when a function returns both error pointers and NULL, the NULL
should not print a dev_err().  I feel like in this case, the Kconfig
rules should prevent a NULL return so this bug is likely harmless but
I haven't investigated outside of looking at this email.

https://staticthinking.wordpress.com/2022/08/01/mixing-error-pointers-and-null/

dd22e56217495e Lad Prabhakar 2024-07-29  263  
dd22e56217495e Lad Prabhakar 2024-07-29  264  	dev_dbg(dev, "Core clock %pC at %lu Hz\n", clk, clk_get_rate(clk));
dd22e56217495e Lad Prabhakar 2024-07-29  265  	priv->clks[id] = clk;
dd22e56217495e Lad Prabhakar 2024-07-29  266  	return;
dd22e56217495e Lad Prabhakar 2024-07-29  267  
dd22e56217495e Lad Prabhakar 2024-07-29  268  fail:
dd22e56217495e Lad Prabhakar 2024-07-29 @269  	dev_err(dev, "Failed to register core clock %s: %ld\n",
dd22e56217495e Lad Prabhakar 2024-07-29  270  		core->name, PTR_ERR(clk));
dd22e56217495e Lad Prabhakar 2024-07-29  271  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


