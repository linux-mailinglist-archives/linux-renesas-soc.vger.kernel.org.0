Return-Path: <linux-renesas-soc+bounces-17418-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C1905AC1E93
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 May 2025 10:23:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 32131188D35F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 May 2025 08:23:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 343B728750F;
	Fri, 23 May 2025 08:23:31 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9644528750C;
	Fri, 23 May 2025 08:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747988611; cv=none; b=OhOtjqZLqNBji7zzVxnMlNX96JuiOJJ6Mh6o9RGCD0bMk/CDoippB1NdKzzYDtsvp6pbQYpfOm1G0l2NW6fDFnlo4CrdJ8sAMtukFO/b4oKslowidM9p0Ew3Ovh0qBHwZu/sTQ4pqEQoVg7mHoQHRRGbGxyRRvc5TGibZVFYSzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747988611; c=relaxed/simple;
	bh=/n7IuSaBmXXb5qi6uBnpAH5RZvgbQZh7xBIBVxR1ME4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DexUGT/kUVsOdGH64FtRxiZLLnWLctuq14lavpsGN7ytHB0bkjlftaT8h+lFjB2I1/MJ/YZcgEgVFuDhsj1L9nV/EijCI4MI+TZSdxb+Uj6QaoBiCcY0t5osMtmxxfAuRrhTNz29JX2raRYWRfbYXrK+a1SWXs9aUMJZsdBC/g4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-52e0d047d31so3735715e0c.2;
        Fri, 23 May 2025 01:23:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747988608; x=1748593408;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=16h2I7GAa27h9TCDuiVKU8pT4EsEtcrnSdTfaMvWiaU=;
        b=VQbl8U/AGFN/PGVRCcy9vhMrdvFvGjJM8KUgfyyMjf4eAWKHVIBw+yeqrmCVFRiptX
         829HJ2J4uGhwHkAyR4E3PO9iLomnkvUTa2nLvPxHNml+6H0WucS1gd/Wm+Hz/ef6xQuO
         Uchin53UBhbO6faK45zlDT+L49p0+9zKn7NqP4aJC33rKfqYvLlR7G3Tu2zRYe9jVHpr
         b1gUAPAEmaqpyb1W+Nm70/+qO6uRnXfx0wlqi59bLJCO4vZgqA9nSzCBN6Nvl7scvMWU
         zRVFHHwEUgB7B0v7KsbZMOIl4si/oaBZVoHvs8mzNBimrZDJgcw7NY3p6Q0ekQyEr3I2
         zqzw==
X-Forwarded-Encrypted: i=1; AJvYcCVWA/NIEZG80YdeaEjdpyVP5NB0xod86Rkb2a45gm8SF2ib+sGhhtRPzIybDZAcy8mivac92l+SQZI=@vger.kernel.org, AJvYcCW3gaSnGPIX2VuM+omnTUcIwUqXgo6KRrYTUei0HWSidp67TBm4+NjP16nf8ubPA/jI+GXtlNVEMPSzRdz83I89UGM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxuj4THOaex4ez91K330Vqfbnzh9vHGBpZq7NvSH0KZ1Zm5uHTJ
	XYG3q2UASG/ik5pjol3VY8YqvNsBJbQxxSmgnEkxt0Bn0l3EHVMOhcAbSZWUfAOx
X-Gm-Gg: ASbGnctW3d2fyiovOjBfdINvLt9yaAmKNzs2FlRDP8Kf0OQtTE5+JxUoaJofrs67bzX
	SJ1PogaviOrsQSHHYPGtEdXmeei3WQb5WgEryWhWoA39JYWoUIg5WokeBe453cxOL6BHWFawyHx
	iiJl7eiPA0rgT7VUnlVoV6cIOwp/5CzE1EmybTKSxps6273EBEEIUCFHpA8R5s7ykI4AFtM2rt4
	Wpe6TKWCmEhbRIwOA2QAd0BcujbSvReV9JGYF5iP1c2HtUtSRlzGIOeb3eiAYYWHuVnhjaZQ3s8
	SoHAD/Yo0/bV4JiSzjetMn530y4ZwHZbthNgTmOKGI3lXKtEOvr6YddkefErzO68JaiSmEaCydy
	OjPeRACs7YDS10w==
X-Google-Smtp-Source: AGHT+IEj4nyBa1yQQrQ6mQGV8RERDj/kYa4WKo/Sbq8dWQqJk9HSK5YKym4fZ8encPGt7C7QpxwuuA==
X-Received: by 2002:a05:6122:1acc:b0:520:4996:7cf2 with SMTP id 71dfb90a1353d-52f1fed85e1mr1254594e0c.10.1747988608119;
        Fri, 23 May 2025 01:23:28 -0700 (PDT)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com. [209.85.217.52])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-52dba910901sm13062641e0c.2.2025.05.23.01.23.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 May 2025 01:23:27 -0700 (PDT)
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-4e150f1ba9aso4744381137.2;
        Fri, 23 May 2025 01:23:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVRK/Jup13V8XLAut6GM7ddYbsq4LpUPlLP40sulD/y+7VL8FkF0t53yc59YMiJXrg6cy7fNYhSjWY=@vger.kernel.org, AJvYcCXUriCKi7eHbRwMC97rzn8XCwHw6XfV9rXdchVirZwM1adDwfHkflUpSCgDRSDBWVDeI7gQo+gDHnqeapHY3/+rUig=@vger.kernel.org
X-Received: by 2002:a05:6102:e06:b0:4df:9e8b:8cad with SMTP id
 ada2fe7eead31-4e2f1a6a477mr1512818137.22.1747988607768; Fri, 23 May 2025
 01:23:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cb0d43138aa443578dcfdaab146bf9215cde9408.1747927483.git.geert+renesas@glider.be>
 <3e8f1df2-5da3-4db1-9fca-2cc9b4d0c0f9@tuxon.dev>
In-Reply-To: <3e8f1df2-5da3-4db1-9fca-2cc9b4d0c0f9@tuxon.dev>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 23 May 2025 10:23:15 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV6Xi_bbu7XvFRjA2QXKm+QYbhmC4Y10=aiXUHpuL7vbA@mail.gmail.com>
X-Gm-Features: AX0GCFsq1o8Nt7e6cNSh-xYPQCpEN3_KUZIfR8BXGfWezat2htGEGj8C2QLJMtI
Message-ID: <CAMuHMdV6Xi_bbu7XvFRjA2QXKm+QYbhmC4Y10=aiXUHpuL7vbA@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: rzg2l: Rename to_mod_clock() to to_mstp_clock()
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Claudiu,

On Fri, 23 May 2025 at 10:00, Claudiu Beznea <claudiu.beznea@tuxon.dev> wrote:
> On 22.05.2025 18:26, Geert Uytterhoeven wrote:
> > Rename the to_mod_clock() helper macro to to_mstp_clock(), to match the
> > type of the returned structure.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> > This depends on "[PATCH v2 3/8] clk: renesas: rzg2l-cpg: Add macro to
> > loop through module clocks"
> > https://lore.kernel.org/20250514090415.4098534-4-claudiu.beznea.uj@bp.renesas.co,
> >
> > To be queued in renesas-clk for v6.17.
> > ---
> >  drivers/clk/renesas/rzg2l-cpg.c | 12 ++++++------
> >  1 file changed, 6 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
> > index dc92f09d5616223b..9449a5a5714302f8 100644
> > --- a/drivers/clk/renesas/rzg2l-cpg.c
> > +++ b/drivers/clk/renesas/rzg2l-cpg.c
> > @@ -1200,18 +1200,18 @@ struct mstp_clock {
> >       bool enabled;
> >  };
> >
> > -#define to_mod_clock(_hw) container_of(_hw, struct mstp_clock, hw)
> > +#define to_mstp_clock(_hw) container_of(_hw, struct mstp_clock, hw)
>
> I don't know the history behind this, but, I think it should be the other
> way around for this driver, I mean change "mstp" strings with "mod"/"module".

I considered that, too, until I saw:

    /**
     * struct mstp_clock - MSTP gating clock
     *

> The RZ/G3S, RZ/G2L HW manuals mention "MSTP" string only as an abbreviation
> for "Module stop state". You can find "Module stop state (MSTP)" string on
> sections describing the MSTOP bits for individual modules.
>
> Instead, those manual refers to the clocks of individual IPs as "module
> clocks".

OK, to avoid confusion with the mstop registers, I better change it
the other way around, and rename the comment to
"struct mod_clock - Module clock".

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

