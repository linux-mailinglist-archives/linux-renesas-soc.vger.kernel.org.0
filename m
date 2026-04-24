Return-Path: <linux-renesas-soc+bounces-31610-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GGXvM6QX62niIQAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31610-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Apr 2026 09:11:32 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AC5A45A909
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Apr 2026 09:11:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6E32030154B2
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Apr 2026 07:09:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DE2723BCED;
	Fri, 24 Apr 2026 07:09:36 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04C6E2FFF8D
	for <linux-renesas-soc@vger.kernel.org>; Fri, 24 Apr 2026 07:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777014576; cv=none; b=Dz0gkqL0gxE0chvocdHQhCkEOaJ42xk/jZEz+VPp+LFYJF42wk1BIb50dCiDCPJudI3JYvnJ3E8msBF1VuNaDAaKghC7YULrQYZyBgCWzLoZcak4GKj38Q1LZ9AJr8PrrCUMesMbnwHejq5iZLGLG8GpjpWQuMgz1Z27XpZSM1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777014576; c=relaxed/simple;
	bh=GkpWGZCRoVZNIZOsBR6Vl09IGJoiPmQO5lO1FmzI5Zo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oSt9ygy0B1ig4VEe2NCF3h48oMDX3vkPRiigqt/iRwiYwYwCMH1ceOeu+EwZzACWdfhEyqgROBR5bsOoBrdFVvodbuO301tO6usB4nz+IX0/GnQnJy7UINbgLJtHHx68JmzyVSo+YENIWJNdfJgJAgRdAShA6Hnb7BX44PoZ9Gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-9568bae58f7so3635935241.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 24 Apr 2026 00:09:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777014574; x=1777619374;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OPkYSejnXmw9q4iGicOigyxcdYu5HJtYWp9F83ylei0=;
        b=UuORc6htZyejOjEbakvBIFGTnCv88LcL55Fr0CKo63sOlBs1ASpaqWOGtkeNJ+k9pL
         M7Iz6ykiMzx1YzuA/eXh0keX0LwflgKn1Dv7GJebHJtg5W8zQlwA0gupQPNynU6nY9SY
         oFlfUHkK7KIZsTI6hTWhRWv5cSn8mYoLRXBice2lH8Sqyq6dbmKDff5vxfDv9nRadGi1
         LpFa3NTMja4xJ0EobcGUxh1vI93UyWSqQRx9K5Sg9ROtu9/tseamHH0Rr5Sm4te5HVdc
         ZrlE+00m1gNnvLrdf/XKQAvYYlOBxP9zfJ/4FdC38loFttAAO9Kay8v/BherbGXpaIqw
         hwUw==
X-Forwarded-Encrypted: i=1; AFNElJ9/6xlQlQmjeTXoJ+jrgtldih0yUjI3dl5rzWblH4ImtJQCUWDcOfeAK4g/cIHECuIMGcO6uQMuuKwWoCpQZmA/fw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0eJaelzzOPLz5/3D48VvM8/f9U8cV2JawBd0YYXZ/tvTNamFj
	LdlU1fsgbVyijaj0+LFFCV1LlW7ea387n+ednrA1vdTtzb/qYTBb4CA9p2JHXPvAtHE=
X-Gm-Gg: AeBDiesZMC4GpPOyzLTe/C9mY3NdtP8osO0VuiW7yWAePw5zZxzZLDJlHp1FtXfU3aX
	PEJwPWDG6ikWT5DM0DSmlFNaMNwCbhXaJ902HAabv+2Q8edOM0Lqq3DimiNOVec0jreB3QPCH+9
	lA9St4u/Q++w7MO37vpCHUYjon7Wwr9oCbYq9Lwp7ZgUTV7/DXwqhX+y6wdUXoSSstRnrYl47vv
	Ug91RTCqb65JFwfZ1Jc4Ek6+XRGPLOCGzJdXa6tW0L7Dl7AajE+S9BSXZdYkIEJDVQNZntBf/p5
	Dol+Hj8gd8fK1nDCM+cBIP0wr0yoFYT2Z1WEARvlSlrMnR0vFCQ6m3qQv5oLyb3lALHBdL/Xhdq
	t+2mCmPeYwWDDowpFgcT8dHPlyMVPNp+BPsGUwZta/elUhvBtC1JCuabjueLbc6PK8s+95PDEt/
	2l7KR0EQdDiVVyuMGcgOZDBbSPKKebsY/kDueEjabL4q0RIGF/01EhOuL1dtMD1RF/tn5BFqQ+A
	Sg=
X-Received: by 2002:a05:6102:5491:b0:60a:7c2f:8ecb with SMTP id ada2fe7eead31-616f68d7579mr16615311137.15.1777014573841;
        Fri, 24 Apr 2026 00:09:33 -0700 (PDT)
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com. [209.85.221.174])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-61745c9e51bsm11586505137.4.2026.04.24.00.09.33
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2026 00:09:33 -0700 (PDT)
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-56a9a7e762bso4686329e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 24 Apr 2026 00:09:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+EIBPUFvSH3snpgo7yprui/IAm3Fqqp7U5662fd9BjEr19pELQoRrom2vZ5ABW8ER1dEZQOAyfHyClPLwSTamEKw==@vger.kernel.org
X-Received: by 2002:a05:6102:3581:b0:611:a5b6:f4d3 with SMTP id
 ada2fe7eead31-616f73fa0e4mr15265032137.22.1777014573418; Fri, 24 Apr 2026
 00:09:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260326110648.29389-1-biju.das.jz@bp.renesas.com>
 <20260326110648.29389-5-biju.das.jz@bp.renesas.com> <CAMuHMdU4wqFCNobN7mkMNCArP41cGmnbEi5cmuc576EdUL6+bQ@mail.gmail.com>
 <TYCPR01MB1133200E7FF04200635988BF7862A2@TYCPR01MB11332.jpnprd01.prod.outlook.com>
In-Reply-To: <TYCPR01MB1133200E7FF04200635988BF7862A2@TYCPR01MB11332.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 24 Apr 2026 09:09:21 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX-S3V=+1JCEj6PAY=w3KNzMyPJfvaHZ8U86z8C6aELAw@mail.gmail.com>
X-Gm-Features: AQROBzDUtnf3dn_P3bYBr8jBd6qU4D0kn93fKzIi5hCr6LiSyquO6mvHq-_4xdc
Message-ID: <CAMuHMdX-S3V=+1JCEj6PAY=w3KNzMyPJfvaHZ8U86z8C6aELAw@mail.gmail.com>
Subject: Re: [PATCH v5 4/4] clk: renesas: r9a08g046: Add clock and reset
 signals for the GBETH IPs
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: "biju.das.au" <biju.das.au@gmail.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 4AC5A45A909
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,baylibre.com,kernel.org,vger.kernel.org,bp.renesas.com];
	TAGGED_FROM(0.00)[bounces-31610-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[glider.be:email,renesas.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid,linux-m68k.org:email]

Hi Biju,

On Thu, 23 Apr 2026 at 13:14, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > From: Geert Uytterhoeven <geert@linux-m68k.org>
> > On Thu, 26 Mar 2026 at 12:06, Biju <biju.das.au@gmail.com> wrote:
> > > From: Biju Das <biju.das.jz@bp.renesas.com>
> > >
> > > Add clock and reset entries for the Gigabit Ethernet Interfaces (GBETH
> > > 0-1) IPs found on the RZ/G3L SoC. This includes various dividers and
> > > mux clocks needed by these two GBETH IPs. Also add tx, tx-180, rx,
> > > rx-180, rmii, rmii-tx and rmii-rx clocks to r9a08g046_no_pm_mod_clk
> > > table to avoid enabling both normal and rmii clocks by the PM framework.
> > >
> > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> >
> > Thanks for your patch!
> >
> > > --- a/drivers/clk/renesas/r9a08g046-cpg.c
> > > +++ b/drivers/clk/renesas/r9a08g046-cpg.c
> >
> > > @@ -86,6 +140,17 @@ static const struct cpg_core_clk r9a08g046_core_clks[] __initconst = {
> > >                     500000000UL),
> > >         DEF_FIXED(".pll2_div2", CLK_PLL2_DIV2, CLK_PLL2, 1, 2),
> > >         DEF_FIXED(".pll3_div2", CLK_PLL3_DIV2, CLK_PLL3, 1, 2),
> > > +       DEF_FIXED(".pll6_div10", CLK_PLL6_DIV10, CLK_PLL6, 1, 10),
> > > +       DEF_MUX(".sel_eth0_tx", CLK_SEL_ETH0_TX, G3L_SEL_ETH0_TX, sel_eth0_tx),
> > > +       DEF_MUX(".sel_eth0_rx", CLK_SEL_ETH0_RX, G3L_SEL_ETH0_RX, sel_eth0_rx),
> > > +       DEF_MUX(".sel_eth0_rm", CLK_SEL_ETH0_RM, G3L_SEL_ETH0_RM, sel_eth0_rm),
> > > +       DEF_MUX(".sel_eth1_tx", CLK_SEL_ETH1_TX, G3L_SEL_ETH1_TX, sel_eth1_tx),
> > > +       DEF_MUX(".sel_eth1_rx", CLK_SEL_ETH1_RX, G3L_SEL_ETH1_RX, sel_eth1_rx),
> > > +       DEF_MUX(".sel_eth1_rm", CLK_SEL_ETH1_RM, G3L_SEL_ETH1_RM, sel_eth1_rm),
> > > +       DEF_DIV(".div_eth0_tr", CLK_ETH0_TR, CLK_PLL6, G3L_SDIV_ETH_A, dtable_4_200),
> > > +       DEF_DIV(".div_eth1_tr", CLK_ETH1_TR, CLK_PLL6, G3L_SDIV_ETH_C, dtable_4_200),
> > > +       DEF_DIV(".div_eth0_rm", CLK_ETH0_RM, CLK_SEL_ETH0_RM, G3L_SDIV_ETH_B, dtable_2_20),
> > > +       DEF_DIV(".div_eth1_rm", CLK_ETH1_RM, CLK_SEL_ETH1_RM,
> > > + G3L_SDIV_ETH_D, dtable_2_20),
> > >
> > >         /* Core output clk */
> > >         DEF_G3S_DIV("P0", R9A08G046_CLK_P0, CLK_PLL2_DIV2,
> > > G3L_DIVPL2B, G3L_DIVPL2B_STS, @@ -94,6 +159,21 @@ static const struct cpg_core_clk
> > r9a08g046_core_clks[] __initconst = {
> > >                     dtable_4_128, 0, 0, 0, NULL),
> > >         DEF_G3S_DIV("P3", R9A08G046_CLK_P3, CLK_PLL2_DIV2, G3L_DIVPL2A, G3L_DIVPL2A_STS,
> > >                     dtable_4_128, 0, 0, 0, NULL),
> > > +       DEF_FIXED("HP", R9A08G046_CLK_HP, CLK_PLL6_DIV10, 1, 1),
> > > +       DEF_MUX_FLAGS("ETHTX01", R9A08G046_CLK_ETHTX01, G3L_SEL_ETH0_CLK_TX_I, sel_eth0_clk_tx_i,
> > > +                     CLK_SET_RATE_PARENT),
> > > +       DEF_MUX_FLAGS("ETHRX01", R9A08G046_CLK_ETHRX01, G3L_SEL_ETH0_CLK_RX_I, sel_eth0_clk_rx_i,
> > > +                     CLK_SET_RATE_PARENT),
> > > +       DEF_MUX_FLAGS("ETHTX11", R9A08G046_CLK_ETHTX11, G3L_SEL_ETH1_CLK_TX_I, sel_eth1_clk_tx_i,
> > > +                     CLK_SET_RATE_PARENT),
> > > +       DEF_MUX_FLAGS("ETHRX11", R9A08G046_CLK_ETHRX11, G3L_SEL_ETH1_CLK_RX_I, sel_eth1_clk_rx_i,
> > > +                     CLK_SET_RATE_PARENT),
> > > +       DEF_FIXED("ETHRM0", R9A08G046_CLK_ETHRM0, CLK_ETH0_RM, 1, 1),
> >
> > Shouldn't the parent be CLK_SEL_ETH0_RM (i.e. before the 1/2 or 1/20 divider)?
>
> Oops, I missed this. You are correct.
>
> > > +       DEF_FIXED("ETHTX02", R9A08G046_CLK_ETHTX02, CLK_SEL_ETH0_TX, 1, 1),
> > > +       DEF_FIXED("ETHRX02", R9A08G046_CLK_ETHRX02, CLK_SEL_ETH0_RX, 1, 1),
> > > +       DEF_FIXED("ETHRM1", R9A08G046_CLK_ETHRM1, CLK_ETH1_RM, 1, 1),
> >
> > Likewise, CLK_SEL_ETH1_RM?
> >
> > If you agree, I can fix this up while applying.
>
> I Agree.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v7.2, with this fixed.

> > > +       DEF_FIXED("ETHTX12", R9A08G046_CLK_ETHTX12, CLK_SEL_ETH1_TX, 1, 1),
> > > +       DEF_FIXED("ETHRX12", R9A08G046_CLK_ETHRX12, CLK_SEL_ETH1_RX,
> > > + 1, 1),
> > >  };
> > >
> > >  static const struct rzg2l_mod_clk r9a08g046_mod_clks[] = { @@ -107,6
> > > +187,50 @@ static const struct rzg2l_mod_clk r9a08g046_mod_clks[] = {
> > >                                         MSTOP(BUS_REG1, BIT(2))),
> > >         DEF_MOD("dmac_pclk",            R9A08G046_DMAC_PCLK, R9A08G046_CLK_P3, 0x52c, 1,
> > >                                         MSTOP(BUS_REG1, BIT(3))),
> > > +       DEF_MOD("eth0_clk_axi",         R9A08G046_ETH0_CLK_AXI, R9A08G046_CLK_P1, 0x57c, 0,
> > > +                                       MSTOP(BUS_PERI_COM, BIT(2))),
> > > +       DEF_MOD("eth1_clk_axi",         R9A08G046_ETH1_CLK_AXI, R9A08G046_CLK_P1, 0x57c, 1,
> > > +                                       MSTOP(BUS_PERI_COM, BIT(3))),
> > > +       DEF_MOD("eth0_clk_chi",         R9A08G046_ETH0_CLK_CHI, R9A08G046_CLK_P1, 0x57c, 2,
> > > +                                       MSTOP(BUS_PERI_COM, BIT(2))),
> > > +       DEF_MOD("eth1_clk_chi",         R9A08G046_ETH1_CLK_CHI, R9A08G046_CLK_P1, 0x57c, 3,
> > > +                                       MSTOP(BUS_PERI_COM, BIT(3))),
> > > +       DEF_COUPLED("eth0_tx_i",        R9A08G046_ETH0_CLK_TX_I, R9A08G046_CLK_ETHTX01, 0x57c, 4,
> > > +                                       MSTOP(BUS_PERI_COM, BIT(2))),
> > > +       DEF_COUPLED("eth0_tx_180_i", R9A08G046_ETH0_CLK_TX_180_I, R9A08G046_CLK_ETHTX02, 0x57c, 4,
> > > +                                       MSTOP(BUS_PERI_COM, BIT(2))),
> > > +       DEF_COUPLED("eth1_tx_i",        R9A08G046_ETH1_CLK_TX_I, R9A08G046_CLK_ETHTX11, 0x57c, 5,
> > > +                                       MSTOP(BUS_PERI_COM, BIT(3))),
> > > +       DEF_COUPLED("eth1_tx_180_i", R9A08G046_ETH1_CLK_TX_180_I,
> > > + R9A08G046_CLK_ETHTX12, 0x57c, 5,
> >
> > Inconsistent alignment (more below).
>
> I tried to squeeze it into 100 columns. Maybe I should have split this into 3 lines??

No please. I'd rather keep it consistent with the other lines.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

