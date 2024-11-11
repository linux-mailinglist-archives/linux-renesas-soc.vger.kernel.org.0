Return-Path: <linux-renesas-soc+bounces-10441-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AB41F9C3B0F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 Nov 2024 10:40:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E2A90B22984
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 Nov 2024 09:40:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5493615C15B;
	Mon, 11 Nov 2024 09:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CboJN/wZ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05256166F3A
	for <linux-renesas-soc@vger.kernel.org>; Mon, 11 Nov 2024 09:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731318010; cv=none; b=WkgQ51/lDcBvcgRh7kXsnVHfqzmaChTovx6GUn/+ejvnTgHGThiXULLCIDbdR5KZBMEk53z4GOt2BTFxpWtWPszHV165NDNfJzIeChYcu1RvDac/UhPFZECV0iTQc2lpouNTsPu4pv/IwNHytKv5yuvL9j+dyN3uf4rATDlEtZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731318010; c=relaxed/simple;
	bh=eVbFQ8eRmgwQjhyZDrpzmXZtLQtDVQOa42qdW6+BPsA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=AbbYaycjUqkrObLEt357W9j4vBMHvrqPB+XpCOs9Dlo74XWsZU49/rgeLeuKsL2RTBx1KYVbssupIG2rlEFO3qTACj+qEe3ET2xx1FMAphhr+Tes9c1SaSe6t2D9+FQ1zvDmId0jCXsPBQzd8YCYaXxnaT+VrmrGT6w38H812ZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CboJN/wZ; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5cec7cde922so5958421a12.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 11 Nov 2024 01:40:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731318006; x=1731922806; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RL5ouNz62J4rP7Vb2EwmgbN1hwLbAAvQeLoAfZ/ypHo=;
        b=CboJN/wZx/s0KPqzs5G8KiJdfT0nBRV1sPV3gNT/W+zJdhJrw6Ekl046AJLjx+m36W
         JCFXCqlXKsJhQvvp15uZ3D6sYVZtA+1OKF3CXm7stUxm4Mph/m9SxDFstILaKP39j21y
         kFpxhWlNTS0YlWrN553BD8+1xJChy4fB/5A+N/GvxQXIv6Ylh8MLewPkJ59velzXeoKA
         qV6XpSkBGjwbt38JYE/cjsCJ2gsCNzvBSb+klUeijdN928zdeS2TFDg9Gm03XaKpE/cw
         ZSE9xQ1bBzouj/h6OspbtBm3VzxE12MJwo8hNQlvjoGKxoJgmkx6lilFVOdIjHa2Pc2m
         IJOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731318006; x=1731922806;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RL5ouNz62J4rP7Vb2EwmgbN1hwLbAAvQeLoAfZ/ypHo=;
        b=h/gewP5CglMFwXJWZaj/Pfb9vqb0qQ93ZrgABsFO12SUcvjsokCTMPICP92ZzE94T1
         88nWTCVtujhRo+1y8AjC+P1kH6SmzHJR8zViCB1ezrhZlDixI0wk4PCs6oua8W1Bnacz
         y8CkB2lq4eRRQ06MDNiTbGcvfLaBHw47UnA+JBrwNTQf9O/OmDf0JjlgPkHpm4sAG1yZ
         LXBDoYlic9Gx+p4wGvdO8j5/0o+C9e2+1SAyYqkXAAG5NibsCh7JLLXdoFoBqs3hSEiD
         buDb2qCXEsmZMBiUTWdtcf9wYP4Xq3mg9SFoKBrS+8qAcOwvhE9WGsS/qQqdYf4dS0fm
         CO/Q==
X-Forwarded-Encrypted: i=1; AJvYcCWnhHAXLeIGUzcvJrydA1agsjQZYj+hqtCtj1w8U0QZ5GSjL/vI55AXGsTHaO+QTk86j3wmk18w3CSWbeKQbr+9Yw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwR86S0ECa9rbunKuknvxHcgTjaQAUFDwt+QYeKoAjAhNjBICgN
	uu5VZuNyHfdrrzzCGrq8PPyqCq5jaWd2mKCrediCJFwZFAjRytqiMXPa3xQk/ac=
X-Google-Smtp-Source: AGHT+IF/p+575+YNR2OJr4WYmzHEumA5ro2KoQ7Lo/HcKAeV1re5jL3XLj3j1AdmsGeHCshinHqVXw==
X-Received: by 2002:a05:6402:13ce:b0:5ce:ddd4:7c2f with SMTP id 4fb4d7f45d1cf-5cf0a30c5dcmr10678581a12.7.1731318006331;
        Mon, 11 Nov 2024 01:40:06 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cf0f369037sm3560713a12.12.2024.11.11.01.40.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2024 01:40:06 -0800 (PST)
Date: Mon, 11 Nov 2024 12:38:50 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Rosen Penev <rosenp@gmail.com>,
	netdev@vger.kernel.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Chandrasekar Ramakrishnan <rcsekar@samsung.com>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	Vincent Mailhol <mailhol.vincent@wanadoo.fr>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Kurt Kanzenbach <kurt@linutronix.de>,
	Vladimir Oltean <olteanv@gmail.com>,
	Chris Snook <chris.snook@gmail.com>,
	Marcin Wojtas <marcin.s.wojtas@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Horatiu Vultur <horatiu.vultur@microchip.com>,
	UNGLinuxDriver@microchip.com,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>,
	Doug Berger <opendmb@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>,
	linux-can@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] net: modernize ioremap in probe
Message-ID: <0460e9ea-3d2b-425b-9e97-c69afe138670@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241109233641.8313-1-rosenp@gmail.com>

Hi Rosen,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Rosen-Penev/net-modernize-ioremap-in-probe/20241110-073751
base:   net-next/main
patch link:    https://lore.kernel.org/r/20241109233641.8313-1-rosenp%40gmail.com
patch subject: [PATCH] net: modernize ioremap in probe
config: arm-randconfig-r071-20241110 (https://download.01.org/0day-ci/archive/20241111/202411110835.tTxOya6U-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202411110835.tTxOya6U-lkp@intel.com/

smatch warnings:
drivers/net/ethernet/freescale/xgmac_mdio.c:395 xgmac_mdio_probe() error: uninitialized symbol 'res'.

vim +/res +395 drivers/net/ethernet/freescale/xgmac_mdio.c

33897cc869eef8 Bill Pemberton    2012-12-03  371  static int xgmac_mdio_probe(struct platform_device *pdev)
9f35a7342cff0b Timur Tabi        2012-08-20  372  {
ac53c26433b51f Marcin Wojtas     2021-06-25  373  	struct fwnode_handle *fwnode;
73ee5442978b2d Shaohui Xie       2015-03-16  374  	struct mdio_fsl_priv *priv;
15e7064e879335 Calvin Johnson    2021-06-11  375  	struct resource *res;
15e7064e879335 Calvin Johnson    2021-06-11  376  	struct mii_bus *bus;
9f35a7342cff0b Timur Tabi        2012-08-20  377  	int ret;
9f35a7342cff0b Timur Tabi        2012-08-20  378  
229f4bb47512ec Calvin Johnson    2020-06-22  379  	/* In DPAA-1, MDIO is one of the many FMan sub-devices. The FMan
229f4bb47512ec Calvin Johnson    2020-06-22  380  	 * defines a register space that spans a large area, covering all the
229f4bb47512ec Calvin Johnson    2020-06-22  381  	 * subdevice areas. Therefore, MDIO cannot claim exclusive access to
229f4bb47512ec Calvin Johnson    2020-06-22  382  	 * this register area.
229f4bb47512ec Calvin Johnson    2020-06-22  383  	 */
9f35a7342cff0b Timur Tabi        2012-08-20  384  
1d14eb15dc2c39 Tobias Waldekranz 2022-01-26  385  	bus = devm_mdiobus_alloc_size(&pdev->dev, sizeof(struct mdio_fsl_priv));
9f35a7342cff0b Timur Tabi        2012-08-20  386  	if (!bus)
9f35a7342cff0b Timur Tabi        2012-08-20  387  		return -ENOMEM;
9f35a7342cff0b Timur Tabi        2012-08-20  388  
9f35a7342cff0b Timur Tabi        2012-08-20  389  	bus->name = "Freescale XGMAC MDIO Bus";
c0fc8e6dcee40c Andrew Lunn       2023-01-09  390  	bus->read = xgmac_mdio_read_c22;
c0fc8e6dcee40c Andrew Lunn       2023-01-09  391  	bus->write = xgmac_mdio_write_c22;
c0fc8e6dcee40c Andrew Lunn       2023-01-09  392  	bus->read_c45 = xgmac_mdio_read_c45;
c0fc8e6dcee40c Andrew Lunn       2023-01-09  393  	bus->write_c45 = xgmac_mdio_write_c45;
9f35a7342cff0b Timur Tabi        2012-08-20  394  	bus->parent = &pdev->dev;
229f4bb47512ec Calvin Johnson    2020-06-22 @395  	snprintf(bus->id, MII_BUS_ID_SIZE, "%pa", &res->start);
                                                                                                   ^^^
res isn't initialized.

9f35a7342cff0b Timur Tabi        2012-08-20  396  
73ee5442978b2d Shaohui Xie       2015-03-16  397  	priv = bus->priv;
865bbb2945a161 Rosen Penev       2024-11-09  398  	priv->mdio_base = devm_platform_ioremap_resource(pdev, 0);
865bbb2945a161 Rosen Penev       2024-11-09  399  	if (IS_ERR(priv->mdio_base))
865bbb2945a161 Rosen Penev       2024-11-09  400  		return PTR_ERR(priv->mdio_base);
9f35a7342cff0b Timur Tabi        2012-08-20  401  
15e7064e879335 Calvin Johnson    2021-06-11  402  	/* For both ACPI and DT cases, endianness of MDIO controller
15e7064e879335 Calvin Johnson    2021-06-11  403  	 * needs to be specified using "little-endian" property.
15e7064e879335 Calvin Johnson    2021-06-11  404  	 */
229f4bb47512ec Calvin Johnson    2020-06-22  405  	priv->is_little_endian = device_property_read_bool(&pdev->dev,
07bf2e11ad0586 Julia Lawall      2016-08-05  406  							   "little-endian");
73ee5442978b2d Shaohui Xie       2015-03-16  407  
6198c722019774 Tobias Waldekranz 2022-01-18  408  	priv->has_a009885 = device_property_read_bool(&pdev->dev,
6198c722019774 Tobias Waldekranz 2022-01-18  409  						      "fsl,erratum-a009885");
229f4bb47512ec Calvin Johnson    2020-06-22  410  	priv->has_a011043 = device_property_read_bool(&pdev->dev,
1d3ca681b9d957 Madalin Bucur     2020-01-22  411  						      "fsl,erratum-a011043");
1d3ca681b9d957 Madalin Bucur     2020-01-22  412  
909bea73485fab Tobias Waldekranz 2022-01-26  413  	xgmac_mdio_set_suppress_preamble(bus);
909bea73485fab Tobias Waldekranz 2022-01-26  414  
dd8f467eda72cd Tobias Waldekranz 2022-01-26  415  	ret = xgmac_mdio_set_mdc_freq(bus);
dd8f467eda72cd Tobias Waldekranz 2022-01-26  416  	if (ret)
dd8f467eda72cd Tobias Waldekranz 2022-01-26  417  		return ret;
dd8f467eda72cd Tobias Waldekranz 2022-01-26  418  
105b0468d7b2e6 zhaoxiao          2022-08-18  419  	fwnode = dev_fwnode(&pdev->dev);
ac53c26433b51f Marcin Wojtas     2021-06-25  420  	if (is_of_node(fwnode))
ac53c26433b51f Marcin Wojtas     2021-06-25  421  		ret = of_mdiobus_register(bus, to_of_node(fwnode));
ac53c26433b51f Marcin Wojtas     2021-06-25  422  	else if (is_acpi_node(fwnode))
ac53c26433b51f Marcin Wojtas     2021-06-25  423  		ret = acpi_mdiobus_register(bus, fwnode);
ac53c26433b51f Marcin Wojtas     2021-06-25  424  	else
ac53c26433b51f Marcin Wojtas     2021-06-25  425  		ret = -EINVAL;
9f35a7342cff0b Timur Tabi        2012-08-20  426  	if (ret) {
9f35a7342cff0b Timur Tabi        2012-08-20  427  		dev_err(&pdev->dev, "cannot register MDIO bus\n");
9f35a7342cff0b Timur Tabi        2012-08-20  428  		return ret;
9f35a7342cff0b Timur Tabi        2012-08-20  429  	}
9f35a7342cff0b Timur Tabi        2012-08-20  430  
1d14eb15dc2c39 Tobias Waldekranz 2022-01-26  431  	platform_set_drvdata(pdev, bus);
9f35a7342cff0b Timur Tabi        2012-08-20  432  
9f35a7342cff0b Timur Tabi        2012-08-20  433  	return 0;
9f35a7342cff0b Timur Tabi        2012-08-20  434  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


