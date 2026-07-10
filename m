Return-Path: <linux-renesas-soc+bounces-35061-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id rtYkHtwQUWrD+wIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-35061-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Jul 2026 17:33:48 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C1BC73C4AA
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Jul 2026 17:33:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-35061-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-35061-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1B073300F44B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Jul 2026 15:33:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33F0642E8F3;
	Fri, 10 Jul 2026 15:33:40 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7F8542E8E6
	for <linux-renesas-soc@vger.kernel.org>; Fri, 10 Jul 2026 15:33:37 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783697620; cv=none; b=vFX5CyteCzMa5lEyQzSl542+9v6h+KZxnvlvfwKkGJp0bOVhBCMWlZiVFpA1fS4eKeeXTRJPav/YmyzjF61do1Z84HjB8DQnqG2sLtZ/Ef3AfH7hT/WCgEvign+x+z0+zDs5E/6FlMsuInviJee08xe7PDQTVwbubpMq2LdN0Sk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783697620; c=relaxed/simple;
	bh=+uZ5UXdDa5uhMDpMicnYOj6M0pDzL1+0oF3Co1ShkM4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MX5U2wvXZM6xsOAeV5UoQW3HM9145Dk3dK0bxh5HOevuxIU2OGRp2gema4hDV1hMLJxOJXVCqu5hLCUrqVEbPbykgdPAC71oRlM5iHDpbATgfjJWESnZyZcsfF5Vj6N7IIkW/Le2zzB13Dki0RMV8zKJnBZlzYSFE9u6unLZGIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.47
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-737de525d2eso1192754137.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 10 Jul 2026 08:33:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783697617; x=1784302417;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+J9nqX31rcmK2FDgFjQE+og8sL9DsOwtNN74GPHDF2c=;
        b=LTb76gppkkdK6aapOwh0KziXS+4/prSlvnofcYFOUKh3vkjII0vdVyBbGg0QU29gOp
         r+AcxUJg6Isnix3bH+POhGUIjABYn/Ka6G+kZPCZ0muB1yFqR0yzyEYtGRyNWPXrTQ1w
         ogmjbpTWWlksDl6jpU3VIia8kwFrrS+3WyJNYVmKj45PptyC8bJ+wab9QstEss07wFl/
         qIuOvMj1Xw7qIqnLnSFllGyu0DbPrFnw61c7gmp3n8jG2WuUQDuYCOt5UXx1XyHZXh1f
         cpnkWHUa/PCKJlYsi4WLEOHOhhTiYPTp3OX76uS5JBPx8NW3ZJfw7pNzPeGWGRm6jKku
         ai0w==
X-Forwarded-Encrypted: i=1; AHgh+RqIf9D/p2dn0PPaIR1JneP1rmIKMVxVpoO4a8D6d4UnbyKFKxcobgqDlGht/kTtNUwVq9knjp6uUWQPoLRtBCflMw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyJ0jMJcxMdOeszenzPGx2OS2Oq0PwHQJhH8LzUuEw+R0aaM9id
	V6RvzOxoUObmm1a1H1iRyXtntUEAe83wNeH2b32u5/9HbkiTSuQRMQXvauktS4gq
X-Gm-Gg: AfdE7clIh0KG7i7bSl1oI1ZUPe2Kzv7Jj9m+5Lf24e2/GYecriprd6ti63J1AmUSy4O
	cJbTlAlyXf/mnq7WvTiv8uHOFvKDs3Ib098th4Wn1CEkTwOnGYf3wpBhSAo5Qyy1I5PuXLTpUYK
	Ap0aHFq/OH67yuMckoG1M5fp8q3eY9bBbNcX7AADdZXpFE4uIB89beM2HKrVjWW2+nRQQsuP+01
	tzYfxDP/UDwfaW/GPfy9k1/RXwSpmynZekT8053F0er6bSK9p9FSdq9a2hpgB4OIU4n9Kvav5lh
	nJTiWN+gCWpyRZtlfH1TTaur8zqv6eydAgHbJKA+99mgzDlgyybbJLOm2GkgRsjPn7X81VHhqul
	PS+68jTftUxeumQij4OMNlwgdb3WlhPREw+dUUuHG2uu+KOqn5VEWId2mBSPUD5eKU+j0tZkDSJ
	J11RQb+Jm4uc1/xNuxQwfPqo9Z5Ff5P4f3ifu5rFvaJ6qn7wRZYg==
X-Received: by 2002:a05:6102:54a8:b0:643:80f1:350a with SMTP id ada2fe7eead31-744dfd09748mr8788753137.2.1783697616693;
        Fri, 10 Jul 2026 08:33:36 -0700 (PDT)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com. [209.85.217.48])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-96ed3184b2asm4252706241.5.2026.07.10.08.33.36
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 08:33:36 -0700 (PDT)
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-725cf9a923aso917969137.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 10 Jul 2026 08:33:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpalVfDNkuckbQj+PAtlFD5U0qUNa7oS1bDOq+RFVUKkiUZ3ptYJfDUKDb+ZbgMSPHnwnm6l7zqCL/Yz0x+xyNp5g==@vger.kernel.org
X-Received: by 2002:a05:6102:424e:b0:740:4fd:1c40 with SMTP id
 ada2fe7eead31-744dffe9c44mr7334430137.25.1783697611180; Fri, 10 Jul 2026
 08:33:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260619164030.380098-1-biju.das.jz@bp.renesas.com> <20260619164030.380098-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260619164030.380098-2-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 10 Jul 2026 17:33:19 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU3hKHP-dSVrX7xzQS8oozeJo_2na9Od3vRuPbKDGLt=Q@mail.gmail.com>
X-Gm-Features: AUfX_mzojKdu_GbcaopGh8X_KXQ0RBr0eGDv_KuWYH0dzXkQTjZt2QCt2fgBU28
Message-ID: <CAMuHMdU3hKHP-dSVrX7xzQS8oozeJo_2na9Od3vRuPbKDGLt=Q@mail.gmail.com>
Subject: Re: [PATCH 1/6] clk: renesas: rzg2l: Add DSI divider clock support
 for RZ/G3L
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
	TAGGED_FROM(0.00)[bounces-35061-lists,linux-renesas-soc=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp,renesas.com:email,linux-m68k.org:from_mime,linux-m68k.org:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1C1BC73C4AA

Hi Biju,

On Fri, 19 Jun 2026 at 18:40, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Add a new DSI divider clock type (CLK_TYPE_G3L_PLLDSI_DIV) for the RZ/G3L
> SoC, which requires a different divider implementation than the existing
> RZ/G2L DSI divider clock.
>
> The RZ/G3L DSI divider uses two cascaded dividers, DIV_DSI_A and
> DIV_DSI_B, where the effective divider is:
>
>   rate = parent_rate / ((1 << div_a) * (div_b + 1))
>
> DIV_DSI_A is a power-of-two divider with values in the range [0, 5],
> and DIV_DSI_B is a linear divider with values in the range [1, 16].
>
> Introduce the g3l_dsi_div_hw_data structure, rzg3l_cpg_dsi_div_ops, and
> rzg3l_cpg_dsi_div_clk_register() to implement the new clock type, and add
> the DEF_G3L_PLLDSI_DIV() macro for use in clock table definitions.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/clk/renesas/rzg2l-cpg.c
> +++ b/drivers/clk/renesas/rzg2l-cpg.c

> @@ -834,6 +837,134 @@ rzg2l_cpg_dsi_div_clk_register(const struct cpg_core_clk *core,
>         return clk_hw->clk;
>  }
>
> +struct g3l_dsi_div_hw_data {
> +       struct clk_hw hw;
> +       struct rzg2l_cpg_priv *priv;
> +       unsigned long rate;
> +       u32 off;
> +       u8 div_a;
> +       u8 div_b;
> +};
> +
> +#define to_g3l_dsi_div_hw_data(_hw)    container_of(_hw, struct g3l_dsi_div_hw_data, hw)
> +
> +static unsigned long rzg3l_cpg_dsi_div_recalc_rate(struct clk_hw *hw,
> +                                                  unsigned long parent_rate)
> +{
> +       struct g3l_dsi_div_hw_data *dsi_div = to_g3l_dsi_div_hw_data(hw);
> +       struct rzg2l_cpg_priv *priv = dsi_div->priv;
> +       int div_a, div_b, val;
> +
> +       val = readl(priv->base + dsi_div->off);
> +       div_a = FIELD_GET(GENMASK(2, 0), val);
> +       div_b = FIELD_GET(GENMASK(7, 4), val);

Please add and use

    #define DIV_DSI_A_SET    GENMASK(2, 0)
    #define DIV_DSI_B_SET    GENMASK(7, 4)

(after having seen G3L_SDIV_DSI_C_SET, I kept on looking for  similar
 A_SET and B_SET use).

> +
> +       return DIV_ROUND_CLOSEST_ULL((u64)parent_rate, (1 << div_a) * (div_b + 1));

You can simplify the divider to "(div_b + 1) << div_a".

> +}
> +
> +static int rzg3l_cpg_dsi_div_determine_rate(struct clk_hw *hw,
> +                                           struct clk_rate_request *req)
> +{
> +       struct g3l_dsi_div_hw_data *dsi_div = to_g3l_dsi_div_hw_data(hw);
> +       struct rzg2l_cpg_priv *priv = dsi_div->priv;
> +       u32 divider = dsi_div_ab_desired;

unsigned int

> +       bool divider_found = false;
> +       unsigned int div_a, div_b;

Perhaps move the declarations of the loop counters inside the
for()-statements?

> +
> +       if (dsi_div_target) {
> +               /* Calculate the DIV_DSI_A and DIV_DSI_B */

Please drop "the".

> +               for (div_a = 5; div_a >= 0 && !divider_found; div_a--) {

div_a is unsigned, so >= is always true

> +                       for (div_b = 0; div_b < 16; div_b++) {
> +                               divider = (1 << div_a) * (div_b + 1);

(div_b + 1) << div_a

> +                               if (divider == dsi_div_ab_desired) {

divider is 1..512, while dsi_div_ab_desired is only u8.

> +                                       dsi_div->div_a = div_a;
> +                                       dsi_div->div_b = div_b;
> +                                       divider_found = true;
> +                                       break;
> +                               }
> +                       }
> +               }
> +       } else {
> +               dsi_div->div_b = 0;
> +               /* Calculate the DIV_DSI_A */

Please drop "the"

> +               for (div_a = 5; div_a >= 0 && !divider_found; div_a--) {
> +                       divider = (1 << div_a);
> +                       if (divider == dsi_div_ab_desired) {
> +                               dsi_div->div_a = div_a;
> +                               divider_found = true;
> +                               break;
> +                       }
> +               }
> +       }
> +
> +       if (!divider_found) {
> +               dev_err(priv->dev, "failed dsi div for: %u\n", divider);
> +               return -EINVAL;
> +       }
> +
> +       req->best_parent_rate = req->rate * divider;
> +
> +       return 0;
> +}
> +
> +static int rzg3l_cpg_dsi_div_set_rate(struct clk_hw *hw, unsigned long rate,
> +                                     unsigned long parent_rate)
> +{
> +       struct g3l_dsi_div_hw_data *dsi_div = to_g3l_dsi_div_hw_data(hw);
> +       struct rzg2l_cpg_priv *priv = dsi_div->priv;
> +
> +       writel(RZG3L_SDIV_DIV_DSI_A_WEN | RZG3L_SDIV_DIV_DSI_B_WEN |
> +              (dsi_div->div_a << 0) | (dsi_div->div_b << 4),

FIELD_PREP(DIV_DSI_A_SET, dsi_div->div_a) |
FIELD_PREP(DIV_DSI_B_SET, dsi_div->div_b)


> +              priv->base + dsi_div->off);
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

