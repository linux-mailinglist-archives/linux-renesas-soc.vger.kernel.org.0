Return-Path: <linux-renesas-soc+bounces-22957-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 86CC3BD4DFA
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Oct 2025 18:16:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EC27618A07B4
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Oct 2025 16:16:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD9EB30CD9F;
	Mon, 13 Oct 2025 16:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ZW8AY5d0"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F132330CD95
	for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Oct 2025 16:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760371360; cv=none; b=oFQNGyDw11RBQHhL7POogaWI5yzACZuY7SH1CpTJwKu5n4Q9fA0zqKfhqAxXScIzfg/Akg+QNY+XERJBbgM109W+KIaNTHkHVIYrHDSPNL7OXhaCoP8MDtNcEdhvxbx+modRmkH2hbN3cop14aJrY/kSmVz57FZ1dBQRqB09bSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760371360; c=relaxed/simple;
	bh=7pmScWeJxb/SA9LfgnIE+RSHfO7kt+ZDsVcv07zsRtU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CGBHed8ozmrd7Db8J0K9gaO1NVjXmtihdZEoMCmvR5rr+tF6fUKop1KWKBw3mwspUFA0K56mjDAwCX2UF33kCZabV3cgSGUCOw3MwXPrjS+RxhPadXoo27KvDEXE79GLuz7i+uuSQIqS7wFkDtQOta5ssTm9nroUh0e2Jl3e8yM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ZW8AY5d0; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-63bad3cd668so1771715a12.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Oct 2025 09:02:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1760371357; x=1760976157; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=85zW8eAa0UUuhYK13qFSD0pz0Cqd0sUrz3cG+0d4BSc=;
        b=ZW8AY5d0A7x0JH23tpNn2fzZpXihG50kEjoqS46YQKNbO1pxmdrYDfF80UhPURhXZo
         huW7y71evh4XYwSyVictteAHRrno+f8zaSq+67H+t6bLzTk0EPHtkVUVZkFcuYOkbabl
         /lldvYg+iHKxdMHSjUPQ9vh4Hu4dYWqYedPDU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760371357; x=1760976157;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=85zW8eAa0UUuhYK13qFSD0pz0Cqd0sUrz3cG+0d4BSc=;
        b=d3m/wm0RsanjeO9VSxvB/cYXeVFdvWJfzjMtYbY+rzGVYIr672R5fHl77D2BbuiYlZ
         gJ3pbz4D7oXT+DH+Zcmn0p0uPLqDf+eDMOSafqkxmRJiaUqmyEq5Ebel6AQpZ4SPVIkU
         Z3DWC8pjL/ZMCSGYeSXK4TUzsCKwSM2GTEXaZta/fVeXTJKD00SouWqiW4PAOOODrmEp
         lDUHTqUNSXMBrlxKCFjbFHXW2zfTUnDZm8ro3/mp+BNn5lI4t80/t8bwlpPxsVhz2+2U
         Cvz6nTo/zACc6IBSMyUcnoKw0NUh0abBk/JEZEaGB6U0GCV4SYhuW/naa36ixq/IFL06
         AzDQ==
X-Forwarded-Encrypted: i=1; AJvYcCXMmtZabxSEs0uHBIZAl5gCsjJfalOPOIg93gJSFRl4j4TFKjH71KohEIA82hJZgAp53AyTSe8XhdIGD/ac1CG9Vg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzBWpiU33XjWJGNpSlaLPZs0jmiEcxIcSaAnKLP7aiPIajnu/3c
	kbgn5z1JVTQI6XJHQk/f4F+nH9lkDCeGxOw3N4iObfaaiS1QQCY9yoBnnJmEIDaprCWt942q1Xt
	cXkfCHnJg
X-Gm-Gg: ASbGncsVaD7eqm3d9tNAo5OIa1KOGWVaL+oDhXJ3bYgmXSN9qutRslmACM2ofSLdH+u
	3VDhQ3oYTiX9DTN2EuHeNDSllZ7UvzPvWK4EsBZVssKM/hST9s4L16R5ER3qgcG+Kck0YjGZCXp
	WCT/i35Jna7M9b0c3d0qhqkTWBm4yJXldsH6L/aFVJWNWTkAB07feBa6XA1TEB4YcrdbmEgX09a
	zzPMxezuXvUMRUlVJy4xiiSfijO9J95kpkrhoI0JjS+9c7Fynkrg1mxnTMoyq+EzQGo4TNuGJ44
	zdrGeVcQ1XxKkIEkZ4LpX/OM9pnTSs+RhNh62XSH3iaBCdxCnMYbqlJ7StgdcTIg7dapxcXZuq9
	0ScRcAh9+K07MoR1G1aSZALXxfGcbokxuhR/llp8601GjD0JE99lqmGAz00OKcBVVSACiLCzGPt
	7s8N2NaBNQ1rOsIA==
X-Google-Smtp-Source: AGHT+IEziGpbFLQ+3OK93cIQ7Jbr/mp6arp6wkGkFHkN+uvNBgFVdD6peKdARg0GJ1eMTISwM84WIQ==
X-Received: by 2002:a17:907:3ccb:b0:b57:2d81:41f with SMTP id a640c23a62f3a-b572d810c7emr1130936966b.40.1760371357039;
        Mon, 13 Oct 2025 09:02:37 -0700 (PDT)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com. [209.85.218.51])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d67d5c2bsm951654166b.37.2025.10.13.09.02.36
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Oct 2025 09:02:36 -0700 (PDT)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b4aed12cea3so697927966b.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Oct 2025 09:02:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV/SVge2n4jpFfyzmFmbSDn4e6PxXuDtqT2xBqbd7zmCjJGWb5K6C04rXven5F8Q7a5y8xN+Y25GZW6guSO9S0DtQ==@vger.kernel.org
X-Received: by 2002:ac2:4c50:0:b0:55f:4ac2:a58c with SMTP id
 2adb3069b0e04-5906dc0ff30mr6173104e87.22.1760370964286; Mon, 13 Oct 2025
 08:56:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251013-ptr_err-v1-0-2c5efbd82952@chromium.org>
 <20251013-ptr_err-v1-10-2c5efbd82952@chromium.org> <176036780330.559803.287308146210017676@ping.linuxembedded.co.uk>
In-Reply-To: <176036780330.559803.287308146210017676@ping.linuxembedded.co.uk>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 13 Oct 2025 17:55:51 +0200
X-Gmail-Original-Message-ID: <CANiDSCsuPkdz0=U2b_mNh4TWTNztAd9qEwJaiMRdGy1sf3UEbA@mail.gmail.com>
X-Gm-Features: AS18NWCmgLaH0rMvCIhheSPVtWPGKkpbEBd_aB_kzUyM4RaB_yHSiy8sRs-muw0
Message-ID: <CANiDSCsuPkdz0=U2b_mNh4TWTNztAd9qEwJaiMRdGy1sf3UEbA@mail.gmail.com>
Subject: Re: [PATCH 10/32] media: i2c: imx335: Use %pe format specifier
To: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>, Bingbu Cao <bingbu.cao@intel.com>, 
	Dafna Hirschfeld <dafna@fastmail.com>, Daniel Scally <djrscally@gmail.com>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Fabio Estevam <festevam@gmail.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Hans Verkuil <hverkuil@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Jacopo Mondi <jacopo+renesas@jmondi.org>, 
	Jacopo Mondi <jacopo@jmondi.org>, Julien Massot <julien.massot@collabora.com>, 
	=?UTF-8?Q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>, 
	Krzysztof Kozlowski <krzk@kernel.org>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Leon Luo <leonl@leopardimaging.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, 
	=?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Purism Kernel Team <kernel@puri.sm>, 
	Rui Miguel Silva <rmfrfs@gmail.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
	Sylvain Petinot <sylvain.petinot@foss.st.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Tianshu Qiu <tian.shu.qiu@intel.com>, Tiffany Lin <tiffany.lin@mediatek.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Yemike Abhilash Chandra <y-abhilashchandra@ti.com>, Yong Zhi <yong.zhi@intel.com>, 
	Yunfei Dong <yunfei.dong@mediatek.com>, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Kieran

On Mon, 13 Oct 2025 at 17:03, Kieran Bingham
<kieran.bingham@ideasonboard.com> wrote:
>
> Quoting Ricardo Ribalda (2025-10-13 15:14:50)
> > The %pe format specifier is designed to print error pointers. It prints
> > a symbolic error name (eg. -EINVAL) and it makes the code simpler by
> > omitting PTR_ERR().
> >
> > This patch fixes this cocci report:
> > ./i2c/imx335.c:1013:3-10: WARNING: Consider using %pe to print PTR_ERR()
>
> Ohhh nice. Is this new ? First I've come across it.

It is actually from 2019:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=57f5677e535ba24b8926a7125be2ef8d7f09323c

I just learned about it because there is a new check in coccinelle :).

It is pretty cool, but you need to be careful to check IS_ERR(ptr)
before doing the printk, otherwise %pe will print the pointer value.

Regards!

>
>
>
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> >  drivers/media/i2c/imx335.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/media/i2c/imx335.c b/drivers/media/i2c/imx335.c
> > index c043df2f15fb25b3a56422092f99a1fd9a508fa9..71ed9a0d84a252ee362621c4d38001508fb86d28 100644
> > --- a/drivers/media/i2c/imx335.c
> > +++ b/drivers/media/i2c/imx335.c
> > @@ -1009,8 +1009,8 @@ static int imx335_parse_hw_config(struct imx335 *imx335)
> >         imx335->reset_gpio = devm_gpiod_get_optional(imx335->dev, "reset",
> >                                                      GPIOD_OUT_HIGH);
> >         if (IS_ERR(imx335->reset_gpio)) {
> > -               dev_err(imx335->dev, "failed to get reset gpio %ld\n",
> > -                       PTR_ERR(imx335->reset_gpio));
> > +               dev_err(imx335->dev, "failed to get reset gpio %pe\n",
> > +                       imx335->reset_gpio);
>
> Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
>
> >                 return PTR_ERR(imx335->reset_gpio);
> >         }
> >
> >
> > --
> > 2.51.0.760.g7b8bcc2412-goog
> >



-- 
Ricardo Ribalda

