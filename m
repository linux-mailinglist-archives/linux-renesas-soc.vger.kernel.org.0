Return-Path: <linux-renesas-soc+bounces-33582-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8HFFGCNlIWrRFgEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33582-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 04 Jun 2026 13:44:35 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9062A63F864
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 04 Jun 2026 13:44:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33582-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33582-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 18F01300517C
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Jun 2026 11:42:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4A85421A0A;
	Thu,  4 Jun 2026 11:41:59 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABDCD42315B
	for <linux-renesas-soc@vger.kernel.org>; Thu,  4 Jun 2026 11:41:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780573319; cv=none; b=LoFdzA7x1efvNjUudBCLWq96p+S8dGmC8WxJRiiSPY0AjRDnC6L/59TVOB97GZxS/VmPtJVEmDoYD2AfPDHd1qT1lLVPmG9p2zB8DQ/qVrCQIQP4T9HfyBs+Wb83GiufSJscij9VWJr0hxnKQl9sqGPuLhz5FfOAadcs4rf0nr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780573319; c=relaxed/simple;
	bh=NFcn+5re6W8fOUpStLnoOpP08n3MpCoonlan2BCzqsg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AtZ6fQO75QmZymGFBosjTPcDBBZZf6Hn/VjY6q7lxXNILkDaW2yE5A9ULsnlFPQKtO+5eQIDE7pJikSHIr8P/i2vLmrbMats7zL0lFFRcuIem7gMYWs1qSMuk1SWhudGhIj/S1n39BNhzgJAN8CLZpx4zpz5wfPGvaeIbn+LQ0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.169
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-5ab03872a64so138132e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 04 Jun 2026 04:41:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780573312; x=1781178112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9SjEL3J1M6ssyuV3yx1NZqXFQtnLE7rLxALmfU/mPzo=;
        b=flEmxeNuDVtf6fTfTZWwlhaJZw0595EvYQ/KOoleeWrjRhp1wilz+B60gADv6db8Y/
         7sFtUeiB1nDRwWx2fEtFEJqsghIdlPXky1feA8ItaLdAF7/w9/MZjsoprXa53pTELi3L
         QtDpxjl2x9tG8mnRdaNaKDJufyJPJrP6gqti1nHY4pidM/r0VuFARJCZeWUaxxG9UI9w
         p/+HF7plDuUtV9QGf6KDo3WWr+UcLtcWuOkt4BvGxIUCCllRVOGDBsRXZohxRtOz04L3
         EQQTEdTQFS/Vv2eKzb93V9XAoKkHfHV1kBmMtQ9flKLZuYlYSMowv/+QlEzsDazRpcI3
         BbVQ==
X-Forwarded-Encrypted: i=1; AFNElJ+F6imAc4wWlGPrpKlq382iJgaUA7GIcGzgUdL2BfTq+Q/69QCJJC77QNQdiGN4OWBVV2kGa4aab+hQHiCmXhDUgA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxenNNmDRfEdgxZp/JwZLi13i19vuTa3eHVNgqipHx6EVl42Iqk
	QKPbPIFhz4iDk1AB61uArrHTKt/xkrk/H+bG4MF1m8ufZeFOBWA/IGp6poo2jhjCwkQ=
X-Gm-Gg: Acq92OEch8kZsItpVUQqNHE9Fy6iV6iScfpDHWuXpxGr3OWtD3DyGusUAwzCsXm06so
	HZFx1UFRiRll8iXAW8S635g5cmDj/pMuy82tmTZZDRmNRzdMdcZ6pFFF2pqjrESVrSs4BwcVYN0
	w5sCzE5MiryE5ExMFVTwsQ2s3HF8aCKGAvwQjRhLm96JaX9yBbUBfX8GODR2nt59etKviKDs4yf
	DQhaMoGC4vEWU+mGfdDv3XXkwfu2b+KH3uTYo2t40yQqiDClrx7SCLaezhvxkgs4BO72249Dec5
	2L8JR/zypbG/rA62IJwlkjwmKWiCD2JZO43jo0xPRYxBI0jKoa6m2xvqhaEMbZqJvilpFY5gJpk
	HISM4nXNeJ1/xWY0O1v11eC6cWjlXsV7YTqP7OdZO3cq2lXWJSBAi5vreJsHgkuQa/LT3roJY9k
	XMoNGed3mmFohIQhOgeD5gEZWM4qGSN2EGcKquj75PzRTpA9+twVaIFH9RRt8c3bIhf7KVXl0=
X-Received: by 2002:a05:6122:3d0d:b0:59d:ac8d:e130 with SMTP id 71dfb90a1353d-5a6e814a73emr4424163e0c.9.1780573312512;
        Thu, 04 Jun 2026 04:41:52 -0700 (PDT)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com. [209.85.217.42])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5a6dd501a90sm5010498e0c.17.2026.06.04.04.41.51
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jun 2026 04:41:51 -0700 (PDT)
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-6cfcad4f979so550699137.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 04 Jun 2026 04:41:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/MH26q+Omd7W7wzgabbQcSX9qN45odM3RC8Z6/HwBLGlRShdiut3mFh7nzUy7+vw8o5kS22xKkBdiDWhIwlMb4JA==@vger.kernel.org
X-Received: by 2002:a05:6102:8017:b0:633:3040:ca5c with SMTP id
 ada2fe7eead31-6ec4cc6cc9fmr4288587137.30.1780573310828; Thu, 04 Jun 2026
 04:41:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260525110603.4018170-1-john.madieu.xa@bp.renesas.com> <20260525110603.4018170-3-john.madieu.xa@bp.renesas.com>
In-Reply-To: <20260525110603.4018170-3-john.madieu.xa@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 4 Jun 2026 13:41:39 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVC_XtgRxJVjX6wnzMHYZeSGeqOmHsm4Tg6RJ0Tm=dX6w@mail.gmail.com>
X-Gm-Features: AVVi8Ccw5Ba_60Dzs2adNDvsycCaE2yjwE6AKvLwWxbsEZk5LA6wgR8624sRVIc
Message-ID: <CAMuHMdVC_XtgRxJVjX6wnzMHYZeSGeqOmHsm4Tg6RJ0Tm=dX6w@mail.gmail.com>
Subject: Re: [PATCH v4 2/8] clk: renesas: r9a09g047: Add audio clock and reset support
To: John Madieu <john.madieu.xa@bp.renesas.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, magnus.damm@gmail.com, 
	bmasney@redhat.com, prabhakar.mahadev-lad.rj@bp.renesas.com, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	biju.das.jz@bp.renesas.com, john.madieu@gmail.com
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
	TAGGED_FROM(0.00)[bounces-33582-lists,linux-renesas-soc=lfdr.de];
	DMARC_NA(0.00)[linux-m68k.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:john.madieu.xa@bp.renesas.com,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:magnus.damm@gmail.com,m:bmasney@redhat.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:linux-renesas-soc@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:biju.das.jz@bp.renesas.com,m:john.madieu@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:magnusdamm@gmail.com,m:johnmadieu@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_CC(0.00)[baylibre.com,kernel.org,gmail.com,redhat.com,bp.renesas.com,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	R_DKIM_NA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linux-m68k.org:from_mime,linux-m68k.org:email,vger.kernel.org:from_smtp,glider.be:email,renesas.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9062A63F864

Hi John,

On Mon, 25 May 2026 at 13:07, John Madieu <john.madieu.xa@bp.renesas.com> wrote:
> Add clock and reset entries for audio-related modules on the RZ/G3E SoC.
>
> Target modules are:
>  - SSIU (Serial Sound Interface Unit) with SSI ch0-ch9
>  - SCU (Sampling Rate Converter Unit) with SRC ch0-ch9, DVC ch0-ch1,
>    CTU/MIX ch0-ch1
>  - DMACpp (Audio DMA Controller)
>  - ADG (Audio Clock Generator) with divider input clocks and audio
>    master clock outputs
>
> The ADG SSI clock outputs (adg_ssi[0-9]_clk) are parented on
> CLK_PLLCLN_DIV8 as a deliberate simplification: the ADG dynamically
> muxes each output between adg_0_clk_195m and audio_clk[a,b,c] at
> runtime via ADG_AUDIO_CLK_SEL{0,1,2}, owned by the rsnd-adg driver.
>
> While at it, reorder plldty_div16 to group it with the other plldty
> fixed dividers.
>
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
> ---
>
> Changes:
>
> v4:
>  - Drop CLK_AUDIO_CLKA and its DEF_INPUT("audio_clka") entry, and
>    reparent adg_0_audio_clka on CLK_AUDIO_EXTAL, since AUDIO_CLKA is
>    provided by the existing AUDIO_EXTAL pin (Geert Uytterhoeven).
>  - Drop the internal core clocks Geert flagged as unused:
>    pllcm33_div4_ddiv2, pllcm33_div4_ddiv2_div2, pllcln_div32,
>    plldty_div2, plldty_div4 and cdiv5_mainosc. pllcln_div4 is kept,
>    as scu_0_clkx2 is parented on it.
>  - Rename the audio module clocks as suggested by Geert: ssif_clk ->
>    ssif_0_clk, scu_clk -> scu_0_clk, scu_clkx2 -> scu_0_clkx2,
>    admac_clk -> dmacpp_0_clk, adg_clks1 -> adg_0_clks1, adg_clk_200m
>    -> adg_0_clk_195m, adg_audio_clk{a,b,c} -> adg_0_audio_clk{a,b,c},
>    ssif_supply_clk -> ssiu_supply_clk. Update the target-module list
>    in the commit message (ADMAC -> DMACpp) to match.
>  - Rename the audio reset entries as suggested by Geert: SCU_RESET_SRU
>    -> SCU_0_RESET_SRU, ADMAC_ARESETN -> DMACpp_0_ARST,
>    ADG_RST_RESET_ADG -> ADG_0_RST_RESET_ADG.
>  - The adg_ssi[0-9]_clk parent is left unchanged as CLK_PLLCLN_DIV8.
>    Geert questioned whether this is correct, since these clocks are
>    ADG-generated. The parent is not changed; instead the commit
>    message now documents that the ADG muxes each output between
>    adg_0_clk_195m and audio_clk[a,b,c] at runtime via
>    ADG_AUDIO_CLK_SEL{0,1,2}, which no static parent can describe.

Thanks for the update!

> --- a/drivers/clk/renesas/r9a09g047-cpg.c
> +++ b/drivers/clk/renesas/r9a09g047-cpg.c

> @@ -532,6 +538,96 @@ static const struct rzv2h_mod_clk r9a09g047_mod_clks[] __initconst = {
>                                                 BUS_MSTOP(3, BIT(4))),
>         DEF_MOD("tsu_1_pclk",                   CLK_QEXTAL, 16, 10, 8, 10,
>                                                 BUS_MSTOP(2, BIT(15))),
> +       DEF_MOD("ssif_0_clk",                   CLK_PLLCLN_DIV8, 15, 5, 7, 21,
> +                                               BUS_MSTOP(2, BIT(3) | BIT(4))),

I will reorder while applying, to preserve sort order (by _onindex/_onbit).

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v7.3 with the above fixed.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

