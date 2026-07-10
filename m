Return-Path: <linux-renesas-soc+bounces-35065-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id I3psNIUUUWp7/AIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-35065-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Jul 2026 17:49:25 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DC5073C614
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Jul 2026 17:49:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-35065-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-35065-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id DC8CD300B5BF
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Jul 2026 15:49:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0766F40683F;
	Fri, 10 Jul 2026 15:49:24 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A00F14195A4
	for <linux-renesas-soc@vger.kernel.org>; Fri, 10 Jul 2026 15:49:22 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783698563; cv=none; b=vCFX4Y58OvITZs7n8ckNR/dAnJqEMZSKvTpxfb9lHqZ8XZXIzGArymVriD+ljGuL7bucFmzfob4pVWUMw21OyrJoBHw5IazDJQKjQXCHM9IaPH2BunXBImh2C40K9Z7FI1tYolRlpo11JPjC7mTgU79Moy1CeVOBIJSsKHDzBqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783698563; c=relaxed/simple;
	bh=A4h77ibawannBAPH87BChFbbPCITD6OENy0wjOmzx7E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bicXI91OepN9SG2AMYYqGLbUStRuVY150ANr3O7PFG0NCLzqfZPw3f5QBeNN4xRZccblon8TcSaQp2P2RJrGtFIRf4xbGT45nBJWoLWg5EJWGwe4U6fWTEa3HzUAPcMWjsBCcZGSJAlqZtaaB7uB5jWXHk/vnOzVbN5yyx70lTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.48
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-725cf9a923aso932656137.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 10 Jul 2026 08:49:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783698561; x=1784303361;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=c56Is5NzVBtMY2XB6xsd7AIP2CY/o4bo39X3DPUe1yU=;
        b=Tei8Lp8VSrnUgbBH9lnNqD8k2lau+KUXVPGqAXtRZvCB7u6QR7T7ite+f6vLocsTIC
         3fgwBZqpLWsWnmXkEvwm3V2jEGJR6WEtkDPc9rAg+UJV2Iv7g8GPBTh4pThHMRqlMr67
         w+UbcTjepLD9CHR3k+3S0sLzdIfaJOJgLIf7hiWeYaocifnxHhOOVJG7Hjr8OEPNCPR8
         DXnXdTULxq8Rr/q6ENjzx7s9EYefkoifGgllGEEFrv6+Spq4/1TJ04+agzXlSQlAb8Df
         EEdZlKVwt2Rj0OnERL7GL+cXwMV3rTy3s4k3WydwfrNoKf4qytVbyRJDC4NPzeWc6JyI
         1o3A==
X-Forwarded-Encrypted: i=1; AHgh+RpnywfgKEuaHKhu9pWPCcuxrmGZI9TvTC39bnM1ou2Vltr2A4fvrLOk4Pt8m8030Rtth2U3Vta9gmAHxPSpXC5wtQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyDFOo72Ty5uV78mN8Ia+iiRwXMXm30Ev5JCFE1LBXPqiDGh+a4
	iwqr3zfuUJPPXIRxBCVLz8wtE4BsuZOyy3+oAj3HsDiLddX2hgcrIZK3Dx1x8+I5
X-Gm-Gg: AfdE7ckF3L4dn+CPM/dUXnm5coGxvmjhH1Pqvz2l8IpQ1utcuISg8Gq2H/Y4TDkdXlC
	m+vGwKAcGnveix1BuPQOoaLM4SX6NvP2VPei8W9XDHbUIh2U9od7PtBtEqqmbZBcEot+JvhKU5R
	gOxLf4Bl7nX8gManr66u6U2yxAF8L6D+o26JQ5BLxrFIBIkHKTS4Xw2EiJcYrCMUxjltTRtA9At
	oabDuOCfxzSW36hZB3kkai/cPy5Hf2PYjy7ckjmE+YG8Qjvfn0EqiNDuXtUHP/aKEfmSbxKSAAs
	AoU5s1/tuY/xDhe0T74hoWyOOg2SUsfBpfljwXnqJqoTXA4VhwhvxZgyde0omnnh3H85Jg7gMA9
	I61no0OlbnxxDyW0l9z0sAwhh9FTYyDw76iQjvSxmWYH33nw1TQ2jInvpAfT/YSu2GORAgc5BMI
	PiSFy9vBbvlgbVIXVFX2OjKHhZBzQyuMQ8IkGERfzwJW+rn1+00A==
X-Received: by 2002:a05:6102:3049:b0:737:2ce5:7b2d with SMTP id ada2fe7eead31-744dfd5b06dmr7250591137.9.1783698561607;
        Fri, 10 Jul 2026 08:49:21 -0700 (PDT)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com. [209.85.217.42])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-744d6deb2a3sm5429142137.8.2026.07.10.08.49.20
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 08:49:21 -0700 (PDT)
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-725cf9a923aso932641137.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 10 Jul 2026 08:49:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrwMj18qNZJ8leb61ILbxLGkMCEtv1DgeDkZsg/jX3ZN+gBFqxUbXgDONg6bu8SzSPmmRn/Pe+ZkOXNnW1ymoKFNw==@vger.kernel.org
X-Received: by 2002:a05:6102:a54:b0:738:b13a:c81b with SMTP id
 ada2fe7eead31-744dfd58226mr8804295137.7.1783698560769; Fri, 10 Jul 2026
 08:49:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260619164030.380098-1-biju.das.jz@bp.renesas.com> <20260619164030.380098-5-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260619164030.380098-5-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 10 Jul 2026 17:49:09 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX2+Y3Wpd5WwZBRSjhPdABGfKEzUifcGg5gTbkya6Pjuw@mail.gmail.com>
X-Gm-Features: AUfX_mxzY40KN7w0aM5WBFkuFrJcn1qYlqHElb3aj7kHBqjUkZvRwirbZBKZLZ8
Message-ID: <CAMuHMdX2+Y3Wpd5WwZBRSjhPdABGfKEzUifcGg5gTbkya6Pjuw@mail.gmail.com>
Subject: Re: [PATCH 4/6] clk: renesas: rzg2l: Add support for RZ/G3L DSI mux
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-35065-lists,linux-renesas-soc=lfdr.de];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_RECIPIENTS(0.00)[m:biju.das.au@gmail.com,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:biju.das.jz@bp.renesas.com,m:bmasney@redhat.com,m:linux-renesas-soc@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:bijudasau@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,renesas.com:email,linux-m68k.org:from_mime,linux-m68k.org:email,mail.gmail.com:mid,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6DC5073C614

Hi Biju,

On Fri, 19 Jun 2026 at 18:40, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Add support for RZ/G3L DSI mux that supports 2 duty cycles.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

More comments...

> --- a/drivers/clk/renesas/rzg2l-cpg.c
> +++ b/drivers/clk/renesas/rzg2l-cpg.c
> @@ -120,6 +120,11 @@
>  #define RZG3L_PLL7_FSTD_DIV_MR_MIN     (8 * MEGA)
>  #define RZG3L_PLL7_FSTD_DIV_MR_MAX     (16 * MEGA)
>
> +#define CPG_PLLDSI_SMUX_LVDS_DUTY_NUM          4
> +#define CPG_PLLDSI_SMUX_LVDS_DUTY_DEN          7
> +#define CPG_PLLDSI_SMUX_DSI_RGB_DUTY_NUM       1
> +#define CPG_PLLDSI_SMUX_DSI_RGB_DUTY_DEN       2

I am wondering if these macros are worthwhile, as IMO they make it
harder to understand the code.

> +
>  /**
>   * struct clk_hw_data - clock hardware data
>   * @hw: clock hw

> +static int rzg3l_cpg_dsi_smux_get_duty_cycle(struct clk_hw *hw,
> +                                            struct clk_duty *duty)
> +{
> +       u8 parent = clk_mux_ops.get_parent(hw);
> +
> +       /*
> +        * CDIV7_DSIx_CLK - LVDS path (div7) - duty 4/7.
> +        * CSDIV_DSIx - DSI/RGB path (csdiv) - duty 1/2.
> +        */
> +       if (parent == 0) {
> +               duty->num = CPG_PLLDSI_SMUX_LVDS_DUTY_NUM;
> +               duty->den = CPG_PLLDSI_SMUX_LVDS_DUTY_DEN;

The 4/7 duty cycle is due to the division by 7 between M2 and M2_DIV7.
Perhaps it should be set by that divider clock instead?

> +       } else {
> +               duty->num = CPG_PLLDSI_SMUX_DSI_RGB_DUTY_NUM;
> +               duty->den = CPG_PLLDSI_SMUX_DSI_RGB_DUTY_DEN;
> +       }
> +
> +       return 0;
> +}


Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

