Return-Path: <linux-renesas-soc+bounces-16810-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 42CE5AAFC25
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  8 May 2025 15:55:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 255C53AF731
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  8 May 2025 13:55:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53AE322A4F6;
	Thu,  8 May 2025 13:55:49 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com [209.85.222.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DF5C1E4BE;
	Thu,  8 May 2025 13:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746712549; cv=none; b=jpCSYMkjXMCm8sCKuUuHW2X+DWvvLGW8E0flBVsPr23DC7GMpgBpB9xa5tUhc9gkn2FclE9qBW7jyU7xblRf7cPDmVLucUjJAfyqfRTPKZH0Z3fI2OoCVlCwd29L8r3j35JDQWW5zRbsT8yeBJP06pTEzjydve5COjQGr+pk8ss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746712549; c=relaxed/simple;
	bh=9yPNPSc0LUCMXjjbU4c3craIMFzHhiWcrmCoxP6V+F0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uPvAF4FhlLYfLL5Kyz+Gvqpowk2qBpJZAo0764zl6cGL4AEiKDmYn/HZzL2wPz3vPxtJqT7j3KjuxB20CPuW5v0FPy9nZmU8RdQpkJPQQ/YDLHx3a6oWfF0CJwpyGvYeAsWz0kz0lg1JH0zb2ZvRNT/j+IZPGiwqUgyjdyniiO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-877c48657f9so340548241.1;
        Thu, 08 May 2025 06:55:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746712543; x=1747317343;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TG53lCY9swcVAuETWptBrWnI+kXcrj2DMV+TDx845sE=;
        b=SWhySSNh+NfkhkJM53EEutcnzhVUBnvjhTQ+4u7UHt7HWS9cL7fO9E4Wrjxz2QbuXD
         w19vkIiPUTh+LYnt0VFGCIOidxmkoqpxI0Ey7J7nvGFYVgzkxEU3UVzOLxnVF+HKfPRc
         vQisCERwtt6Aen+UpTrsWBIS0qh41qC2Br6JOe5wwH297ohkGK++bOGbBldIunNXKo+f
         ymx1ZarkdpluD5xeytn6jSoSOqeUcTU2XelubJ3PqbFmUdgWuQ4e+TQ/SVePdE52tVkf
         +Wd9TDHm1n7QWBpKIgJb7rBXJFjFYQXV/B7G0oZgbAwYjPSX9vEUWz0ll6aqqQGItKi7
         QQsQ==
X-Forwarded-Encrypted: i=1; AJvYcCU9fsdiVJ8MjzN4Mv5tdyWI/cA1hnevZEW3OkZrwC8p4KteigwHyNzAjK66YNjhHrUUV/+Ws/B3YK4WOGZx@vger.kernel.org, AJvYcCVRvdmLcvlPIUjkfN3/YHWKC1Asv3kHOgYERU2p67OU8biqFsHVNCpPp1Rnzd8lYv4bM5jWA6ziZ5m3NWOE7cHSzlg=@vger.kernel.org, AJvYcCWHzSHp6D+0a/uRbvkOaPk614jLm0rG/AV6UCeA3wl+uqJ90ZYssekMdKwQDog+I6gV0j2yBWPKNnnu@vger.kernel.org, AJvYcCWJZOJLxeKQzc+TyLO64ZifRI5b9c0CdfPtozBGJkWzck9rvdaSV9rhjiSbxnD+xtNWSmXs2tVWqy+y@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0D7m50Vl4TKOJCz3fnKeIhDcuOSvJMRssz3+96vmwLGXiPLMB
	XMgo6bV3yzllzrCaWP2+XtFcVROlZB0UfMdqU9zXgPuVuDi8LVTl/e0fjJFw
X-Gm-Gg: ASbGncs5lnHkNL3zwyNG3sUPlMeuFrbrK8pOJBLq9VZV98ZE1FLQGPVAE/QsI0KYJzC
	jpnOw5bTyWBEteHdZt8T+Rh/uSQgJH+4hl/7/nrHNfnsPJxyMGBHanu2xR6XQ/BKTyWXoIORyw1
	r+v6BhoODdZD+MgPhCkZKxIFMHP6TqIC0jr1e4KRn/0WB6oGdqWVIgOr4bw0C30qKYTfazqNkK2
	SlXm9HaO6dkMiCBTHGNNzm71JA8act2zVuUF2oW4/rHbM9x54WNd8M4qKzzxmjYyHg7nY4JhXLP
	nkvYjSOWBL1IRR0qQvKFIII1IXGc4+6XZ37Las+MMZXv1/+DkO6Q+y3DKUfWqgpMwi+OqsTh4Yu
	rxyA=
X-Google-Smtp-Source: AGHT+IGHGVHlk0vPBsU/x6OzgEC77+U/haMrfV4lYHLuXTqNDEa0zw2GO5SddMzzg2RMkE3Y9cJmMw==
X-Received: by 2002:a05:6102:3309:b0:4d7:9072:1873 with SMTP id ada2fe7eead31-4dc738e63afmr6195059137.24.1746712543238;
        Thu, 08 May 2025 06:55:43 -0700 (PDT)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com. [209.85.222.51])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4dea85b24e3sm12237137.9.2025.05.08.06.55.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 May 2025 06:55:42 -0700 (PDT)
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-877c48657f9so340538241.1;
        Thu, 08 May 2025 06:55:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUPmzHpkV7H97l1bzgh+/3KZOGMUuFwcgus8PWfyhCEN5AADk8l6tGyNxG1gt9TvmLKTo+8ySxneyts@vger.kernel.org, AJvYcCVqSsxf0hX+zDMIu0MrV2vrShlsQa6F6UpLoVJYXw690dANCizgiCJbzVjmUYCbyvQmWnK6vI0w9mTk@vger.kernel.org, AJvYcCWAUL9JpyjJbq8mKdADD4FkgnuEVdBYox/FhrgURN278qyO6JLoNZsrLLZNR+TP0pW5dek+Ibg7MUI7XPrQX5rc3FM=@vger.kernel.org, AJvYcCWEKwWpft9ExK1fLeTjHXUGNFJT2v45zWHgh85W2XIWA15FPlqwMlSZrlknyZycB1xK8bg3Ac3LTPRZglMf@vger.kernel.org
X-Received: by 2002:a05:6102:3309:b0:4d7:9072:1873 with SMTP id
 ada2fe7eead31-4dc738e63afmr6195041137.24.1746712542587; Thu, 08 May 2025
 06:55:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250410140628.4124896-1-claudiu.beznea.uj@bp.renesas.com>
 <20250410140628.4124896-2-claudiu.beznea.uj@bp.renesas.com>
 <CAMuHMdWx9Xk5QksoGFvCyo2HLXZ_+WRBCe3bDrZx=bfPoXHJgg@mail.gmail.com> <df05d999-8eba-4fbd-93f6-7919f73da11a@tuxon.dev>
In-Reply-To: <df05d999-8eba-4fbd-93f6-7919f73da11a@tuxon.dev>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 8 May 2025 15:55:30 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXQMtTuvi+VzEN-OkGNneoxngrcyxffG80gk73GMN8Fpg@mail.gmail.com>
X-Gm-Features: AX0GCFtHcX-rwmtxLJu-ieDhfsL3iAqABkUt_x6vV19TS74XV00cFj1CzKSYXKw
Message-ID: <CAMuHMdXQMtTuvi+VzEN-OkGNneoxngrcyxffG80gk73GMN8Fpg@mail.gmail.com>
Subject: Re: [PATCH 1/7] clk: renesas: rzg2l-cpg: Skip lookup of clock when
 searching for a sibling
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, magnus.damm@gmail.com, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Claudiu,

On Wed, 7 May 2025 at 14:12, Claudiu Beznea <claudiu.beznea@tuxon.dev> wrote:
> On 05.05.2025 18:52, Geert Uytterhoeven wrote:
> > On Thu, 10 Apr 2025 at 16:06, Claudiu <claudiu.beznea@tuxon.dev> wrote:
> >> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> >>
> >> Since the sibling data is filled after the priv->clks[] array entry is
> >> populated, the first clock that is probed and has a sibling will
> >> temporarily behave as its own sibling until its actual sibling is
> >> populated. To avoid any issues, skip this clock when searching for a
> >> sibling.
> >>
> >> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> >
> > Thanks for your patch!
> >
> >> --- a/drivers/clk/renesas/rzg2l-cpg.c
> >> +++ b/drivers/clk/renesas/rzg2l-cpg.c
> >> @@ -1324,6 +1324,9 @@ static struct mstp_clock
> >>
> >>                 hw = __clk_get_hw(priv->clks[priv->num_core_clks + i]);
> >>                 clk = to_mod_clock(hw);
> >> +               if (clk == clock)
> >> +                       continue;
> >> +
> >>                 if (clock->off == clk->off && clock->bit == clk->bit)
> >>                         return clk;
> >>         }
> >
> > Why not move the whole block around the call to
> > rzg2l_mod_clock_get_sibling() up instead?
> >
> >             ret = devm_clk_hw_register(dev, &clock->hw);
> >             if (ret) {
> >                     clk = ERR_PTR(ret);
> >                     goto fail;
> >             }
> >
> >     -       clk = clock->hw.clk;
> >     -       dev_dbg(dev, "Module clock %pC at %lu Hz\n", clk,
> > clk_get_rate(clk));
> >     -       priv->clks[id] = clk;
> >     -
> >             if (mod->is_coupled) {
> >                     struct mstp_clock *sibling;
> >
> >                     clock->enabled = rzg2l_mod_clock_is_enabled(&clock->hw);
> >                     sibling = rzg2l_mod_clock_get_sibling(clock, priv);
> >                     if (sibling) {
> >                             clock->sibling = sibling;
> >                             sibling->sibling = clock;
> >                     }
> >             }
> >
> >     +       clk = clock->hw.clk;
> >     +       dev_dbg(dev, "Module clock %pC at %lu Hz\n", clk,
> > clk_get_rate(clk));
> >     +       priv->clks[id] = clk;
> >     +
> >             return;
>
> This should work as well. I considered the proposed patch generates less
> diff. Please let me know if you prefer it addressed as you proposed.

Given you have a later patch that contains a similar check, postponing
setting priv->clks[id] looks like the better solution to me.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

