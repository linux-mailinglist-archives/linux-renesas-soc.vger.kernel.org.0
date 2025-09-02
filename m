Return-Path: <linux-renesas-soc+bounces-21193-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C6E6CB40399
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Sep 2025 15:34:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 54C8A1B27156
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Sep 2025 13:32:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BD9D3093B5;
	Tue,  2 Sep 2025 13:27:34 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78C8E3081BE;
	Tue,  2 Sep 2025 13:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756819654; cv=none; b=Cdk3Ad3rm8Q3gX05rbW2pRoW1QdMJItgjo0WXsNwb7nGr2LZWkqOHr2XD0IlrQ2PZhwiTycHdQUbXklFm0dYAflePZD+635ka6iyvPy1bmcC2xnZO/cG+E084tce9vK2BlFnczSNEpgwdcJM0BqNk8x5bc3A88ITXE+XctMLPq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756819654; c=relaxed/simple;
	bh=2v2OPO/bSxYdTs8lkjHpFf9k0dAktDUW78DNfxE1urc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DxrT3kWx1aFQ85KMzq6djeT0tHwlE6/RINldOhk3oM5G2e/ZA/pnH/FRzxVHnYJZVh/LfyurBg+cODDoJmg3cNa8TAbpRmmmDyf9bkLqnb8W/Qb8FsEX+rTJNQ1CAX1yZm2Zpg7RC7n+iCersGVSZuWOGlLz2ZTs6/u+/G20h+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-5290c67854eso3303490137.3;
        Tue, 02 Sep 2025 06:27:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756819651; x=1757424451;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Hjg367ve14UB2eLFgEqGx8q70SaZsiZ2GUHWVuglP4c=;
        b=pGMKWw3JYsCSJGvUfrF1y9NJIuLKR0Po+aqf086jNKJvaU4x677qHGPNUmHwAiz8LW
         qvTAtMh9h1KfUmEUfNsTvsWYW4d0Vf06+ADcO0vgLiLzzKBQrYYB6bQvmJYolZgDIsUP
         z51ZIBNZqnvztVeZ4FXnR51FJpGph53wsgKK5N6Gk7ALKNCRSyIS6xiBz359T1z4KbGM
         ocvygk6SrkgJ9fZHurjT0+RgPVKsjUm/o174IQkgJQjv3Fyuvw/jkF6t7ER0oJy8+nMC
         tBgilP7PHfoAju7w2xOUqGqAho5BYRQSvIBB/zBH3/corunSa0gaQxnwULjCAoVci2si
         iKwg==
X-Forwarded-Encrypted: i=1; AJvYcCVHLsVsY2bv0Yq2SaoruTAW7alvQpordaT/FweXQo85BpuWvY7gySiaY3PwYBvnGb9G2NuuIlgtRTioTQpo4CXYuwY=@vger.kernel.org, AJvYcCVW8kkgU24En4EaanTh1P7xSnyOa9EPMTKiXOwBnQwn3nFgSr7E8lEzEJ2/tyoEjeCqNmUs4HaMzVA=@vger.kernel.org, AJvYcCVhI/vAoJ8JQ2vZogkYkO9ePBbs4UciooRuymC8kVVzyejrjdPGQThJviHKGeHxtV6n3icmntvvaBEdz9Qh@vger.kernel.org
X-Gm-Message-State: AOJu0YzBzB7F6IiNHqnPhwl2N1cc73ZmXrGjniRbEIBLPZByv6kzGAke
	Qe8Pp+8t4mZAAaoob0MDQ74UUi/H35l1zE7mRuJ8QDOQK4/kMRUeJJBUVv18gNVE
X-Gm-Gg: ASbGncu4V4uxbUnvgGLImySTFBGJdTZnR8JEcoey5aoAGfn1T8sMW3P68LTs5EOTqfi
	yl73WtF2hRqtSXf0v2hmTSbtGlcvGqY1mKR2dJMosLNAhIR839z+Gy7dtBLVD6CkxqpRhZUq5CJ
	6iyxEghRHQDEL5oGv3fYo5hlv86R4DEFQKNiXWtYXhJh2Vtp4gXkSaiWv00JyFmWxlyPgYkgTQi
	93g3Xowhjx/yfBo6F/G2C1A5rNgW1wPzvkzk+6gGlF+LBvxjJWtuj0K/7c8ym1iDPSjEUws+NTv
	wn+WvUg7kM6hi1t6ddWVhrKGSq5BT+e/WLxwIiLpUUcd6JNXdkLOdV7HNk/YUJQbSEZqezcsnHk
	5Jk+i0fSBYcmdGXBjQAFq5hkD6Eem/8cnXtAd8SO5BZBe7oFokIsmO0EBLdL4+fBMsJ+ZyU4=
X-Google-Smtp-Source: AGHT+IH17CO/IhKeNaCMaFmPJRwR/j9WC9CIvfFSlVLZzkcen91Nxo3x0EU08eb9FZBheEwEtpet/g==
X-Received: by 2002:a67:e702:0:b0:527:cc44:3d79 with SMTP id ada2fe7eead31-52b197510d4mr3742216137.3.1756819651085;
        Tue, 02 Sep 2025 06:27:31 -0700 (PDT)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com. [209.85.217.53])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-52aef458ebasm4287486137.4.2025.09.02.06.27.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Sep 2025 06:27:30 -0700 (PDT)
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-52aa9d0dd6eso2162357137.1;
        Tue, 02 Sep 2025 06:27:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVaO5rbEMTit2C4s+yqSUbi+awaU4viPEeUTNuvE+oQHLSF7++hQgBCwol3QrEKQoD8+t3Z1Vx+eI3n89oL@vger.kernel.org, AJvYcCWAC3N8CFO5LkKnuSVKX1qv9WOCQ1mAKPyZm64E83Oft9oL52K15aGN0rHl9Ypcs/xfXhyR7BeyUTPl11lz3ewcNrI=@vger.kernel.org, AJvYcCWqJBLeJ3OpTzS7Y0e6JCTm/2N7Px0UElJuvU7iyNYf7FWRcixERxstdj/75tAh/u1oyTZkd/kfUsM=@vger.kernel.org
X-Received: by 2002:a05:6102:5a92:b0:52a:45b4:7147 with SMTP id
 ada2fe7eead31-52b1b6fbdb3mr3511355137.21.1756819650188; Tue, 02 Sep 2025
 06:27:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250820171812.402519-1-biju.das.jz@bp.renesas.com> <20250820171812.402519-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20250820171812.402519-3-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 2 Sep 2025 15:27:18 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUmi=pp10=_WNTwbuH-PYknbFyP9iBcQDB+tNKVEXgLpA@mail.gmail.com>
X-Gm-Features: Ac12FXyVk2yOZVKjDiZ2w1NlLODExRAU-e_ztQQvAlGVHGSo3QSOuUlrCoAreR0
Message-ID: <CAMuHMdUmi=pp10=_WNTwbuH-PYknbFyP9iBcQDB+tNKVEXgLpA@mail.gmail.com>
Subject: Re: [PATCH 02/11] clk: renesas: r9a09g047: Add USB3.0 clocks/resets
To: Biju <biju.das.au@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

On Wed, 20 Aug 2025 at 19:18, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Add USB3.0 clock and reset entries.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/clk/renesas/r9a09g047-cpg.c
> +++ b/drivers/clk/renesas/r9a09g047-cpg.c
> @@ -16,7 +16,7 @@
>
>  enum clk_ids {
>         /* Core Clock Outputs exported to DT */
> -       LAST_DT_CORE_CLK = R9A09G047_GBETH_1_CLK_PTP_REF_I,
> +       LAST_DT_CORE_CLK = R9A09G047_USB3_0_CLKCORE,
>
>         /* External Input Clocks */
>         CLK_AUDIO_EXTAL,
> @@ -181,6 +181,8 @@ static const struct cpg_core_clk r9a09g047_core_clks[] __initconst = {
>                   CLK_PLLETH_DIV_125_FIX, 1, 1),
>         DEF_FIXED("gbeth_1_clk_ptp_ref_i", R9A09G047_GBETH_1_CLK_PTP_REF_I,
>                   CLK_PLLETH_DIV_125_FIX, 1, 1),
> +       DEF_FIXED("usb30_ref_alt_clk_p", R9A09G047_USB3_0_REF_ALT_CLK_P, CLK_QEXTAL, 1, 1),
> +       DEF_FIXED("usb30_core_clk", R9A09G047_USB3_0_CLKCORE, CLK_QEXTAL, 1, 1),

"usb3_0_..." for both, to match the public define and the clock diagram.

>  };
>
>  static const struct rzv2h_mod_clk r9a09g047_mod_clks[] __initconst = {
> @@ -276,6 +278,10 @@ static const struct rzv2h_mod_clk r9a09g047_mod_clks[] __initconst = {
>                                                 BUS_MSTOP(8, BIT(4))),
>         DEF_MOD("sdhi_2_aclk",                  CLK_PLLDTY_ACPU_DIV4, 10, 14, 5, 14,
>                                                 BUS_MSTOP(8, BIT(4))),
> +       DEF_MOD("usb30_aclk",                   CLK_PLLDTY_DIV8, 10, 15, 5, 15,
> +                                               BUS_MSTOP(7, BIT(12))),
> +       DEF_MOD("usb30_pclk_usbtst",            CLK_PLLDTY_ACPU_DIV4, 11, 0, 5, 16,
> +                                               BUS_MSTOP(7, BIT(14))),

"usb3_0_..." for both.
I cannot verify the actual clock bits, but they do lie in the empty
number space. And apparently the censor team forgot to scrub the
MSTOP bits ;-)

>         DEF_MOD_MUX_EXTERNAL("gbeth_0_clk_tx_i", CLK_SMUX2_GBE0_TXCLK, 11, 8, 5, 24,
>                                                 BUS_MSTOP(8, BIT(5)), 1),
>         DEF_MOD_MUX_EXTERNAL("gbeth_0_clk_rx_i", CLK_SMUX2_GBE0_RXCLK, 11, 9, 5, 25,
> @@ -352,6 +358,7 @@ static const struct rzv2h_reset r9a09g047_resets[] __initconst = {
>         DEF_RST(10, 7, 4, 24),          /* SDHI_0_IXRST */
>         DEF_RST(10, 8, 4, 25),          /* SDHI_1_IXRST */
>         DEF_RST(10, 9, 4, 26),          /* SDHI_2_IXRST */
> +       DEF_RST(10, 10, 4, 27),         /* USB30_ARESETN */

I cannot verify the actual reset bits, but they do lie in the empty
number space.
USB3_0_ARESETN, for consistency with the clocks?

>         DEF_RST(11, 0, 5, 1),           /* GBETH_0_ARESETN_I */
>         DEF_RST(11, 1, 5, 2),           /* GBETH_1_ARESETN_I */
>         DEF_RST(12, 5, 5, 22),          /* CRU_0_PRESETN */

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

