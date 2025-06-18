Return-Path: <linux-renesas-soc+bounces-18498-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D5A3ADE985
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Jun 2025 13:02:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7E0BB189D891
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Jun 2025 11:02:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6554C286D5F;
	Wed, 18 Jun 2025 11:02:34 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5389217F34;
	Wed, 18 Jun 2025 11:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750244554; cv=none; b=ounElB3IzBCmYsfqyNRwPCZY3AO4uBqee830KmGDGFYAWk3iaVqQEu/4yiOl+C9vGR7e2Mr/LiKeNVGHn1PcJ0xg0yB6BidEryLmHn7A65HxEqzH4N1BorYfrGGupXhkVVw+/xVvIolUWJr47HLIb3KBpyPFH7HEI8eJ0sVp+ZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750244554; c=relaxed/simple;
	bh=8Mdl41yfkwjBum/UK7UDtzh/9HHF0ZU7up4KckhO50M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=duiTgl4s4BJbc9BP/UT6kCyJh4WebzTEKdNqhTpCBa/J/44sVhz4QgorsAxZrBc8rCCO+PXi4VnshjL1s+/DwaQPrxij6oxDhGpMyjm0T0ghQwNjHtGX8N18UZsBKgk3Iu+2BoSR7tZrNDvL6dlWAvxtpw+5ltHNW/z3CkT9/bQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-7d3e7641b76so50546585a.3;
        Wed, 18 Jun 2025 04:02:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750244551; x=1750849351;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X7K7lx2GqYzdK1GvyZH3DgcdbSQTTX8Ktyuv5Fd5USQ=;
        b=gCOTw91ddKdpAVcQS64NucKluveUp2C8/ZALdY1RziHkcVLi30TbIcRgIqKDEtAeJA
         Q4hn4wXAroxlrQ5LVp7rpB2H6Bi9/ZOuWCtEXET08vjnNleaMUzfx+OGQ2r6ym9qBLZ6
         L6DBJPBcSedUSevF0Ejr6BMhTRj/3/qqXWiwXhBNRDfOgRnp++F2xwobwlVZWihgymxv
         FsW9F/q8H8Pxxj8IQemCQPTTD5uvzb1KdqVl+d+jsygKlxmzTX1/dNVcIn7IirW6r3+G
         V6aQCNc82OD+uDrhTa6Qf2SquTlhOGlUK5RePVcUjDCgif59m07O76Wq5dICU0/VL1OI
         ZRIA==
X-Forwarded-Encrypted: i=1; AJvYcCV1BnqKZZ+zLdpXrXkcJxOtEqhDpCTECb0vGN+kA2vIkhayywFC3jiYpP4Xach+mEySba+1xofDacqCK4GV@vger.kernel.org, AJvYcCXog2sUwtjTfR39cve5/js2l3QLlAta1d8F+JiwKSKhwkoaVpOMXt811Gp/PDwyfOOFR+P8X+OcOfVG@vger.kernel.org, AJvYcCXw8UIkpd192bDpk7JYADy/CxSwDhvKVYxJx1jMHGYXfUueE5B5KgLfWNPEBMFz7HEnrxWbgpQp@vger.kernel.org, AJvYcCXwrOZPt1BxoDrtApwp0bshRqnb+d3Dx8xxeyxNGfcd3sUca+QhveyEFyDajeV5t5ySWGeYR3uObpQeGNdo0MwyuMU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyeUndIRHms1ZJYXGNeynii6KJetL7viLGXqAbi1ZoSjDfCaUQN
	aMTn3SImpP0PQknNBjOm4Zw2d0j1g/QWIiHQ6cCUY4oZE75Bzha1xRHKi+Slm08C
X-Gm-Gg: ASbGncsj4E9lBzOAn8Ak4qRrzquLztVqE+owwa+QaG3VABwqFLqBB7LsH1ghp5B+C0L
	0T4OFr+bMGvqIvLZ2jkD32tp9RpjR8vKRVmjXB0DEE5Qoln2q7kQ8uLkmpbYj/C31qMeKyYWXW7
	RcKFhsenF8qjcMQMY382UBbz4CO549Yr23S7M9hEa4iiy6uM6VhLxOZXqgW2VhPxKVQkf2prafn
	PvnO/H2XdIjTGW1a0z91+TzFX5mv4cz6nk1hUxtLtr9HMFbc4AAqPJP7zOq5tPj46Lew3Q1AeFN
	nQFUYQtxdc8ODi0Ay3e7TbjzrM2I/YJNC/78lOPSwPKCV4UzCcmjAQdfGwndDFuQCNmmmuTsNQj
	oRklim7VUNumx3pIRZvSXKUF46Cdx
X-Google-Smtp-Source: AGHT+IGk2QTS5CdQMaCrT54yLjS7GK+WjrRV4TvLYgVzmSrxSlhdyC4K2H4/i7pdT76BYCDRBFikHQ==
X-Received: by 2002:a05:620a:17a1:b0:7d0:a30a:5609 with SMTP id af79cd13be357-7d3c6c1ee79mr2291218885a.21.1750244548700;
        Wed, 18 Jun 2025 04:02:28 -0700 (PDT)
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com. [209.85.222.182])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d3e77b827fsm79542785a.15.2025.06.18.04.02.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jun 2025 04:02:27 -0700 (PDT)
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-7d20451c016so386594485a.1;
        Wed, 18 Jun 2025 04:02:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUF+XcDXETGmzSsEzBdb9SaMUVudSZxUBqM0SvgjVOXxZwvolWdn8ENJAPXTaUXi8rl/qLbM6379TFrEt9PiKN/aPQ=@vger.kernel.org, AJvYcCUf0qFoqSzI8uk6aoLR41FtnHvSjWFpkSuo0BrL+1iaD2/sGq1zPcqFBNtTTjc9hqfMCJquHPL89s5s@vger.kernel.org, AJvYcCVFcy8O+1Us+pAhDvKNC59UduiJLPZ+o1lClbQC5n8+9Cci3+FTHMg4HFvKObxBnnaUROGOci0cRDovcAfa@vger.kernel.org, AJvYcCWBNjHoyUW3+6qMoyMYT26MRvH1XR6b/QsHAQVFQvDMNtAHZQpvkgLQbhTzDnFykGWDSmNTEVuH@vger.kernel.org
X-Received: by 2002:a05:620a:278b:b0:7d3:edb1:40b6 with SMTP id
 af79cd13be357-7d3edb143eamr109245885a.12.1750244547119; Wed, 18 Jun 2025
 04:02:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250611061609.15527-1-john.madieu.xa@bp.renesas.com>
 <20250611061609.15527-2-john.madieu.xa@bp.renesas.com> <CAMuHMdXE-C4FAXOfzQv8xfgFytwpqkARDORGLkosZtCsjK8nmg@mail.gmail.com>
 <OSCPR01MB14647EFA0DA38119F00DF1D50FF72A@OSCPR01MB14647.jpnprd01.prod.outlook.com>
In-Reply-To: <OSCPR01MB14647EFA0DA38119F00DF1D50FF72A@OSCPR01MB14647.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 18 Jun 2025 13:02:13 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWnz3VUeFaJBEgLc0F_gGkdm679H4YqFFuRAEVFKZd8OA@mail.gmail.com>
X-Gm-Features: Ac12FXwUhhR0-G19jUbGUyODnf8a2OCL8fitfccPJVj6VynoDqAvtG10jGJpeA0
Message-ID: <CAMuHMdWnz3VUeFaJBEgLc0F_gGkdm679H4YqFFuRAEVFKZd8OA@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] clk: renesas: r9a09g047: Add clock and reset
 signals for the GBETH IPs
To: John Madieu <john.madieu.xa@bp.renesas.com>
Cc: "andrew+netdev@lunn.ch" <andrew+netdev@lunn.ch>, "conor+dt@kernel.org" <conor+dt@kernel.org>, 
	"davem@davemloft.net" <davem@davemloft.net>, "edumazet@google.com" <edumazet@google.com>, 
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "kuba@kernel.org" <kuba@kernel.org>, 
	"pabeni@redhat.com" <pabeni@redhat.com>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	"robh@kernel.org" <robh@kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"john.madieu@gmail.com" <john.madieu@gmail.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"magnus.damm@gmail.com" <magnus.damm@gmail.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi John,

On Wed, 18 Jun 2025 at 12:04, John Madieu <john.madieu.xa@bp.renesas.com> wrote:
> > From: Geert Uytterhoeven <geert@linux-m68k.org>
> > On Wed, 11 Jun 2025 at 11:02, John Madieu <john.madieu.xa@bp.renesas.com>
> > wrote:
> > > Add clock and reset entries for the Gigabit Ethernet Interfaces (GBETH
> > > 0-1) IPs found on the RZ/G3E SoC. This includes various PLLs,
> > > dividers, and mux clocks needed by these two GBETH IPs.
> > >
> > > Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > Tested-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
> >
> > Thanks for your patch!
> >
> > > --- a/drivers/clk/renesas/r9a09g047-cpg.c
> > > +++ b/drivers/clk/renesas/r9a09g047-cpg.c

> > > @@ -214,6 +252,30 @@ static const struct rzv2h_mod_clk
> > r9a09g047_mod_clks[] __initconst = {
> > >                                                 BUS_MSTOP(8, BIT(4))),
> > >         DEF_MOD("sdhi_2_aclk",                  CLK_PLLDTY_ACPU_DIV4,
> > 10, 14, 5, 14,
> > >                                                 BUS_MSTOP(8, BIT(4))),
> > > +       DEF_MOD("gbeth_0_clk_tx_i",             CLK_SMUX2_GBE0_TXCLK,
> > 11, 8, 5, 24,
> > > +                                               BUS_MSTOP(8, BIT(5))),
> > > +       DEF_MOD("gbeth_0_clk_rx_i",             CLK_SMUX2_GBE0_RXCLK,
> > 11, 9, 5, 25,
> > > +                                               BUS_MSTOP(8, BIT(5))),
> > > +       DEF_MOD("gbeth_0_clk_tx_180_i",         CLK_SMUX2_GBE0_TXCLK,
> > 11, 10, 5, 26,
> > > +                                               BUS_MSTOP(8, BIT(5))),
> > > +       DEF_MOD("gbeth_0_clk_rx_180_i",         CLK_SMUX2_GBE0_RXCLK,
> > 11, 11, 5, 27,
> > > +                                               BUS_MSTOP(8, BIT(5))),
> > > +       DEF_MOD("gbeth_0_aclk_csr_i",           CLK_PLLDTY_DIV8, 11, 12,
> > 5, 28,
> > > +                                               BUS_MSTOP(8, BIT(5))),
> > > +       DEF_MOD("gbeth_0_aclk_i",               CLK_PLLDTY_DIV8, 11, 13,
> > 5, 29,
> > > +                                               BUS_MSTOP(8, BIT(5))),
> > > +       DEF_MOD("gbeth_1_clk_tx_i",             CLK_SMUX2_GBE1_TXCLK,
> > 11, 14, 5, 30,
> > > +                                               BUS_MSTOP(8, BIT(6))),
> > > +       DEF_MOD("gbeth_1_clk_rx_i",             CLK_SMUX2_GBE1_RXCLK,
> > 11, 15, 5, 31,
> > > +                                               BUS_MSTOP(8, BIT(6))),
> > > +       DEF_MOD("gbeth_1_clk_tx_180_i",         CLK_SMUX2_GBE1_TXCLK,
> > 12, 0, 6, 0,
> >
> > scripts/checkpatch.pl says:
> >
> >     WARNING: please, no space before tabs
> >
>
> Noted.
>
> > > +                                               BUS_MSTOP(8, BIT(6))),
> > > +       DEF_MOD("gbeth_1_clk_rx_180_i",         CLK_SMUX2_GBE1_RXCLK,
> > 12, 1, 6, 1,
> > > +                                               BUS_MSTOP(8, BIT(6))),
> > > +       DEF_MOD("gbeth_1_aclk_csr_i",           CLK_PLLDTY_DIV8, 12, 2,
> > 6, 2,
> > > +                                               BUS_MSTOP(8, BIT(6))),
> > > +       DEF_MOD("gbeth_1_aclk_i",               CLK_PLLDTY_DIV8, 12, 3,
> > 6, 3,
> > > +                                               BUS_MSTOP(8, BIT(6))),
> >
> > Shouldn't all of these use DEF_MOD_MUX_EXTERNAL() instead of DEF_MOD(),
> > like on RZ/V2H and RZ/V2N?
> >
>
> Do we really need to use DEF_MOD_MUX_EXTERNAL? Unlike for the RZ/V2H,
> On G3E, unbind/bind works with DEF_MOD. I can however switch to
> DEF_MOD_MUX_EXTERNAL for consistency if required.
>
> Please let me know.

Does that mean the monitor bits on RZ/G3E do reflect the correct state of
external clocks? If yes, then DEF_MOD() is fine.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

