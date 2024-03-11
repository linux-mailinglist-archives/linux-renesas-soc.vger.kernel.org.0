Return-Path: <linux-renesas-soc+bounces-3677-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DEF83877E90
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 Mar 2024 12:03:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6C6051F209AF
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 Mar 2024 11:03:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 845D3383A5;
	Mon, 11 Mar 2024 11:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="uX8e0chV"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6DC8381DA
	for <linux-renesas-soc@vger.kernel.org>; Mon, 11 Mar 2024 11:03:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710155004; cv=none; b=n3GuqBnqLepNSGIP183zZqhGotaKIjgHdNcSvjNhDOpusmeDdI4o/3+1sbmT/SnSYu9GFmbLiOjAs04seAI0tm9QJA/DcNcenIeCzEbFgsApXT/MYxtTdZB7/FteWiSc6NfuAUiCHk6E5j0KAfe5ISPHMeN8N+cefPfPJjq+jug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710155004; c=relaxed/simple;
	bh=gQkrDPxpS2EqSQo1lFnVAl0v8qesDjjlj8YPz5bYqM8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g09q3Y4NcVY/UYpivec8cPzekciqulTwvn5QbcpFP87fMfWudFFZY89r/yRtQBLLzGaIuvvmr92SsOnKAv1NsTbTHdh8eqrwAudqvX3QsyGmsMyK1bYcfHbPh93y9WGWafO67FRX725VD0/3R/6uk9Ix/wAJ0XLY9/AQPItQFE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=uX8e0chV; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-513298d6859so3875595e87.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 11 Mar 2024 04:03:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech.se; s=google; t=1710155000; x=1710759800; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8+eJcaivf1oVvQVDFOxNL/y8v7xDssxtOMnaOKKnTqo=;
        b=uX8e0chVZg5wXdYofGbhN9Y9D2w1psaR+zO5VF5V8hx3ee5G5xRpJRY53RcVdUpNKq
         DIfS7I6UTJRAn6BH+vAPi7S/YGFTmZpUttt0TVgQ/hbCYnSzjIgCEfPHM12aa97S75qQ
         73KaAVo7JojfatlTTxQfHk04xiFp12ueiNgsMhs/kYFhB4dL42H16xP2Ewv0q4midFz1
         DQEr7vFm0ktsbuNyQRKwUbhh8Jefje1fTeUVonxbORI8voQrOzqlpuQhuCDtmNvIiBLH
         ElGKTmMJHYjiZnoLdwxTUGqXyyDlzO27SD7qoaCYwb3yZXhBwsXMHM+ViRo04eoAl5F4
         oPMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710155000; x=1710759800;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8+eJcaivf1oVvQVDFOxNL/y8v7xDssxtOMnaOKKnTqo=;
        b=eoM7Z54Vj/0WoKLlepTt3HZsgiBEyGrbO0OEpOdmwe5gSG5szaoCifgVeLUSm6zkjx
         xmictm/utCtStfHxDT18je21SF9Kbjh2EFOI6+Mm3/UjcU3thSMMIuinLsTJjFnGoX2a
         y5BsdAsrFuLkvCyALi5QaZekVjQ7IpfoL767qHWR2KNHhw/0SDtMOqqTPuiKhl7JWvVv
         q3pAqK3NAJ9IrHUpwez4GietzhwQv9adFL8l03yj5YRtt3hhf4tiiz/pfi7xrTU8tDIi
         sgKPz7Su2sjnd1xKjQJg2eBD6AhmGf8L5Mp7kvdWx2UUBaxQ9w/Xmitn1FyX6af0cW9p
         6klw==
X-Forwarded-Encrypted: i=1; AJvYcCXifIx4wqtD2gCeB4pQVVp5e+2x2xkfSTEbeZeK0+IARSYnQh8nLC0cle4Li0YrPB2qKAw3SXTMmPanbwjbNF8TfM3o33OI6TsnLlfbDHLatt0=
X-Gm-Message-State: AOJu0YzHSxAxymeEmjlrHyYntchTcHVk/wHLbMHgHgjBSYOWMBqiZq9o
	eeE0faODM6yl6qHuKK31kblmI0XP/F8BOApKJ9/IbD5TxXrDgZpa34AsyJYAf7s=
X-Google-Smtp-Source: AGHT+IHCeW/KiGNKh5pnO8aDXhMpbBef+uHHSz0cnNkmQDkNzqVeAL6zbpqGWin1+BefNMGf1qyY2g==
X-Received: by 2002:a05:6512:3e19:b0:513:2b35:2520 with SMTP id i25-20020a0565123e1900b005132b352520mr3581022lfv.58.1710154999925;
        Mon, 11 Mar 2024 04:03:19 -0700 (PDT)
Received: from localhost (h-46-59-36-113.A463.priv.bahnhof.se. [46.59.36.113])
        by smtp.gmail.com with ESMTPSA id h4-20020a056512350400b005139c3c584bsm989738lfs.241.2024.03.11.04.03.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Mar 2024 04:03:19 -0700 (PDT)
Date: Mon, 11 Mar 2024 12:03:18 +0100
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Sergey Shtylyov <s.shtylyov@omp.ru>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Biju Das <biju.das.jz@bp.renesas.com>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [net-next 2/2] ravb: Add support for an optional MDIO mode
Message-ID: <20240311110318.GN3735877@ragnatech.se>
References: <20240309155334.1310262-1-niklas.soderlund+renesas@ragnatech.se>
 <20240309155334.1310262-3-niklas.soderlund+renesas@ragnatech.se>
 <CAMuHMdVRftTVMmnBX9YH50jau-GJEM+Lmq8tVh2ynrCRsZU46g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdVRftTVMmnBX9YH50jau-GJEM+Lmq8tVh2ynrCRsZU46g@mail.gmail.com>

Hi Geert,

Thanks for your suggestion.

On 2024-03-11 10:32:35 +0100, Geert Uytterhoeven wrote:
> Hi Niklas,
> 
> On Sat, Mar 9, 2024 at 4:55 PM Niklas Söderlund
> <niklas.soderlund+renesas@ragnatech.se> wrote:
> > The driver used the OF node of the device itself when registering the
> > MDIO bus. While this works it creates a problem, it forces any MDIO bus
> > properties to also be set on the devices OF node. This mixes the
> > properties of two distinctly different things and is confusing.
> >
> > This change adds support for an optional mdio node to be defined as a
> > child to the device OF node. The child node can then be used to describe
> > MDIO bus properties that the MDIO core can act on when registering the
> > bus.
> >
> > If no mdio child node is found the driver fallback to the old behavior
> > and register the MDIO bus using the device OF node. This change is
> > backward compatible with old bindings in use.
> >
> > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> 
> Thanks for your patch!
> 
> > --- a/drivers/net/ethernet/renesas/ravb_main.c
> > +++ b/drivers/net/ethernet/renesas/ravb_main.c
> > @@ -2582,8 +2583,20 @@ static int ravb_mdio_init(struct ravb_private *priv)
> >         snprintf(priv->mii_bus->id, MII_BUS_ID_SIZE, "%s-%x",
> >                  pdev->name, pdev->id);
> >
> > -       /* Register MDIO bus */
> > -       error = of_mdiobus_register(priv->mii_bus, dev->of_node);
> > +       /* Register MDIO bus
> > +        *
> > +        * Look for a mdio child node, if it exist use it when registering the
> > +        * MDIO bus. If no node is found fallback to old behavior and use the
> > +        * device OF node. This is used to be able to describe MDIO bus
> > +        * properties that are consumed when registering the MDIO bus.
> > +        */
> > +       mdio_node = of_get_child_by_name(dev->of_node, "mdio");
> > +       if (mdio_node) {
> > +               error = of_mdiobus_register(priv->mii_bus, mdio_node);
> > +               of_node_put(mdio_node);
> > +       } else {
> > +               error = of_mdiobus_register(priv->mii_bus, dev->of_node);
> > +       }
> >         if (error)
> >                 goto out_free_bus;
> >
> 
> Perhaps the code should be streamlined for the modern case?
> 
>         mdio_node = of_get_child_by_name(dev->of_node, "mdio");
>         if (!mdio_node) {
>                 /* backwards compatibility for DT lacking mdio subnode */
>                 mdio_node = of_node_get(dev->of_node);
>         }
> 
>         error = of_mdiobus_register(priv->mii_bus, mdio_node);
>         of_node_put(mdio_node);
> 
> When deemed necessary, you can easily replace the backwards
> compatibility handling by error handling later.

This looks much better, will do so as well as s/OF/DT/ in the commit 
message for next version.

> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> -- 
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds

-- 
Kind Regards,
Niklas Söderlund

