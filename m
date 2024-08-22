Return-Path: <linux-renesas-soc+bounces-8083-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D42F395BCA8
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Aug 2024 19:03:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5A8481F21FE6
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Aug 2024 17:03:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0B681CF294;
	Thu, 22 Aug 2024 17:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MwYytXG3"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F20E71CF288;
	Thu, 22 Aug 2024 17:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724346186; cv=none; b=F9mYOxl76B6wr2pUKT6ZEUpavuD2Nk7ExC8KPPv8bcDc8Gu8o/HUfSSyjOUv5HAVJWp5P+ua+GlwYiy3Kc0YZhRZKjK3ZjUMQF1Ek35oDs0M755dPrJ/0wlAQvDeJuj58+T3er7eF0YCv8O0lhIdtrdbR1aYq70SJyXeEOtM5O8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724346186; c=relaxed/simple;
	bh=qkIjjiVogjjvnuxGsaniqp8BUrrCLWdw7P3LDfPm/Yw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FYSVAqFeL3zTt5pxOIPqGWDlQWVQHBu+Z+g7fxyIXqNowo9ZYe5AcCXitBPh8Ym6I6QqoV4IsqXrbZnFGCgq/h0Dx/jR8xj0pPkADtMnVw7SXYLi53IXGQlQzY7UdV18vDiG6hyZgoQHVv7lFCm1U1NQsi/PctejMOblZG4NgWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MwYytXG3; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5334adf7249so1457418e87.3;
        Thu, 22 Aug 2024 10:03:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724346183; x=1724950983; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DIj/n8EH0F4bk0Ees7Y37+6sgIgt4AQemsJzINsa4Sk=;
        b=MwYytXG3Dol5SheXkLW2VODbAcpA1hv8A5EfqQd0HlrKMF1cAMIeubT0ivHxDS8Htn
         8CKf3pp/vO3FinAoGvbdyhFqY8bBus2FlAD7uKimUiLcZoInkq2LfQvJI9JAkxkCs/5y
         CcpbfGQMYQVV07WYCRsi1mrWnPZOw2OBDUFcZGrhAw6rShJjAMH0ziuuSpESZEvdFmUJ
         yN6muCRO31sViVPwQLABPKBysG0vhr/UoE/k8no57+kkr36WcTobYr+NuI18hGUkCTN/
         TlIGKikk05RcPEIFASQZeWloRiMElN70wJ5Xl3AHOIBRyOUaSDT715HHHIKEU/rbwIuw
         rHwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724346183; x=1724950983;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DIj/n8EH0F4bk0Ees7Y37+6sgIgt4AQemsJzINsa4Sk=;
        b=jf/Wd0osFQa4jGyrU02SGMVEDlKwWyVbwIWhKVFf92/H9+7+KzNU+iRzqHDx0OlZSl
         RKUl1ncr+/vlGBJCGfeuCw5yJaiuJ6mRoWxNN8OjpWr/6DXXUdV+7AHy8Fe/YQzuoA5v
         HE8NLhdXykYVL7Qy31vpM6qsCtibtPzCJfVMEJ21+FZ/9OmxRdYaPR0Fn0LIPtAA5USo
         Qj05TRQeXK3gIcBNHPPrHiH/XDf5DfwfU0+wdvFvVLXBhO1BzkyiihQfwtMntIkkbEtI
         fWeAWs5eRrTufEHDdOnpBS5UPh8f+cDzIMpxoZWdTcH0fk31ATeT/pngEjl3CA0b4VsR
         YFMw==
X-Forwarded-Encrypted: i=1; AJvYcCWTull26zBcqlvmgS7tXn9wSlYhg4ByII4zzYW2Q0euLfcsfa/48/J2nQ2IgnXswPvDVeyFP/3B0WEzrin12ko8zic=@vger.kernel.org, AJvYcCXeknbAFzeEdEmUUjp1XXufe9ZKCl/cP25xdF0SE5aPkGybAjGLDzXPA+CXzBjuJ8DH0kds21bo@vger.kernel.org, AJvYcCXpYu/Ge1BDBenuBTo8eaD+zC54rnN1KlfFMLkWPJWZg6CKwJkf+ta3FOniWNtkOgaIzZqgARnS1vfktpM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyK3wtG3qgA+tcQ9MlMYcnyrDn1qOd19EFJfWAJkg3cHOi6d0eg
	CJ1krq6yueUP0dzsbty+8dnyH899rH1H/0Bfo2yXWQQ1mAvFjUIUPUBXSYd+OlGV3AO5tg6u/Pi
	5/MGpqh4BahlvIfihnMGdtuWvbjA=
X-Google-Smtp-Source: AGHT+IFAxofPqnflODhvDlBtQ1z7sw6PKXYf1b65/dZtDIdsYSI9mkJ9/6dbkLecgibvSfpX8V/qQTeRgjB86ZrsvxA=
X-Received: by 2002:a2e:f1a:0:b0:2ef:20ae:d111 with SMTP id
 38308e7fff4ca-2f3f87e0c64mr45111601fa.6.1724346182420; Thu, 22 Aug 2024
 10:03:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240822084733.1599295-1-frank.li@vivo.com> <20240822084733.1599295-9-frank.li@vivo.com>
 <15ba8f05-8909-4ade-b0f3-c98cad0bd9f0@wanadoo.fr>
In-Reply-To: <15ba8f05-8909-4ade-b0f3-c98cad0bd9f0@wanadoo.fr>
From: Marcin Wojtas <marcin.s.wojtas@gmail.com>
Date: Thu, 22 Aug 2024 19:02:49 +0200
Message-ID: <CAHzn2R2To1pQ+RSWMS+fdKpMzvXLoORRva0MOTpUrYnsQQEy+g@mail.gmail.com>
Subject: Re: [net-next 8/9] net: mvpp2: Convert to devm_clk_get_enabled() and devm_clk_get_optional_enabled()
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Yangtao Li <frank.li@vivo.com>, clement.leger@bootlin.com, andrew@lunn.ch, 
	f.fainelli@gmail.com, olteanv@gmail.com, davem@davemloft.net, 
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	ulli.kroll@googlemail.com, linus.walleij@linaro.org, linux@armlinux.org.uk, 
	alexandre.torgue@foss.st.com, joabreu@synopsys.com, hkallweit1@gmail.com, 
	justinstitt@google.com, kees@kernel.org, u.kleine-koenig@pengutronix.de, 
	jacob.e.keller@intel.com, horms@kernel.org, shannon.nelson@amd.com, 
	linux-renesas-soc@vger.kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

czw., 22 sie 2024 o 15:20 Christophe JAILLET
<christophe.jaillet@wanadoo.fr> napisa=C5=82(a):
>
> Le 22/08/2024 =C3=A0 10:47, Yangtao Li a =C3=A9crit :
> > Use devm_clk_get_enabled() and devm_clk_get_optional_enabled()
> > to simplify code.
> >
> > Signed-off-by: Yangtao Li <frank.li@vivo.com>
> > ---
> >   drivers/net/ethernet/marvell/mvpp2/mvpp2.h    |  7 --
> >   .../net/ethernet/marvell/mvpp2/mvpp2_main.c   | 86 +++++-------------=
-
> >   2 files changed, 22 insertions(+), 71 deletions(-)
> >
> > diff --git a/drivers/net/ethernet/marvell/mvpp2/mvpp2.h b/drivers/net/e=
thernet/marvell/mvpp2/mvpp2.h
> > index 9e02e4367bec..643a645e8097 100644
> > --- a/drivers/net/ethernet/marvell/mvpp2/mvpp2.h
> > +++ b/drivers/net/ethernet/marvell/mvpp2/mvpp2.h
> > @@ -1044,13 +1044,6 @@ struct mvpp2 {
> >        */
> >       struct regmap *sysctrl_base;
> >
> > -     /* Common clocks */
> > -     struct clk *pp_clk;
> > -     struct clk *gop_clk;
> > -     struct clk *mg_clk;
> > -     struct clk *mg_core_clk;
> > -     struct clk *axi_clk;
> > -
> >       /* List of pointers to port structures */
> >       int port_count;
> >       struct mvpp2_port *port_list[MVPP2_MAX_PORTS];
> > diff --git a/drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c b/drivers/=
net/ethernet/marvell/mvpp2/mvpp2_main.c
> > index 2fe8bae4eb3c..0075499de29f 100644
> > --- a/drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c
> > +++ b/drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c
> > @@ -7462,6 +7462,7 @@ static int mvpp2_get_sram(struct platform_device =
*pdev,
> >
> >   static int mvpp2_probe(struct platform_device *pdev)
> >   {
> > +     struct clk *pp_clk, *gop_clk, *mg_clk, *mg_core_clk, *axi_clk;
>
> Hi,
>
> Nitpick: you could also define just struct clk *pp_clk, *clk; and reuse
> clk for most calls.
> *Maybe* clk_get_rate() could be moved in order to only need 1 clk.
>

I'm also supportive to optimizing for amount of variables used, as
they are all local now.

Best regards,
Marcin

> CJ
>
> >       struct mvpp2 *priv;
> >       struct resource *res;
> >       void __iomem *base;
> > @@ -7561,56 +7562,30 @@ static int mvpp2_probe(struct platform_device *=
pdev)
> >               priv->max_port_rxqs =3D 32;
> >
> >       if (dev_of_node(&pdev->dev)) {
> > -             priv->pp_clk =3D devm_clk_get(&pdev->dev, "pp_clk");
> > -             if (IS_ERR(priv->pp_clk))
> > -                     return PTR_ERR(priv->pp_clk);
> > -             err =3D clk_prepare_enable(priv->pp_clk);
> > -             if (err < 0)
> > -                     return err;
> > +             pp_clk =3D devm_clk_get_enabled(&pdev->dev, "pp_clk");
> > +             if (IS_ERR(pp_clk))
> > +                     return PTR_ERR(pp_clk);
> >
> > -             priv->gop_clk =3D devm_clk_get(&pdev->dev, "gop_clk");
> > -             if (IS_ERR(priv->gop_clk)) {
> > -                     err =3D PTR_ERR(priv->gop_clk);
> > -                     goto err_pp_clk;
> > -             }
> > -             err =3D clk_prepare_enable(priv->gop_clk);
> > -             if (err < 0)
> > -                     goto err_pp_clk;
> > +             gop_clk =3D devm_clk_get_enabled(&pdev->dev, "gop_clk");
> > +             if (IS_ERR(gop_clk))
> > +                     return PTR_ERR(gop_clk);
> >
> >               if (priv->hw_version >=3D MVPP22) {
> > -                     priv->mg_clk =3D devm_clk_get(&pdev->dev, "mg_clk=
");
> > -                     if (IS_ERR(priv->mg_clk)) {
> > -                             err =3D PTR_ERR(priv->mg_clk);
> > -                             goto err_gop_clk;
> > -                     }
> > -
> > -                     err =3D clk_prepare_enable(priv->mg_clk);
> > -                     if (err < 0)
> > -                             goto err_gop_clk;
> > -
> > -                     priv->mg_core_clk =3D devm_clk_get_optional(&pdev=
->dev, "mg_core_clk");
> > -                     if (IS_ERR(priv->mg_core_clk)) {
> > -                             err =3D PTR_ERR(priv->mg_core_clk);
> > -                             goto err_mg_clk;
> > -                     }
> > +                     mg_clk =3D devm_clk_get_enabled(&pdev->dev, "mg_c=
lk");
> > +                     if (IS_ERR(mg_clk))
> > +                             return PTR_ERR(mg_clk);
> >
> > -                     err =3D clk_prepare_enable(priv->mg_core_clk);
> > -                     if (err < 0)
> > -                             goto err_mg_clk;
> > +                     mg_core_clk =3D devm_clk_get_optional_enabled(&pd=
ev->dev, "mg_core_clk");
> > +                     if (IS_ERR(mg_core_clk))
> > +                             return PTR_ERR(mg_core_clk);
> >               }
> >
> > -             priv->axi_clk =3D devm_clk_get_optional(&pdev->dev, "axi_=
clk");
> > -             if (IS_ERR(priv->axi_clk)) {
> > -                     err =3D PTR_ERR(priv->axi_clk);
> > -                     goto err_mg_core_clk;
> > -             }
> > -
> > -             err =3D clk_prepare_enable(priv->axi_clk);
> > -             if (err < 0)
> > -                     goto err_mg_core_clk;
> > +             axi_clk =3D devm_clk_get_optional_enabled(&pdev->dev, "ax=
i_clk");
> > +             if (IS_ERR(axi_clk))
> > +                     return PTR_ERR(axi_clk);
> >
> >               /* Get system's tclk rate */
> > -             priv->tclk =3D clk_get_rate(priv->pp_clk);
> > +             priv->tclk =3D clk_get_rate(pp_clk);
> >       } else {
> >               err =3D device_property_read_u32(&pdev->dev, "clock-frequ=
ency", &priv->tclk);
> >               if (err) {
> > @@ -7622,7 +7597,7 @@ static int mvpp2_probe(struct platform_device *pd=
ev)
> >       if (priv->hw_version >=3D MVPP22) {
> >               err =3D dma_set_mask(&pdev->dev, MVPP2_DESC_DMA_MASK);
> >               if (err)
> > -                     goto err_axi_clk;
> > +                     return err;
> >               /* Sadly, the BM pools all share the same register to
> >                * store the high 32 bits of their address. So they
> >                * must all have the same high 32 bits, which forces
> > @@ -7630,7 +7605,7 @@ static int mvpp2_probe(struct platform_device *pd=
ev)
> >                */
> >               err =3D dma_set_coherent_mask(&pdev->dev, DMA_BIT_MASK(32=
));
> >               if (err)
> > -                     goto err_axi_clk;
> > +                     return err;
> >       }
> >
> >       /* Map DTS-active ports. Should be done before FIFO mvpp2_init */
> > @@ -7649,12 +7624,12 @@ static int mvpp2_probe(struct platform_device *=
pdev)
> >       err =3D mvpp2_init(pdev, priv);
> >       if (err < 0) {
> >               dev_err(&pdev->dev, "failed to initialize controller\n");
> > -             goto err_axi_clk;
> > +             return err;
> >       }
> >
> >       err =3D mvpp22_tai_probe(&pdev->dev, priv);
> >       if (err < 0)
> > -             goto err_axi_clk;
> > +             return err;
> >
> >       /* Initialize ports */
> >       device_for_each_child_node_scoped(&pdev->dev, port_fwnode) {
> > @@ -7665,8 +7640,7 @@ static int mvpp2_probe(struct platform_device *pd=
ev)
> >
> >       if (priv->port_count =3D=3D 0) {
> >               dev_err(&pdev->dev, "no ports enabled\n");
> > -             err =3D -ENODEV;
> > -             goto err_axi_clk;
> > +             return -ENODEV;
> >       }
> >
> >       /* Statistics must be gathered regularly because some of them (li=
ke
> > @@ -7698,16 +7672,6 @@ static int mvpp2_probe(struct platform_device *p=
dev)
> >   err_port_probe:
> >       for (i =3D 0; i < priv->port_count; i++)
> >               mvpp2_port_remove(priv->port_list[i]);
> > -err_axi_clk:
> > -     clk_disable_unprepare(priv->axi_clk);
> > -err_mg_core_clk:
> > -     clk_disable_unprepare(priv->mg_core_clk);
> > -err_mg_clk:
> > -     clk_disable_unprepare(priv->mg_clk);
> > -err_gop_clk:
> > -     clk_disable_unprepare(priv->gop_clk);
> > -err_pp_clk:
> > -     clk_disable_unprepare(priv->pp_clk);
> >       return err;
> >   }
> >
> > @@ -7745,12 +7709,6 @@ static void mvpp2_remove(struct platform_device =
*pdev)
> >
> >       if (!dev_of_node(&pdev->dev))
> >               return;
> > -
> > -     clk_disable_unprepare(priv->axi_clk);
> > -     clk_disable_unprepare(priv->mg_core_clk);
> > -     clk_disable_unprepare(priv->mg_clk);
> > -     clk_disable_unprepare(priv->pp_clk);
> > -     clk_disable_unprepare(priv->gop_clk);
> >   }
> >
> >   static const struct of_device_id mvpp2_match[] =3D {
>

