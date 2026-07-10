Return-Path: <linux-renesas-soc+bounces-35067-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id JbDpBs4UUWqI/AIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-35067-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Jul 2026 17:50:38 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 76C0E73C628
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Jul 2026 17:50:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-35067-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-35067-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D59C93018772
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Jul 2026 15:50:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54762439003;
	Fri, 10 Jul 2026 15:50:35 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21CB2438012
	for <linux-renesas-soc@vger.kernel.org>; Fri, 10 Jul 2026 15:50:31 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783698634; cv=none; b=uoqIUFsHCE5KFJ+vEh6xviz2GxmUNVK63lBdkz7Lv0PKvXbSU+Up32d2tdRImZIQ33Wp6iqT9qyfDfoIx1Hb4vuBCz7NtB3IgdfrpoD9IevrgU3Q3FwK+UnR2IeXXsUIoG7s8v+zSfusYEE451NE0MOarw9/LwipSGf8XuaJWPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783698634; c=relaxed/simple;
	bh=7siWu5tOBAOWAK8D+hTW+WuI2Xn9CN6SJH65H7cpEYI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p+uULLMgTFVUTd0jwUMdvM+CRt1ArbbCdsoqALW1W1nxcPPGYG86YMpRAS9ABQyfLkCIc21vgyWfZ+g9sXkVc3lvjPGUy1L/6mOy76hStKPKbeknwvdLKqFt/kV0Fi/q65dau75Ou87vAR4g2UdTxSYh71L+qxUeYLPKTYhQp4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.41
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-73be40e5c4cso487654137.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 10 Jul 2026 08:50:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783698631; x=1784303431;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=COq9xMLib3DzhYnSQrCEEFddJljJERP911HcL/5Bs7Q=;
        b=AxC1T6Gr9AyQ6F9SvbZICrhsZvO0dGwPTs+ZK6OJ/4BbHnyBaqqr83wgKON3Q9xb9C
         oTd1daENgmSWIqMXdT3eXZTzBm2abSVNROpTFUn7cBtJHbVB27w5rmIjIwa+CrqO2IF8
         eM9tmLSZLrnHCrCMQBjAf2EkcOcviwVJv2ViD8YaGFdSLc5Gwy3mNIbrXTp2yLxN4Rpg
         JfXKvUEmWnLCYzTBhKKWiz/laDGEzI/mevaGb1kZ8rM00QTgVLTETlFoL2WjYDjhqB6W
         MiODD+A9N95j43wr5/twYt0/xRnQXBnvFRzibJbWQbn/Lrti3L0wpBdj9jjgaamJYeFR
         Ti0Q==
X-Forwarded-Encrypted: i=1; AHgh+RrzkuU3VpuOrgsw6J6V0wcf3GcdqSZm48q/0Jh04mO3pkgVbDFmshRqRyL9Mza/XRWIJNtDF+LIopLa8v2umajy9w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzdSBujTNopoUqgjVqzqBWmAXJr5hvpl8tnIYETg29duu/Y7I4r
	G3UcWGx+Mm8J9PJCun3PqIrgmlp++30Vqqdz9bxARdUk9SvbctAMuJQiL+FxwU/y
X-Gm-Gg: AfdE7ckPNtbChYjNOMidzNtcuwq/3+/DiD7HZpz6R0QiRf6VPZl9dyVepYz1GAyUFd9
	j+QN9hfFmpTpx5anFbvk1DukpkmaLk1K8b8p6maZh1NFGugtwZW2eQGatyMLe6qB1M53pRJS5nF
	if0Azo3g+6vRAY7OEJl9WDlStpH6v5SRWMKM1zIM225PuZdzf0W6hNrqhUDMEvGNVLWa3+t9+pQ
	P0+NnzXBxpuj71m+EHrBpOuR59NS/b8sntFB9+m7UZgB7jBicIv+EvUxIM3Gp7Xwo+LTs4Po70A
	sQ/Si+6dx8NdYvjjXgR0xu9YY0bznJ8kXA1TjtFoawx3p4uIaKdHLHhQ0orydf40YCSNutADI1X
	1IHjkpVFFGHyrDo9bnpgHuA1CYAKGYkoXdyGOsG3EgmemS0II6gOyMI+AFxzUTzE5/o0t8Z2p6+
	76OjkjBClJnxA/MUKONZqJm3OxReLb1WIjiOrXs5dssdUdomU8R3aAzw==
X-Received: by 2002:a05:6102:512c:b0:740:2717:a2d5 with SMTP id ada2fe7eead31-744dff56176mr7947067137.6.1783698630731;
        Fri, 10 Jul 2026 08:50:30 -0700 (PDT)
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com. [209.85.221.175])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-96ed6737807sm4290133241.13.2026.07.10.08.50.29
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 08:50:30 -0700 (PDT)
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-5bf94664327so603372e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 10 Jul 2026 08:50:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RofP/zbowEkQA5v12RQp8JtsDE8YHP1pSIxwm/P7cFBYFkiUMXL0e1boRRyo9p0A343x0AlH/6MCMNtpTG4xYF25g==@vger.kernel.org
X-Received: by 2002:a05:6123:102:b0:5ab:26f:49e3 with SMTP id
 71dfb90a1353d-5bf75d07354mr6081672e0c.3.1783698629559; Fri, 10 Jul 2026
 08:50:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260619164030.380098-1-biju.das.jz@bp.renesas.com> <20260619164030.380098-7-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260619164030.380098-7-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 10 Jul 2026 17:50:18 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWxV-iErH=Kq6tm427MAgokh4hYzJYPr4PLqfmLG8JqgA@mail.gmail.com>
X-Gm-Features: AUfX_myJ2dro8QO_CpOJ1eUm20yID6JHmWFTNfxFEckms8jxuihDYFh0fr0o1Lo
Message-ID: <CAMuHMdWxV-iErH=Kq6tm427MAgokh4hYzJYPr4PLqfmLG8JqgA@mail.gmail.com>
Subject: Re: [PATCH 6/6] clk: renesas: r9a08g046: Add clock and reset entries
 for LVDS
To: Biju <biju.das.au@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, Brian Masney <bmasney@redhat.com>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-35067-lists,linux-renesas-soc=lfdr.de];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_RECIPIENTS(0.00)[m:biju.das.au@gmail.com,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:biju.das.jz@bp.renesas.com,m:bmasney@redhat.com,m:linux-renesas-soc@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:bijudasau@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[glider.be:email,renesas.com:email,mail.gmail.com:mid,linux-m68k.org:from_mime,linux-m68k.org:email,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 76C0E73C628

On Fri, 19 Jun 2026 at 18:40, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Add clock and reset entries for LVDS.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>


> ---
>  drivers/clk/renesas/r9a08g046-cpg.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/drivers/clk/renesas/r9a08g046-cpg.c b/drivers/clk/renesas/r9a08g046-cpg.c
> index 7cea2c6d2c42..273e147dca7a 100644
> --- a/drivers/clk/renesas/r9a08g046-cpg.c
> +++ b/drivers/clk/renesas/r9a08g046-cpg.c
> @@ -574,6 +574,10 @@ static const struct rzg2l_mod_clk r9a08g046_mod_clks[] = {
>                                         MSTOP(BUS_MCPU3, BIT(11))),
>         DEF_MOD("rsci3_tclk",           R9A08G046_RSCI3_TCLK, R9A08G046_CLK_P16, 0x618, 11,
>                                         MSTOP(BUS_MCPU3, BIT(12))),
> +       DEF_MOD("lvds_pllclk",          R9A08G046_LVDS_PLLCLK, R9A08G046_CLK_M2, 0x61c, 0,
> +                                       MSTOP(BUS_PERI_VIDEO, BIT(11))),
> +       DEF_MOD("lvds_clk_dot0",        R9A08G046_LVDS_CLK_DOT0, R9A08G046_CLK_M3, 0x61c, 1,
> +                                       MSTOP(BUS_PERI_VIDEO, BIT(11))),
>  };
>
>  static const struct rzg2l_reset r9a08g046_resets[] = {
> @@ -637,6 +641,7 @@ static const struct rzg2l_reset r9a08g046_resets[] = {
>         DEF_RST(R9A08G046_RSCI1_TRESETN, 0x918, 9),
>         DEF_RST(R9A08G046_RSCI2_TRESETN, 0x918, 10),
>         DEF_RST(R9A08G046_RSCI3_TRESETN, 0x918, 11),
> +       DEF_RST(R9A08G046_LVDS_RESET_N, 0x91c, 0),
>  };
>
>  static const unsigned int r9a08g046_crit_mod_clks[] __initconst = {
> --
> 2.43.0
>


--
Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

