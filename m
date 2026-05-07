Return-Path: <linux-renesas-soc+bounces-32243-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6L95M7yJ/Gm8RAAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32243-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 07 May 2026 14:46:52 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 671054E866E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 07 May 2026 14:46:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DD132301A3B8
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 May 2026 12:46:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 301413A783C;
	Thu,  7 May 2026 12:46:40 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4CF73B19BC
	for <linux-renesas-soc@vger.kernel.org>; Thu,  7 May 2026 12:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778158000; cv=none; b=CqQ4FnEA9zfJ7tVcRwWX7sukJhLv1RcUXuKoqE7QwArAg54wOhkm3iFIm/tAPbR0jvBXB1NH1mNVD0/Edg46UQ2C1Rb2ylNInf+jW6IyIDvb7Yw2f1BU4pvf56b177RpFFxAccS4uLa9RKgGYv1oHWxfKXTbIIY+LnsKhf56aAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778158000; c=relaxed/simple;
	bh=WQcsCfXBVgz/c/y5hkF2s/14dwVl7k3U3PuuA9anBr8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Sp2g2ovNHtY/usv2X0LaTEuqYAyRyN6BLrff1327qVnnklpqY6ul6FeOWcxKC8pkzSnK8xG7AkNmX0F9Xevnagg2cokYwGMDIb0fostcaOkdDJd7G2zL60EsRz4Gnv/YRv5nDJobHIKCeT4CQkn3cCC5hlA5rkDEKOis2tN+Y3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-bc2a455fd55so115088066b.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 07 May 2026 05:46:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778157997; x=1778762797;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DMoCH2XgRGmeYWuHVMU3wW5pIafd9En9VI/xZpgNjvI=;
        b=Go//iQdESKHJ4NiPt1vuPT+Se7lIMy7JdTFDUha5QMb2D7VpwC0nWBcA9hg8b3OBIm
         Zawfgyp1F0itMZrSG+nnBJaSQ4FII4wBfOCtorNutbLm6fsLYHPV8y3Wr25pHzVlSxF1
         6gNM2fRZ+Fdp3kD626++rzBeYdgfX/YhZlboH81Kf3hd/nxLm4GfWvmTcjp2mRhnCSJE
         vhXy22a145XshO5a6MDeEF1luarYq/NkrQhu3r9+Qpm1uzHfsuveLnA6b8SsqB1q5n6A
         b1mPz3TuG15vGtYc5KTLG/agFWtHaawOz8CDzVl0n0+2yZTzRdfRhUy/KIa2n+A3g/hR
         5Mvw==
X-Forwarded-Encrypted: i=1; AFNElJ+5GYE5c91XvKoh8J1gDVcnZhAEFj37Zr+7bP4ZksMmFaLCrfbIUACs2BOzHa8HCgIlPpLcTtO65qJVjGfWos2J9Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwQxHq+ghdL3ZICSGmm2H+sMyGlU0hFaefxaQmI/iaB8DYm+HHT
	lanYcmHnelhMguv0UhsusLxBdYf6Kf4SksYS+8css+LTKHY8rPEws1olgYlxVSW8nO8=
X-Gm-Gg: AeBDiet5Nux+Zv2MWfgQXVuMMA9QG1lvE20wF+ki7T5L+0likt4HpnKRPEPKYeovDP+
	4tgpI6Ub5148lOxJjtZVP9B5v6WBVDDfsNRTQBwTAubBa+VuTtSp6AhlnZBmIJBun8CpaTwT1fB
	ee6zcWMrejJnmvvF+xk628ZbKOaXcuBxX0FjlINv4Upp0ncx3ztEJLSuj0O4af6Adblkea8M7X2
	FRU8j4Sjj826ouEC3AX/YbeCefjdUo7IO2FrEpEVbDzEbvRFOy7U9tn4+HhfcOxELZOY2mwVITS
	TphbhXHv09ozkchzPBHxl2uIaOm9s7Dcf4D0gBunyxYq25wBgp5Rwy5NY20LRhvO2RbSZ87qTfR
	0WeSH6SnwNkNCzdr2KnCoV/MRbFX9AI7PADsRNmFvrVimytge9pn7SGkszkjkPy++R3ljcwO8oM
	ATTrDryziMU9+muhjeHz4wxO/k0znF0q9jNQH0NENEB7yZHLjG6ARCIRIkwhUfEkc8slDDFL4=
X-Received: by 2002:a17:907:9617:b0:bc6:7325:9526 with SMTP id a640c23a62f3a-bc673259b04mr267832766b.9.1778157996813;
        Thu, 07 May 2026 05:46:36 -0700 (PDT)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com. [209.85.208.47])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bc833e110fesm77441866b.46.2026.05.07.05.46.33
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2026 05:46:35 -0700 (PDT)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-67b6da5a618so1147500a12.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 07 May 2026 05:46:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/R1YHh1ok56NU28r16sFpTGigrrhay0OnFNRRuuvu35zeuD9lneWx9faxpQIeMQ17p017El9bFa1DKtabPGowdMQ==@vger.kernel.org
X-Received: by 2002:a05:6402:46c8:b0:67c:7618:7c2e with SMTP id
 4fb4d7f45d1cf-67d63d8550fmr3393847a12.8.1778157992777; Thu, 07 May 2026
 05:46:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260505071544.8965-1-biju.das.jz@bp.renesas.com> <20260505071544.8965-4-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260505071544.8965-4-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 7 May 2026 14:46:20 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV6KBSzVWZ_zSu+_p9MCK7=ZCv9hbKTo90w7n9C4nJJdA@mail.gmail.com>
X-Gm-Features: AVHnY4KZhHToYCwxjA3QFx4b-ubcRlYhXK1ceM_rJBkJvo-JZ4N6lUhOd36bIiI
Message-ID: <CAMuHMdV6KBSzVWZ_zSu+_p9MCK7=ZCv9hbKTo90w7n9C4nJJdA@mail.gmail.com>
Subject: Re: [PATCH 3/3] clk: renesas: r9a08g046: Add RSPI clock and reset support
To: Biju <biju.das.au@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, Brian Masney <bmasney@redhat.com>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 671054E866E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32243-lists,linux-renesas-soc=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.992];
	RCPT_COUNT_SEVEN(0.00)[9];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,mail.gmail.com:mid,glider.be:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Hi Biju,

On Tue, 5 May 2026 at 09:15, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Add clock and reset definitions for the three RSPI (Serial
> Peripheral Interface) channels on the RZ/G3L (R9A08G046) SoC.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/clk/renesas/r9a08g046-cpg.c
> +++ b/drivers/clk/renesas/r9a08g046-cpg.c
> @@ -168,6 +190,7 @@ static const char * const sel_eth1_tx[] = { ".div_eth1_tr", "eth1_txc_tx_clk" };
>  static const char * const sel_eth1_rx[] = { ".div_eth1_tr", "eth1_rxc_rx_clk" };
>  static const char * const sel_eth1_rm[] = { ".pll6_div10", "eth1_rxc_rx_clk" };
>  static const char * const sel_rsci[] = { ".pll2_div5", ".pll2_div6", ".pll2_div7", ".pll2_div2_4" };
> +static const char * const sel_rspi[] = { ".pll2_div5", ".pll2_div6", ".pll2_div7", ".pll2_div2_4" };

OK if I drop this line...

>  static const char * const sel_eth0_clk_tx_i[] = { ".sel_eth0_tx", ".div_eth0_rm" };
>  static const char * const sel_eth0_clk_rx_i[] = { ".sel_eth0_rx", ".div_eth0_rm" };
>  static const char * const sel_eth1_clk_tx_i[] = { ".sel_eth1_tx", ".div_eth1_rm" };
> @@ -199,6 +222,9 @@ static const struct cpg_core_clk r9a08g046_core_clks[] __initconst = {
>         DEF_MUX(".sel_rsci1", CLK_SEL_RSCI1, G3L_SEL_RSCI1, sel_rsci),
>         DEF_MUX(".sel_rsci2", CLK_SEL_RSCI2, G3L_SEL_RSCI2, sel_rsci),
>         DEF_MUX(".sel_rsci3", CLK_SEL_RSCI3, G3L_SEL_RSCI3, sel_rsci),
> +       DEF_MUX(".sel_rspi0", CLK_SEL_RSPI0, G3L_SEL_RSPI0, sel_rspi),
> +       DEF_MUX(".sel_rspi1", CLK_SEL_RSPI1, G3L_SEL_RSPI1, sel_rspi),
> +       DEF_MUX(".sel_rspi2", CLK_SEL_RSPI2, G3L_SEL_RSPI2, sel_rspi),

... and s/sel_rspi/sel_rsci_rspi/ while applying?

>         DEF_MUX(".sel_eth0_tx", CLK_SEL_ETH0_TX, G3L_SEL_ETH0_TX, sel_eth0_tx),
>         DEF_MUX(".sel_eth0_rx", CLK_SEL_ETH0_RX, G3L_SEL_ETH0_RX, sel_eth0_rx),
>         DEF_MUX(".sel_eth0_rm", CLK_SEL_ETH0_RM, G3L_SEL_ETH0_RM, sel_eth0_rm),

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

