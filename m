Return-Path: <linux-renesas-soc+bounces-26006-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F630CD661F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Dec 2025 15:35:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CCE1E304BD93
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Dec 2025 14:35:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93B142ECE9B;
	Mon, 22 Dec 2025 14:35:13 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10B7229B789
	for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Dec 2025 14:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766414113; cv=none; b=jlkwZTv+28+cwPL9+Ir3kIbNcKI6sVWa+kEYh1O4Kb+ilsk6rXUbMabJ4iKSEuldYKZeIhp0daD9D4v6ihZVqVh0c9AxSln6YyLtdxLc7PSTiHPoiVT1qWairKl9vXRaG8XRE26fs3KdLj3MchvQ93nhFQpuIymSgYvoiCdrkhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766414113; c=relaxed/simple;
	bh=tA0sTALuO56vvABuHYMRS7BncP3lkmrEmL6Nk8GJCa0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kq83hGrDcCGdiFc4zGM6/48l0vpNAcvPJ8Z6RDmah/FDZTGPD0oQsJefh/b5C+dyXtH9sBIbPeE8ZmFU4odRCFsS2/B8To0rVpPnosmUAlqwv97/wgM8Czf1sLiGcOwHYLa8CuPbIH+R6UfJX9XXJKA9ebKD+3vOUFgC/yQOuPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-55b104727c8so1111036e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Dec 2025 06:35:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766414111; x=1767018911;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H9D4XeQv03MY1UFCjCbOzOZrrwsw53mZKzI1psvzYSw=;
        b=SBcXg6gP+4F/0aHWZ1V/qowLyFsoPiOqf8b6GoH05ZlSCdpwhtyNvxeDvshoUDAV0o
         YlbT4J1+50qWfJpMVCnI3fOAhdcwe8olu5pp4/oB99CfbsyNlu/BJrgsUUasmj4AKUYf
         MnN2qYHqUM2Wqy+mkK0vfcFcexPN8vxQOy4RT88sPM3Awawv1BNSQdd4BJXdSZxNUjw+
         4oeRLtxzrBSjjYGuFZMZIS7Oy3qCQxDmwuX18bg/OGTkAnfk0cmn/N4Pv/4vf93YXuQe
         Xl09B2Kketxoohvq3NA01bfdAhVAHFobxXHfNoDM5mn0knBYV4RLxsQA5KCSfCuiEgsk
         3cyw==
X-Forwarded-Encrypted: i=1; AJvYcCVCuoe830LhuLJ8QGRn4NmNiGxMPivMENdI6U7CEqAYa2TEpNDPacjj4LjpxL9K1hHMgVTWxsZ395hSEcxzlc7+KA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyVIJC2/UGHALBvKxCThmbZQ7s0rewG+GOa1/HRglpqSJPl2VRq
	YNWYuxZZgB9r9WWOpsdx2BdDk+d7psQXiTz9lhT3NNCkk39bVZG6o8tZ4qkohEGV
X-Gm-Gg: AY/fxX4N4/fssIoO4kxaHLVl4eAuzd8Ue1tMGXfDrfLIwqwEjhX6PvoSnPLHaH7nMEo
	GSa6AqfTmCskTIOAhC8I2jtrw1IicEVef2I49i0uOrEJvoHjnaRcJeL11PfeqC7r56bgOvZTeyV
	7inp22mnZLdP0hLeTe1nA5O8xruTMq8Gx60CwrtCeA+qgxAXtokWj39fP8BjioJhmZBobL1Mw1X
	UK2fRuxH4tzTZz6bzsiHE4+XpSJHhYodDpuADW8I0Rg0eZuQIPTa16EkSFaoJYbymyAzQM28R2N
	hhu2giG7vRROsWNlIpTIskxBIccHyiI5HPBupZabNPiVVcpe7yRtzeDBtJx6rRH5zn5jIme0uCA
	h8Mmbwix4E56jyOJssMktunP7wx35WGwr7ZaVKxeslwYLYad4dq/dQpKdS97D3aVH7U3fXRRpqr
	8rKoN4q6XW88QYAs1YYlqQlNGICjOSy9KDApjhgUF6MUliRrm7
X-Google-Smtp-Source: AGHT+IHJKbbOeJ4Ml4G5xOk2DHaSX51/f5CLioN8HM3zSYmQpIuBh/W52NW9G9k2GTIsEZ6I5bVXnQ==
X-Received: by 2002:a05:6122:2a52:b0:55f:c41f:e841 with SMTP id 71dfb90a1353d-5615bed1815mr3341598e0c.19.1766414110918;
        Mon, 22 Dec 2025 06:35:10 -0800 (PST)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com. [209.85.217.49])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5615d04ba51sm3485337e0c.3.2025.12.22.06.35.10
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Dec 2025 06:35:10 -0800 (PST)
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-5e19e72c2a7so1160261137.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Dec 2025 06:35:10 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUtFhaHdG5hnpRVIg8QeqN4WjKIxA8irh60KsASe8FDVberK1UiNJHACBvr2hToY73Tdj7mJuQ2zPsRc0kVpJBbIQ==@vger.kernel.org
X-Received: by 2002:a05:6102:3053:b0:5db:ebb4:fdcf with SMTP id
 ada2fe7eead31-5eb1a697bdamr3032517137.17.1766414109800; Mon, 22 Dec 2025
 06:35:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251129185203.380002-1-biju.das.jz@bp.renesas.com>
 <20251129185203.380002-5-biju.das.jz@bp.renesas.com> <TY3PR01MB11346098C68AF3DC9147F0E5C86DDA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB11346098C68AF3DC9147F0E5C86DDA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 22 Dec 2025 15:34:58 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXkn=i9Vr0d94X6bnVQguNJC7FCD-NyVQ8erngY8mEaOA@mail.gmail.com>
X-Gm-Features: AQt7F2p4TVtjKEmQpE77u-WEYcG5SiMF-x1Uk6OyGFJ8hMSi7xvBk_43SfOFyhU
Message-ID: <CAMuHMdXkn=i9Vr0d94X6bnVQguNJC7FCD-NyVQ8erngY8mEaOA@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] arm64: dts: renesas: r9a09g047e57-smarc: Add
 support for WIFI + BT test
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: "biju.das.au" <biju.das.au@gmail.com>, "magnus.damm" <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

On Sat, 29 Nov 2025 at 19:53, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > From: Biju Das <biju.das.jz@bp.renesas.com>
> >
> > Add support for WIFI + BT test M.2 board [1] [1] https://www.embeddedartists.com/wp-
> > content/uploads/2021/05/2AE_2BC_M2_Datasheet.pdf
> >
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

> > --- a/arch/arm64/configs/defconfig
> > +++ b/arch/arm64/configs/defconfig
> > @@ -1910,3 +1910,29 @@ CONFIG_CORESIGHT_STM=m  CONFIG_CORESIGHT_CPU_DEBUG=m  CONFIG_CORESIGHT_CTI=m
> > CONFIG_MEMTEST=y
> > +CONFIG_BRCMUTIL=m
> > +CONFIG_BRCMFMAC_PROTO_BCDC=y
> > +CONFIG_BRCMFMAC_SDIO=y
> > +CONFIG_SERIAL_DEV_CTRL_TTYPORT=y
> > +CONFIG_BT_BREDR=y
> > +CONFIG_BT_RFCOMM=y
> > +CONFIG_BT_RFCOMM_TTY=y
> > +CONFIG_BT_BNEP=y
> > +CONFIG_BT_BNEP_MC_FILTER=y
> > +CONFIG_BT_BNEP_PROTO_FILTER=y
> > +CONFIG_BT_HS=y
> > +CONFIG_BT_HCIUART_NOKIA=m
> > +CONFIG_BT_HCIUART_BCSP=y
> > +CONFIG_BT_HCIUART_ATH3K=y
> > +CONFIG_BT_HCIUART_3WIRE=y
> > +CONFIG_BT_HCIUART_INTEL=y
> > +CONFIG_SND_SOC_MTK_BTCVSD=y
> > +CONFIG_SND_SOC_BT_SCO=y
> > +CONFIG_CRYPTO_RSA=y
> > +CONFIG_CRYPTO_HASH_INFO=y
> > +CONFIG_ASYMMETRIC_KEY_TYPE=y
> > +CONFIG_ASYMMETRIC_PUBLIC_KEY_SUBTYPE=y
> > +CONFIG_X509_CERTIFICATE_PARSER=y
> > +CONFIG_PKCS7_MESSAGE_PARSER=y
> > +CONFIG_SYSTEM_TRUSTED_KEYRING=y
> > +CONFIG_SYSTEM_TRUSTED_KEYS=y
>
> Please don't apply this patch. Added here for testing purpose.

Doh, I had already started reviewing it :-(

CONFIG_BT_RFCOMM, CONFIG_BT_BNEP, and CONFIG_SND_SOC_MTK_BTCVSD can
be modular.
CONFIG_BT_HS was removed in v6.9?
CONFIG_SYSTEM_TRUSTED_KEYS is supposed to be a filename?

And please use "make savedefconfig" ;-)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

