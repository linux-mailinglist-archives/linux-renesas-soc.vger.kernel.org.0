Return-Path: <linux-renesas-soc+bounces-15839-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CB20FA8598A
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Apr 2025 12:23:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 232B94E5202
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Apr 2025 10:22:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8D111F03D9;
	Fri, 11 Apr 2025 10:19:48 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 963E6EEB1;
	Fri, 11 Apr 2025 10:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744366788; cv=none; b=JDSdNHb/B1GpmV50ToCnz/Xeni8bdOqMNKOuCLu5/mzaC6xoSUrWhao945EDKULi+G22m0S8spzVsM8NvZnBd0TfucHxiLp0ewfW46diSEfBk1q/lIy15O9UuTev14T54LUvenPLSCouSTg36qsGrN8pzYNDUeztCQ+SQjEOf80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744366788; c=relaxed/simple;
	bh=LprdMn8AM2NvclLuiyL7Aj0jeV6crsPoS64Xmqg3AK4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rwPZJdmLrQjkVAXPDps9TEWz6KTGxKfIZFfZrJLLKJZ60kfz4jhUmDJPuI7NaeQ4Hs4Z1dVzwS64ryrbQR5EhLRU0rKeo1UsW6ljc4WE3LemoRdHv5k33TwklbC5VrxTVgEiXE/ldHeOKZg65vTgNfk+m8NOL6YX9sGo530LlyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-86d3ac0fec0so1650907241.1;
        Fri, 11 Apr 2025 03:19:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744366784; x=1744971584;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MRj8vlwCzaPw8iMnn+a+shmBroae65IYrdR7nYfHouk=;
        b=Yuj9wD7l8E6xIZARsW5dGms5euLwld2vq6MY6hzNgnsey4dh86fsdbaoc9ll1DvUI8
         0IxqCGEQ2XubeS1p5dz+q9dytI9jKY644tDfD0XQ22+lZW4fbCuTPvsIX/gGxb9BaQEm
         C3z4xRDOrNCVPrhfgImnw+i1ZzIUmGdHXJtMBwq8vMVmaY09UpUMfsHXX/dzsFjtfSU+
         ohWnLOm7Hn+R0hegfzqY1sHFSpC9S4vlV5O6tC21AvbzL1vKMgdqCI2rUBFjeAecehAn
         gszMyMjYwI2ZQrQAmkLW4I8wn8eQzze6DW1bEjNwSZazPqi3t9UJggt0TmQe+SbKP6Nl
         tL2w==
X-Forwarded-Encrypted: i=1; AJvYcCWsy5g+ZhtIcYfFE6OGdQWh3NAzO8cYYrW0ic97IVgkbTV/vedz9cb69gJompw+h9AhmxiqX6F+J3DW@vger.kernel.org
X-Gm-Message-State: AOJu0YxWU9CcCM8oBkzJb3NSDN0MhRvw1leDtF8TuHOoEhmGztttAIxb
	FNYxRoVImM8rO4H69PC2sQVbDQ/lAnoruZRVjwpQRK3zfvO/aFp+ITctDXq/i4g=
X-Gm-Gg: ASbGncupox2C2V6LlkaAoBUV+oerd4vPXGEyzeYZEIlIr7ldhf0gyMjD1hb0XrTC9FH
	1W2+EpYa0M8peFdTz/aVoDkIIpqDwIfzzIuB7nXgbEGjIcj08GD6bZxXCj4EogpIoL2W6q4Pv4e
	fsd+0HTQNY+gzV8X+RPB28BzW3G6UQ42gziztrWptWcNKtTODtXxmkc4ECWaHYNCCmRc08is12E
	UC96Y9ZdVlNxqb32dOcWDeYR4spg7qS7W7h3GIiPNMgN/+zOfobQxDk/W6srXaDu8Mq4SdSLal3
	2ELBUYV4orW05rZDOGci2OLIyWuFamJ10bMC9iDkd+4m2M1Ey+/hbQbAcGWzB4XG5lbtSs0BkAf
	9ShI=
X-Google-Smtp-Source: AGHT+IHkDEJ20ruQHBiUp3lkAKpRmRv4rw7qpGTsgkw5NJRzoTqVZ+19LXbccUT1O+31/vk3D3bkNg==
X-Received: by 2002:a05:6102:370d:b0:4bb:dc3c:1b47 with SMTP id ada2fe7eead31-4c9e4f229famr942091137.14.1744366783897;
        Fri, 11 Apr 2025 03:19:43 -0700 (PDT)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com. [209.85.222.45])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-8755716bae6sm985425241.15.2025.04.11.03.19.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Apr 2025 03:19:43 -0700 (PDT)
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-86d5e42c924so1480602241.3;
        Fri, 11 Apr 2025 03:19:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU9xnHdUbtbchDbz44zvVrGvBowBvBEcD/jrpbB+bF/8ovTn2j32e3aErfZwJnnlbn5IY4M3JzsjCDb@vger.kernel.org
X-Received: by 2002:a05:6102:3e8d:b0:4c1:9288:906c with SMTP id
 ada2fe7eead31-4c9e4ef1b42mr1037857137.9.1744366783244; Fri, 11 Apr 2025
 03:19:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250410071406.9669-4-wsa+renesas@sang-engineering.com>
 <20250410071406.9669-6-wsa+renesas@sang-engineering.com> <CAMuHMdXgWgtNGUCsuRuGQdtwYEZ3H3+JTfMATsCz53WeuOVw9g@mail.gmail.com>
In-Reply-To: <CAMuHMdXgWgtNGUCsuRuGQdtwYEZ3H3+JTfMATsCz53WeuOVw9g@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 11 Apr 2025 12:19:30 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU8LV152774jekKzsTLpJNdrvJQookXC2kxa6uerV5PbA@mail.gmail.com>
X-Gm-Features: ATxdqUGiHLMvgzMX3y1qKKAp2a_PVcgWZ1oyIIciKbrSnEQA-krhQ4s8SruR0c0
Message-ID: <CAMuHMdU8LV152774jekKzsTLpJNdrvJQookXC2kxa6uerV5PbA@mail.gmail.com>
Subject: Re: [PATCH 2/2] ARM: dts: renesas: r9a06g032-rzn1d400-eb: describe SD
 card port
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 11 Apr 2025 at 11:47, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Thu, 10 Apr 2025 at 09:14, Wolfram Sang
> <wsa+renesas@sang-engineering.com> wrote:
> > Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
>
> > --- a/arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-eb.dts
> > +++ b/arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-eb.dts
> > @@ -66,6 +66,28 @@ pins_eth2: pins-eth2 {
> >                 drive-strength = <6>;
> >                 bias-disable;
> >         };
> > +
> > +       pins_sdio1: pins_sdio1 {
>
> pins-sdio1
>
> > +               pinmux = <RZN1_PINMUX(95, RZN1_FUNC_SDIO)>,
> > +                        <RZN1_PINMUX(97, RZN1_FUNC_SDIO)>,
> > +                        <RZN1_PINMUX(98, RZN1_FUNC_SDIO)>,
> > +                        <RZN1_PINMUX(99, RZN1_FUNC_SDIO)>,
> > +                        <RZN1_PINMUX(100, RZN1_FUNC_SDIO)>,
> > +                        <RZN1_PINMUX(101, RZN1_FUNC_SDIO_E)>,
> > +                        <RZN1_PINMUX(102, RZN1_FUNC_SDIO_E)>;
> > +       };
> > +
> > +       pins_sdio1_clk: pins_sdio1_clk {
>
> pins-sdio1-clk
>
> > +               pinmux = <RZN1_PINMUX(96, RZN1_FUNC_SDIO)>;
> > +               drive-strength = <12>;
> > +       };
> > +};
>
> With the above fixed:
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

I will fix these while queuing in renesas-devel for v6.16.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

