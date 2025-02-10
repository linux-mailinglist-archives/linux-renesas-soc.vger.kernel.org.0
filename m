Return-Path: <linux-renesas-soc+bounces-13003-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E7028A2EFF0
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Feb 2025 15:37:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EE9F31887D75
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Feb 2025 14:37:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45B622405FD;
	Mon, 10 Feb 2025 14:35:37 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B5E823956A;
	Mon, 10 Feb 2025 14:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739198137; cv=none; b=Htn5N3l6gIE6qb6e+YAy6AssVKTLiw8HhtvJInA4Dj1nrWipH0ShjYPV0NU7T2aljFjKGUsMv+ZRgJOxDE8liAaPwqsKHlTEuMkDBW+dW7S9Z4vBe8cEKlwPOCWM12K2fAgO8Ri9Pzu7IAyYo664Bz+dcPuMEv8Qiz1cmaNMUVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739198137; c=relaxed/simple;
	bh=EugmHzWhsLW9EDevL3RlZjnGjoIb2uxftMobj8htTM0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IyE1jFQnVvPV/BGn/Mc97J0JsWKIuBsfEEOv1sUpyaBS/OZ/jer6PZ/kjU7ZwG6ZcIAY1zxq/j2sSelWvEJWM0vVPBVnIcbjz+eoJ4p6QTRdz2b6qoWRqR5I4KjX9W/QISXldPUM/qcPC4EylDPDN+36J+DgOYFRAPic5LLhbZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-520335ff378so484850e0c.3;
        Mon, 10 Feb 2025 06:35:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739198133; x=1739802933;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gHjU2LN0MZChrxpUHDr8fZ70fguTgKTrG0LTTJF6WDY=;
        b=hl+H81QOdHL6oQqzeR1X83g1KH5huK9WYPKDvfMj4f0kkuflEJj1UMvprfQzLnfmiT
         hnJ9BooX/Lz//ENZAY32KarveIphF0mcox3XX6ysmEJ7mEgB+KwlOKocwmcekJ1/ecEA
         o/R5HK+ChvXR9uS9+wT7QbRxjHWqzCLi5Yw4herN0jN82+ZgLndPuwdh/mEJIezoTfhC
         qVr3GFspD2B3kNRe1Mp4xWK0WED+RnSAsp1lmmPR99Q9nWXVx8sE4YzYirSQUF2xbXlh
         Y6NCU/1Zwvk/f10VI9Bk2eDZOfLcGJaSIpu97KVIFOgu6Q5jUuf1Kz9lRWBJW5v+UceK
         O4Rg==
X-Forwarded-Encrypted: i=1; AJvYcCU/geB1DfNx9sk7HCQ0L9VtvdUgoykH/d8LetB/dV2aGqX6NBbmVvCDb13CZ6kZmAoYFdC71x0kNyXawJry@vger.kernel.org, AJvYcCUb4u/hMxVNTcIRO0BvhQ77iRjI+OVgPXT5rfiGesbDK8zjxaby/W46hDXNvI5bK+zaXGNE3QDlCXCo@vger.kernel.org, AJvYcCWBZGv9KFUKzAOI+Fb+S09aVBdIZKsLodje9whyxyczsgml/6RJmxZPCw4aujmGmdqDjU70YV9RcQ7BxCWrkT39LYI=@vger.kernel.org, AJvYcCWKUbUjzm7zN5s4G9Bi5ZijvH+uBddJH3RcotUzJnFtuCdGDkLYvr98/HqwLirIrBf4wN1CQUgG5RwCjD3P@vger.kernel.org
X-Gm-Message-State: AOJu0YwEmcP+A9a7/eC1W301AJ/mfsuw/67uJXaZV7EbbjK8I/dRCSEU
	RhuVJiA7jfdO+VG6kiF3/x7vJed0d3iuGW1CLEkaUn8e3yyMZ18/9ugVjuq7
X-Gm-Gg: ASbGncsPnt4Jr3KLAl52d2LMeWUf3BAGStQUW7hZhJpuQDrv14tAujLve1tybn6m7Pa
	BI9bPanaSXaN7AaNnQ9xJ25E9PphB7UolyiZN0jzHmNfzf1Rdp/lDdLXziSycdRyVlcbBRFV5XO
	Edg5ixTz0XhQcK4HoDieZ2Si1UAcZULkIiyXb5NXDaCkjGIAy7eUhVAIa21PRqWFTjTiZB16ARJ
	FLMvqVyT1jxllahnsHKjx4Cq/WMJtr58fhHHwMfKG7tC5mLU1gDzAN3OC6EMCongjSLO8KMwywo
	+FMVhB31cgScjNzH88Q4ROgIC1Bpu4MgHdCkVsR1yiPNaixEDupjoA==
X-Google-Smtp-Source: AGHT+IEIbTLf9rg8opk53JE49oi/yF7fu24mh1/3Iq62AjtkrAeZGbBp+LS5gx6oQpAOtuRjLOPp0w==
X-Received: by 2002:a05:6122:458d:b0:520:3914:e6bb with SMTP id 71dfb90a1353d-52039152847mr3286789e0c.7.1739198132844;
        Mon, 10 Feb 2025 06:35:32 -0800 (PST)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com. [209.85.217.50])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-51f22767281sm1340802e0c.20.2025.02.10.06.35.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Feb 2025 06:35:32 -0800 (PST)
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-4aff31b77e8so1233816137.1;
        Mon, 10 Feb 2025 06:35:32 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUEqq0FJt0MTECOz6YOsjjkrD0TqR0RNLh8BZ0XFDd+0mJtXntFlr/CoOTtu1wvd7pTY8whhT5WeXBIZ/sUuinr8Ak=@vger.kernel.org, AJvYcCUd7+K3wIwAL5Nd4Q5XBLcdkcv53ybAO0QzzpUR72FjhzJj+lgWJNn/gMUPAunL4S0rWXZrdvSmeJKHPncI@vger.kernel.org, AJvYcCVaqr6HHVN4Xfr17BNpXGFF/Mwrv6sNurD2mGpvqwYEn+GHEyav2GkKrLIyVcGewXUjxX5DJEwXWbUa@vger.kernel.org, AJvYcCXUFQGB5ir6SdjehFHPGEhVnf4NpdLMun7m27XN/yjwNLYpKEyHWimEDHL3frWyGfN8Jxej+HpBNpsfq2t9@vger.kernel.org
X-Received: by 2002:a05:6102:442b:b0:4ba:71cf:190 with SMTP id
 ada2fe7eead31-4ba85f7500cmr9182819137.25.1739198132312; Mon, 10 Feb 2025
 06:35:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250129165122.2980-1-thierry.bultel.yh@bp.renesas.com>
 <20250129165122.2980-3-thierry.bultel.yh@bp.renesas.com> <CAMuHMdVB2W6R+xYeTUKSv_dMGruECSft-P19m6nZD61=ROngXw@mail.gmail.com>
 <TY3PR01MB11346D5D895C190EBE8C8A84B86F22@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CAMuHMdUpaV71Svyenq=hXMk3GfjgZvHn-0APkv_LKSzyytKzag@mail.gmail.com> <TY3PR01MB11346D0C3FA9E451ADD3F5BB386F22@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB11346D0C3FA9E451ADD3F5BB386F22@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 10 Feb 2025 15:35:20 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWDd4MawW_cybPTy+3Sc6-9t1-ZF9_V+mPQHTHNnmEg2A@mail.gmail.com>
X-Gm-Features: AWEUYZk_2lvBsUd8Qjnyv8xKZGlYnar2Q7PzLmiT_H2s3zCkd7d64X3frh4VJdc
Message-ID: <CAMuHMdWDd4MawW_cybPTy+3Sc6-9t1-ZF9_V+mPQHTHNnmEg2A@mail.gmail.com>
Subject: Re: [PATCH 02/14] dt-bindings: serial: Document sci bindings for the
 Renesas RZ/T2H (a.k.a r9a09g077) SoC
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

On Mon, 10 Feb 2025 at 15:26, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > -----Original Message-----
> > From: Geert Uytterhoeven <geert@linux-m68k.org>
> > Sent: 10 February 2025 14:15
> > Subject: Re: [PATCH 02/14] dt-bindings: serial: Document sci bindings for the Renesas RZ/T2H (a.k.a
> > r9a09g077) SoC
> >
> > On Mon, 10 Feb 2025 at 14:19, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > > > -----Original Message-----
> > > > From: Geert Uytterhoeven <geert@linux-m68k.org>
> > > > Sent: 10 February 2025 13:15
> > > > Subject: Re: [PATCH 02/14] dt-bindings: serial: Document sci
> > > > bindings for the Renesas RZ/T2H (a.k.a
> > > > r9a09g077) SoC
> > > >
> > > > On Wed, 29 Jan 2025 at 17:52, Thierry Bultel <thierry.bultel.yh@bp.renesas.com> wrote:
> > > > > Document RZ/T2H (a.k.a r9a09g077) in SCI binding.
> > > > >
> > > > > Signed-off-by: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
> > > >
> > > > Thanks for your patch!
> > > >
> > > > > --- /dev/null
> > > > > +++ b/Documentation/devicetree/bindings/serial/renesas,rzsci.yaml
> > > > > @@ -0,0 +1,100 @@
> > > > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) %YAML
> > > > > +1.2
> > > > > +---
> > > > > +$id: http://devicetree.org/schemas/serial/renesas,rzsci.yaml#
> > > >
> > > > "rzsci" is IMHO a bad name, as SCI on RZ/T2 differs from the
> > > > similar-named "SCI" (sometimes called "RSCI" or "SCIg") on RZ/A1H, RZ/A2M, RZ/G2L, RZ/V2L, and
> > RZ/G3S (and most old SuperH SoCs).
> > > >
> > > > BTW, I believe the variant on RZ/T2 is also used on RZ/N2, RZ/V2H, and RZ/G3E?
> > > >
> > > > However, binding-wise, they all seem to be very similar.
> > > > So perhaps you can just add this to the existing
> > > > Documentation/devicetree/bindings/serial/renesas,sci.yaml?
> > >
> > > It is present in RZ/G3E as well.
> > > RSCI supports sci, scif, i2c and spi that is the reason renesas,rzsci.yaml introduced.
> >
> > If you plan to add support for I2C and SPI, you will need different bindings under
> > Documentation/devicetree/bindings/{i2c,spi}/.
>
> OK, I thought since it is a single IP, we need to use a single compatible and instantiate appropriate device based on
> the device property rather than separate SCI, i2c and spi compatible.
>
> Yes, I agree having different device compatible for same IP make life easier, no need to add specific
> vendor property.

I said "different bindings", not "different compatible values"!

Cfr. "renesas,tpu" having bindings in both
Documentation/devicetree/bindings/timer/renesas,tpu.yaml and
Documentation/devicetree/bindings/pwm/renesas,tpu-pwm.yaml.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

