Return-Path: <linux-renesas-soc+bounces-13001-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AD8FA2EF80
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Feb 2025 15:16:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CB84B3A30FC
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Feb 2025 14:15:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29384235C1F;
	Mon, 10 Feb 2025 14:15:26 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46EEA29422;
	Mon, 10 Feb 2025 14:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739196926; cv=none; b=Ifu9N/YbF+HmE/qTM1k92tNaaKOXTnSrdOHSPdDInhYGy+jjj1qnDSPpsIZ38I5HrnnPKtnwgsA6MGNTS7RF2Rgdh88sJe9RxnyJDC/jQO1MdbJXgTdQTaeOBSL/jYAvanhsi7eMMaRGOgeMJ5jCq1y5BqLvtgobNtDlvFNsvt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739196926; c=relaxed/simple;
	bh=A9PgrsXSRNKEPfOJomrogXIlnGOX5hrS1mbx+8uD1SE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bg8CJXOh49dGdbOZZu1aRHqER02GCyNhmBzxC77ZDwxgofBsZUE1XDXd9FGG9DJjJ7dSF1nf7F2bZePyt+Uedk4vI9LSWJWdfIgQw8VlkZIKYLueiDJODbnn35VIkqcqLkeh8Q80NeZaoGLntNJADItgBApPpOFypplgUvYQD1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-4ba9680271fso1663168137.1;
        Mon, 10 Feb 2025 06:15:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739196922; x=1739801722;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sxuehLgcBoD1P6oKVRxDFIHudAPxcjV73MhKrBH3pHs=;
        b=vuN+qFLiL/KtaRO6tZUhw0MKaHP41z4DsdyTYAEVr1IJZR7ivM9HHGPHBlgH0DOry8
         iXN/gAS5u5m1H7uvUAiJynuFBXnW1JvD72VW3hH/yYtmgKI/f+aHKwhtlv/JjMST9X01
         xBZpQTtpPLCHGmA7BlRHCCSnVUhWCm9SDh1QUQLgqGM3lV0MeiPyyOfb9hfjYErwdU39
         TE7EDvu9uPpeYC1LaIFnoGkHshqqILFGOYlgQmQq+W3CLHPPFWZEA6PLjCYCGUnyUnL3
         2pBniHf4OS8TSTo4NU7cP5KjduGuHkP9p892AEwIWu9ZFhXSx2hCVBJRaLTJLJdaxXD5
         C39g==
X-Forwarded-Encrypted: i=1; AJvYcCUwpBuksD8H4iDUxZH1Phq2IKyc5OcLB7//6elhcwb/LUBKRn6oKI/hHALUtPKwrwTulrE/HwgmUtPBnw8s@vger.kernel.org, AJvYcCWCrVcMCrzbeJ/dwKw9Voj8LRG31yDvx/YRggWYHEIiE09oAYhNBITT3N1EXpQJgnqilTuvzukwJvIgnXSn@vger.kernel.org, AJvYcCXb+JealS6R+nWrvjsGNemt5HBRb6DY7rBpEwEOH+JLjfHsp9gpCY2ikmb2ZV7RvWku4YSt1gQZRSlS@vger.kernel.org, AJvYcCXqKe/6fZE7/eV7D/6oNNE7gA/IiVrn+1DIWi5KSCOcXorWrG4aT22ZBNs8g7dsTckpESvbHuJlXkHJ/07eqjE5OFQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzOVlP66eJgKvi+sTtqqyDBy8ssHwRRrS4IC8+wNe/uhJ7ggihf
	+529nJapYZ2/dhIwsCv0HDFIuzqjugzOOaEdgOHyiIBi4pcUtF6JdIVuJSBL
X-Gm-Gg: ASbGncs0wbeVR1kmyT1vdhxblfGooTx5sW1LXoCh07TaUTmFPf1LqP/2C9IGjKHa/pP
	2xwrpXrmURT4alY0vcpCAFmLoUuhw4xhHvgIjLH1eRISytWopDGcDEzyUHHmlB/jCRQn0pYOUWA
	9iepVVF1aIhZoo69zWA+XiqdgqTzdxs/fGPglc3Bs2f0EYmgA2pgkhvgm7XAPCJ0Nj/yI8t/sDE
	MUbuyt0q83inNJAe+QuJUGrkLS/X+GrMKS03znVudKXh77hH3ojyg7qChdB5Is78uOXusOutZNj
	4p5FIdcs+GQY4xCtAoKcelurWY4uOYThkIZfggOj24h0jQdCfoC0bg==
X-Google-Smtp-Source: AGHT+IFkZIv+UuNG5hhRVrPRHp164vpV1+c2pvI9OyfRBD/G8mDUCOOqEQY6hIZFZqrG6C3KaRIEHg==
X-Received: by 2002:a05:6102:5490:b0:4bb:c670:7ef4 with SMTP id ada2fe7eead31-4bbc670837amr2438177137.3.1739196922628;
        Mon, 10 Feb 2025 06:15:22 -0800 (PST)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com. [209.85.217.47])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4bbdcf078ccsm63429137.3.2025.02.10.06.15.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Feb 2025 06:15:22 -0800 (PST)
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-4b9486a15a0so2998715137.0;
        Mon, 10 Feb 2025 06:15:22 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVYu8lEBXYrAOEkx8tLFD5NUe6orqc38kfeZk8iniM0JavXd4bRRIFjQjMWG9RqqIZlhvuN+9LTmPX1@vger.kernel.org, AJvYcCVf5utrZmQFto+T2Nh/GXq74sRIVBqJX94NzdtEZHH6Xk1T0NyYM5mm9PRwViJWFRFyxnyC0v+F7movrrpn@vger.kernel.org, AJvYcCVvtyzBD1r6QBXGZ2T+5ST/u0isDZx4D6RCFE4jP3BTWxdzgqii8JY4s7ID3gmvYSa2mBsLVs+opDFPJt4vZO+FELc=@vger.kernel.org, AJvYcCXho9SruSvC0N5gLc/BqxeMrbnZixjWjUY4q/xV7DjlEf7DVoUtq6EVzjTyB8fV3vOgGONamKbnedV7BGfT@vger.kernel.org
X-Received: by 2002:a05:6102:162b:b0:4bb:c630:dcbe with SMTP id
 ada2fe7eead31-4bbc6311774mr2601198137.11.1739196921936; Mon, 10 Feb 2025
 06:15:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250129165122.2980-1-thierry.bultel.yh@bp.renesas.com>
 <20250129165122.2980-3-thierry.bultel.yh@bp.renesas.com> <CAMuHMdVB2W6R+xYeTUKSv_dMGruECSft-P19m6nZD61=ROngXw@mail.gmail.com>
 <TY3PR01MB11346D5D895C190EBE8C8A84B86F22@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB11346D5D895C190EBE8C8A84B86F22@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 10 Feb 2025 15:15:10 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUpaV71Svyenq=hXMk3GfjgZvHn-0APkv_LKSzyytKzag@mail.gmail.com>
X-Gm-Features: AWEUYZn4-yY_D8g0FNPB0KsKrTKyUuZA5A4EpCp9Dr-kxloDMrY4NFg8EU8hFMQ
Message-ID: <CAMuHMdUpaV71Svyenq=hXMk3GfjgZvHn-0APkv_LKSzyytKzag@mail.gmail.com>
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

On Mon, 10 Feb 2025 at 14:19, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > -----Original Message-----
> > From: Geert Uytterhoeven <geert@linux-m68k.org>
> > Sent: 10 February 2025 13:15
> > Subject: Re: [PATCH 02/14] dt-bindings: serial: Document sci bindings for the Renesas RZ/T2H (a.k.a
> > r9a09g077) SoC
> >
> > On Wed, 29 Jan 2025 at 17:52, Thierry Bultel <thierry.bultel.yh@bp.renesas.com> wrote:
> > > Document RZ/T2H (a.k.a r9a09g077) in SCI binding.
> > >
> > > Signed-off-by: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
> >
> > Thanks for your patch!
> >
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/serial/renesas,rzsci.yaml
> > > @@ -0,0 +1,100 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) %YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/serial/renesas,rzsci.yaml#
> >
> > "rzsci" is IMHO a bad name, as SCI on RZ/T2 differs from the similar-named "SCI" (sometimes called
> > "RSCI" or "SCIg") on RZ/A1H, RZ/A2M, RZ/G2L, RZ/V2L, and RZ/G3S (and most old SuperH SoCs).
> >
> > BTW, I believe the variant on RZ/T2 is also used on RZ/N2, RZ/V2H, and RZ/G3E?
> >
> > However, binding-wise, they all seem to be very similar.
> > So perhaps you can just add this to the existing
> > Documentation/devicetree/bindings/serial/renesas,sci.yaml?
>
> It is present in RZ/G3E as well.
> RSCI supports sci, scif, i2c and spi that is the reason renesas,rzsci.yaml introduced.

If you plan to add support for I2C and SPI, you will need different
bindings under Documentation/devicetree/bindings/{i2c,spi}/.

Note that we already have drivers/spi/spi-sh-sci.c (without DT support),
but it's definitely sub-optimal for the fancy new variant in RZ/T2...

> You mean add this in renesas,sci.yaml and then expand??

Indeed. Differences seem to be minimal.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

