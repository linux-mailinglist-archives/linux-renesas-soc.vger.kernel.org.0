Return-Path: <linux-renesas-soc+bounces-22461-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 46E24BA95F9
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Sep 2025 15:41:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C58567A5645
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Sep 2025 13:39:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D5223009EC;
	Mon, 29 Sep 2025 13:40:57 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 093E72C1594
	for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Sep 2025 13:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759153257; cv=none; b=s1KRfi6fkAGsldWqWw2sDZodrP8kezmzfvnMQ2/nYVTLfoOSs0lOQYACvRPGKx+kE5hKt+YEBGzpg//hcYaukm7ferXzp6q5ufzVrqczCzow8l6bE1cSeC4ZYcqiHvZ512waAHhPQHzTzPlSUADGUDsziOHgyZQijgImXSx1cnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759153257; c=relaxed/simple;
	bh=Tp/+PM9+Sy05Cjhgu9npI9TL9LauZ+N9nnhGZhAvrvk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gE0fLz5Rm+oF7i78i9WLH4VlcFHHjsdkODwdFqtqNzL2PtbgPmKRQ0vAVlpfxdKfwnWZ2+G9PMSHl1oMre2Vyy5YY3xIRa2DWxH6JcytOLKAwl+raBJAmWEyHS4/qINWXYqecngRVqtCuOVNPlIDhJDtJfIHbXcX5JQzq4avR/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-55784771e9dso2398210137.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Sep 2025 06:40:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759153255; x=1759758055;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qm08KR5H4STadXUKbamNIFJgAtOHPpWf/WM5mQqKzbo=;
        b=C0KXUin1XFcbUkbUmox0XQnSTlF/XLkowrixyaXR4AVZs4HFCqSTF4mnhv0fsoEO6f
         x9wAPKAHscTN2kgndsTZAG7EQX97nFubmD2YyEFhypBieVaIGiWP7BMvZTSjNueb7xAh
         jZenbh2oBGqgcQtGHZO2wpnaBgSccmA7ablNTUmw6mXAGPIq/zWRmjQn0anGgpOp4Q61
         ce8H+eXCfJavQcFjxtKtQ8zCHiJd5AcD8NdLdbb0wxLHgl+eZSnCHSdKk9hdFSukl1Xm
         WLMQJTOs/bAqqReH2CfgFU3WvPZLbj3jxEIWZAEsNVMC9Sa49KZz3rQRGDuGYZ7knndT
         W4mg==
X-Gm-Message-State: AOJu0YzlZ8n1RssKJVPHO5sGAcr4F4oZ+wuJ7nYkpoBHKr2US6n9UvCC
	TWL9A1cws0+rFigNn788PWa67MHBOFfv7p/l322ASKG8avnXOhkr1vPxeyJSP4Fi
X-Gm-Gg: ASbGncvU4DqGJs/BTXH+YWSoADfbfP6H/dhQHcJXQYW3/62fHXN9GYFCn0hVWeGUthh
	94XAVG9q3v4U3AUfLIa3xoxMBpp4+xGh1uLrhjqReWQxwHJpT1VJDdMctE6D4Oa0s23Si6HdAKG
	HporNf5sz//363bmV70QIeOPmNMeO7akUHtdkO13iAW7NW4UBb21zbDV54FaF//qNDOnIfZFmSl
	O7tmQGWwRdQXKtuJGHy2EMtEdF4YGKceA9zDQnWwVgIsZg0qRVp3w2oSeqKiExphC1ij1pGhQ7B
	UcHGOHgpRp1PbFj5orKnaJ6t/6dAmM0ZfEmM0grTDzUiO/mYkpo9bGmfb/9LI9d+/CSTNRFH0vM
	pGHqSmlps8K9nrR5DV79/j55+eu1bJQcOsdrHKOrcSCs4+yvE1A/f4qgi4p11NO51
X-Google-Smtp-Source: AGHT+IHgjv+ksGAK8eRFC5a9bBsOm7ZhiOC9xbIiOUBv1A764nH6jYqu7zJonGvI2d8pNlNhOem9bg==
X-Received: by 2002:a05:6102:f11:b0:569:93c9:b572 with SMTP id ada2fe7eead31-5acc83f70f0mr5649130137.9.1759153254602;
        Mon, 29 Sep 2025 06:40:54 -0700 (PDT)
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com. [209.85.221.177])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-54beddbc629sm2223584e0c.24.2025.09.29.06.40.54
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Sep 2025 06:40:54 -0700 (PDT)
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-54bbaca0ee5so581586e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Sep 2025 06:40:54 -0700 (PDT)
X-Received: by 2002:a05:6122:512:b0:539:1dbf:3148 with SMTP id
 71dfb90a1353d-54bea190110mr5792338e0c.2.1759153254117; Mon, 29 Sep 2025
 06:40:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250929093616.17679-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20250929093616.17679-2-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 29 Sep 2025 15:40:43 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWrMB5ZdRgX0BwLJeOgJPecxm_kw2J=RcFegdZgtHwtYA@mail.gmail.com>
X-Gm-Features: AS18NWBeAgZ5zJOTSMBe1yfaG4XRAU4Ts8CPoXs-R5ZbYP7bbF2osO6h6YMQhPw
Message-ID: <CAMuHMdWrMB5ZdRgX0BwLJeOgJPecxm_kw2J=RcFegdZgtHwtYA@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: renesas: gose: remove superfluous port property
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org, 
	=?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset="UTF-8"

Hi Wolfram,

CC Niklas

On Mon, 29 Sept 2025 at 11:36, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> 'bus-width' is defined for the corresponding vin input port already. No
> need to declare it in the output port again. Fixes:
>
> arch/arm/boot/dts/renesas/r8a7793-gose.dtb: composite-in@20 (adi,adv7180cp): ports:port@3:endpoint: Unevaluated properties are not allowed ('bus-width' was unexpected)
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thanks for your patch!

> --- a/arch/arm/boot/dts/renesas/r8a7793-gose.dts
> +++ b/arch/arm/boot/dts/renesas/r8a7793-gose.dts
> @@ -373,7 +373,6 @@ adv7180_in: endpoint {
>                                 port@3 {
>                                         reg = <3>;
>                                         adv7180_out: endpoint {
> -                                               bus-width = <8>;
>                                                 remote-endpoint = <&vin1ep>;
>                                         };
>                                 };

I think r8a7791-koelsch.dts has the same issue, but currently it is
not flagged by dtbs_check because adi,adv7180 uses slightly different
and less modern DT bindings than adi,adv7180cp.
However, according to the schematics both Koelsch and Gose use
ADV7180WBCP32Z, so r8a7791-koelsch.dts should use adi,adv7180cp, too?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

