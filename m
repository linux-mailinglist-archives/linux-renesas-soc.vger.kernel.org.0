Return-Path: <linux-renesas-soc+bounces-22192-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A74EBB94B65
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Sep 2025 09:11:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 42089168660
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Sep 2025 07:11:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B269B3019D0;
	Tue, 23 Sep 2025 07:11:44 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D09EB254B19
	for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Sep 2025 07:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758611504; cv=none; b=dBim/hLdWES14MY5hqn0Si9iGoKqGP/ixiF0TWttPoZsLtPibIcOdIjcTAk2NLdH2Wz53rpbxQisi3TexIunhRjJZV6cUnUZ9GCeskETPa1h64Eey6wyhVyfc/lho+AjUJpQbHK40f/+i5MBNOpQNfuxSW3h06GfNA37Y5M3OIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758611504; c=relaxed/simple;
	bh=lABsp8gvjknFQ37de9gqAnMwmx0hTbvHeH1QVV9Be5c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ap1oH5ypMZBVxPgOLuOD3yARQoAGyVXfnxs6flCJ/9BZGsxBO5PJdY0VmSBznFOROc383GExCpYpMGkIC1BtjeP4Ggoxr9y8oDjv6TJi15UoDod46fbZZXT36goKN1G6+M8f6Fgw0tEy9mc/rQqY9oS/m56i0CVvIuCwG/0JxL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-890190c7912so1308236241.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Sep 2025 00:11:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758611501; x=1759216301;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pFsTdKxavgCQUg2QQGOIC2nf6+AvLxajlrLtSjRxAuk=;
        b=xTlqg/PqmxrYftSUzXK7tMu4ZNVtP9jkWDJWq1Z0N1n+1Mh/I/4mm7EgaOGMV+MutU
         sxZjK/JDIObikeNXMHhcrxKcLQXOFImDvXj8NOHnZG8ynO/IFihsorn+c/kg89/GjUtY
         Vk/c/itcWTotXNdqn3WSLV8mchPzUzEKx50sVJNCfuicSPYaze9cLz36ZH14ZJYM/Alv
         amQx8gc8SezkSprM02shz15kdAbgg+rruMmzy20TBny1dQkcHd62m3eH/Zb2K4+PhmR+
         xWkKBDLV8vADLutOtD1L7Ladhk9mSckf0lQPUAUC2Mh+W3pZrkYnPUk5QjJoYNp1YUlL
         CNyQ==
X-Forwarded-Encrypted: i=1; AJvYcCXeWbJqK938iMFcwe6KG3EWaJmstKCOjPqXoo4F07QJgJVh1L0HqsKNayVT2JtqOiVDGZwWXhoQQmKQutVPrxc4kQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxkhvjzcbLlG+9srp4wEbzSUWANKMesRTHi/snieGIYtDnnKKX4
	gqcW1MDQTd9uvIsIyKkwkbXfyNvSzrvw/GDERR4kGCrHBkVHZ/5NEOWjH+ARnQQn
X-Gm-Gg: ASbGncvJjmR+QC7DF+n6n8IZzYgo0szZN5gS+hLKRMU0zX/HLidnN/p9PP6L/h3pbKi
	yaW5ugiGRNAbXuEslnF8jNbo1cRQGQQ0syGvauKicG95HNTxSK+m+cFXF/b6jEVy03rYgG43Vhp
	HqIxwJSSnpL7Q5+0QOiRhIxZLm58Oy2TB/Iqe6P5qvH/wtrogiJKN6IrCHVss9g88Ng/a4P1wqg
	hQ0GiS3CxpGTVLpNdMeRKvKoklOl42ZCwyC7febFEHO6ptpzy+QG7JmEuOdhHqZT6VZwT1rJavP
	L67DOIDGQ6BzuY2Jpcb4lrf35IBiov229mxd1b1132LaHydol1imngJAzVUmnLakUhzGFV20i35
	vYq5om+AkQ/rkXIgMEd0dvEvk8DIjrxMbgva05/AaOz9o4pUKaRGxWti4tN5g
X-Google-Smtp-Source: AGHT+IF5IeVe+se0nqdqnOt2fif3UF++QorlL9juuODmTPYaHrgWage0Q2MjAV3B39TNys1ZI8OEsA==
X-Received: by 2002:a05:6122:905:b0:54b:c31b:9380 with SMTP id 71dfb90a1353d-54bcb1db394mr388946e0c.10.1758611501495;
        Tue, 23 Sep 2025 00:11:41 -0700 (PDT)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com. [209.85.222.53])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-54a9928f32fsm1673247e0c.6.2025.09.23.00.11.41
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Sep 2025 00:11:41 -0700 (PDT)
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-892196f0471so2066445241.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Sep 2025 00:11:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVgV4N3NiSxHeTdIsAFPwcUYzEr3Kkaj75B2OfEZSTbdMTYR3KhpSdPFVETpZCZfKNmbrDKRt0X64WXfjs0upsCtA==@vger.kernel.org
X-Received: by 2002:a05:6102:6a8b:b0:5a2:c93c:8f82 with SMTP id
 ada2fe7eead31-5a575a9a98cmr503789137.9.1758611501039; Tue, 23 Sep 2025
 00:11:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250918134526.18929-1-marek.vasut+renesas@mailbox.org>
 <CAMuHMdWncCJQ_5uiATC+JhGr8K2ewO72L0DTWXtcx-OF-P=zVQ@mail.gmail.com> <196d5c6d-0bd6-4dd5-b3ea-c8166b2bd830@mailbox.org>
In-Reply-To: <196d5c6d-0bd6-4dd5-b3ea-c8166b2bd830@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 23 Sep 2025 09:11:29 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW=WTTvhfe_qRBsp+T2cEC21Y62_O_Zhj_eUApqNdoX6Q@mail.gmail.com>
X-Gm-Features: AS18NWAc9jYFHCjAWopmo_SZ1H2hwwG12zzTpMASIYI_DARZ5FZlGm7NHgYnia8
Message-ID: <CAMuHMdW=WTTvhfe_qRBsp+T2cEC21Y62_O_Zhj_eUApqNdoX6Q@mail.gmail.com>
Subject: Re: [PATCH v2] clk: renesas: cpg-mssr: Read back reset registers to
 assure values latched
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>, linux-clk@vger.kernel.org, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Marek,

On Mon, 22 Sept 2025 at 18:24, Marek Vasut <marek.vasut@mailbox.org> wrote:
> On 9/22/25 1:35 PM, Geert Uytterhoeven wrote:
> >> --- a/drivers/clk/renesas/renesas-cpg-mssr.c
> >> +++ b/drivers/clk/renesas/renesas-cpg-mssr.c
> >> @@ -676,18 +676,31 @@ static int __init cpg_mssr_add_clk_domain(struct device *dev,
> >>
> >>   #define rcdev_to_priv(x)       container_of(x, struct cpg_mssr_priv, rcdev)
> >>
> >> -static int cpg_mssr_reset(struct reset_controller_dev *rcdev,
> >> -                         unsigned long id)
> >> +static int cpg_mssr_writel_with_latch(struct reset_controller_dev *rcdev,
> >> +                                     char *func, bool set, unsigned long id)
> >
> > This function does a bit more than writel()-with-latch, so please find
> > a more suitable name. Or... continue reading.
>
> I did so in V4.
>
> >>   {
> >>          struct cpg_mssr_priv *priv = rcdev_to_priv(rcdev);
> >>          unsigned int reg = id / 32;
> >>          unsigned int bit = id % 32;
> >> +       const u16 reset_reg = set ? priv->reset_regs[reg] : priv->reset_clear_regs[reg];
> >>          u32 bitmask = BIT(bit);
> >>
> >> -       dev_dbg(priv->dev, "reset %u%02u\n", reg, bit);
> >> +       if (func)
> >> +               dev_dbg(priv->dev, "%s %u%02u\n", func, reg, bit);
> >> +
> >> +       writel(bitmask, priv->pub.base0 + reset_reg);
> >> +       readl(priv->pub.base0 + reset_reg);
> >> +
> >> +       return 0;
> >> +}
> >
> > Now, do we want a special de(reset)-with-latch() function (which does
> > reduce code duplication), or would a simpler variant be more useful?
> > After this, we have three different "dummy read" mechanisms in this
> > driver:
> >
> >    1. Clock enable/disable and resume on RZ/A:
> >
> >           writeb(value, priv->pub.base0 + priv->control_regs[reg]);
> >
> >           /* dummy read to ensure write has completed */
> >           readb(priv->pub.base0 + priv->control_regs[reg]);
> >           barrier_data(priv->pub.base0 + priv->control_regs[reg]);
> >
> >    2. Reset handling on R-Car:
> >
> >           writel(bitmask, priv->pub.base0 + reset_reg);
> >           readl(priv->pub.base0 + reset_reg);
> >
> >    3. Reset release on RZ/T2H and RZ/N2H:
>
> Maybe T2H support is not yet upstream , even in next ?

My bad, that is still under review (and I didn't even have the latest
version in my local tree). Latest version is
"[PATCH v3] clk: renesas: cpg-mssr: Add module reset support for RZ/T2H"
https://lore.kernel.org/all/20250905114558.1602756-1-prabhakar.mahadev-lad.rj@bp.renesas.com

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

