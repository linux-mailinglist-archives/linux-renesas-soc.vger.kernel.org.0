Return-Path: <linux-renesas-soc+bounces-26912-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 678F3D2F6CC
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 16 Jan 2026 11:18:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 50B6C30A2551
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 16 Jan 2026 10:14:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E1ED35EDB8;
	Fri, 16 Jan 2026 10:14:48 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B66B530BB8E
	for <linux-renesas-soc@vger.kernel.org>; Fri, 16 Jan 2026 10:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768558488; cv=none; b=WFG8JIQeBOiZlKJmfpbZrUCCRMwpRCChQ+QMAJJ3J2kuysEfGPkWkCTagaaHcfHWJ86KGVutD658O1n+1J0PKw118C/R1rMobn+YZNmtngBCSr9qd4ujEZQa7Sb9uCVJgF7tIyPHGG5ZwyaIcEhckJQUklpSweX9kLpUGzSiO3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768558488; c=relaxed/simple;
	bh=vFDSKDXTht/uJMvnTP9p1krfHXltHzGUh32WOHuB08M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fQmjJaaY1q1vmD4RpxQ76A2jbOWeobhz7jJlmRecxlPUrjjzSOi3U2+4ns4XsFuhPwRJEghQ8Gg18mxVY4bN2vTeo+Uo5OQG9Uz1lEG/8TY+DkX0MqUTNtXB+EeG9r1pZu3EZgK5wUY3JEBD+6s6drBCcRndk9myYe/+dtUwPDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-45c838069e5so1089649b6e.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 16 Jan 2026 02:14:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768558485; x=1769163285;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qn67cUMU39CUXsSSgwxUh1den8X1/rN7e8d6+1v2Oh4=;
        b=G0jUCbJ6xs5PyLAP0iEuPqv2ZgUeN0yvg2tHSEvb+ineIVy7bVKm9zmApddVot8JNN
         kIgHz1p3AA/5Z7jBV4OWbEFmB80Cwee5KgHvZanwM0U5N96eVyWrdYZicifNTpu34fHU
         odCeyqlVIKQ30hJFQHXBntkUFJLUdhAVaZW3DouyT9YNXXxtMQ+slpOzyEzaN05PBLPD
         6r+ZLFzfDwZ+0ca517wNePXOecZ+ZVv7FTxbhEZakyHpxHiyriEApKbyNnrN0yrh6AMe
         BOE4WEOEE7OfmpEfQ00dgVjXJugW8Bj9VggmIx8IE5PLJIzsnclsL23AE1xHiw/Ttlsi
         JcPQ==
X-Forwarded-Encrypted: i=1; AJvYcCVrfEif0cCBqtE8NWezhCxSsZJ+jEiyz3veRARKlfYwpSIKqBy38NIxH49JnLVbLGJSoAfvyyYORd86uFplHKNC5w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyald1S2O7Ytwgu6bwyhKMKOXLDKBnA1mEoT0k+ePDCxS5vvqle
	088AmWk76KSrfQK6GMODGIdwjXPwCJysS/dS90YHxuCsB96YPI7WrNZnoaR2GoMxoMg=
X-Gm-Gg: AY/fxX7xiwK8qp+xgltGk7Jq0huDvLBGLd3QoN8kJ2lbqIlLTqseykubIw0cONgy3OE
	1eIIFZqiMWW6mxqLxZUhpBUSzpbdYr/qw3u8TXBZ3Nnr33lwZle4GewYTyVBkjQ3dcWxQVYiWLZ
	YKQwExc+LW3iI0cBKN6RF69lnDJ/7Q8yl+aTa5qJ1lygwMr4pMjfyY/xFFmetxswA77uJR1nqWA
	JK8bt/CarKVmSMVeewcgVUKAXsVuhBYhoI7LRk/LEZyWdnrLMqc8Xbehsau0VeKME46RtYzhVUj
	O6mdLcAYFfIyTY/G09VL1RFRJTJ/fqU07cEa5NRDVLVoQsT7kt+A+cmqzCEUw60dfeLVm6B3wUh
	M2KX7XvrpTjNzXDJDiOT/lSCiXjuu3dO+Vd6eUEWSTAhKOaqwsFtPo2zCixc1Ias9ueJQHLeQb0
	xMmYsFERFY8OST7aCylxRDElwA/zKWwaeJqgNmRTtL10TzKm4X
X-Received: by 2002:a05:6808:1796:b0:459:b564:e20e with SMTP id 5614622812f47-45c9c155ce0mr1082650b6e.61.1768558483015;
        Fri, 16 Jan 2026 02:14:43 -0800 (PST)
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com. [209.85.161.48])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-45c9e03e924sm1081832b6e.19.2026.01.16.02.14.42
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Jan 2026 02:14:42 -0800 (PST)
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-661106487f9so1545247eaf.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 16 Jan 2026 02:14:42 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU5QU0IZFmUxrBDKJt5MXl4MTy4B0vVN2wujm/QMfUmwlsiJfDgjcZJNtq4/yDswAYSmCqxn2KUMyYVDxP0kToN4g==@vger.kernel.org
X-Received: by 2002:a05:6102:6d0:b0:5ee:a8c4:18f2 with SMTP id
 ada2fe7eead31-5f1a552a486mr757624137.26.1768558035521; Fri, 16 Jan 2026
 02:07:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260115-schneider-6-19-rc1-qspi-v2-0-7e6a06e1e17b@bootlin.com>
 <20260115-schneider-6-19-rc1-qspi-v2-13-7e6a06e1e17b@bootlin.com>
 <CAMuHMdUHwqBrNMQTO-g7yUA_owWXxT6bPi34Oxjt-J7N0Q2CXQ@mail.gmail.com> <87ldhxubt5.fsf@bootlin.com>
In-Reply-To: <87ldhxubt5.fsf@bootlin.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 16 Jan 2026 11:07:03 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUqWUriQHR8UY631HZfVNsejgXE64jrChi=k2=5E6Hi-Q@mail.gmail.com>
X-Gm-Features: AZwV_QiKDKKs-kGw2MFPAKLM-ZDRg69LJFyTkD_IY3NAlTAe2l416xADsDXNbp0
Message-ID: <CAMuHMdUqWUriQHR8UY631HZfVNsejgXE64jrChi=k2=5E6Hi-Q@mail.gmail.com>
Subject: Re: [PATCH v2 13/13] ARM: dts: r9a06g032: Describe the QSPI controller
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Vaishnav Achath <vaishnav.a@ti.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	=?UTF-8?Q?Herv=C3=A9_Codina?= <herve.codina@bootlin.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Santhosh Kumar K <s-k6@ti.com>, Pratyush Yadav <pratyush@kernel.org>, 
	Pascal Eberhard <pascal.eberhard@se.com>, linux-spi@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Miquel,

On Fri, 16 Jan 2026 at 10:49, Miquel Raynal <miquel.raynal@bootlin.com> wrote:
> >> +               qspi0: spi@40005000 {
> >> +                       compatible = "renesas,r9a06g032-qspi", "renesas,rzn1-qspi", "cdns,qspi-nor";
> >> +                       reg = <0x40005000 0x1000>, <0x10000000 0x10000000>;
> >> +                       interrupts = <GIC_SPI 64 IRQ_TYPE_LEVEL_HIGH>;
> >> +                       clocks = <&sysctrl R9A06G032_CLK_QSPI0>, <&sysctrl R9A06G032_HCLK_QSPI0>,
> >> +                                <&sysctrl R9A06G032_HCLK_QSPI0>;
> >> +                       clock-names = "ref", "ahb", "apb";
> >> +                       #address-cells = <1>;
> >> +                       #size-cells = <0>;
> >> +                       cdns,fifo-width = <4>;
> >
> > <4> is the default, right?
>
> It is the default in the bindings indeed, however the driver does not
> imply that default and errors out if the property is missing. The
> property is also marked required in the bindings, which is kind of
> incorrect I guess. Also, all DTS explicitly set this value to 4.

OK.

>
> However looking into the RM I found "Transmit and receive FIFOs are 16
> bytes". I haven't tested that, I will.

Oh, that bullet is not present in the docs on the CD I looked at.
It is indeed documented in newer versions.

There's also cdns,fifo-depth, which thus should be 4?

>
> >> +                       cdns,trigger-address = <0>;
> >
> > Where in the RZ/N1 docs can I find if these two properties are
> > correct?
>
> This property is mandatory. Maybe I could just discard it for my
> compatible, because it is only relevant for indirect modes, which are
> unsupported.

OK.

> >> +                       status = "disabled";
> >> +               };
> >> +
> >>                 rtc0: rtc@40006000 {
> >>                         compatible = "renesas,r9a06g032-rtc", "renesas,rzn1-rtc";
> >>                         reg = <0x40006000 0x1000>;
> >
> > The rest LGTM, ignoring my comments on the bindings:
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> Thanks for the review, but I guess if I end up changing the DTS snippet
> I might drop it. Or would you like me to keep it anyway?

Please keep it as long as you don't change the (SoC integration)
things I typically focus on (address, interrupts, clocks), and don't make
too wild changes ;-)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

