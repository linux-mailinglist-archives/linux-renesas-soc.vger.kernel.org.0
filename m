Return-Path: <linux-renesas-soc+bounces-18460-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F541ADD119
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Jun 2025 17:11:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BD969188D0CC
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Jun 2025 15:12:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCAB22E9742;
	Tue, 17 Jun 2025 15:11:34 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0C992E9733;
	Tue, 17 Jun 2025 15:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750173094; cv=none; b=N3jZuiY8HDVxyq5moyC5Ay8zsqVPk2zepSTWAGhs5exJ7fnStMbdM1Po8HTIf/I33rvVardpsM63MJiqAyJtOgryWoO8Mk2tMwH63vIcC514jrOoPRUs5zZOzsIC9p05jSqQ9scarbJ1oRBeDgoZjsErfV7eEyCjA42mbJQLvdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750173094; c=relaxed/simple;
	bh=Zsh5aIo+bj1A7ONN8PodNeASYr6LUKd2rkEpVPlcDeI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jK6adyT52nI2/J2H+V7ic2JGkyPOPfFb94s5gh7kozb/P8ctq5sGBaqIe+mNF1Ks1vUv1fz863nXmPdqa3VtAKhH1vKEt1L0qeilF55Fru0NQyDp/lKgLX1OAUGx/lJMNnATsy3pkm4eBsC7THBF/g6/5Bc4Ft16lIRvQch1SOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-4a43972dcd7so74762411cf.3;
        Tue, 17 Jun 2025 08:11:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750173090; x=1750777890;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vO7a97pP4ukARVbDLbAKCzb/am8gMifgt4A7ef66jhM=;
        b=g9EEG7INJWGa258Oy6rwWUhcAW5siUx754PCwx1qyuK08jwI5gqkjE14bG1xKD/JM8
         xsAAbt2tvarOnfHUPyUJYX0oFVBT/+iFn5HkuoUV3BVHd+2XiVFiqCHXULydYyura4uN
         /Yi4GKxEtZYjQEgjqL2v0ZETmrG9zk7ZpVuoyVE+y8zMGfwgrulsqthprMqhK0IJ0snT
         aS4nRW41jeGadduS7fA8Hss7720VCVGTOne6g8ZJgRCi49WdI+mCFZZXlT4w85+PPmTj
         6oGtXk0c34EoJdp3ICpjm9zdrNdELv2lnZL44eSJ+cezPCaVhQi/fuZw35S5e1G0JV/t
         ETyw==
X-Forwarded-Encrypted: i=1; AJvYcCVCODdI5maIZUK8x0b7XIpV7twfijqCLwT0vRSf9GJoUmUxZRxEf4sr5BHcymSm+AmCV68vaKd2@vger.kernel.org, AJvYcCW6QH9AbRhASs8oZSaKpEcXgpept2q2UjaPZ9vWBvKiSyfUXu53BEnyGPyKii3qcacMS/6v37yCsHi+PgHk@vger.kernel.org, AJvYcCXLLEo53Kyqn8oZY1XopYTE7JjcWrcOOqgbRucC5RnN0ZbsThEP+yspSpuQCk//LStr+qSj9hvAT73T@vger.kernel.org, AJvYcCXZMhVHeCEU/DaTls4owpiz/p4bP1845CCTqegH+gBwNNdTmsFn788hM7Pn7wZTFeRxBJ3JZ9IvIthijMiwjTG3gcQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzldXLIHKmXN3T27/zEhLD5EOGy6Pb54tRCWNNoatRNr+pAavAZ
	VRhNGrNY0KKJ1F/0WhvGaP8mFqv7zPQXbAXIhno82sW+HYUj6MFZOYmkRVygy83l
X-Gm-Gg: ASbGncuElgRO6SV5/+LcoIL9wDW431E+t5j9a5eVIxhaT87pgP2gMg6kalwOs6nNMFT
	5owkPGWK+op9ilHvEkuHrfQ92Bi16DbxiJlPmYXjORI5p2loKd+yZ8w3k+s0Di5ZEI+J3CGmHA2
	sTdRAM4R/0XZhBM2MHzG6JaLl9CW/eKfK/Dg4ivvHFI0zRvPZa528u/E7JZKOJXCd8zEuGXvV+j
	5n2hMtvlSAWXej1APncljXAayH2dK3JJ+u1teYfXXuo/dwj15ISEm9uXzeY0xktUJ7EcmMQJhxy
	wwpbAE/GHzXzpLRcHU9yMc1L9mdDZkauApjl8n+3mfQ35P4DAz8+yjz6wjCpE0THRZOHlGCuwN2
	clFzsS9YB28/C2DHh8M2F57btdafu
X-Google-Smtp-Source: AGHT+IEX2Bjy6La5Rp4ul7jKmgUKQN0m3E3+9FXnVOfpn6cUDld26sB6pcM1We78L1iu0pDJcE3oYg==
X-Received: by 2002:a05:622a:18a0:b0:4a4:3d6e:57c8 with SMTP id d75a77b69052e-4a73c5f941cmr219515821cf.34.1750173089864;
        Tue, 17 Jun 2025 08:11:29 -0700 (PDT)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com. [209.85.222.172])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fb4ed60787sm33751536d6.48.2025.06.17.08.11.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jun 2025 08:11:29 -0700 (PDT)
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-7c5b8d13f73so644463285a.0;
        Tue, 17 Jun 2025 08:11:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUYcHUlfymYbkzumkB8iWuE177kGit9rIEh//B4Yf5wMBjl2ya0cG2/XKPslSxtioo/T2bfbcL8@vger.kernel.org, AJvYcCV0JcIlH8vn/7IkMizb5q4BwaXLN9CQFYbBZJ/DvD/H4DnXvn/TVrcQKVXAGNEQ6LaGuPEhIpleUu4F@vger.kernel.org, AJvYcCVgBlCeqz1Mf5lBmftoihhUbWbo1yFWIGhesfZ1gxfDDWsYrPtyyvxZGKENoxxgh66YIFQgTe6WMF85FBJO@vger.kernel.org, AJvYcCWPQ6i22dD7bpyARLHlA6my0VBew96gN4Nige6Rn4sgF1bKvdQjGCDpWY+7Zsp+Fxdp0MwO3xysnbOhSpHaeS4/8LQ=@vger.kernel.org
X-Received: by 2002:a05:620a:4690:b0:7d3:913e:802e with SMTP id
 af79cd13be357-7d3c6cf5d27mr1916389785a.41.1750173089155; Tue, 17 Jun 2025
 08:11:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250611061609.15527-1-john.madieu.xa@bp.renesas.com> <20250611061609.15527-2-john.madieu.xa@bp.renesas.com>
In-Reply-To: <20250611061609.15527-2-john.madieu.xa@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 17 Jun 2025 17:11:17 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXE-C4FAXOfzQv8xfgFytwpqkARDORGLkosZtCsjK8nmg@mail.gmail.com>
X-Gm-Features: Ac12FXyQCqP8CWB4cTKabVnuKWIm_-hzOXZkBQa3qOJhr22FARrB3ykfGLTgX08
Message-ID: <CAMuHMdXE-C4FAXOfzQv8xfgFytwpqkARDORGLkosZtCsjK8nmg@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] clk: renesas: r9a09g047: Add clock and reset
 signals for the GBETH IPs
To: John Madieu <john.madieu.xa@bp.renesas.com>
Cc: andrew+netdev@lunn.ch, conor+dt@kernel.org, davem@davemloft.net, 
	edumazet@google.com, krzk+dt@kernel.org, kuba@kernel.org, pabeni@redhat.com, 
	prabhakar.mahadev-lad.rj@bp.renesas.com, robh@kernel.org, 
	biju.das.jz@bp.renesas.com, devicetree@vger.kernel.org, john.madieu@gmail.com, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	magnus.damm@gmail.com, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi John,

On Wed, 11 Jun 2025 at 11:02, John Madieu <john.madieu.xa@bp.renesas.com> wrote:
> Add clock and reset entries for the Gigabit Ethernet Interfaces (GBETH 0-1)
> IPs found on the RZ/G3E SoC. This includes various PLLs, dividers, and mux
> clocks needed by these two GBETH IPs.
>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> Tested-by: Biju Das <biju.das.jz@bp.renesas.com>
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/clk/renesas/r9a09g047-cpg.c
> +++ b/drivers/clk/renesas/r9a09g047-cpg.c
> @@ -85,7 +95,18 @@ static const struct clk_div_table dtable_2_64[] = {
>         {0, 0},
>  };
>
> +static const struct clk_div_table dtable_2_100[] = {
> +       {0, 2},
> +       {1, 10},
> +       {2, 100},
> +       {0, 0},
> +};
> +
>  /* Mux clock tables */
> +static const char * const smux2_gbe0_rxclk[] = { ".plleth_gbe0", "et0_rxc_rx_clk" };
> +static const char * const smux2_gbe0_txclk[] = { ".plleth_gbe0", "et0_txc_tx_clk" };
> +static const char * const smux2_gbe1_rxclk[] = { ".plleth_gbe1", "et1-rxc-rx_clk" };
> +static const char * const smux2_gbe1_txclk[] = { ".plleth_gbe1", "et1-txc-tx_clk" };

Please use consistent naming for the external clocks (underscores
vs. dashes).  However, both differ from the similar names used on
RZ/V2H and RZ/V2N; perhaps use the naming from the latter instead?

>  static const char * const smux2_xspi_clk0[] = { ".pllcm33_div3", ".pllcm33_div4" };
>  static const char * const smux2_xspi_clk1[] = { ".smux2_xspi_clk0", ".pllcm33_div5" };
>

> @@ -214,6 +252,30 @@ static const struct rzv2h_mod_clk r9a09g047_mod_clks[] __initconst = {
>                                                 BUS_MSTOP(8, BIT(4))),
>         DEF_MOD("sdhi_2_aclk",                  CLK_PLLDTY_ACPU_DIV4, 10, 14, 5, 14,
>                                                 BUS_MSTOP(8, BIT(4))),
> +       DEF_MOD("gbeth_0_clk_tx_i",             CLK_SMUX2_GBE0_TXCLK, 11, 8, 5, 24,
> +                                               BUS_MSTOP(8, BIT(5))),
> +       DEF_MOD("gbeth_0_clk_rx_i",             CLK_SMUX2_GBE0_RXCLK, 11, 9, 5, 25,
> +                                               BUS_MSTOP(8, BIT(5))),
> +       DEF_MOD("gbeth_0_clk_tx_180_i",         CLK_SMUX2_GBE0_TXCLK, 11, 10, 5, 26,
> +                                               BUS_MSTOP(8, BIT(5))),
> +       DEF_MOD("gbeth_0_clk_rx_180_i",         CLK_SMUX2_GBE0_RXCLK, 11, 11, 5, 27,
> +                                               BUS_MSTOP(8, BIT(5))),
> +       DEF_MOD("gbeth_0_aclk_csr_i",           CLK_PLLDTY_DIV8, 11, 12, 5, 28,
> +                                               BUS_MSTOP(8, BIT(5))),
> +       DEF_MOD("gbeth_0_aclk_i",               CLK_PLLDTY_DIV8, 11, 13, 5, 29,
> +                                               BUS_MSTOP(8, BIT(5))),
> +       DEF_MOD("gbeth_1_clk_tx_i",             CLK_SMUX2_GBE1_TXCLK, 11, 14, 5, 30,
> +                                               BUS_MSTOP(8, BIT(6))),
> +       DEF_MOD("gbeth_1_clk_rx_i",             CLK_SMUX2_GBE1_RXCLK, 11, 15, 5, 31,
> +                                               BUS_MSTOP(8, BIT(6))),
> +       DEF_MOD("gbeth_1_clk_tx_180_i",         CLK_SMUX2_GBE1_TXCLK, 12, 0, 6, 0,

scripts/checkpatch.pl says:

    WARNING: please, no space before tabs

> +                                               BUS_MSTOP(8, BIT(6))),
> +       DEF_MOD("gbeth_1_clk_rx_180_i",         CLK_SMUX2_GBE1_RXCLK, 12, 1, 6, 1,
> +                                               BUS_MSTOP(8, BIT(6))),
> +       DEF_MOD("gbeth_1_aclk_csr_i",           CLK_PLLDTY_DIV8, 12, 2, 6, 2,
> +                                               BUS_MSTOP(8, BIT(6))),
> +       DEF_MOD("gbeth_1_aclk_i",               CLK_PLLDTY_DIV8, 12, 3, 6, 3,
> +                                               BUS_MSTOP(8, BIT(6))),

Shouldn't all of these use DEF_MOD_MUX_EXTERNAL() instead of DEF_MOD(),
like on RZ/V2H and RZ/V2N?

>         DEF_MOD("cru_0_aclk",                   CLK_PLLDTY_ACPU_DIV2, 13, 2, 6, 18,
>                                                 BUS_MSTOP(9, BIT(4))),
>         DEF_MOD_NO_PM("cru_0_vclk",             CLK_PLLVDO_CRU0, 13, 3, 6, 19,

The rest LGTM. Note that I don't have access to the Additional Document,
so I couldn't verify all details.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

