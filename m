Return-Path: <linux-renesas-soc+bounces-31561-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KOSBNWXp6Wm2nAIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31561-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Apr 2026 11:41:57 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 84EE044FE40
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Apr 2026 11:41:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 42A10305B2B7
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Apr 2026 09:39:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 390C23E5598;
	Thu, 23 Apr 2026 09:39:43 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9BCD3E5ED2
	for <linux-renesas-soc@vger.kernel.org>; Thu, 23 Apr 2026 09:39:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776937182; cv=none; b=UazoeVSZmi79xQW0sv/bJ8ossdi8NOnwGl1+k+DZdOqkHlnZ9eV6PQZ83P/WE6cR3qyY8QO/SJG+GqEbum15/AgnaGqQ1C99QPFgbnTiRogLqpA9oIXDEECovjcJIUwmEQCzW0QjuX6q4hYjJHEbM6wvmru3LTGhX99/uhrXxTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776937182; c=relaxed/simple;
	bh=8KfRKWnC2a8QhyOPBB1Am1veLoXXyq9MoBmrXeFLDAc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hMOh+IfXMOAzO6hv14eXEdph0h+ga8/JsCsEoH2et+CJIwDZaZYjevlhEip0vX8t45ZwERN+vJubjLi0roGxlakAec6DzTHF8AHLkYd5xoiqM1a7Zql1LfZZ6DpLnVzscoikikmChbC2fcIldDA2RFxpL+YWXXHjkSqpI7Iw42M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-605def5b807so1928880137.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 23 Apr 2026 02:39:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776937177; x=1777541977;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=go1WMIAsem5LEjre+Mt82iaNq/eWdJ4DT2hUHXWyutw=;
        b=cNRqny3XfFiEyloIPfTOYnQ1bi7lxK8pcrCmYhHIo5YEXe9trfxd/YiWow8ZI7YWJ7
         UaG5QcfXFtV3czlSYwEgl1TeNlovcTTHi4eLe5yufYmufsovoGSPbC66OJ4ReD8CnlN/
         L8pw4vctRXmD8MC1o9DbnDOnkL+SCHBzYf5fIBkWnk9j4aqi7zBAlhARxQLn+UekfUDU
         4H7NHqTyEZ408AYsEdbsTd/r0zX2apvyqooaAxKGV/EH3tLHaAEdrhKwcHeowK0n2Ijk
         +LWAfEd/7UJbzMIpUTO9QIJfsXYhwe+AkFLVy8tEap6CD9MUMyElcAdtN+oOb0auCf9l
         sxvg==
X-Forwarded-Encrypted: i=1; AFNElJ8iea6GP896hY0hfFangI4FycT7sxEn0Uq5Aewd8H9OMhd9KFzvVnrQ+e/XZm1UmTsvsfD8WGb4++H+H3211AjIVA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxqZ9cVtgSZ5+pM95UUAEmA1K9nGZQCmmYAn8fXqJyIZs/sypAY
	5iyAURSKDc9g1cJcMLaQ3yNw4pvIrf6GETXY0/uYxvaeso0m1GMkoXNWQ4MdbKGIqpI=
X-Gm-Gg: AeBDieudl3VLNd/fKXQF77z7ZTbgCOmnUt/uKT/tBT6bp21VQYMDXu6rdtGKcmI+oy3
	8BPMdqnnAeQOcvC2R5oSQt8gQBzO4jntlB3apJXKyO+5Kd4IKT8szf+KDr78D31FiZ8rS9Usc1H
	vkoVowTp3bW0up9R+EhqNm5jbGpo4/Y4j0cvRRt/O9N7u1ojd2g26k3rgLvbTSJGptvvHDCNGEv
	kysLvBxIgXzAkwGhgcbohxZu57l9+w6BIJMh5OFI0m289M/Q1DncVeQkzFeVE0eeLDDKViNhPoM
	hfMsG2V2WRRrG1iqYqH/0trp1q0osFeyax0e52uNPAalCDbHK5U5rldYZm7sL3yEMY6QxyIA3Vp
	+mkWFeFl7csDT5uwfWTYF3aUsUYAYwPdtKGRjtdyWk8bzvwgqZ6cjmLKBP/7hE3F6sZhNKySmo7
	Hs6zWw1Ms8HuwlI7vN9+gXFNWSRHAP8euHmpDfbMQydpmbzGznrPw0V5gszqTysnJ7B81vD4A=
X-Received: by 2002:a05:6102:3e26:b0:605:ead:8f38 with SMTP id ada2fe7eead31-616f7c5da11mr938980137.29.1776937176774;
        Thu, 23 Apr 2026 02:39:36 -0700 (PDT)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com. [209.85.222.52])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-617482b3ac4sm9472876137.12.2026.04.23.02.39.35
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Apr 2026 02:39:36 -0700 (PDT)
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-95673f7b5baso1482642241.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 23 Apr 2026 02:39:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/UUWtxS4dYYw0OaHQdsbcWJ2aXMYCdNcKnSqJRekvm1XnxcONzyOtiD8m66xU1AqWY3ic+8UlLWLe0pUJjg0fy8w==@vger.kernel.org
X-Received: by 2002:a05:6102:41a6:b0:60a:8515:9097 with SMTP id
 ada2fe7eead31-616f4741ef9mr12358337137.3.1776937175679; Thu, 23 Apr 2026
 02:39:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260326110648.29389-1-biju.das.jz@bp.renesas.com> <20260326110648.29389-5-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260326110648.29389-5-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 23 Apr 2026 11:39:24 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU4wqFCNobN7mkMNCArP41cGmnbEi5cmuc576EdUL6+bQ@mail.gmail.com>
X-Gm-Features: AQROBzCRF5GnRj_CGoI5SvJDP-G6tqsoc-CT24ZWU0ZSnYkK6CwPToD4dB2ND5E
Message-ID: <CAMuHMdU4wqFCNobN7mkMNCArP41cGmnbEi5cmuc576EdUL6+bQ@mail.gmail.com>
Subject: Re: [PATCH v5 4/4] clk: renesas: r9a08g046: Add clock and reset
 signals for the GBETH IPs
To: Biju <biju.das.au@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31561-lists,linux-renesas-soc=lfdr.de];
	DMARC_NA(0.00)[linux-m68k.org];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.998];
	RCPT_COUNT_SEVEN(0.00)[8];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,linux-m68k.org:email,mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 84EE044FE40
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Biju,

On Thu, 26 Mar 2026 at 12:06, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Add clock and reset entries for the Gigabit Ethernet Interfaces
> (GBETH 0-1) IPs found on the RZ/G3L SoC. This includes various dividers
> and mux clocks needed by these two GBETH IPs. Also add tx, tx-180, rx,
> rx-180, rmii, rmii-tx and rmii-rx clocks to r9a08g046_no_pm_mod_clk
> table to avoid enabling both normal and rmii clocks by the PM framework.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/clk/renesas/r9a08g046-cpg.c
> +++ b/drivers/clk/renesas/r9a08g046-cpg.c

> @@ -86,6 +140,17 @@ static const struct cpg_core_clk r9a08g046_core_clks[] __initconst = {
>                     500000000UL),
>         DEF_FIXED(".pll2_div2", CLK_PLL2_DIV2, CLK_PLL2, 1, 2),
>         DEF_FIXED(".pll3_div2", CLK_PLL3_DIV2, CLK_PLL3, 1, 2),
> +       DEF_FIXED(".pll6_div10", CLK_PLL6_DIV10, CLK_PLL6, 1, 10),
> +       DEF_MUX(".sel_eth0_tx", CLK_SEL_ETH0_TX, G3L_SEL_ETH0_TX, sel_eth0_tx),
> +       DEF_MUX(".sel_eth0_rx", CLK_SEL_ETH0_RX, G3L_SEL_ETH0_RX, sel_eth0_rx),
> +       DEF_MUX(".sel_eth0_rm", CLK_SEL_ETH0_RM, G3L_SEL_ETH0_RM, sel_eth0_rm),
> +       DEF_MUX(".sel_eth1_tx", CLK_SEL_ETH1_TX, G3L_SEL_ETH1_TX, sel_eth1_tx),
> +       DEF_MUX(".sel_eth1_rx", CLK_SEL_ETH1_RX, G3L_SEL_ETH1_RX, sel_eth1_rx),
> +       DEF_MUX(".sel_eth1_rm", CLK_SEL_ETH1_RM, G3L_SEL_ETH1_RM, sel_eth1_rm),
> +       DEF_DIV(".div_eth0_tr", CLK_ETH0_TR, CLK_PLL6, G3L_SDIV_ETH_A, dtable_4_200),
> +       DEF_DIV(".div_eth1_tr", CLK_ETH1_TR, CLK_PLL6, G3L_SDIV_ETH_C, dtable_4_200),
> +       DEF_DIV(".div_eth0_rm", CLK_ETH0_RM, CLK_SEL_ETH0_RM, G3L_SDIV_ETH_B, dtable_2_20),
> +       DEF_DIV(".div_eth1_rm", CLK_ETH1_RM, CLK_SEL_ETH1_RM, G3L_SDIV_ETH_D, dtable_2_20),
>
>         /* Core output clk */
>         DEF_G3S_DIV("P0", R9A08G046_CLK_P0, CLK_PLL2_DIV2, G3L_DIVPL2B, G3L_DIVPL2B_STS,
> @@ -94,6 +159,21 @@ static const struct cpg_core_clk r9a08g046_core_clks[] __initconst = {
>                     dtable_4_128, 0, 0, 0, NULL),
>         DEF_G3S_DIV("P3", R9A08G046_CLK_P3, CLK_PLL2_DIV2, G3L_DIVPL2A, G3L_DIVPL2A_STS,
>                     dtable_4_128, 0, 0, 0, NULL),
> +       DEF_FIXED("HP", R9A08G046_CLK_HP, CLK_PLL6_DIV10, 1, 1),
> +       DEF_MUX_FLAGS("ETHTX01", R9A08G046_CLK_ETHTX01, G3L_SEL_ETH0_CLK_TX_I, sel_eth0_clk_tx_i,
> +                     CLK_SET_RATE_PARENT),
> +       DEF_MUX_FLAGS("ETHRX01", R9A08G046_CLK_ETHRX01, G3L_SEL_ETH0_CLK_RX_I, sel_eth0_clk_rx_i,
> +                     CLK_SET_RATE_PARENT),
> +       DEF_MUX_FLAGS("ETHTX11", R9A08G046_CLK_ETHTX11, G3L_SEL_ETH1_CLK_TX_I, sel_eth1_clk_tx_i,
> +                     CLK_SET_RATE_PARENT),
> +       DEF_MUX_FLAGS("ETHRX11", R9A08G046_CLK_ETHRX11, G3L_SEL_ETH1_CLK_RX_I, sel_eth1_clk_rx_i,
> +                     CLK_SET_RATE_PARENT),
> +       DEF_FIXED("ETHRM0", R9A08G046_CLK_ETHRM0, CLK_ETH0_RM, 1, 1),

Shouldn't the parent be CLK_SEL_ETH0_RM (i.e. before the 1/2 or 1/20 divider)?

> +       DEF_FIXED("ETHTX02", R9A08G046_CLK_ETHTX02, CLK_SEL_ETH0_TX, 1, 1),
> +       DEF_FIXED("ETHRX02", R9A08G046_CLK_ETHRX02, CLK_SEL_ETH0_RX, 1, 1),
> +       DEF_FIXED("ETHRM1", R9A08G046_CLK_ETHRM1, CLK_ETH1_RM, 1, 1),

Likewise, CLK_SEL_ETH1_RM?

If you agree, I can fix this up while applying.

> +       DEF_FIXED("ETHTX12", R9A08G046_CLK_ETHTX12, CLK_SEL_ETH1_TX, 1, 1),
> +       DEF_FIXED("ETHRX12", R9A08G046_CLK_ETHRX12, CLK_SEL_ETH1_RX, 1, 1),
>  };
>
>  static const struct rzg2l_mod_clk r9a08g046_mod_clks[] = {
> @@ -107,6 +187,50 @@ static const struct rzg2l_mod_clk r9a08g046_mod_clks[] = {
>                                         MSTOP(BUS_REG1, BIT(2))),
>         DEF_MOD("dmac_pclk",            R9A08G046_DMAC_PCLK, R9A08G046_CLK_P3, 0x52c, 1,
>                                         MSTOP(BUS_REG1, BIT(3))),
> +       DEF_MOD("eth0_clk_axi",         R9A08G046_ETH0_CLK_AXI, R9A08G046_CLK_P1, 0x57c, 0,
> +                                       MSTOP(BUS_PERI_COM, BIT(2))),
> +       DEF_MOD("eth1_clk_axi",         R9A08G046_ETH1_CLK_AXI, R9A08G046_CLK_P1, 0x57c, 1,
> +                                       MSTOP(BUS_PERI_COM, BIT(3))),
> +       DEF_MOD("eth0_clk_chi",         R9A08G046_ETH0_CLK_CHI, R9A08G046_CLK_P1, 0x57c, 2,
> +                                       MSTOP(BUS_PERI_COM, BIT(2))),
> +       DEF_MOD("eth1_clk_chi",         R9A08G046_ETH1_CLK_CHI, R9A08G046_CLK_P1, 0x57c, 3,
> +                                       MSTOP(BUS_PERI_COM, BIT(3))),
> +       DEF_COUPLED("eth0_tx_i",        R9A08G046_ETH0_CLK_TX_I, R9A08G046_CLK_ETHTX01, 0x57c, 4,
> +                                       MSTOP(BUS_PERI_COM, BIT(2))),
> +       DEF_COUPLED("eth0_tx_180_i", R9A08G046_ETH0_CLK_TX_180_I, R9A08G046_CLK_ETHTX02, 0x57c, 4,
> +                                       MSTOP(BUS_PERI_COM, BIT(2))),
> +       DEF_COUPLED("eth1_tx_i",        R9A08G046_ETH1_CLK_TX_I, R9A08G046_CLK_ETHTX11, 0x57c, 5,
> +                                       MSTOP(BUS_PERI_COM, BIT(3))),
> +       DEF_COUPLED("eth1_tx_180_i", R9A08G046_ETH1_CLK_TX_180_I, R9A08G046_CLK_ETHTX12, 0x57c, 5,

Inconsistent alignment (more below).

> +                                       MSTOP(BUS_PERI_COM, BIT(3))),
> +       DEF_COUPLED("eth0_rx_i",        R9A08G046_ETH0_CLK_RX_I, R9A08G046_CLK_ETHRX01, 0x57c, 6,
> +                                       MSTOP(BUS_PERI_COM, BIT(2))),
> +       DEF_COUPLED("eth0_rx_180_i", R9A08G046_ETH0_CLK_RX_180_I, R9A08G046_CLK_ETHRX02, 0x57c, 6,
> +                                       MSTOP(BUS_PERI_COM, BIT(2))),
> +       DEF_COUPLED("eth1_rx_i",        R9A08G046_ETH1_CLK_RX_I, R9A08G046_CLK_ETHRX11, 0x57c, 7,
> +                                       MSTOP(BUS_PERI_COM, BIT(3))),
> +       DEF_COUPLED("eth1_rx_180_i", R9A08G046_ETH1_CLK_RX_180_I, R9A08G046_CLK_ETHRX12, 0x57c, 7,
> +                                       MSTOP(BUS_PERI_COM, BIT(3))),
> +       DEF_MOD("eth0_ptp_ref_i",       R9A08G046_ETH0_CLK_PTP_REF_I, R9A08G046_CLK_HP, 0x57c, 8,
> +                                       MSTOP(BUS_PERI_COM, BIT(2))),
> +       DEF_MOD("eth1_ptp_ref_i",       R9A08G046_ETH1_CLK_PTP_REF_I, R9A08G046_CLK_HP, 0x57c, 9,
> +                                       MSTOP(BUS_PERI_COM, BIT(3))),
> +       DEF_MOD("eth0_rmii_i",          R9A08G046_ETH0_CLK_RMII_I, R9A08G046_CLK_ETHRM0, 0x57c, 10,
> +                                       MSTOP(BUS_PERI_COM, BIT(2))),
> +       DEF_MOD("eth1_rmii_i",          R9A08G046_ETH1_CLK_RMII_I, R9A08G046_CLK_ETHRM1, 0x57c, 11,
> +                                       MSTOP(BUS_PERI_COM, BIT(3))),
> +       DEF_COUPLED("eth0_tx_i_rmii",

Inconsistent line break / alignment (more below).

> +                               R9A08G046_ETH0_CLK_TX_I_RMII, R9A08G046_CLK_ETHTX01, 0x57c, 12,
> +                                       MSTOP(BUS_PERI_COM, BIT(2))),
> +       DEF_COUPLED("eth0_rx_i_rmii",
> +                               R9A08G046_ETH0_CLK_RX_I_RMII, R9A08G046_CLK_ETHRX01, 0x57c, 12,
> +                                       MSTOP(BUS_PERI_COM, BIT(2))),
> +       DEF_COUPLED("eth1_tx_i_rmii",
> +                               R9A08G046_ETH1_CLK_TX_I_RMII, R9A08G046_CLK_ETHTX11, 0x57c, 13,
> +                                       MSTOP(BUS_PERI_COM, BIT(3))),
> +       DEF_COUPLED("eth1_rx_i_rmii",
> +                               R9A08G046_ETH1_CLK_RX_I_RMII, R9A08G046_CLK_ETHRX11, 0x57c, 13,
> +                                       MSTOP(BUS_PERI_COM, BIT(3))),
>         DEF_MOD("scif0_clk_pck",        R9A08G046_SCIF0_CLK_PCK, R9A08G046_CLK_P0, 0x584, 0,
>                                         MSTOP(BUS_MCPU2, BIT(1))),
>  };

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

