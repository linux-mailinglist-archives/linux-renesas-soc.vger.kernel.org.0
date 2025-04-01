Return-Path: <linux-renesas-soc+bounces-15226-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 75E16A774EF
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Apr 2025 09:13:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 75AF33A4C4B
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Apr 2025 07:12:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D59921D63C0;
	Tue,  1 Apr 2025 07:12:38 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D258E2111
	for <linux-renesas-soc@vger.kernel.org>; Tue,  1 Apr 2025 07:12:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743491558; cv=none; b=lC4af7RKPIOJiD7APsXGJBSVyJQcsQgLIrwcfSkEu+tzzbmCpMVCf7JCXUaUu94xsLN6eXbHMOnuBoSr2Tyb2p7ejY/7hnl/fSCx3NUBjAztp8pWlYmwA0RS3CIFTl/j9DjtBjk9tagXvWjCioCCLubButx6xJ12jtgHRQ7+CZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743491558; c=relaxed/simple;
	bh=wptQBSvi3LNoaTWQjnRbZLj7aAvGok8h0v//ySS3T8Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p9abXqpP4wQ93qG7W2MGEFKOHBb/w1XMQw54wWjgSqbrZNiUya4DI6FpFpInKb/O+b0WjH2Bdz4aHXD0AowXVQyvqi8dy+a0X+b3MOwn7BFLHZFt0NBW2z41Mh1m+n8qoryyty8Nw/HTz17NSbE7kD7wk5fpHlSsh2etR537+FI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-525b44ec88aso2462503e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 01 Apr 2025 00:12:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743491554; x=1744096354;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UAlobGX4gwmuPA7MBviycca5BoxilVNHbTt9MJvvB2o=;
        b=ZeKvRlWleP/Uc0mhXli/DmpQvfDomxOZd2PmXetlqa2kGuTNpo6PWVRwQfHXzqigmv
         WooQDvOKg/5maLgH7AQFv9yXfxOd/9aeMMl1TpuiN7C4OLD74ve7JDQwt5STqtB1WT0u
         R+l50qlOKzpszYLbo0cG6RA2m4QMdzgrpzbVJ+PjRKxCunXhIEejEEUcFxD9zkGrhzvk
         ENw/vSBYx1v03OLJUrDeN9xFI5SNA5xzN4cPK6+TO1mwijIzvl4q5iBpaoF26kAW/mU7
         MbOCtUZJqSh6Le0E5ZkN8ks2yjccRtMcdc1CuOCUDHxE5wgUNbVVXA21Zfxgyd3/jOz9
         0U2A==
X-Forwarded-Encrypted: i=1; AJvYcCVZE691OK7Cnji3dlVIKEmQLHXX9v0TotYwZJbtqtGqRWzwS/wBMJr7M3ypmg4rJV4JofPTIcHey0pECZjqPeNAUQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8yxfNz73O3GssdNGu1d0XrlKMHyvQNB/UEuz3tMF3LiiP9LQv
	d3WIAW33mAzz339FgzyJokw51VF/RZkeovQQd/ytiriLKzV2dycr9u22EjSx
X-Gm-Gg: ASbGncsuLSxHqoJAGwmiRLbiDtF5EpyK6IxtJV2cqLrtGkE4B3Lk9U+rElnfI0YBfJF
	kxiJVQ54i38Xbc8KRNpvwk/98Nsi36oA83V0c8COl7HYIMFrfbnQvtwNKbw+ok20oqKIpLfVLjf
	324m1zAYDL1O0ROvHFZ1mbXrbsfeuMjq4w7rqeGnjv8JlgVXUpZbAUnNmdQe4Lq+XkOokhdgq3p
	UaELKr4f7Z0lMxDz2ReDPJ/4YKRw7TBTwlf/KSiGrh0h4yZQvbkQ/Ia7LDryQRcgRVc5NsbAr6u
	XZMEn/2UrJ4W65L6MqvwqVL4YDSRdasIkGqH/85A678ijkLrwQ8tBrcufyIVpzic5y7VJ/QIjMN
	jNJwg3qY=
X-Google-Smtp-Source: AGHT+IHIMl+f5OGNVdeMbcq5SmZ8pgl12p/lwDqsMRLfPP+Wrje+zpZ6Ezz9gSSWsa/K3kCbHvyi1w==
X-Received: by 2002:a05:6122:400b:b0:526:1dde:3613 with SMTP id 71dfb90a1353d-5261dde36camr5818901e0c.0.1743491554176;
        Tue, 01 Apr 2025 00:12:34 -0700 (PDT)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com. [209.85.222.45])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5260eadc03dsm1915859e0c.44.2025.04.01.00.12.33
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Apr 2025 00:12:33 -0700 (PDT)
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-86b31db3c3bso2186672241.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 01 Apr 2025 00:12:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV2QhyyAlAggQI+qhaPCNQ20/fLCF9u1H/OMO5EVWmOm8du7sfiZwU0gmOQJ7DC/XbobfIr7bB2WabEwFtI5g35Tg==@vger.kernel.org
X-Received: by 2002:a05:6102:d8f:b0:4c5:5aba:94bb with SMTP id
 ada2fe7eead31-4c6d37fede6mr8135849137.3.1743491553729; Tue, 01 Apr 2025
 00:12:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250327193318.344444-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250327193318.344444-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdVC0HzvB9EPKTev8Y6ioB6GfE-axEgzK52+SVj5hGnMUQ@mail.gmail.com>
 <CA+V-a8uvetHu1nvigA6s5DNYPKMq5iC6=UEnMLy=z+83nQ8acQ@mail.gmail.com>
 <CAMuHMdVdrJpyABVQPf-QuErPohmxcFPtECW3XW87bNfGVarMDg@mail.gmail.com> <CA+V-a8unH4rjRWuF+fO8DMPDEcTTz+rp0=0QR_k1yDk9VP5HeQ@mail.gmail.com>
In-Reply-To: <CA+V-a8unH4rjRWuF+fO8DMPDEcTTz+rp0=0QR_k1yDk9VP5HeQ@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 1 Apr 2025 09:12:22 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVYX0YAfvE6J5SAbUdH-+PD7kv5=osv8CuHy_sa_Wa-Cg@mail.gmail.com>
X-Gm-Features: AQ5f1JoiCPFWymVZc80Sb30ODngs2crtzA2AgZf4POmXLTLXZRwvlAZ2taa8AH0
Message-ID: <CAMuHMdVYX0YAfvE6J5SAbUdH-+PD7kv5=osv8CuHy_sa_Wa-Cg@mail.gmail.com>
Subject: Re: [PATCH RFC INTERNAL v2 1/4] soc: renesas: Kconfig: Enable SoCs by
 default when ARCH_RENESAS is set
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Prabhakar,

On Mon, 31 Mar 2025 at 21:09, Lad, Prabhakar <prabhakar.csengg@gmail.com> w=
rote:
> On Mon, Mar 31, 2025 at 4:48=E2=80=AFPM Geert Uytterhoeven <geert@linux-m=
68k.org> wrote:
> > Note that apart from a scary "WARNING: unmet direct dependencies
> > detected for PM", an m68k allmodconfig kernel builds fine after
> >
> >     -if ARM64
> >     +if ARM64 || COMPILE_TEST
> >
> How about with the below:
>
> diff --git a/arch/m68k/Kconfig b/arch/m68k/Kconfig
> index eb5bb6d36899..31f313d90f0a 100644
> --- a/arch/m68k/Kconfig
> +++ b/arch/m68k/Kconfig
> @@ -122,7 +122,7 @@ menu "Kernel Features"
>
>  endmenu
>
> -if !MMU
> +if !MMU || COMPILE_TEST
>  menu "Power management options"
>
>  config PM

I'd rather not add compile-testing for such a core subsystem symbol.
The SoC-specific ARCH_* symbols don't enable much code in-se, and mainly
expose driver options that become visible when compile-testing anyway.
I rather see build issues due to building the latter with PM disabled,
else we may lose the ability to notice such issues, and the opportunity
to fix them.

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

