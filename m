Return-Path: <linux-renesas-soc+bounces-31559-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qOn0GVzo6Wm2nAIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31559-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Apr 2026 11:37:32 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8737744FC8A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Apr 2026 11:37:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CC5263010D89
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Apr 2026 09:37:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E6BE3E4C92;
	Thu, 23 Apr 2026 09:37:29 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5DAF3E51D9
	for <linux-renesas-soc@vger.kernel.org>; Thu, 23 Apr 2026 09:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776937049; cv=none; b=Gq1hMlbDSfDtrXPUncaqMdZR+JW1yQAghVyzdPpkR9PrPaNlS2DdBohcZI0h5bazEet2bzTFBuh1nvR8uCfHY/VO3ABPRLwvjXDr01nSuB/buBUQI9XqnpsWQi5jEs/5XBeYtKIaETynR0DGrCORJOZdm5UjpRCm6pKi7Eidxk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776937049; c=relaxed/simple;
	bh=MMW8tY8fFNjxzkTNFQdlqOQr9QMK/x8eljdm5gJfveY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DlPDp7D/TadF+ujEDNISi2OyBpEcwuu5/+HMIXLYVZM8Rk2nHcKrXB2VsFzqXn4wYbuGP1GMROYs0MFD33g1lFWTWTsWgAJn7D+qNftFLbQFV+TDTO8vdpwH4id4FcHA/OanBufvqu/VVPLEYU73Edsbg3GtsJ0fVIOFYN2sBBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-56f660d9a51so4201601e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 23 Apr 2026 02:37:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776937047; x=1777541847;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2sPVy0d3Q09KZb/RrhEpm6fKzZd0ZrDUPEVCPpd/6xc=;
        b=N2TBWFzvEgivuvTLVFfiVxOmV65zn/nwPNIlkvlr+4sSIdJNy7zqD2GaQd06IzTJIL
         nwPSjZ99Q2pNtCiVm5YqGGcJJaSGKJiEIBHxw44cnu4eDcTDK6cl3mWOjvuB8G7/OLXJ
         liNOOT6Bp3cqnBlgKZNtIkcQtinU0/1+EfD9LOnN/BVodnEivXFH8p68hmXNOGfLcyVy
         Ii5eJ07PsCSQPQu/5YdAxw6nk+AVKFI9BdnILzFtjOkt2eyp7XfWEQs2r1+OJOhrsNQz
         qpntlMzoRv0KiEWkXJz2hbBroIbS1Zo85SkjIb/VRFe9f1EvPgipdzPF+k753/R3nFeh
         roMQ==
X-Forwarded-Encrypted: i=1; AFNElJ+lZt3N0WGG1nc8VqxDGqhcwVqSb/aNRnXqa7NMmnWuBAZ9FS1Bs1O47JEvxQ22l3DKmFZAVN87osU2Sb3uUNAoxA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwtuiPDkEUiPA6dOn8ECsm4ix0Cn7giuPePpYF97+ogfX5+3cXn
	QJ4bTOjINBG3X+oCQ/CKEWgFXKuGUH1xwDYhqo1Jp+QDpuVX7vyUmJjYYLms0S3/IIs=
X-Gm-Gg: AeBDiesyRx1NwowiWtRskKKkhowKT93WoxuLQ+Ij4OX2aRKUfHGNVO+gcLy/HFEcOoB
	AqWmtTtFhLJWnh1roZ2kIQt8rl8iVDxyzRht9KBiJmgmSUXm75rlBzFCEThQwdebcrTvVPnDopn
	Xk2oR6kCkY+AgVyPLggBvglQ7gi7BzqrpeRQGRB2XR1sWh+gaSHZ1IQ6Vt/Y9BkLD5SjSPXnBYe
	DWpfwlBbX186mE3kRbixX/0+c5hQyc0cHX/YE9QYWhUy2PGjktS+DDg44ATSxgPs+8lMwjMKR9j
	UMfw/lssX7rPdi2+5M+9gsiPKVUY3MbBpmqFoaZ6I3UVxBIVBwgkPtGaFVtThlGySi9NLM972rr
	grmg4jpbYs2nl/wo3D8sF6aE/QkF0iSlZLUrITRKGkER8jFIRIhh5/rKGyCY+DN0FJGrh6G/ldk
	8yK7skFrnJzH+hEGOa9ixwI8JUiq1Hd5ePZDoEV7x8UaZj63UJw/LydqbaFQfqQNOHY/Uzlvc=
X-Received: by 2002:a05:6122:225:b0:56d:8bdb:fa50 with SMTP id 71dfb90a1353d-56fa5a4281dmr14538457e0c.13.1776937046659;
        Thu, 23 Apr 2026 02:37:26 -0700 (PDT)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com. [209.85.217.49])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56fa93253aesm11151154e0c.14.2026.04.23.02.37.25
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Apr 2026 02:37:25 -0700 (PDT)
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-605a3cff8d0so3872274137.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 23 Apr 2026 02:37:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8D1gDutoaHVyC/1cliRboo0d72dB72u6KCxKuTSi2z4m1oiSbTUnPL89TyC4uMkqjWB0Xpb7TpTimMq3g6aCABEw==@vger.kernel.org
X-Received: by 2002:a05:6102:2d09:b0:605:17b8:16dc with SMTP id
 ada2fe7eead31-616f6ef7d62mr14489475137.20.1776937045430; Thu, 23 Apr 2026
 02:37:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260326110648.29389-1-biju.das.jz@bp.renesas.com> <20260326110648.29389-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260326110648.29389-3-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 23 Apr 2026 11:37:14 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUAdDAzRVkn6yOnTuN8nMWHwQsmfSncYu-0g=0KzUXbhA@mail.gmail.com>
X-Gm-Features: AQROBzATkhB-bEdA01TJo1KbJI6u1Ear7Clb_HG6YiZ4zlpVNu741tRlDhNBios
Message-ID: <CAMuHMdUAdDAzRVkn6yOnTuN8nMWHwQsmfSncYu-0g=0KzUXbhA@mail.gmail.com>
Subject: Re: [PATCH v5 2/4] clk: renesas: rzg2l: Add support for enabling PLLs
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
	TAGGED_FROM(0.00)[bounces-31559-lists,linux-renesas-soc=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[8];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,glider.be:email,mail.gmail.com:mid,renesas.com:email]
X-Rspamd-Queue-Id: 8737744FC8A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Biju,

On Thu, 26 Mar 2026 at 12:06, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Add support for enabling PLL clocks in the RZ/G3L CPG driver to turn off
> some PLLs, if they are not in use(eg: PLL6, PLL7)
>
> Introduce `is_enabled` and `enable` callbacks to handle PLL state
> transitions. With the `enable` callback, PLL will be turned ON only when
> the PLL consumer device is enabled; otherwise, it will remain off. Define
> new macros for PLL standby and monitor registers to facilitate this
> process.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/clk/renesas/rzg2l-cpg.c
> +++ b/drivers/clk/renesas/rzg2l-cpg.c
> @@ -58,6 +58,13 @@
>  #define RZG3S_DIV_NF           GENMASK(12, 1)
>  #define RZG3S_SEL_PLL          BIT(0)
>
> +#define RZG3L_PLL_STBY_OFFSET(x)       (GET_REG_SAMPLL_CLK1(x) - 0x4)
> +#define RZG3L_PLL_STBY_RESETB          BIT(0)
> +#define RZG3L_PLL_STBY_RESETB_WEN      BIT(16)
> +#define RZG3L_PLL_MON_OFFSET(x)                (GET_REG_SAMPLL_CLK1(x) + 0x8)

This - 0x4 / + 0x8 is a bit hard to follow.  I don't want to block
this series, so for now it's OK.
I think it would be good to refactor the whole PLL sub register offset
handling: currently the config value contains the offsets of both the
CLK1 and CLK2 registers (which differ by a fixed value of 4) in the
config value, and the other register offsets are derived using the
macros above.  Instead, it could store the lowest PLL registers offset
(STBY), and derive all others from that by additions only.

> +static int rzg3l_cpg_pll_clk_endisable(struct clk_hw *hw, bool enable)
> +{
> +       struct pll_clk *pll_clk = to_pll(hw);
> +       struct rzg2l_cpg_priv *priv = pll_clk->priv;
> +       u32 stby_offset, mon_offset;
> +       u32 val, mon_val;
> +       int ret;
> +
> +       stby_offset = RZG3L_PLL_STBY_OFFSET(pll_clk->conf);
> +       mon_offset = RZG3L_PLL_MON_OFFSET(pll_clk->conf);
> +
> +       if (enable) {
> +               val = RZG3L_PLL_STBY_RESETB_WEN | RZG3L_PLL_STBY_RESETB;
> +               mon_val = RZG3L_PLL_MON_RESETB | RZG3L_PLL_MON_LOCK;
> +       } else {
> +               val = RZG3L_PLL_STBY_RESETB_WEN;
> +               mon_val = 0;
> +       }
> +
> +       writel(val, priv->base + stby_offset);
> +
> +       /* ensure PLL is in normal/stanby mode */

standby.

> +       ret = readl_poll_timeout_atomic(priv->base + mon_offset, val, mon_val ==
> +                                       (val & (RZG3L_PLL_MON_RESETB | RZG3L_PLL_MON_LOCK)),
> +                                       10, 100);
> +       if (ret)
> +               dev_err(priv->dev, "Failed to %s PLL 0x%x/%pC\n", enable ?
> +                       "enable" : "disable", stby_offset, hw->clk);
> +
> +       return ret;
> +}

With the typo fixed:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

