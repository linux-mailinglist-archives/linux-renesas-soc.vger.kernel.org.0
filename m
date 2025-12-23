Return-Path: <linux-renesas-soc+bounces-26085-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A26A0CD9E4B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Dec 2025 17:04:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 30EE03036C91
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Dec 2025 16:04:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DAC524E4A8;
	Tue, 23 Dec 2025 16:04:25 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD4102517AC
	for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Dec 2025 16:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766505865; cv=none; b=oUsyfg+oLUr2qWubXWWmpyAFwQC9LpoQazsqqhNEsdozmriViGP2Dk1W3bMo0zwW5BTHOjIIpqT8qjp9ArNZqdUXVw/N1W/QxoyPNW2KGvwtaCH0JzAXbRc1l1pQ3jGNaGQXt2J4f0eKva2xqEZV5H9aNHrNheC6wnnWkRJwsxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766505865; c=relaxed/simple;
	bh=tW8m0sz+TxMy7bagqa/CKCdA8ogTvNRf1HesjjfNDns=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YtboNKgO1CWSofhWVnCIpNGCk+iWDcQpcot6q8NgrwxA2DfTFfrUY+ZWoZd++bFy2szYuKmoYnMQHIvWA9nb2VEfXQ53Z88pHebBFon3MbmkvbAUqD3nG1itC91wx9HKqp25Jjeci4qT552m+DKDTfF/L98D2R09IoYXUhEZzh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-55b22d3b2a6so3189072e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Dec 2025 08:04:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766505862; x=1767110662;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZUmrcjPrsJVbh8LyphvK5uHaAZlXwQPpsimX8t4O9kE=;
        b=CJODHTOG5DJjm1grdkRkGWZzEC+h/7CiuRO9yLWmMGnrqdGvFaThZggUn6V6cFk3BO
         UBUtjoDtor3sdS1GcNxmivrs7SlOR41hAUdYrJOpACBBSRSpetVe63ft5t4TqtZT1bRQ
         70IG9b6JPgPOUvDKvKU6Ovg6oLI8b9FCnuDmAACGnVpHhtnPz9DI3HALAWS31beTduEA
         CPOeHkKW6dJvGYMyoPwRcgdYofm9mlh6VjOveDE6LhW7+8yCFiZcnYxbDYXzER434k5S
         CxYJXOIfY88F7i0OC9VeBRzmGqi6GugLEmJElk+eWANHkeEvENDvqaGctQ2QbqrYH/T5
         HRGA==
X-Forwarded-Encrypted: i=1; AJvYcCWtYqbLJzgdyvVJdsQesBncIiLpVlgKR5gpOjOTnDkfYRI+1yr9tK0Z5cztQ0YRsXvpXmK1OcRZ/IyPoJt9jVr3+Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzVGPARYqIl72nMfqrqeLit0E8BGyALJ3aER7Fhqqlsf9JzQYI4
	IGdJAEhS7n9WBfPGg9CW0SWHIL6BbN6Q8rI7/JwzVuyJHMHWLHnplPlugo2D5R7Qh7U=
X-Gm-Gg: AY/fxX7yCDY/wLmEWh6WpGiizKIzIEAMftc8cJGYUQDaR1lgKEewzo/YEACZFmkEzfn
	xTJhkCbdYSEXGhLC2jRmEghykSQvxzXKc63BIIcJNqhnmm9Frc7owvqagFi8Er8iD70fAJW39UN
	Lneg+wMnNco2nJMskFZlzVvZELFRiKyLu+Ok+vTn6SkB0TkdsxVT07mu5nJ4i3ZIc1XUxOtJILe
	PX0mmAH4iOGKBEi8ww2wsDRqHtJEcYXvjaYHRtLLJNje6MWSMx+CMGOQ/TcOEueg1Y8oMtD77Pf
	BSf5ntXk0KxJaB6fjauVoZX4m8qa+XpownOT/jUx2xD1jvcSQyBhxaVEDDSZ9SwfxKwlkG9ZOjg
	p4T4Cs8SRvPKBpmUar0WjMOw3p6uuoWy1xHGVSbiDcojBUaXvWEpLPZTmOpokII3XBKBHQW30Tq
	RQ9WdLGDI59fk19F+AWogHkMLsIqdpyT8rELMmJPKB2RkKyrLY
X-Google-Smtp-Source: AGHT+IEIXjsb3muOmEgIXhsuTRNgjHPummhgZBJ/uSt57L833UY2v4TlVEZqj99tJG4LysrZLoBlow==
X-Received: by 2002:a05:6122:3197:b0:557:c734:ee5 with SMTP id 71dfb90a1353d-5615b8a7c5cmr4994774e0c.8.1766505862186;
        Tue, 23 Dec 2025 08:04:22 -0800 (PST)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com. [209.85.222.43])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5615cf27fe6sm4889098e0c.0.2025.12.23.08.04.20
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Dec 2025 08:04:21 -0800 (PST)
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-93f523bba52so3004907241.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Dec 2025 08:04:20 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW5vbSs5F7hQPbJjzaEd917GdY6hgRrTr2hLo2eLJb/diO2HB7aNKSXXBf4rsufx7+/skemv31fhD0xEJXIOoaR9w==@vger.kernel.org
X-Received: by 2002:a05:6122:1d91:b0:559:6b7f:b0f4 with SMTP id
 71dfb90a1353d-5615b851ddemr5491694e0c.5.1766505860287; Tue, 23 Dec 2025
 08:04:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251201134229.600817-1-cosmin-gabriel.tanislav.xa@renesas.com>
 <20251201134229.600817-13-cosmin-gabriel.tanislav.xa@renesas.com>
 <CAMuHMdWUPM=q7J_S_x7=CZoYxKm-v=7GGGkq9Nv0T14b8MBtpA@mail.gmail.com> <TYYPR01MB139556681F53AC66A668F7E4D85B5A@TYYPR01MB13955.jpnprd01.prod.outlook.com>
In-Reply-To: <TYYPR01MB139556681F53AC66A668F7E4D85B5A@TYYPR01MB13955.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 23 Dec 2025 17:04:09 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUeoC7OefbLd+0WihUtvV7zMtFREeor+V3efUitzcgiZw@mail.gmail.com>
X-Gm-Features: AQt7F2r8FcJNMBmChD_xiGNEJI2gOR_iQl7z1azyYjzKxdOKv8tEtQ1DkplXGqY
Message-ID: <CAMuHMdUeoC7OefbLd+0WihUtvV7zMtFREeor+V3efUitzcgiZw@mail.gmail.com>
Subject: Re: [PATCH 12/13] arm64: dts: renesas: r9a09g077: wire up DMA support
 for SPI
To: Cosmin-Gabriel Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: Fabrizio Castro <fabrizio.castro.jz@renesas.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, "magnus.damm" <magnus.damm@gmail.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, 
	"linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Cosmin,

On Tue, 23 Dec 2025 at 15:42, Cosmin-Gabriel Tanislav
<cosmin-gabriel.tanislav.xa@renesas.com> wrote:
> > From: Geert Uytterhoeven <geert@linux-m68k.org>
> > On Mon, 1 Dec 2025 at 14:44, Cosmin Tanislav
> > <cosmin-gabriel.tanislav.xa@renesas.com> wrote:
> > > RZ/T2H (R9A09G077) has three DMA controllers that can be used by
> > > peripherals like SPI to offload data transfers from the CPU.
> > >
> > > Wire up the DMA channels for the SPI peripherals.
> > >
> > > Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
> >
> > Thanks for your patch!
> >
> > > --- a/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
> > > +++ b/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
> > > @@ -200,6 +200,8 @@ rspi0: spi@80007000 {
> > >                         clocks = <&cpg CPG_CORE R9A09G077_CLK_PCLKM>,
> > >                                  <&cpg CPG_MOD 104>;
> > >                         clock-names = "pclk", "pclkspi";
> > > +                       dmas = <&dmac0 0x267a>, <&dmac0 0x267b>;
> > > +                       dma-names = "rx", "tx";
> >
> > RZ/T2H does not seem to have restrictions about which DMA controllers
> > can be used by which SPI instance.  Hence shouldn't these point to
> > all three DMA controllers?
>
> It does seem like there's no restriction about which DMA controller to
> use.
>
> >     dmas = <&dmac0 0x267a>, <&dmac0 0x267b>,
> >            <&dmac1 0x267a>, <&dmac1 0x267b>,
> >            <&dmac2 0x267a>, <&dmac2 0x267b>;
> >     dma-names = "rx", "tx", "rx", "tx", "rx", "tx";
> >
>
> I was not aware that the DMA core supports this. I will add the other DMA
> controllers to the list.
>
> > Note that this requires updating the DT bindings, as they currently
> > restrict dma to two entries.
>
> dma-names:
>   items:
>     enum:
>       - rx
>       - tx
>
> This should work fine, right?

Yes, dma-names is OK.  But currently dmas has "maxItems: 2".

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

