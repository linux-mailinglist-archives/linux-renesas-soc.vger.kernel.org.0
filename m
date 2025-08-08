Return-Path: <linux-renesas-soc+bounces-20150-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 10C10B1E76E
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  8 Aug 2025 13:37:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5D34B17DF85
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  8 Aug 2025 11:37:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E91C9262FF0;
	Fri,  8 Aug 2025 11:37:03 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 873BA24DD00;
	Fri,  8 Aug 2025 11:37:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754653023; cv=none; b=j+++b23ejhugRk6GQoqw+CIb18CaPohexsqPeO/RWAUFda6s+rK6h21Ci1xkTBxsXpM6Hb5KdsoSPotjViSBJrd8or5IYtct2s6hv7EWv2RbCvvgbYqh9jvGj0sh+UIxi/4jbCIKybSclRr1W1EJP64oFFmH5lQacTr/DEQUmIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754653023; c=relaxed/simple;
	bh=gtDlUXjx3AuIpfaR6ZQLFBU3NHKGraAbdFGwcsVjn1I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YCAR8mWhujWiv+pMatI5ULvnQGfKxlz9k7CqyWGyvbjuCUlZaYv9/gdExe54Q6z0iA0ziFzGywqzN4ddVxpzWOQdpfAQ+Qve3PiCWBPnJl2t+U9czhBuJ+W9yojsVi9ItqxoFDjJruyHj3BmHHm11L6RD1NbLSGtwo/q2E3z5pQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-506374fbecbso515185137.0;
        Fri, 08 Aug 2025 04:37:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754653020; x=1755257820;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vMh9VGi52BBQxipHAd+7tDp6WMYuobiaPFMDnuSBC00=;
        b=YTPcCIsIQDet8uTJeZwn0b/5XjXFfVnCPof6GQZnUBDDZFNguF2o+2ZLKKb97uSyKg
         Zr/qhKUkdzpEQld5h2Ulta0zPvrpLlFDvuU/S2yKmuec/ZgHIRB1/7S05srPkiMckYlo
         2gwH0ouMPAnVEZgA8lIqdvA1n8rrLliqB2Y+TtfHH4f5x4UsLnoFXnzKpIYG82NuARAl
         ykYZmB34/9/7P6TCbi27RYR9vCzKyingrIne4dlN1Pq4e90qyNZ+RiGxB/u3VB3OH3/2
         Oo4rjUMcCsjVSbh/eP2mHsev/N4qujgsoD/+IcsPbLZ16nUHIPQg86O7Xdnn3Y7+gXD7
         P+OA==
X-Forwarded-Encrypted: i=1; AJvYcCU+m+1clH1xykGMoglCtQH0gwAQItcSVps2KwxyHZ4hDwPECX3UNSNlzrWm/kimqbatHjPy739C83FW@vger.kernel.org, AJvYcCXNpUr5KZX/jWc9396H9gThB6bmylQXMisixAogfHedaEsQRVt9H/93/h81VuSfmBnRr5OnwI14gXx9aKxr@vger.kernel.org, AJvYcCXmTudy5arM8ZUvnA4u9j9+ZyGx+t2GapDKgvtdjC0dod6jwaW/zAAyGN55aWNVkEdJ4WCV98Ygq66rvED95ZAsLuw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7qJWdLAiAyxnciRpU+6/ZCOVTwDE+6kQqGT6PijK7AAYC1P1H
	eM3Sv+G1egNAM46Q9mZIw5Emmk0lueq54mbbrGiR2d6ksSbsKfzkkCAqWsrqDElZ
X-Gm-Gg: ASbGncu+QMKGNYqTpdyOxqUJxiwKX5KbwbToHGXzdTTOgUZA/ZUorfNcRhcHTH17TGf
	CdjpyRnayvxMIl1ioXASp6rOBuEUkQuUD9s9d73vRqMxiAbPlmmc/P6zRUJeshgUFs4G8wKPahg
	JRrP53j285NAea/76lJMTdN7q3ikRkOxTgsitvah+vTOdHbASY/iepiDL6++WfHmrjLoJ/36uWY
	tsURFaVOl9ZWNOKvrvMhFAjQz1ALlTDVG6j0iLxCVy2CzJBNgi71H6tpzXn1cR/qeQ2xRTd6DpV
	Q18tr/mwMqbXGhK3plj4NlvgX1phbA2Cg2+Jy8LOdr11MZ62J6d/n4/Sd/XfEJVmQdxYUF/NdWO
	fTfC0U+Rj3/zIJZolQcQmNktoz5RbI6qIY9E0vDxLSjY133QTliie1OPY/JO7
X-Google-Smtp-Source: AGHT+IHZW/rxNjYRvnDyMWouFscRm/XztHZKzND7LgsohIquo/IfFKmFcrmBHqU6zXz3qkfLB4gqqQ==
X-Received: by 2002:a05:6102:4a83:b0:4e7:3efd:ac76 with SMTP id ada2fe7eead31-5060d6a6719mr916961137.8.1754653020294;
        Fri, 08 Aug 2025 04:37:00 -0700 (PDT)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com. [209.85.217.52])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-88e0268c86dsm684412241.1.2025.08.08.04.36.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Aug 2025 04:36:59 -0700 (PDT)
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-500006b3efdso1746223137.1;
        Fri, 08 Aug 2025 04:36:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVI+61KhlyvFGUI0M+PPLX5F0xs5vvMvvIYrxaPs6Sy7rWyE2mMOKsnwXrpBpZODHIOZWlDIzDDvMxX@vger.kernel.org, AJvYcCVezzfDeqJ8IeyIWNe7lNyAb9W3xYJdRwiY2GvUwQ8+JRRMSlXn6kjCyHF+5t6qyHLDp0GqrG++nm5IaBlA@vger.kernel.org, AJvYcCWXPtw60JSLNMSO8jauAj2zQAwrBkvqNiicK4chDNiSw5kFsPP3MgP0oF+BKkOaIYLZ0PrfPCO5CxGk06Znzj40vuc=@vger.kernel.org
X-Received: by 2002:a05:6102:160a:b0:4fc:1987:fc84 with SMTP id
 ada2fe7eead31-5060f4b66f2mr894612137.21.1754653018841; Fri, 08 Aug 2025
 04:36:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250808061806.2729274-1-claudiu.beznea.uj@bp.renesas.com>
 <20250808061806.2729274-2-claudiu.beznea.uj@bp.renesas.com>
 <CAMuHMdUsFFd+orb17oQqoEidzYWMRjPoqMyzpgrdnicc=MRSYQ@mail.gmail.com> <cbdfa6fd-e65b-45d7-a21f-3bfdd46af332@tuxon.dev>
In-Reply-To: <cbdfa6fd-e65b-45d7-a21f-3bfdd46af332@tuxon.dev>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 8 Aug 2025 13:36:46 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXM=Mu+vJ6n3spj7Dd+8boLXEpcSn0M1KB8OwPijqq4aw@mail.gmail.com>
X-Gm-Features: Ac12FXyw3l-ZkMLHBlhyWGduOyueyVdYtS9uJ44n_pd7DZOK2XQY3SINLE-SWGw
Message-ID: <CAMuHMdXM=Mu+vJ6n3spj7Dd+8boLXEpcSn0M1KB8OwPijqq4aw@mail.gmail.com>
Subject: Re: [PATCH v4 1/8] soc: renesas: rz-sysc: Add syscon/regmap support
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: vkoul@kernel.org, kishon@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, p.zabel@pengutronix.de, magnus.damm@gmail.com, 
	yoshihiro.shimoda.uh@renesas.com, biju.das.jz@bp.renesas.com, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	John Madieu <john.madieu.xa@bp.renesas.com>, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Claudiu,

On Fri, 8 Aug 2025 at 12:32, Claudiu Beznea <claudiu.beznea@tuxon.dev> wrote:
> On 08.08.2025 12:29, Geert Uytterhoeven wrote:
> > On Fri, 8 Aug 2025 at 08:18, Claudiu <claudiu.beznea@tuxon.dev> wrote:
> >> From: John Madieu <john.madieu.xa@bp.renesas.com>
> >>
> >> The RZ/G3E system controller has various registers that control or report
> >> some properties specific to individual IPs. The regmap is registered as a
> >> syscon device to allow these IP drivers to access the registers through the
> >> regmap API.
> >>
> >> As other RZ SoCs might have custom read/write callbacks or max-offsets,
> >> register a custom regmap configuration.
> >>
> >> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
> >> [claudiu.beznea:
> >>  - do not check the match->data validity in rz_sysc_probe() as it is
> >>    always valid
> >>  - dinamically allocate regmap_cfg]
> >> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> >> ---
> >>
> >> Changes in v4:
> >> - adjusted the patch description by dropping "add" from
> >>   "add register a custom regmap configuration"
> >> - updated the list of changes from Claudiu Beznea
> >> - dynamically allocate the regmap_config as proposed at [2]
> >> - this patch is needed for proper function of USB (as proposed in this
> >>   series) that being the reason it is introduced here, as well
> >>
> >> [2] https://lore.kernel.org/all/CAMuHMdVyf3Xtpw=LWHrnD2CVQX4xYm=FBHvY_dx9OesHDz5zNg@mail.gmail.com/
> >
> >> --- a/drivers/soc/renesas/rz-sysc.c
> >> +++ b/drivers/soc/renesas/rz-sysc.c
> > =
> >> @@ -117,7 +125,26 @@ static int rz_sysc_probe(struct platform_device *pdev)
> >>                 return PTR_ERR(sysc->base);
> >>
> >>         sysc->dev = dev;
> >> -       return rz_sysc_soc_init(sysc, match);
> >> +       ret = rz_sysc_soc_init(sysc, match);
> >> +       if (ret)
> >> +               return ret;
> >> +
> >> +       regmap_cfg = devm_kzalloc(dev, sizeof(*regmap_cfg), GFP_KERNEL);
> >> +       if (!regmap_cfg)
> >> +               return -ENOMEM;
> >
> > Is there any specific reason you decided to allocate regmap_cfg
> > separately, instead of embedding it into struct rz_sysc?
>
> Sorry, I missed to mention.
>
> I chose to have it like this as the regmap_cfg is not used anywhere else
> (through rz_sysc) except in probe.

OK.  Upon closer look, devm_regmap_init_mmio() does not save the
regmap_cfg pointer for later use, so it can be allocated using kzalloc()
instead, and freed immediately after calling devm_regmap_init_mmio().

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

