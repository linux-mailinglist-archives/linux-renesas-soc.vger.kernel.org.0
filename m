Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C88DC2E253D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 24 Dec 2020 08:35:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726664AbgLXHfL (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 24 Dec 2020 02:35:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726186AbgLXHfK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 24 Dec 2020 02:35:10 -0500
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50455C06179C
        for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Dec 2020 23:34:30 -0800 (PST)
Received: by mail-wr1-x429.google.com with SMTP id a12so1363448wrv.8
        for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Dec 2020 23:34:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=irTCI/vF0NkdBwIJVYrdKY08hhMbdCGPb63kIfO2o2A=;
        b=R6zumxj5qvPbaQ4pMr1SUXVtsq99ZJmEEj4kGrQD/PJTM/EI2nIJySlp+8DHxbGSya
         dSpv6/MBDLhv81xFenGB6ic+QB3FjIj4tUE2lU7mYqU8Md1NBpF3BHgIYeE+jodyoWuX
         9cpCSF1GzKG3k/0wOLa00LPV/08zivvnLjhHEmx2/me+VVXK6fl9Tv6bh0MtiI8/ZEOd
         KfWVgbw93zXAs3vCR6jSpwYaHCVbGmEONWCY0ngPDPZBbKQoCx+3oKVXuY0p+Px6e2sU
         5DoOBYdfZISQMaaxxIm151sRu/O1XJInWx4OIVra3M6smOXrifJLA8oJjYme9O+FDTZ1
         4lNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=irTCI/vF0NkdBwIJVYrdKY08hhMbdCGPb63kIfO2o2A=;
        b=bGuoHcbVJ846E1ggpzD48h4GGKiBmpqjr4ybhl0Ad5Po8x/JFmHhbm+OfpQbxdTKIf
         skxT6POccps8REVQ+aWc6G+3MmnkltO7GWXgMTEQk8KL0hAAtfhDv/ieB1e49DR7w2x2
         UyvJuhlEn5+tRaZjbIpLG3/cpx2Cvw39T0tWUhDUf1ehoogkXGj5PGI0ZCOaobS2pY0i
         /lZpeGcTfl7l1GY+OKN43TBmGOpcyyEl/wIqdgXwDu1woi9zd4PZO9t2yTp2avn31ChO
         ct8vG7ldRwO1dTRJ9u51bqH+fA21I4fGMm6O4k0o/j2AKbuRnAz50H4K0ixqQ4MzIDBB
         Jh+A==
X-Gm-Message-State: AOAM5302iWt+10kp5o2S2U27WMd0YLSHMR+/q3ZbQPUgq1xv9b0Ptuhm
        biPICGzhnwMJjbywJcQjQw1HQg==
X-Google-Smtp-Source: ABdhPJxO2aw2I+NqFLE1L/awTbwxiuesQi5naGzmXtMKXPnXTMsy2GU+91KE+f9Cs5zfvVpLSe1IZg==
X-Received: by 2002:adf:b1ca:: with SMTP id r10mr33037021wra.252.1608795269049;
        Wed, 23 Dec 2020 23:34:29 -0800 (PST)
Received: from dell ([91.110.221.181])
        by smtp.gmail.com with ESMTPSA id w18sm39857432wrn.2.2020.12.23.23.34.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Dec 2020 23:34:28 -0800 (PST)
Date:   Thu, 24 Dec 2020 07:34:26 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     "marek.vasut+renesas@gmail.com" <marek.vasut+renesas@gmail.com>,
        "matti.vaittinen@fi.rohmeurope.com" 
        <matti.vaittinen@fi.rohmeurope.com>,
        "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "broonie@kernel.org" <broonie@kernel.org>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        Khiem Nguyen <khiem.nguyen.xt@renesas.com>,
        "linux-power@fi.rohmeurope.com" <linux-power@fi.rohmeurope.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v6 11/12] mfd: bd9571mwv: Make the driver more generic
Message-ID: <20201224073426.GD681741@dell>
References: <1608718963-21818-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1608718963-21818-12-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <20201223153928.GA681741@dell>
 <OSAPR01MB368360D8A4E3AD1E6F928271D8DD0@OSAPR01MB3683.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <OSAPR01MB368360D8A4E3AD1E6F928271D8DD0@OSAPR01MB3683.jpnprd01.prod.outlook.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, 24 Dec 2020, Yoshihiro Shimoda wrote:

> Hi Lee,
> 
> > From: Lee Jones, Sent: Thursday, December 24, 2020 12:39 AM
> > On Wed, 23 Dec 2020, Yoshihiro Shimoda wrote:
> > > From: Khiem Nguyen <khiem.nguyen.xt@renesas.com>
> > >
> > > Since the driver supports BD9571MWV PMIC only, this patch makes
> > > the functions and data structure become more generic so that
> > > it can support other PMIC variants as well. Also remove printing
> > > part name which Lee Jones suggested.
> > >
> > > Signed-off-by: Khiem Nguyen <khiem.nguyen.xt@renesas.com>
> > > Co-developed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> > > Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> > > Reviewed-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
> > > ---
> > >  drivers/mfd/bd9571mwv.c       | 89 +++++++++++++++++++++++++------------------
> > >  include/linux/mfd/bd9571mwv.h | 18 +--------
> > >  2 files changed, 54 insertions(+), 53 deletions(-)
> > 
> > Couple of small points.
> > 
> > Remainder looks good.
> 
> Thank you for your review!
> 
> > > diff --git a/drivers/mfd/bd9571mwv.c b/drivers/mfd/bd9571mwv.c
> > > index 49e968e..c905ab4 100644
> > > --- a/drivers/mfd/bd9571mwv.c
> > > +++ b/drivers/mfd/bd9571mwv.c
> > > @@ -3,6 +3,7 @@
> > >   * ROHM BD9571MWV-M MFD driver
> > >   *
> > >   * Copyright (C) 2017 Marek Vasut <marek.vasut+renesas@gmail.com>
> > > + * Copyright (C) 2020 Renesas Electronics Corporation
> > >   *
> > >   * Based on the TPS65086 driver
> > >   */
> > > @@ -14,6 +15,14 @@
> > >
> > >  #include <linux/mfd/bd9571mwv.h>
> > >
> > > +/* Driver data to distinguish bd957x variants */
> > > +struct bd957x_ddata {
> > > +	const struct regmap_config *regmap_config;
> > > +	const struct regmap_irq_chip *irq_chip;
> > 
> > > +	const struct mfd_cell *cells;
> > > +	int num_cells;
> > 
> > Are you using these post-probe?
> > 
> > If not, they're not ddata.
> 
> I'm not using all these members post-probe.
> So, I'll remove ddata.
> 
> <snip>
> > >  static int bd9571mwv_probe(struct i2c_client *client,
> > > -			  const struct i2c_device_id *ids)
> > > +			   const struct i2c_device_id *ids)
> > >  {
> > > -	struct bd9571mwv *bd;
> > > -	int ret;
> > > -
> > > -	bd = devm_kzalloc(&client->dev, sizeof(*bd), GFP_KERNEL);
> > > -	if (!bd)
> > > -		return -ENOMEM;
> > > -
> > > -	i2c_set_clientdata(client, bd);
> > > -	bd->dev = &client->dev;
> > > -	bd->irq = client->irq;
> > > +	const struct bd957x_ddata *ddata;
> > > +	struct device *dev = &client->dev;
> > > +	struct regmap *regmap;
> > > +	struct regmap_irq_chip_data *irq_data;
> > > +	int ret, irq = client->irq;
> > > +
> > > +	/* Read the PMIC product code */
> > > +	ret = i2c_smbus_read_byte_data(client, BD9571MWV_PRODUCT_CODE);
> > > +	if (ret < 0) {
> > > +		dev_err(dev, "Failed to read product code\n");
> > > +		return ret;
> > > +	}
> > 
> > Nit: '\n' here.
> 
> I got it. I'll add a blank line here.
> 
> > > +	switch (ret) {
> > > +	case BD9571MWV_PRODUCT_CODE_BD9571MWV:
> > > +		ddata = &bd9571mwv_ddata;
> > 
> > Simply declare 'const struct mfd_cell *cells' locally in probe and
> > assign it here instead.
> 
> I got it. I'll also add "const struct regmap_config *regmap_config;"
> and "const struct regmap_irq_chip *irq_chip;" locally in probe.

If you only use them there, then yes, that's correct.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
