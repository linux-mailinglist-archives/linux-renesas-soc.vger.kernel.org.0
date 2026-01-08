Return-Path: <linux-renesas-soc+bounces-26428-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 6209AD04033
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 08 Jan 2026 16:48:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 055F730FF394
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  8 Jan 2026 15:28:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30B7E4B2A3D;
	Thu,  8 Jan 2026 13:44:30 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 745A64A8F6D
	for <linux-renesas-soc@vger.kernel.org>; Thu,  8 Jan 2026 13:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767879869; cv=none; b=NdTflpjXmKQQ+A2vPOx48wi51K1fwurSusyQPjDobpxgBeIp8jjbZdIEfSfOslxgMjm1Kb+tNunOk+T0cgb/sqUqTLSWM85vS09H3onZBfFTuZIpsyRgU0V2KhLnJJNIf7iCPnkcmoeBCldkR7BwKRlB4PY/UR2qyK4JxDh6DP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767879869; c=relaxed/simple;
	bh=I51tV3b8usB+tvcn2R45/6DZ2BX3FnDNDxrB4OhgMWM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UvbH8wLUQ+lTlemISY+6mDZ8ujGq7sgK/DHd33QHC41mOtQELFwbrQgy3aLSNMWBa4klLOi5q+3OmCSWmCGwhzuMQ3GF7gLo2WKlCc7sVy4W2cklBCas/ZmyzKAxmNFa9EVu/zjHAa1n17/34Gxo/skB+UGLCqm2GNLSyBuS2Os=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-55b24eedd37so2370076e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 08 Jan 2026 05:44:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767879863; x=1768484663;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GSpZZZQ/XSFXYi9X6nl9Vzin2Kd7NuEMTA33b+P0F5w=;
        b=qwM+m3v53PCpLXK7g+XiU/i2qV7+WKnVG34MEHlsumVrhDf6LNSVuR4WrvQRSTjh1T
         5HWeZvKyQds8hY9EMGTcHIjcyyp67OoWZSwlxYJvF+hd0Izf9ua3r/XZP5bQXJa+mSWv
         iSCdCnDNPBUxPT7d2QGr6Lgr8nULWu7rr+HomyLAiHGjE2NglZsrRzXmptZarwYzKPnZ
         MXDBlFEnHvkO6Z6EATtUldwCZ7oG3OuUVTnJmZQs6p+d+4AL8pktR4Fm1d0dPskB3j9M
         oOEutMDnCI2StJxuSaEE3HjELaC1y0uSEhSk/7w66MNArpUSKbUSnn+uQkhcCxhpHqty
         qohw==
X-Forwarded-Encrypted: i=1; AJvYcCU/8XzdcgAkUKixGZ8g6tgLipu2AuGgckpO26Q3OpnjJsqdr0Jcf5IvGPYBaMIvMpBD1114bkGA/xDgsCLKdw67xA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwVoi0WexCaSgdQdpRNGR9gSiArv084Bl8OC5YL9YfP5//+owyt
	7T2fQX2M2mqfceiI4FjzbYjmpp/WWTI+XjfTaLE0kZ2Yo5GpcGFn7D85Mo0IJMr8
X-Gm-Gg: AY/fxX7xTLfB7yJuyl4/ms4rixaGA+V/eJdlIRLZDp5NjXsjLdUDHN65HzXOBwivXbC
	fT7I68yAhlcanz0wQyZnDfAZ/PYDkkeler+fiLt202AIsF9HVzQuFHY+XIqgrW8c2ifjiJWb9lG
	xLLZK5x1aLSuykZvLwy6+c5NJE5BSJ9o4CklARz4xaMLSuOn6YZkYq7KmtxYZMjsooTfSWMFZLb
	oroVlyFMAD4zNX+LcHT/MIJm0zlvpfzVKrzZXNZC+i+qvgUhKXlPReqjCZPCT7kBs1rb15sS02b
	i4+sMsJUvemrr9gT0WpEYGNk//yu0Br9O5yG9mtKRxqNB64lmAJ9/WH5TRhQ78PU4JPRVcR3MxO
	i9cIvMxC4ykOr+LrBS6UI897QapKM+HIJusTFTKapLsfCPU5UDEHbjp4HSL1mx+HmsPh2mBmuOJ
	12n61lI5aTp6gyppVLEHRBHX70AnvQvA5t2Tmwe90ekledh8Zbrai8
X-Google-Smtp-Source: AGHT+IFkLC5xIyArDzoUos6kZXAymGtWY2Txawo40GDC2AVoD+t5AYOg8VqUD0RJcpLK811hU5mFsg==
X-Received: by 2002:a05:6122:8292:b0:560:2442:74bb with SMTP id 71dfb90a1353d-563480023ddmr2293263e0c.19.1767879861755;
        Thu, 08 Jan 2026 05:44:21 -0800 (PST)
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com. [209.85.221.175])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5633a074d30sm6191720e0c.0.2026.01.08.05.44.20
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jan 2026 05:44:21 -0800 (PST)
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-55b24eedd37so2370036e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 08 Jan 2026 05:44:20 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXcamKjcmCkVKfVacEOTlGZT0UREqQkJhd+2gsg8RwZocEy9SfgfdkfngLqMUEBs69Du/BiyebQzt57fd70gr0RVg==@vger.kernel.org
X-Received: by 2002:a05:6122:616e:b0:55b:305b:4e35 with SMTP id
 71dfb90a1353d-56348014f57mr1928870e0c.21.1767879860484; Thu, 08 Jan 2026
 05:44:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251215163230.227849-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20251215163230.227849-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdVeB0xYbnHx-RYf3F4aw4TQOzC39A_MWc8PoROo8-p1mA@mail.gmail.com> <CA+V-a8vqVm9-kO_hMhN5WcsEXamUU8=hafGFzmsbKXFwv0UL_g@mail.gmail.com>
In-Reply-To: <CA+V-a8vqVm9-kO_hMhN5WcsEXamUU8=hafGFzmsbKXFwv0UL_g@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 8 Jan 2026 14:44:09 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXuMm9_ornGBtvN+1hpH7=Nsowsx=mOi3s7siADhze5GQ@mail.gmail.com>
X-Gm-Features: AQt7F2qkeR2zPzHqAg24UJEFLvC8CjbFw0bqtz6nnjBX8HFdHYx_1i-WTWSt0HE
Message-ID: <CAMuHMdXuMm9_ornGBtvN+1hpH7=Nsowsx=mOi3s7siADhze5GQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: renesas: r9a09g056: Add DMA support for
 RSPI channels
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Prabhakar,

On Thu, 8 Jan 2026 at 14:26, Lad, Prabhakar <prabhakar.csengg@gmail.com> wr=
ote:
> On Thu, Jan 8, 2026 at 1:18=E2=80=AFPM Geert Uytterhoeven <geert@linux-m6=
8k.org> wrote:
> > On Mon, 15 Dec 2025 at 17:34, Prabhakar <prabhakar.csengg@gmail.com> wr=
ote:
> > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > >
> > > Enable DMA support for RSPI channels.
> > >
> > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com=
>
> >
> > Thanks for your patch!
> >
> > > --- a/arch/arm64/boot/dts/renesas/r9a09g056.dtsi
> > > +++ b/arch/arm64/boot/dts/renesas/r9a09g056.dtsi
> > > @@ -679,6 +679,8 @@ rspi0: spi@12800000 {
> > >                         clock-names =3D "pclk", "pclk_sfr", "tclk";
> > >                         resets =3D <&cpg 0x7b>, <&cpg 0x7c>;
> > >                         reset-names =3D "presetn", "tresetn";
> > > +                       dmas =3D <&dmac0 0x448c>, <&dmac0 0x448d>;
> > > +                       dma-names =3D "rx", "tx";
> >
> > RZ/V2N does not seem to have restrictions about which DMA controllers
> > can be used by which SPI instance.  Hence shouldn't these point to
> > all five DMA controllers?
> >
> >     dmas =3D <&dmac0 0x448c>, <&dmac0 0x448d>,
> >            <&dmac1 0x448c>, <&dmac1 0x448d>,
> >            <&dmac2 0x448c>, <&dmac2 0x448d>,
> >            <&dmac3 0x448c>, <&dmac3 0x448d>,
> >            <&dmac4 0x448c>, <&dmac4 0x448d>;
> >     dma-names =3D "rx", "tx", "rx", "tx", "rx", "tx",
> >                 "rx", "tx", "rx", "tx";
> >
> So the driver would choose the DMA channel based on the available one?
> For example if all the 16 channels are consumed for dmac0 the driver
> would switch to the next available one dmacX? and this would be the
> job of a consumer driver? Or do we want to let the board user
> choose/override in board DTS based on the available DMAC channels?

When there are multiple dmas entries with the same dma, the DMA
subsystem picks a (random?) available channel.  This is clearly
visible on e.g. Salvator-XS, where the mapping from I2C channels
to DMA controllers changes on almost every boot
(see /sys/kernel/debug/dmaengine/summary).

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

