Return-Path: <linux-renesas-soc+bounces-25166-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D142CC89C6D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Nov 2025 13:32:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 313C93B6CCD
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Nov 2025 12:31:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64BC6327217;
	Wed, 26 Nov 2025 12:31:25 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD88C2F1FE7
	for <linux-renesas-soc@vger.kernel.org>; Wed, 26 Nov 2025 12:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764160285; cv=none; b=BbtVmcrWBxTexS64fyzPfziKWROuMW+7PitxDYMlA6qEYcID8x3S0WyHHVTbP4RTsD/J41MQ5SVHYcsAoRhKTItRqNQq+hZ0jVCVvGamh9pscRDpr7s4+IEHGSCPs7S/sj2wQ0NhF4WaBdowmjh9vp40y8aisZO0HB1ZfxkWhO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764160285; c=relaxed/simple;
	bh=n72+LqBciqZ8qXv8XKxHQzFcQ/xEgnqQaVpiyP9J89U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SszAOJlfsmrFS0xmRjHikZtqi8C11Rhr0Q3a3Ox+TJBCksvOBvcNfDqkycprgF8aMPtPhOPM8xYRy9Z6EQbavnBmCppHzG3FuooB/CZ5bSi/F5XxAv0ObT76aYoqh/CRCDuta7Msxe9eK+MK+2qLKUrd80IddxjTU6jMPEYn/gM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-55ae07cf627so2009879e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 26 Nov 2025 04:31:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764160283; x=1764765083;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IebHBTGSBZDf2bN+LDoDCtbDaHZ5HR00nyG3SMmY0/Y=;
        b=KbtxTTkBQdF9ztapOo9KoyMKHWLQVoy9LfmyP1rG7JSMOFIEINcZiItPIwpZnya6zD
         zPdsVsxQNFjg94RuVVp7RJuUEeyvpnf7CJV8X1jqOtk6tr+mr3nI4GtYCnK1yBlqaB81
         v73yQjeguEX0WO6dWC4ngQNI4YSyVHjrzEo63ViWxiv7CWqfitYHReSzR+7Pma53HYqB
         txBoYwAke8cRbR0m5V3+MkIadrC5fz4fh27ei/wiSCZ9ukd0OZaiDMs9PWAhRFXWrQo7
         7jWEX6HfJw/UPmhrpDrchTmqhcMHOXO8YizA3o0lxcRfdZXf8c60EGdzdRjJlcZkxeuu
         +q3A==
X-Forwarded-Encrypted: i=1; AJvYcCXfcHDmDMVLMUM1v2t6c6GoxNYWFEr0noVT1ut4ACpMjHOAX0pQf4Y8RouDUIqleTGOPwngef2bI+lraYmouYlBnA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxQD/MOIEVYR7ld9tM21noGYmMgotIqsT52hYaPeLHesOQeUD/Y
	qg7WT1IPeT4FjfI3gmXfp/3EfKCMzUZbh6h6RieFs/N6H5AEnwS1qfVGcNPx6Sg1
X-Gm-Gg: ASbGncvuPoNdGbc7twjxR2g6l9rvEaoP9OcFsaJ9ZiUlCo/kwmIdF1i4wGAOl0NOOJ6
	lielW6ACaEZAaiEMmZkwQNVTuXZQUn+s2LtaUBcZdBRpMqLlO3ma2Me621tEUrjfYf0orMRbW7U
	nXUxjrtNgF9M59dVZCOV6L3psF2u64Vt5wKX1EniN26bymj+PCVGr3f0MBXe0DYT/o+WkzVF6YI
	5mhLMOhl0tq0Dm/uCNV9nIn8OslZz6h788QAGd3CgJFKXCK6/61eu2RMGxLJUPyf4FenxVfnAwW
	adOV1jQkJCE1hvizasUakV4dLTsXV0GrOzsyiGV0JBsfU57xtwvhjw9iFEuijj0XjVTyg89cS0M
	TgjA3sb3sOYLWgPN/T2fXKItfzsqGyIxs1FvJ+lF11/DjWXuZUDSzUYHcJcxXnWu0TPnKKwjg+7
	jGd2WwqGGcRrFLpWUHakBr1ZrbEcDKcPw8MhOm3BT73ia7+Ph0
X-Google-Smtp-Source: AGHT+IEzfDMJJmE1T7moYOg9CIkAIWCHjWUiQDDMz0wOcUuPDTZM3Ck1RN1c6GU2Id6kZEMxgd3TAw==
X-Received: by 2002:a05:6122:6089:b0:559:67df:5889 with SMTP id 71dfb90a1353d-55b8ef233e1mr7127668e0c.6.1764160282570;
        Wed, 26 Nov 2025 04:31:22 -0800 (PST)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com. [209.85.222.53])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-55b7f60308csm8324294e0c.2.2025.11.26.04.31.21
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Nov 2025 04:31:22 -0800 (PST)
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-9371f6f2813so1841070241.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 26 Nov 2025 04:31:21 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUpH+/FL7STkojBXNHcY0YJ59S/qSEM8X7rWxBLKmmDVbgiQS6Is76jGVlrkiNykTrzdCsz5JjEh5g3ll28vPHiVg==@vger.kernel.org
X-Received: by 2002:a05:6102:b06:b0:5df:8f4:61e6 with SMTP id
 ada2fe7eead31-5e1de4306d4mr5874535137.32.1764160281205; Wed, 26 Nov 2025
 04:31:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251125214529.276819-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdXD3f3jN2F7c+yHmEb1C5Byc-e=sEXt_s=UpBQLv_F=Pg@mail.gmail.com> <CA+V-a8vDzG3_CKUPRLmFv9Z3qjqcgAp8vhpBHkGs=EA3o3Zxkg@mail.gmail.com>
In-Reply-To: <CA+V-a8vDzG3_CKUPRLmFv9Z3qjqcgAp8vhpBHkGs=EA3o3Zxkg@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 26 Nov 2025 13:31:10 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUM8hN0xM2Q-Y_oGb+u=+ONabO-M-Wg+_5A-SStHm4pdw@mail.gmail.com>
X-Gm-Features: AWmQ_bmlFD-VTRpd9QpSsyXpi_cI3W3wmlQ-DQEzT-MkMb8_VH0lcb9MT1A0uEc
Message-ID: <CAMuHMdUM8hN0xM2Q-Y_oGb+u=+ONabO-M-Wg+_5A-SStHm4pdw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: spi: renesas,rzv2h-rspi: Document RZ/V2N SoC support
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Fabrizio Castro <fabrizio.castro.jz@renesas.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-spi@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Prabhakar,

On Wed, 26 Nov 2025 at 13:11, Lad, Prabhakar <prabhakar.csengg@gmail.com> w=
rote:
> On Wed, Nov 26, 2025 at 11:38=E2=80=AFAM Geert Uytterhoeven
> > On Tue, 25 Nov 2025 at 22:45, Prabhakar <prabhakar.csengg@gmail.com> wr=
ote:
> > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > >
> > > Document the RSPI controller on the Renesas RZ/V2N SoC. The block is
> > > compatible with the RSPI implementation found on the RZ/V2H(P) family=
.
> > >
> > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com=
>
> >
> > > --- a/Documentation/devicetree/bindings/spi/renesas,rzv2h-rspi.yaml
> > > +++ b/Documentation/devicetree/bindings/spi/renesas,rzv2h-rspi.yaml
> > > @@ -12,6 +12,9 @@ maintainers:
> > >  properties:
> > >    compatible:
> > >      oneOf:
> > > +      - items:
> > > +          - const: renesas,r9a09g056-rspi # RZ/V2N
> > > +          - const: renesas,r9a09g057-rspi
> >
> > I am a bit intrigued too read that the initial value of the SPI
> > Transfer FIFO Status Register indicates 4 empty stages on RZ/V2H,
> > and 16 on RZ/V2N, while both variants have a 16-stage FIFO...
> >
> Both SoC variants report a value of 0x10 for the RSPIm_SPTFSR register.
>
> Rev.1.20 for RZ/V2N mentions, 16-stage
> Rev.1.30 for RZ/V2H mentions, 16-stage

My RZ/V2H Rev.1.20 says 4h (Section 7.5.2.2.19 SPI Transfer FIFO
Status Register (RSPIm_SPTFSR) and Table 7.5.2.1 List of Registers)

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

