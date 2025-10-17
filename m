Return-Path: <linux-renesas-soc+bounces-23248-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 26940BEA9BC
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Oct 2025 18:19:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 62C06940CC4
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Oct 2025 15:36:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54D40335063;
	Fri, 17 Oct 2025 15:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d4h0h4Uk"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6252B33290F
	for <linux-renesas-soc@vger.kernel.org>; Fri, 17 Oct 2025 15:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760715267; cv=none; b=KFnlcr6dC3q5W9NzAmJisXAS403rxDjAMSyoMo2grVBAj7dIYghyz7wPMzMTDroI+QBINdeojuH0wf1lk07FTMwFhkaOH62EZO4RtLOPJd1EsTBYE9CfUfjVBjiiKmFmbEcf5IEpCezG8I/8dfQeeg08smM/sRuDc9i2sAdfC6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760715267; c=relaxed/simple;
	bh=UTHjW/toYsIDFb60IqVuORUHKF64xvgXUjf946jP9sk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BZuy10+X9iTP9CzvujvxI5IdDfJDK87Vl074KLfTYUqevH5XuBiQt3xaldL2exdgrLU38lpM+ePIbg08/NqdxdY1mH+OTwqUPLV/YpCgBcbBQ/pR0cqDCypGir4f+ObhnYCY55XTtJLs5M9ZzdNORN12jjRGd9UF1653meM/aog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d4h0h4Uk; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3f0ae439bc3so1043096f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 17 Oct 2025 08:34:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760715264; x=1761320064; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=favt1IDI3QNdxE7vKo/4IJP+8NRTOtxfK/UHHLad8Y4=;
        b=d4h0h4UkQUBi9RG84ziDxhlIlsh3UxB7sn9MR7Yj6W3bbda/QIgbac9Nxjc/PKohD6
         OUfpeEO2D9/VbtZquhIw0u3j/oyBvlYMN5TvwKJBBw064OEmk6YJiddpsAk2KZV/Dcty
         Sr04ODUnmqod/jqWfeYdeefjGE6NhMxOyfKuZnzhXhnm6wHt9VBMuPuh6YUGcSffY7vn
         o4MmEpGYsKQJAoAowELN6harvqe3BvL5v37+1nQ7QgJZESDGGd8Z+4n0M4CpB6njudCz
         iUeig9cBju+kKMttbtS1dpexh15pnseMLKqEeA4ZERcEplzCLQNQwMmJfzjOc5pYTz5M
         juYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760715264; x=1761320064;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=favt1IDI3QNdxE7vKo/4IJP+8NRTOtxfK/UHHLad8Y4=;
        b=ly0u6H0R3x3GuaGUuvDmwycLH53clmEHQuFiU71Jz1see6q26axlpo5dA16xxg3nkp
         VEE74Up5j93Qi+FvCl/NOQ44Dv8U6UgPrUbgUKxH1FPnhRIpYlB7UZy582weuDwHWG2j
         JAGfe+C6SxMq5IX2kXrxo16MfvJRnW+HgtRY7wUcbg8mfdpbdMzdZU/XEGRYyRtxPppz
         BGNhe5N7N7eEdtIPlc8BiBFZdIOA7kWZc6soJBB3lWC22v5YGfX7POZU1TA/Rfu5Gk7b
         8OukDQjb/eshwf07VN/yeWzxO45nJMRFLj+ZyieC8lorcNPFDR2aIsK9ljpkPJIlZmv/
         F6kg==
X-Forwarded-Encrypted: i=1; AJvYcCX979Aq7vZQljExWBIg8PmDa8qYmLLustLpvESw6FRBo0Z+UtS0qFVD9O+/HlmFiqIqxZ6BcqIFF8aNsHlTwOswhg==@vger.kernel.org
X-Gm-Message-State: AOJu0YydCLa1ebdBUh7EHvM4umsSz+SWg3w0giWF7vkF/OtQA0TwDS2C
	t6BFahkrOQkr7HgA33HUTRwr1CXeU4K0VVeSdFD/5W+docz1W9uWObufkX/7ytyjuRqRd/y5OUm
	cC8VQiZWS8w9ZbFBEXelcpoiZnB5/zO4=
X-Gm-Gg: ASbGncsDSHJnfA2zzIevCuDTN1ga8Pm24FamC0sAE7ZODYDgHo8+70PSp5yO2VyhTSj
	7XPSi3Nu+oUXXsKnEss+Gz7dD4vhQatbCyPSK+0AXlOk6glPCq7YRKWF88aR3LXDxTDwD+QaUIR
	2Zh4kwTdfEQAzTrUPk5FCUpDgglBasGkc7xHkJ76FNUOSyjIdmWqq96AQVa2wWD0Gc/GiS7yRUx
	WNi8sI+WPmUDJt6JlYUU1FPm0KJD7uGvL/3nw9hPhZ7zS+/AK/9zsniJJUVBQ==
X-Google-Smtp-Source: AGHT+IHfpHgBVmETg3KYRZoAGy7Gg8QhvZwh2b+3jlFtVYjceIivbm2b7FrweI3TQHdE8Iw08/NlAQfWRcgPGmGMoFI=
X-Received: by 2002:a05:6000:4313:b0:3d7:2284:b20 with SMTP id
 ffacd0b85a97d-42704d9cf76mr3237097f8f.3.1760715263625; Fri, 17 Oct 2025
 08:34:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251014191121.368475-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20251014191121.368475-2-prabhakar.mahadev-lad.rj@bp.renesas.com> <20251016-dimmed-affidavit-90bae7e162aa@spud>
In-Reply-To: <20251016-dimmed-affidavit-90bae7e162aa@spud>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 17 Oct 2025 16:33:56 +0100
X-Gm-Features: AS18NWBguR9F654YWkASexXoMxk8B54Vyccl4usuxCXhdtptJoKlKHlfL85bFOo
Message-ID: <CA+V-a8un1cF=acNjG=79_v7oaR8gzBQ+3z1As8AqrJnOnk-OUw@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: renesas,r9a09g077: Document pin
 configuration properties
To: Conor Dooley <conor@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij <linus.walleij@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Conor,

Thank you for the review.

On Thu, Oct 16, 2025 at 5:41=E2=80=AFPM Conor Dooley <conor@kernel.org> wro=
te:
>
> On Tue, Oct 14, 2025 at 08:11:20PM +0100, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Document the pin configuration properties supported by the RZ/T2H pinct=
rl
> > driver. The RZ/T2H SoC supports configuring various electrical properti=
es
> > through the DRCTLm (I/O Buffer Function Switching) registers.
> >
> > Add documentation for the following standard properties:
> > - bias-disable, bias-pull-up, bias-pull-down: Control internal
> >   pull-up/pull-down resistors (3 options: no pull, pull-up, pull-down)
> > - input-schmitt-enable, input-schmitt-disable: Control Schmitt trigger
> >   input
> > - slew-rate: Control output slew rate (2 options: slow/fast)
> >
> > Add documentation for the custom property:
> > - renesas,drive-strength: Control output drive strength using discrete
> >   levels (0-3) representing low, medium, high, and ultra high strength.
> >   This custom property is needed because the hardware uses fixed discre=
te
> >   levels rather than configurable milliamp values.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> >  .../bindings/pinctrl/renesas,r9a09g077-pinctrl.yaml | 13 +++++++++++++
> >  1 file changed, 13 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/pinctrl/renesas,r9a09g07=
7-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/renesas,r9a09g07=
7-pinctrl.yaml
> > index 36d665971484..9085d5cfb1c8 100644
> > --- a/Documentation/devicetree/bindings/pinctrl/renesas,r9a09g077-pinct=
rl.yaml
> > +++ b/Documentation/devicetree/bindings/pinctrl/renesas,r9a09g077-pinct=
rl.yaml
> > @@ -72,6 +72,19 @@ definitions:
> >        input: true
> >        input-enable: true
> >        output-enable: true
> > +      bias-disable: true
> > +      bias-pull-down: true
> > +      bias-pull-up: true
> > +      input-schmitt-enable: true
> > +      input-schmitt-disable: true
> > +      slew-rate:
> > +        enum: [0, 1]
>
> What are the meanings of "0" and "1" for slew rate? Why isn't this given
I'll add a description for it (0 =3D slow, 1 =3D fast) and the same values
are programmed in the register to configure the slew rate.

> as the actual rates? The docs surely give more detail than just "slow"
> and "fast".
You mean to represent slew-rate in some sort of a unit?

>
> > +      renesas,drive-strength:
> > +        description:
> > +          Drive strength configuration value. Valid values are 0 to 3,=
 representing
> > +          increasing drive strength from low, medium, high and ultra h=
igh.
>
> I see what you wrote in the commit message, but I don't really get why
> you need a custom property. I would imagine most devices only have some
> some small set of "fixed discrete levels", yet manage with milli- or
> micro-amps fine. Converting from mA to register values in a driver is
> not difficult, and I figure the documentation for the device probably
> doesn't just give vague strengths like "medium" or "ultra high", but
> probably provides currents?
>
> I dunno, I am just confused by the need to shove register values into
> these properties, rather than using the actual units.
>
I'm checking this with the HW team. I'll get back on this once I have
some feedback.

Cheers,
Prabhakar

