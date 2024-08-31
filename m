Return-Path: <linux-renesas-soc+bounces-8586-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 42ABE9670E6
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 31 Aug 2024 12:32:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 68A3C1C212E4
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 31 Aug 2024 10:32:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B01B217B500;
	Sat, 31 Aug 2024 10:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="K79//bN8"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 080FD16F0CA
	for <linux-renesas-soc@vger.kernel.org>; Sat, 31 Aug 2024 10:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725100362; cv=none; b=Jm5E6ROuVQIyf+AlE1kxppQu+V4yaxA7mr60qgfaNMLy/2G483QgByaEGCRvaZLYrOa7ynWXfFub7m9UPoC2LdTI6vbVko8P24ojIwBe79+piCSatSc3xqvBvXNhayqBrhfhActfh6CxR+iupI7TvcZGZpjGDHgPkRDYUj+p4uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725100362; c=relaxed/simple;
	bh=LS7JjNLNOai5U4tKMxi9bIxoMnNaywIh2Nz/2XzTViE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S8gED11WUDv/HFlteFge7UEuqMxHAwKQiLJfdFUxopFlqWQz/v5T9AqOp+GmnDsoR9wPkKJIMwZC3BkHiGaCble0XqByRJWQGeh5AXJvkvuwS1cyVQKCWShO5q4UYMHgQmGg/g50a3VrdhHpuTdonFYysZ3rrrcGYeLIDhq9Obo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=K79//bN8; arc=none smtp.client-ip=209.85.219.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-dff1ccdc17bso2837885276.0
        for <linux-renesas-soc@vger.kernel.org>; Sat, 31 Aug 2024 03:32:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725100360; x=1725705160; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tKxIacQXeZ2qcUvNmDUUVII5ysi793GfJwtJp8UupOo=;
        b=K79//bN8cXBhdsmHCleEkY4jKCZWc7vZw5bVpr+9ezF/Tq9yh1+AQko2aps9jV6Nra
         L3nUQSBVdDPzzAsctwyEh26AqNfkQnXhfTKx0aojqdEI8gv5BjVAuA2+xBBr1rH1wAtc
         yiWEUy1EZCGryL4OB5YQUkSL5aAXA3sGcD85ZAL4shyVE7asTxQMohCD4zVZ0qcqazA+
         b53sCQ6XKu59mdeupIEFnm/dF5Ob8dzrs1MmEDemLvq5f8/ydxpoIgty/SaFvRDwTE85
         iFPmNSWBYjRCQXEJXCFHh80/KOlBz+bZXN+Kne31Q2Xfyrmax4lC7xpTONo/KgnTjNEo
         +BGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725100360; x=1725705160;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tKxIacQXeZ2qcUvNmDUUVII5ysi793GfJwtJp8UupOo=;
        b=YgHYWfi+gSSN4s3ZRW87Vcl3GNLEhQiG3P9A6PmrJDYHy0zI7htdtznFc/2lZU6lNv
         BA4XjYwsSBfJsyPeXDQEznVeeWvuue2ThIhuXlOXtmSr+7Q+j39YVgtZ9gtN7xeKQEbi
         r4n7TpbRImjqvA79ElDmsrMC/BPGLx2SryvA7vtmQsNZKGGmNpQ00q40DPLqIcfIdsjB
         kqYNAf8j4UJZIftlFdmLEZ8ExO4zbak5Cpc5CHWq1PYUrsowiOBaR7aTkuQ3Z0HDxlVo
         /fbxsu37aG/W6WWnQkh3mzJhUDmeDL0sKYV0/5fFNf1i+FTZU+g2J3pMkoOJy2d20Mld
         rBKg==
X-Forwarded-Encrypted: i=1; AJvYcCVsLWEltvpoF3AdnNh6XuDNePztJmoc+iEIeYizGeb7zFNU/WXy1R+Xh2W3ljmwth++3e42/1dTdYN5+DLpm5qf7Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxIIW0oLVASEfGKv8SPBPMR3sRx/+6dp7EJmSjyzbckIDcDoIJv
	99mOFYhr3zirI+wFWzgmjF4xgIizMLCRGJows5/wCjHsY5dhUBko7BSRwmngWrj0/08njCaaiKL
	rbW0zfQJr34aP6rUeY2z8giDESxEBMgSZDP0hPQ==
X-Google-Smtp-Source: AGHT+IH8Eb7EYXiidD/DrNNChHQ2lwNk48tFSRFBB77aRxIJWoIIPagMeOtludSNPt8BV9FsjbJZVJT8vUY8xBCkml0=
X-Received: by 2002:a05:6902:1145:b0:e0b:a7c1:9dcc with SMTP id
 3f1490d57ef6-e1a7a019106mr5308764276.20.1725100360016; Sat, 31 Aug 2024
 03:32:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240822152801.602318-1-claudiu.beznea.uj@bp.renesas.com>
 <CAPDyKFrS4Dhd7DZa2zz=oPro1TiTJFix0awzzzp8Qatm-8Z2Ug@mail.gmail.com>
 <99bef301-9f6c-4797-b47e-c83e56dfbda9@tuxon.dev> <CAPDyKFrVS2vpsJqTvjKCJ7ADqXc4D4k2eeCBsaK4T+=pXDnKUA@mail.gmail.com>
 <fa9b3449-ea3e-4482-b7eb-96999445cea5@tuxon.dev>
In-Reply-To: <fa9b3449-ea3e-4482-b7eb-96999445cea5@tuxon.dev>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Sat, 31 Aug 2024 12:32:02 +0200
Message-ID: <CAPDyKFrkkASq7rfRN=9sEet-p8T8t+f__PdnSNRN3bMNipnNNw@mail.gmail.com>
Subject: Re: [PATCH 00/16] Add initial USB support for the Renesas RZ/G3S SoC
To: claudiu beznea <claudiu.beznea@tuxon.dev>
Cc: vkoul@kernel.org, kishon@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, p.zabel@pengutronix.de, geert+renesas@glider.be, 
	magnus.damm@gmail.com, gregkh@linuxfoundation.org, mturquette@baylibre.com, 
	sboyd@kernel.org, yoshihiro.shimoda.uh@renesas.com, 
	biju.das.jz@bp.renesas.com, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
	linux-pm@vger.kernel.org, Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

[...]

> >
> > If not, there are two other options that can be considered I think.
> > *) Using the genpd on/off notifiers, to really allow the consumer
> > driver of the reset-control to know when the PM domain gets turned
> > on/off.
> > **) Move the entire reset handling into the PM domain provider, as it
> > obviously knows when the domain is getting turned on/off.
>
> This option is what I've explored, tested on my side.
>
> I explored it in 2 ways:
>
> 1/ SYSC modeled as an individual PM domain provider (this is more
>    appropriate to how HW manual described the hardware) with this the PHY
>    reset DT node would have to get 2 PM domains handlers (one for the
>    current PM domain provider and the other one for SYSC):
>
> +               phyrst: usbphy-ctrl@11e00000 {
> +                       compatible = "renesas,r9a08g045-usbphy-ctrl";
> +                       reg = <0 0x11e00000 0 0x10000>;
> +                       clocks = <&cpg CPG_MOD R9A08G045_USB_PCLK>;
> +                       resets = <&cpg R9A08G045_USB_PRESETN>;
> +                       power-domain-names = "cpg", "sysc";
> +                       power-domains = <&cpg R9A08G045_PD_USB_PHY>, <&sysc
> R9A08G045_SYSC_PD_USB>;
> +                       #reset-cells = <1>;
> +                       status = "disabled";
> +
> +                       usb0_vbus_otg: regulator-vbus {
> +                               regulator-name = "vbus";
> +                       };
> +               };
> +

According to what you have described earlier/above, modelling the SYSC
as a PM domain provider seems like a better description of the HW to
me. Although, as I said earlier, if you prefer the reset approach, I
would not object to that.

>
> and the PHY reset driver will get bulky with powering on/off both of these,
> at least with my current implementation, something like (and the following
> code is in probe()):
>
> +       if (priv->set_power) {
> +               priv->cpg_genpd_dev = dev_pm_domain_attach_by_name(dev, "cpg");
> +               if (IS_ERR(priv->cpg_genpd_dev)) {
> +                       dev_err_probe(dev, error, "Failed to attach CPG PM
> domain!");
> +                       error = PTR_ERR(priv->cpg_genpd_dev);
> +                       goto err_pm_runtime_put;
> +               }
> +
> +               priv->sysc_genpd_dev = dev_pm_domain_attach_by_name(dev,
> "sysc");
> +               if (IS_ERR(priv->sysc_genpd_dev)) {
> +                       dev_err_probe(dev, error, "Failed to attach sysc PM
> domain!");
> +                       error = PTR_ERR(priv->sysc_genpd_dev);
> +                       goto err_genpd_cpg_detach;
> +               }
> +
> +               priv->cpg_genpd_dl = device_link_add(dev, priv->cpg_genpd_dev,
> +                                                    DL_FLAG_PM_RUNTIME |
> +                                                    DL_FLAG_STATELESS);
> +               if (!priv->cpg_genpd_dl) {
> +                       dev_err_probe(dev, -ENOMEM, "Failed to add CPG
> genpd device link!");
> +                       goto err_genpd_sysc_detach;
> +               }
> +
> +               priv->sysc_genpd_dl = device_link_add(dev,
> priv->sysc_genpd_dev,
> +                                                     DL_FLAG_PM_RUNTIME |
> +                                                     DL_FLAG_STATELESS);
> +               if (!priv->sysc_genpd_dl) {
> +                       dev_err_probe(dev, -ENOMEM, "Failed to add sysc
> genpd device link!");
> +                       goto err_genpd_cpg_dl_del;
> +               }
> +
> +
> +               error = pm_runtime_resume_and_get(priv->cpg_genpd_dev);
> +               if (error) {
> +                       dev_err_probe(dev, error, "Failed to runtime resume
> cpg PM domain!");
> +                       goto err_genpd_sysc_dl_del;
> +               }
> +
> +               error = pm_runtime_resume_and_get(priv->sysc_genpd_dev);
> +               if (error) {
> +                       dev_err_probe(dev, error, "Failed to runtime resume
> sysc PM domain!");
> +                       goto err_genpd_cpg_off;
> +               }
> +       }

Indeed, the code above looks bulky.

Fortunately, we now have dev|devm_pm_domain_attach_list(), which
replaces all of the code above.

[...]

Kind regards
Uffe

