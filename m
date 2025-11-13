Return-Path: <linux-renesas-soc+bounces-24599-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id ED2F0C59CB6
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Nov 2025 20:39:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A14E14E0223
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Nov 2025 19:39:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E82E33164D4;
	Thu, 13 Nov 2025 19:39:18 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67E0E311941
	for <linux-renesas-soc@vger.kernel.org>; Thu, 13 Nov 2025 19:39:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763062758; cv=none; b=O6LmZUpdK/NV6UAQVzavTO1AOgPf92yWDbVmGIL0dvjtNvRH59MVO7bz9PQiQcZyi4h8NjSzNEY6CNgX4PDEBV7tnqoFD8WadofD03TGdr1nQ0sGL7TcOUZWC9H5ioiVk9E/OqhnGnJYGFOQ+xN9fdBaTx5sSxH7MZT15VMrVNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763062758; c=relaxed/simple;
	bh=KrVPSr030oztfxZIPgcjWHnLE170syEv/sQVsiYj6tU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TucrvbFLNqGRu/UNU9nnu+ZCa3R0iS6EMwPoGQHA6kCPCCG0errczRBS3ztVu9uzOJ2PHAQ66K7r589WTUYntDDUWk63Yw0yYhfMGduzW3/3iT3Dd7I3qxg/8cWi7M/NOcrVa7pEAk6xkyJD6xP8ufd+9/82FrpCuU66hnhDtMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-93516cbe2bbso367230241.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 13 Nov 2025 11:39:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763062756; x=1763667556;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7pTcM33l/BUAPozIzYP9jhGNhpCj6nx3D59IiN3ZLnk=;
        b=pPsfgWbqSQXZWgGm0Z51iLrWpaonkgDNqivbDQiBXgaJcbdqdLSB0mqHdtF9QVWkUK
         0MMx9YHhDR70xeN6+f6Is3NWbTwiAMxR/8r5+YpmuqIVGZQUwF64rbgPybW+cLhUT6OG
         6kwS2/eGJcDlBGWBkKej1wqv0BSu8dFEragkabgB1tgQn6xblm9dBWaHGtkOhpcXFou8
         rLILjpx11rqY+vcFXEpsMJxXis2CUqaVPmjf1ZDecIWHOt/yLg0V5kVpKkQI+aQeAtlT
         72QF289EmtujE3DVDPF2CfafPTNsw0PCa1iW8MLKFZtyDWiXQlS2Dum/Ho0jhmsvnMSu
         JThA==
X-Forwarded-Encrypted: i=1; AJvYcCW4Mo1Kvwf2mlWrr5ayLjppmEYgknSOxe5qsFARofI9evs6mkG8V+Muj2qB6IA6LNuQKno02D+698Nm0tmrMOWqDg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwJ+30anxxb8RcQBzr+VlcFiyWiSxukfqySMxH/B6esjWjZo+l5
	ChXQyVE2rt4thFJAOHMdNaJHZUSdjpg6N/JOH+lCz4cXBvh7DN25kHlh2YB3cab382I=
X-Gm-Gg: ASbGnctgTOE03/Lzfn/iIt9gIzTdxe3URB9gvmR4kty3moRrZRwKgqu0y2HR8NBCra+
	8AGRAZHXhO6HIzV0H24BmDTAPM4/RxgGGmprY3dcdv1ACflhy22FjyKRZWGxH9bAkhkaRqDA/Wk
	laBqchzKI12L0HrmDwQ4OihamZ6OYkbI6dO3OMHpoByf6GmjLn3IAsL1J7u2MBOX37BY0apBdSz
	poVaDlweY6sshCysFPnsSbd54Qf6SRq2sJUUt/Kv/N9mscs/AohgY7MSZYrWdFSl1zqdne2AH8R
	XUhnoOxw/Zy4CPHi+x9TbZRFL8l0oJlZtunSVp2GZ3gYgszwe5iFNW0Z1Frgol9OYXz7Ihd80v+
	20uMTIXMt1XSKZSAsD7f81T7Ey6l6Uq+b0bM/4uBTYRDRLvlkaUv0zlPft2olwZC2GCC3Ccvvqy
	Q5pb6VrvQ+eKtxIULzVQrL3Qs/XAmV3hI8tfAxkg==
X-Google-Smtp-Source: AGHT+IHVF30GGV/7neTGBxPTvhu7x9JnTNYmrPpNyvV9fOYlRIDJ/+5ekrr9/sLSow5kNyq+SnHwuA==
X-Received: by 2002:a05:6102:4193:b0:5df:b2cd:12b8 with SMTP id ada2fe7eead31-5dfc5a6e91emr450175137.30.1763062755975;
        Thu, 13 Nov 2025 11:39:15 -0800 (PST)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com. [209.85.217.51])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-55b0f35db02sm974413e0c.9.2025.11.13.11.39.15
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Nov 2025 11:39:15 -0800 (PST)
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-5dd9bfba5bbso423249137.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 13 Nov 2025 11:39:15 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVE1jM7a+HaEK+VXHAZdZQDOLlQjXfakvS75je5jx1twGWuWGVSjfPuHcRte6xKJZfOffcm3LfXkI17Mby19g2Gyg==@vger.kernel.org
X-Received: by 2002:a05:6102:3584:b0:5db:3d11:c8d6 with SMTP id
 ada2fe7eead31-5dfc54e8119mr433490137.5.1763062755344; Thu, 13 Nov 2025
 11:39:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251027154615.115759-1-biju.das.jz@bp.renesas.com>
 <20251027154615.115759-2-biju.das.jz@bp.renesas.com> <CAMuHMdX4YxaU4KQoAF+hhfOfqGtRH-xSRgNqLp8dyEU29z5z1g@mail.gmail.com>
 <TY3PR01MB11346CB74E94956AC93A9471C86CDA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB11346CB74E94956AC93A9471C86CDA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 13 Nov 2025 20:39:03 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUxyg=ky8MhRVhsFBpkEGfZ+TxmAZTbt0V=BvARz1Q2Kg@mail.gmail.com>
X-Gm-Features: AWmQ_bkbG8_TdPRJtSgGPoKrasUmNhVEi6af3-UdoFhIEOwJ_G61yii6AUJLKgk
Message-ID: <CAMuHMdUxyg=ky8MhRVhsFBpkEGfZ+TxmAZTbt0V=BvARz1Q2Kg@mail.gmail.com>
Subject: Re: [PATCH 01/19] clk: renesas: r9a09g047: Add RSCI clocks/resets
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	"biju.das.au" <biju.das.au@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

On Thu, 13 Nov 2025 at 20:35, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > From: Geert Uytterhoeven <geert@linux-m68k.org>
> > On Mon, 27 Oct 2025 at 16:46, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > > Add RSCI clock and reset entries.
> > >
> > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> >
> > > --- a/drivers/clk/renesas/r9a09g047-cpg.c
> > > +++ b/drivers/clk/renesas/r9a09g047-cpg.c
> > > @@ -218,6 +224,106 @@ static const struct rzv2h_mod_clk r9a09g047_mod_clks[] __initconst = {
> > >                                                 BUS_MSTOP(5, BIT(13))),
> > >         DEF_MOD("wdt_3_clk_loco",               CLK_QEXTAL, 5, 2, 2, 18,
> > >                                                 BUS_MSTOP(5,
> > > BIT(13))),
> > > +       DEF_MOD("rsci0_pclk",                   CLK_PLLCM33_DIV16, 5, 13, 2, 29,
> > > +                                               BUS_MSTOP(11, BIT(3))),
> > > +       DEF_MOD("rsci0_tclk",                   CLK_PLLCM33_DIV16, 5, 14, 2, 30,
> > > +                                               BUS_MSTOP(11,
> > > + BIT(3))),
> >
> > According to both the clock list and the clock system diagram, the parent clock of rsciN_pclk and
> > rsciN_tclk is CLK_PLLCLN_DIV16?
>
> Thanks, you are correct, I will fix this in next version.

Thanks for confirming!
I will fix it while applying, i.e. will queue in renesas-clk for v6.19.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

