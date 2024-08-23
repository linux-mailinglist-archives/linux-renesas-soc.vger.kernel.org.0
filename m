Return-Path: <linux-renesas-soc+bounces-8187-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E3E5E95D3BC
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Aug 2024 18:53:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 637391F23D6D
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Aug 2024 16:53:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47FD618BB88;
	Fri, 23 Aug 2024 16:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cShglcHW"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E24312B6C;
	Fri, 23 Aug 2024 16:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724431995; cv=none; b=jvsTRqxcDNl4Yr35ncNEsHXMbe1mOsSBiWIyh2jNIzmum/nSVsijBZBlffA8QHSy/UW1d1i6oLmY2lJo31sSdBWUfjRJQN5JVDUY6QbiH2QGi2pFcY19ueKcCJT3ucpHIUDwN46alGpRb4XBaQnvadxxw/zIXsKtx2TSJDKbbqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724431995; c=relaxed/simple;
	bh=1bgw/Kad0mno9yvnmFSAkkRdRvDChUoKawQTuAds79I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GMQYfCRVHhQUMNjMTBp6Y5QLqudP0345OYKTeYpqwrAJytfMV5uTBW/cpjleX2ahNCbYinWU4Xk52TVVJRfG6ni3RxtDjQsoJvrT4yAKqGmbx2pVnxZiS4K19ysep8HjAqZNnJY5gUiR0aiD+rrcyjUiCpsadqlPZkjn5Eeuy5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cShglcHW; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2f409c87b07so21632291fa.0;
        Fri, 23 Aug 2024 09:53:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724431991; x=1725036791; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v3dNTaiY5IwxKdtWPFyIFrXrhNmpKz5xY0XspkPMjuU=;
        b=cShglcHW9C6qEzTnMX1cuubGoDK9aeUufDyjeUPdDZCJ7ijR86TzgFaMqgpgzqGs48
         gDnbTEl9xAEm5/+kmag+tRs4ai739NMIqzYjTgsF/EZxKzcETyg7EFNg6w3hI6fKuG5o
         bXe2+g82NV3UJUQ135blj5XJy6T1UWP49f/GDega8Faj9n0xTBiMC3kURkA6agfLx9F4
         E4HCAOhcMvGRTGqgXMTNU2FUJH06aruPRoFitX6RZqfp1RllFJB1tL47mTEI7y+UEQzi
         Pl2c4kMu2FLbvd5Hdc05ZPC+g/IpuyObRR14ycp/Y08zrwda7dvb2jJcN7Jdf76oT5LO
         9WFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724431991; x=1725036791;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v3dNTaiY5IwxKdtWPFyIFrXrhNmpKz5xY0XspkPMjuU=;
        b=JFoXKBOtyWhVoMdqQ3FyT7OdAepD0Pekt5MGIfAifhtLBdFyilZMpHYkM4pnwdrwu8
         MUS0HqzIZI/E9glcHxFNwmzg13JhioFZnvgAd0ySzJmEShofuvDbHNvbpdn8pYYEPH3v
         GBdmSiMVTAKGZR/FY5WT02FCqNmnRyBPd34Xvj7cfAVwy4vv/mwduD5jRc1Vs6IMyPEc
         7uOJGY6wStXcINCro8G98tS7UT+jEq+V9gSb06YVjUadV1X6Qn2Cp+54riT+yP8vvEvX
         +kfQ+owa+JyyqfnSTzUXYCIjmxA7tviINogLVessta/FEfTBFgBChMDjGIRbGLaXDUZA
         3vPA==
X-Forwarded-Encrypted: i=1; AJvYcCUPxDcAdFqF6DDsd1aC8Gjl5OM5fb/aU7UeRNXF6gy/XqNKz4c5AhGtFYJvn/n2kNyT/RqSxqyMHQei3vQG4WJlcj0=@vger.kernel.org, AJvYcCUvxEtkkp/porK3tQOHicUiWVt4kDG7/lX4S3Qkmgc88fTUzEBFAsgyMNqqqrMSz65vnellw0DDkw17UX8=@vger.kernel.org, AJvYcCXPzmaxSD7iJBPl9wzvF/Q52F74xcx0WaGXlRrbRyS5P8Zdg0/gppFtAY0rmZpzJmH/oEEL7I5p@vger.kernel.org
X-Gm-Message-State: AOJu0YwHVRYcyrIgiM16GS8Dc717Q8m9xbJXEPFV3vwN5xp5fYHVrTPv
	+oB2oA8RNAMx3jB+4/xzlMISzQR0yFBuz/eQGY7RGZtAlaqkqAn/EggiaCvVXGO1H5GwI0/F3Rc
	52oXRgvOX7XuUoYFjuFBd2gro6hs=
X-Google-Smtp-Source: AGHT+IHFX3VQxQPo7oldwhzia1sNHKwPxoeEI8OI4ihkGQJzz3Kefmx2UFC0C3joDhGlSP0z6cPQURvCDKileTV5k2w=
X-Received: by 2002:a05:651c:1505:b0:2ef:2d3d:3cc3 with SMTP id
 38308e7fff4ca-2f4f48d5a82mr20452211fa.4.1724431990868; Fri, 23 Aug 2024
 09:53:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240823072122.2053401-1-frank.li@vivo.com> <20240823072122.2053401-9-frank.li@vivo.com>
In-Reply-To: <20240823072122.2053401-9-frank.li@vivo.com>
From: Marcin Wojtas <marcin.s.wojtas@gmail.com>
Date: Fri, 23 Aug 2024 18:52:58 +0200
Message-ID: <CAHzn2R2eEWeSJOVQWbhG6FbCZv-o2PqL4tdU0E0XWSHM_EOjjw@mail.gmail.com>
Subject: Re: [net-next v2 8/9] net: mvpp2: Convert to devm_clk_get_enabled()
 and devm_clk_get_optional_enabled()
To: Yangtao Li <frank.li@vivo.com>
Cc: clement.leger@bootlin.com, andrew@lunn.ch, f.fainelli@gmail.com, 
	olteanv@gmail.com, davem@davemloft.net, edumazet@google.com, kuba@kernel.org, 
	pabeni@redhat.com, ulli.kroll@googlemail.com, linus.walleij@linaro.org, 
	linux@armlinux.org.uk, alexandre.torgue@foss.st.com, joabreu@synopsys.com, 
	mcoquelin.stm32@gmail.com, hkallweit1@gmail.com, kees@kernel.org, 
	justinstitt@google.com, u.kleine-koenig@pengutronix.de, horms@kernel.org, 
	sd@queasysnail.net, linux-renesas-soc@vger.kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

pt., 23 sie 2024 o 09:07 Yangtao Li <frank.li@vivo.com> napisa=C5=82(a):
>
> Use devm_clk_get_enabled() and devm_clk_get_optional_enabled()
> to simplify code.
>
> Signed-off-by: Yangtao Li <frank.li@vivo.com>
> Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> Tested-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> Suggested-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---


Reviewed-by: Marcin Wojtas <marcin.s.wojtas@gmail.com>

Thanks!
Marcin

> v2:
> -get rid of amount of variables used
>
>  drivers/net/ethernet/marvell/mvpp2/mvpp2.h    |  7 --
>  .../net/ethernet/marvell/mvpp2/mvpp2_main.c   | 89 +++++--------------
>  2 files changed, 24 insertions(+), 72 deletions(-)
>
> diff --git a/drivers/net/ethernet/marvell/mvpp2/mvpp2.h b/drivers/net/eth=
ernet/marvell/mvpp2/mvpp2.h
> index 9e02e4367bec..643a645e8097 100644
> --- a/drivers/net/ethernet/marvell/mvpp2/mvpp2.h
> +++ b/drivers/net/ethernet/marvell/mvpp2/mvpp2.h
> @@ -1044,13 +1044,6 @@ struct mvpp2 {
>          */
>         struct regmap *sysctrl_base;
>
> -       /* Common clocks */
> -       struct clk *pp_clk;
> -       struct clk *gop_clk;
> -       struct clk *mg_clk;
> -       struct clk *mg_core_clk;
> -       struct clk *axi_clk;
> -
>         /* List of pointers to port structures */
>         int port_count;
>         struct mvpp2_port *port_list[MVPP2_MAX_PORTS];
> diff --git a/drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c b/drivers/ne=
t/ethernet/marvell/mvpp2/mvpp2_main.c
> index 2fe8bae4eb3c..0ca2daeb0f90 100644
> --- a/drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c
> +++ b/drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c
> @@ -7561,56 +7561,32 @@ static int mvpp2_probe(struct platform_device *pd=
ev)
>                 priv->max_port_rxqs =3D 32;
>
>         if (dev_of_node(&pdev->dev)) {
> -               priv->pp_clk =3D devm_clk_get(&pdev->dev, "pp_clk");
> -               if (IS_ERR(priv->pp_clk))
> -                       return PTR_ERR(priv->pp_clk);
> -               err =3D clk_prepare_enable(priv->pp_clk);
> -               if (err < 0)
> -                       return err;
> -
> -               priv->gop_clk =3D devm_clk_get(&pdev->dev, "gop_clk");
> -               if (IS_ERR(priv->gop_clk)) {
> -                       err =3D PTR_ERR(priv->gop_clk);
> -                       goto err_pp_clk;
> -               }
> -               err =3D clk_prepare_enable(priv->gop_clk);
> -               if (err < 0)
> -                       goto err_pp_clk;
> +               struct clk *clk;
>
> -               if (priv->hw_version >=3D MVPP22) {
> -                       priv->mg_clk =3D devm_clk_get(&pdev->dev, "mg_clk=
");
> -                       if (IS_ERR(priv->mg_clk)) {
> -                               err =3D PTR_ERR(priv->mg_clk);
> -                               goto err_gop_clk;
> -                       }
> +               clk =3D devm_clk_get_enabled(&pdev->dev, "pp_clk");
> +               if (IS_ERR(clk))
> +                       return PTR_ERR(clk);
>
> -                       err =3D clk_prepare_enable(priv->mg_clk);
> -                       if (err < 0)
> -                               goto err_gop_clk;
> +               /* Get system's tclk rate */
> +               priv->tclk =3D clk_get_rate(clk);
>
> -                       priv->mg_core_clk =3D devm_clk_get_optional(&pdev=
->dev, "mg_core_clk");
> -                       if (IS_ERR(priv->mg_core_clk)) {
> -                               err =3D PTR_ERR(priv->mg_core_clk);
> -                               goto err_mg_clk;
> -                       }
> +               clk =3D devm_clk_get_enabled(&pdev->dev, "gop_clk");
> +               if (IS_ERR(clk))
> +                       return PTR_ERR(clk);
>
> -                       err =3D clk_prepare_enable(priv->mg_core_clk);
> -                       if (err < 0)
> -                               goto err_mg_clk;
> -               }
> +               if (priv->hw_version >=3D MVPP22) {
> +                       clk =3D devm_clk_get_enabled(&pdev->dev, "mg_clk"=
);
> +                       if (IS_ERR(clk))
> +                               return PTR_ERR(clk);
>
> -               priv->axi_clk =3D devm_clk_get_optional(&pdev->dev, "axi_=
clk");
> -               if (IS_ERR(priv->axi_clk)) {
> -                       err =3D PTR_ERR(priv->axi_clk);
> -                       goto err_mg_core_clk;
> +                       clk =3D devm_clk_get_optional_enabled(&pdev->dev,=
 "mg_core_clk");
> +                       if (IS_ERR(clk))
> +                               return PTR_ERR(clk);
>                 }
>
> -               err =3D clk_prepare_enable(priv->axi_clk);
> -               if (err < 0)
> -                       goto err_mg_core_clk;
> -
> -               /* Get system's tclk rate */
> -               priv->tclk =3D clk_get_rate(priv->pp_clk);
> +               clk =3D devm_clk_get_optional_enabled(&pdev->dev, "axi_cl=
k");
> +               if (IS_ERR(clk))
> +                       return PTR_ERR(clk);
>         } else {
>                 err =3D device_property_read_u32(&pdev->dev, "clock-frequ=
ency", &priv->tclk);
>                 if (err) {
> @@ -7622,7 +7598,7 @@ static int mvpp2_probe(struct platform_device *pdev=
)
>         if (priv->hw_version >=3D MVPP22) {
>                 err =3D dma_set_mask(&pdev->dev, MVPP2_DESC_DMA_MASK);
>                 if (err)
> -                       goto err_axi_clk;
> +                       return err;
>                 /* Sadly, the BM pools all share the same register to
>                  * store the high 32 bits of their address. So they
>                  * must all have the same high 32 bits, which forces
> @@ -7630,7 +7606,7 @@ static int mvpp2_probe(struct platform_device *pdev=
)
>                  */
>                 err =3D dma_set_coherent_mask(&pdev->dev, DMA_BIT_MASK(32=
));
>                 if (err)
> -                       goto err_axi_clk;
> +                       return err;
>         }
>
>         /* Map DTS-active ports. Should be done before FIFO mvpp2_init */
> @@ -7649,12 +7625,12 @@ static int mvpp2_probe(struct platform_device *pd=
ev)
>         err =3D mvpp2_init(pdev, priv);
>         if (err < 0) {
>                 dev_err(&pdev->dev, "failed to initialize controller\n");
> -               goto err_axi_clk;
> +               return err;
>         }
>
>         err =3D mvpp22_tai_probe(&pdev->dev, priv);
>         if (err < 0)
> -               goto err_axi_clk;
> +               return err;
>
>         /* Initialize ports */
>         device_for_each_child_node_scoped(&pdev->dev, port_fwnode) {
> @@ -7665,8 +7641,7 @@ static int mvpp2_probe(struct platform_device *pdev=
)
>
>         if (priv->port_count =3D=3D 0) {
>                 dev_err(&pdev->dev, "no ports enabled\n");
> -               err =3D -ENODEV;
> -               goto err_axi_clk;
> +               return -ENODEV;
>         }
>
>         /* Statistics must be gathered regularly because some of them (li=
ke
> @@ -7698,16 +7673,6 @@ static int mvpp2_probe(struct platform_device *pde=
v)
>  err_port_probe:
>         for (i =3D 0; i < priv->port_count; i++)
>                 mvpp2_port_remove(priv->port_list[i]);
> -err_axi_clk:
> -       clk_disable_unprepare(priv->axi_clk);
> -err_mg_core_clk:
> -       clk_disable_unprepare(priv->mg_core_clk);
> -err_mg_clk:
> -       clk_disable_unprepare(priv->mg_clk);
> -err_gop_clk:
> -       clk_disable_unprepare(priv->gop_clk);
> -err_pp_clk:
> -       clk_disable_unprepare(priv->pp_clk);
>         return err;
>  }
>
> @@ -7745,12 +7710,6 @@ static void mvpp2_remove(struct platform_device *p=
dev)
>
>         if (!dev_of_node(&pdev->dev))
>                 return;
> -
> -       clk_disable_unprepare(priv->axi_clk);
> -       clk_disable_unprepare(priv->mg_core_clk);
> -       clk_disable_unprepare(priv->mg_clk);
> -       clk_disable_unprepare(priv->pp_clk);
> -       clk_disable_unprepare(priv->gop_clk);
>  }
>
>  static const struct of_device_id mvpp2_match[] =3D {
> --
> 2.39.0
>

