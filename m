Return-Path: <linux-renesas-soc+bounces-18316-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AFFB2AD94EA
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Jun 2025 20:59:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1F42A3A3905
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Jun 2025 18:58:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C38223498E;
	Fri, 13 Jun 2025 18:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BdQUdt/v"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F20B231837;
	Fri, 13 Jun 2025 18:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749841152; cv=none; b=Uk1olx3W5IiiRa1lGTwq8TQWhuCih5X6Q4TFXh8/8/w8T0i8J9N50HthCPknFKvdqR3H9WkntlkesBy9J1kFyP3VDMuG9h3/MhW1f4JDa+9l9yYgvqDyxd/y2Cts+rn5W7wPqxJg8pkjfnEtR5pGFm8dvreiByhAhNSXzKfCgRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749841152; c=relaxed/simple;
	bh=bfi/XXY37D6EzOO2Od8sT5Dtm/chbynwgKX5STjjpn0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Mhg2F3HKXCeRHPTZucaXa430VrmYR6HrDRyERZBo8yeIufBm4X6s1c5DVBPNUh2B9PcudF8EGAuq3NZoec22SyP29capgrxrUwouMCQoohan8mNtfjop0YiTO67L9LZ/srMon9VKfSfq8z7cik4sxsbS2jnTZTmPHKmEgO4/kgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BdQUdt/v; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3a4e742dc97so2383939f8f.0;
        Fri, 13 Jun 2025 11:59:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749841149; x=1750445949; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1/YIWQiUS3RgGsA89qeDcl9n+fbbe3YP1rWF9uN/SOc=;
        b=BdQUdt/vCRSJjW0FSV+gO2rp6q07n0kU5fIrRfy3LoezVTmD9hr9dhf0RDRBfOOfWa
         LCMrNYgo2rAfyBDBWSJvlwJ/jCSq6cDJjXPasjuZcpFwEJzZaUqG/hBLECf2mFZu9v5v
         e+jvGemQCCnYo71Q+Xfkevs8o0Nwbne1ZNz5Yurk3RIoDbYSqpVQQxhclm4PVo3bMD7g
         ir7iTP1a/pOkmurfiF06ltgfhCi5Ogi3wN3kr2F9vP5DUYGCrNmMcI/gCL5gvjVQPQEs
         Us/io94bMwsasxh2sH21EX13vIxtcOliaPEf8MnBCDauG8WTTxhkgHbr92NosHMj5u2k
         +BSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749841149; x=1750445949;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1/YIWQiUS3RgGsA89qeDcl9n+fbbe3YP1rWF9uN/SOc=;
        b=PX8P/nKYm2tjpPSh1j8Fcw/Mtz18v+RC7RwD5xZu8x6DaCXBXt5eGDhKsbeh/KvNzH
         f78+8wL0S6ITncY9iF/P8RklCdc6J5kBo8wVEaNVChOqbfszT/UnNDdSrcIBEbvUIXo3
         wEHDh1cISzZD60UYlGkHK+VW8eOxGdcNpjD/j+NXstxTzc0it+tQG4OjkoIr3XbR7LeA
         RHjKtB/Li1JNeWGnqq7MFRsKMzlhhfkC8jsd4zKIRFkTeNXjSM1PLc1Y9mXk+be+1kC9
         MCoAtCg0wI7Ga+nXumf/SSbbTAb6SpGJHggKQUtSNsJJCCSTK/rVXIiq8Ce6uiSRbk3O
         H+OA==
X-Forwarded-Encrypted: i=1; AJvYcCV7ekGoh+q/0JFFuaLdqZwTffWesMRkgDb9mAo4PsXhK08fw4MXj4ckLTKMVCEvSKR0UwQILP5K2Nj7zOa3@vger.kernel.org, AJvYcCVrpF0qhXOhMNDZzAE/ZrWL6eHQCucl1P/0bn1m0lv7K7E18Md4l4l8lD21W6CZBITFvVefdzV+D0ht@vger.kernel.org, AJvYcCWukulkOV+25xm3AgBmPZYj6R+T0aGG7tq2fCMyeAHWLqyxgH9bJeHYXfoVFledaR9SDDo388Mh5S0gtEb/M3xf6pM=@vger.kernel.org, AJvYcCXwnM7riu/BLSeWQdrih2DKWiUkCiD5hq0O+/yklEO0ZhOXIQjK28jmdzqsw+o6sd6sObBhzUyiYIaP@vger.kernel.org
X-Gm-Message-State: AOJu0YyUYiCZmaSmS5ZfAG9fTIAv97VsUUdZw+KsIJGHLGvgu8xiRiYT
	TLA8O+CZLeQY8lZKEUlx6OqMurLbMdvEed0QixXagxiULfa0hWReQiaiF3x7xk4kWzStcO8vBkR
	myv2iXFzBWqGlZ8hoy49ao5xhZx7MR42hrh+wqRL6RQ==
X-Gm-Gg: ASbGncsN5ksrNHOOx3TPcYH1wJ/SPviOFGDz97/5Z+CGRbGI5TRXX+nshTRcre27lG9
	2oFTdcn9dmJxYrh9UHzEH53ho1ndSrdqVkUfgJjVwDncDEkl7v+9Sk0cvLnER+UHDOhha6xS/0E
	ycJnQwf1LsWikbBYdXQG5blnDJWtarYCYxn6do6tavLkY=
X-Google-Smtp-Source: AGHT+IH6gVOrqupXkFxkZ8jHnjuBHoHp7WV2inzbQO5tSHCWOyZg7SSesd/x6TXCOy40KyIsVZAvAGsZEk2TYXgix+U=
X-Received: by 2002:a05:6000:1884:b0:3a4:eb7a:2ccb with SMTP id
 ffacd0b85a97d-3a56d821e4dmr2085068f8f.16.1749841148379; Fri, 13 Jun 2025
 11:59:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250609232253.514220-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdWoWqrMKgNSYN_NDOtROD-SAq7ProhREPJTEBTOPCeH=A@mail.gmail.com> <CA+V-a8sBhF-FwV0BXCxpHkuhdAg5YcwDsWPFRPSV_BdmNpLWYA@mail.gmail.com>
In-Reply-To: <CA+V-a8sBhF-FwV0BXCxpHkuhdAg5YcwDsWPFRPSV_BdmNpLWYA@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 13 Jun 2025 19:58:42 +0100
X-Gm-Features: AX0GCFvWiPn4aKbGTJejOZagRntrlAdbPUi0Zn3dwUU2W9SE1HnlVmKNOPFDH-w
Message-ID: <CA+V-a8t6WNQS-1AkFUeSioxNyF9vSbaxUDkQsYDk-=m1tysu+w@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: mmc: renesas,sdhi: Document RZ/T2H and
 RZ/N2H support
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

On Fri, Jun 13, 2025 at 4:37=E2=80=AFPM Lad, Prabhakar
<prabhakar.csengg@gmail.com> wrote:
>
> Hi Geert,
>
> Thank you for the review.
>
> On Thu, Jun 12, 2025 at 4:47=E2=80=AFPM Geert Uytterhoeven <geert@linux-m=
68k.org> wrote:
> >
> > Hi Prabhakar,
> >
> > On Tue, 10 Jun 2025 at 01:23, Prabhakar <prabhakar.csengg@gmail.com> wr=
ote:
> > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > >
> > > Add SDHI bindings for the Renesas RZ/T2H (a.k.a R9A09G077) and RZ/N2H
> > > (a.k.a R9A09G087) SoCs. Use `renesas,sdhi-r9a09g057` as a fallback si=
nce
> > > the SD/MMC block on these SoCs is identical to the one on RZ/V2H(P),
> > > allowing reuse of the existing driver without modifications.
> > >
> > > Update the binding schema to reflect differences: unlike RZ/V2H(P),
> > > RZ/T2H and RZ/N2H do not require the `resets` property and use only a
> > > single clock instead of four.
> > >
> > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com=
>
> >
> > Thanks for your patch!
> >
> > > --- a/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
> > > +++ b/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
> > > @@ -129,59 +131,75 @@ allOf:
> > >          compatible:
> > >            contains:
> > >              enum:
> > > -              - renesas,sdhi-r9a09g057
> > > -              - renesas,rzg2l-sdhi
> > > +              - renesas,sdhi-r9a09g077
> > > +              - renesas,sdhi-r9a09g087
> > >      then:
> > >        properties:
> > > +        resets: false
> > >          clocks:
> > > -          items:
> > > -            - description: IMCLK, SDHI channel main clock1.
> > > -            - description: CLK_HS, SDHI channel High speed clock whi=
ch operates
> > > -                           4 times that of SDHI channel main clock1.
> > > -            - description: IMCLK2, SDHI channel main clock2. When th=
is clock is
> > > -                           turned off, external SD card detection ca=
nnot be
> > > -                           detected.
> > > -            - description: ACLK, SDHI channel bus clock.
> > > +          description: ACLK, SDHI channel bus clock.
> >
> > According to the documentation, this is the SDHI high speed clock...
> >
Actually re-reading the doc there are two clocks (I had missed the
second clock earlier),
1] ACLK, IMCLK from the PCLKAM which is 200MHz
2] SDHI_clkhs from PLL2 which is 800MHz
Note, on RZ/V2H too the ACLK/IMCLK is 200MHz and clk_hs is 800MHz

So, I'll represent them as below:
        clocks:
          items:
            - description: ACLK, IMCLK, SDHI channel bus and main clocks.
            - description: CLK_HS, SDHI channel High speed clock.
        clock-names:
          items:
            - const: aclk
            - const: clkh

And for the ACLK, IMCLK which comes from peripheral module clock
(PCLKAM) this will be a module clock and CLK_HS will have to be
modelled as a CORE clock.

Cheers,
Prabhakar

