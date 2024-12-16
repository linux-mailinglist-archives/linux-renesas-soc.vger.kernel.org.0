Return-Path: <linux-renesas-soc+bounces-11362-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 19D659F2C89
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Dec 2024 10:03:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 120C77A1109
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Dec 2024 09:03:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBDFA1CEAB3;
	Mon, 16 Dec 2024 09:03:30 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A6EE2E628;
	Mon, 16 Dec 2024 09:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734339810; cv=none; b=cjTkx+ogjz5SKMwd/kTG7wHRQ1VICII1wwuhaGXN1HGjWaPDD8QZv/fY4XQHe1KN4FebcYc3feHXWUExgCUOGfuu4s4KJA2EuYY2oTUzyNDqqWXEc6P103/6A/wA8JJ1lG6kd7l4TVqo1d5LqhJKf942u+mGrDRPS9d2V3JPcFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734339810; c=relaxed/simple;
	bh=XS39IjXJajdXC3kTPlsZK/PjcGofKjWrWJVJt7M373Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Yt5UqTMl/ALkfdyIBDXKjiACViQ70YG3pIV2TZu9Zn5AomLrOSThoGDegecjMujsNq8CFWxGBU48RHmPjX9JzLBL5q8ZVHi6/gM/2oLk06l98mvPPO9ZXlorriM24I/xAJFZf8qEa23YCxhG66XXTzYT4yTMCgWO9eaDeryeR2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-517aea3ee2aso1750243e0c.2;
        Mon, 16 Dec 2024 01:03:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734339806; x=1734944606;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/pewpxD4lpJ3Q4gxuwGa+K4FHvRkwiErzIpkGMT8MKY=;
        b=VxMRokaXgqn3bFxAfmibzCDfq+zeyo+dIOQZsb5xChY+WJwjefh3JwKeqqbdotUpmS
         EVXWT3vKbxqsqnBPBd/+31Dzs6JYvwZlsfLkNqJiDOjiTUz+YeVAk+M4G1R+3Om2zLdy
         0PWYbpJ1+05oXlakhBOatg+p4hVbaJIt6WpQJ7uegxkJJqCja3i1kDc3z5tzLyqou2pt
         aSWhPQIrvuZ+Vgc7vwGiIN3LrPnac4gHr1sJjdbK2dn0VUpI5fAyRMSZ0a/O3ueFBx9u
         Ozo5fPU+cDgsZL82Ah90to2nKuILkor2N80WWt3xLs4HFLPmp5ln0bK8v6PPVSJuLrxZ
         bNBg==
X-Forwarded-Encrypted: i=1; AJvYcCVsKsO+/FkDV12IGV0Q/c8WlQMq0neO+dalOG5m6uXC9+GXx7iiDGnBwkzvglsuHZD8RF2SdFTUftnkRy8cpkCKaps=@vger.kernel.org, AJvYcCXDQ6NCvUZ4xpxRtUiOksO1hcs+FtfWl0OfE1737dDLyiZJl2fSgQMBFKCSNJdlCth/45zk/uKtTPyg@vger.kernel.org, AJvYcCXLXCoLS5j1xCfYag1cQgiBhuBfBpEUejigFQmuZnm/WJxb4fATXPqocVrWzH/cH/y3ajvZm4NocZuGpw2E@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/miABPcR9CxGO+8oaImTnb9OL23CfSPRz63eL7OWrQ3RpltS6
	4iRWgkJlvlHxouU0bi07XV6ExymutFEdxhtsOaf1O3ERwzxk20BTxZnH18x6
X-Gm-Gg: ASbGncssbzeDi/B+PI+/39mkMcpveE7xga+jBGd9AOb2MECJrVM4S0zqhGnKolOuk+t
	21zkIa017WAGYok8BBjTvnVQ/apjUhgpYVDWctvJYEMPbW7BvKZFQYNCM7S38Q0QYqxz7JD+j+o
	S2G+BuOw0pJfZXeULqlg8j7lD1mA5uG+Q0kHDkayYW8CoSIpyM5IXPtEmfhJQ6Z3gu1H8JLxYaZ
	nZ7nm1TiMHyxYebP4IZPlGHSFg278c5f9GJFKLB9Sg0WgzUXdGhVoeRiw85Gzgv4YjNl4ZwCfm1
	6GLaeqSgVkH3Vm9W8to=
X-Google-Smtp-Source: AGHT+IHPp+5Tu8TYm0Qs2FQJUTj4a2EegwFlVpGGUj5FEmNFnyhsuNkAqQwGjRmmMY1Ibcdf8FI0og==
X-Received: by 2002:a05:6122:3c51:b0:518:7bc4:fccd with SMTP id 71dfb90a1353d-518ca37977emr10750669e0c.2.1734339806494;
        Mon, 16 Dec 2024 01:03:26 -0800 (PST)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com. [209.85.217.49])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-519eb729c81sm604348e0c.46.2024.12.16.01.03.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Dec 2024 01:03:26 -0800 (PST)
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-4b24bc0cc65so2318619137.2;
        Mon, 16 Dec 2024 01:03:26 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWB4c+1awo4npnCcyfWoZdijj/R6KBXvFppixcvuuNx2brYh8dpznpC5br8daYyI24aiU92LrbdMZvXnTya@vger.kernel.org, AJvYcCWOBD7x3pol45BWJvHkIvFTmRFJ9AS2w2J+IJ37fpjCAvnh7MXrOa3ZvJFWi9kMojDoARY507aXrNkh@vger.kernel.org, AJvYcCXHD4XPlpQ15rwEnmXK3YVu2Nhsq3+XEIBsAUdOpBNb+BimakL0+q5SpCXsZtZTUzbKqBh2HjrAXK4VtNBNZTzlemE=@vger.kernel.org
X-Received: by 2002:a05:6102:4a82:b0:4b2:5ca3:2b09 with SMTP id
 ada2fe7eead31-4b25ddc68b1mr11113902137.19.1734339806145; Mon, 16 Dec 2024
 01:03:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241206212559.192705-1-john.madieu.xa@bp.renesas.com>
 <20241206212559.192705-4-john.madieu.xa@bp.renesas.com> <CAMuHMdUK-r1iO1HXVWd_xq7u1wkLZFZ1bHeo-goe2dWY9rfQJA@mail.gmail.com>
 <OSBPR01MB277516153173A68AEDAE0FCFFF392@OSBPR01MB2775.jpnprd01.prod.outlook.com>
In-Reply-To: <OSBPR01MB277516153173A68AEDAE0FCFFF392@OSBPR01MB2775.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 16 Dec 2024 10:03:13 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXX+atcd_sM_HLeQ92rkhjf6R1jVYJ3vc1w95DM_FmtRA@mail.gmail.com>
Message-ID: <CAMuHMdXX+atcd_sM_HLeQ92rkhjf6R1jVYJ3vc1w95DM_FmtRA@mail.gmail.com>
Subject: Re: [PATCH 3/5] soc: renesas: rz-sysc: Add support for RZ/G3E family
To: John Madieu <john.madieu.xa@bp.renesas.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, 
	"john.madieu@gmail.com" <john.madieu@gmail.com>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi John,

On Sat, Dec 14, 2024 at 5:36=E2=80=AFAM John Madieu
<john.madieu.xa@bp.renesas.com> wrote:
> > From: Geert Uytterhoeven <geert@linux-m68k.org>
> > On Fri, Dec 6, 2024 at 10:26=E2=80=AFPM John Madieu
> > <john.madieu.xa@bp.renesas.com> wrote:
> > > Add SoC detection support for RZ/G3E SoC. Also add support for
> > > detecting the number of cores and ETHOS-U55 NPU and also detect PLL
> > > mismatch for SW settings other than 1.7GHz.
> > >
> > > Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>

> > > --- a/drivers/soc/renesas/rz-sysc.h
> > > +++ b/drivers/soc/renesas/rz-sysc.h
> > > @@ -42,6 +44,7 @@ struct rz_sysc_signal {
> > >   * @offset: SYSC SoC ID register offset
> > >   * @revision_mask: SYSC SoC ID revision mask
> > >   * @specific_id_mask: SYSC SoC ID specific ID mask
> > > + * @extended_device_identification: SoC-specific extended device
> > > + identification
> > >   */
> > >  struct rz_sysc_soc_id_init_data {
> > >         const char * const family;
> > > @@ -49,6 +52,9 @@ struct rz_sysc_soc_id_init_data {
> > >         u32 offset;
> > >         u32 revision_mask;
> > >         u32 specific_id_mask;
> > > +       void (*extended_device_identification)(struct device *dev,
> > > +               void __iomem *sysc_base,
> > > +               struct soc_device_attribute *soc_dev_attr);
> >
> > That's a rather long name...
>
> Will be shortened in v2. I'm thinking of ext_dev_id().

What about print_id() or print_ext_id(), which is what the function really =
does?

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

