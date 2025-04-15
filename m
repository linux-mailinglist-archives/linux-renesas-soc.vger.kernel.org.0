Return-Path: <linux-renesas-soc+bounces-16014-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EA34A8A120
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Apr 2025 16:34:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A3E4D3AB71A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Apr 2025 14:34:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFA8320469E;
	Tue, 15 Apr 2025 14:34:19 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E8E8198823;
	Tue, 15 Apr 2025 14:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744727659; cv=none; b=jD8P1BIHMg8mNo0QhDduvWpNeAlvf2CD689MvkZCg/4UTqhUfmWj6FO+D44hc8UG8fYm1VC0Bdv3UPW6iDSKBZ+ZP+YV3odYfZ4Afyn6BbCbe4xIXQhhZExUSU4uxvOIiF/TGpD7UisQwd7lF2Hav7ryWWFcO/Ba3PvTm1ECWVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744727659; c=relaxed/simple;
	bh=0ho7LkAw5exAV2fASQLJiJ6zKiogLTEOEBo9ma+MBz0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SSYpXwI3tQgB7R7fD3WXooOgPrS+UNA9ktwwwXvG3OZi6DUY61p8Try5nA/bJ2bAmILYLe/H8MEZ6YrU1aak8aIBdUmpoSc4mxcpL10l+HKCPKnDQ1v9ycBmvNakEO/cZseXM3Vcg0GqD6z/pVZij5uJ8eCiugDZelVmzIm2gvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-6f0c30a1ca3so60239936d6.1;
        Tue, 15 Apr 2025 07:34:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744727656; x=1745332456;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YFPVcEEiobdT+1OcIUxsmQr7Ur44l0CAmSvwXzoKSWk=;
        b=onAd4Msko/Sv+53q+pXwuF8T2QGlHuxK0imhPN7HO42HhnocBhngFMIDhZDToNXgWt
         wFzE3n8AwTFdJKwpRDMJT6UD7zNPIvwxgXZB0IDZyV/zVKpHOAEWaXFNSibpAtpEePOp
         WXhlKIfojV1af0MPTWJqHoQ+X50qmYdJTxZzFf0HkgtYTNktZ0T3h1RaW72I97hPbFy7
         5KXvQFE2kZhLSX+2SN2AJLiDs9cItimibnNnE7cX4JNbSa4ynniBSBnBms3ancZNBt3O
         dBiKlhEkoc2xDR42umuZaPh/B42B4atWrZtQLnkXo8Cn4r5wEaAgFW8yq+K+gsrDMY4L
         pSSw==
X-Forwarded-Encrypted: i=1; AJvYcCUH1rvTMm2ZK6guDHc2p4dcSmwHenepNfP7qAJRQ85/ftwuLQR7PnUmnQrYmPFKe7QRWLuYH9nXw/c0@vger.kernel.org, AJvYcCUVv5/naxHzjMF2tHbNbIZTUUs2UzxesT3KY/S9vwK5vffyr4QMigN+3YABIy6QwNnBqbUBE5Y1uU/uxEjrlmvFmdU=@vger.kernel.org, AJvYcCVGAv8FG1u8U//hffWQyv7nwIujFisxy+TEZNBhRLiP/ADX5M2jX6q9QPrRYBVXNy623XWViRUNn1p4@vger.kernel.org, AJvYcCXf+f+D4PZ6vmugdblvGUaklhMS5hywxAkoBLCgLwJ64fT0Q5kAhuai3e2iMU1vtbnbG8mSaCPZinG7KSyY@vger.kernel.org
X-Gm-Message-State: AOJu0YxyykkGnCM+Aakm1SRrt+CaNYY7+JnymJjfrSgw7XcZ148INujz
	BFXpreoWfje80xirzNXoVPcH4MD2TZ77htbvUGzbClMpGavoL7brmUKMmonQ
X-Gm-Gg: ASbGnctDBcpObexMHeM4A8ToGwPzxvAFR88Nw7Tt40EpVTKaO3CBSTnjhxKa0VUN6ig
	PV+PkvJnw21Y8J4wkV6bZeddye6RxYyl9gvJEn3Yze52c7q8r6xZ1pIAuEmqtaZt5ZR+DBMLidz
	2zKHDQ7qSUhwbdeNJJLTdmwACTMdG7ikztQlMGofx9nKTIpUl/IUFvNkd2h8/A4cp0EOQEN2u5I
	+qmpoOX1t6JyDsUUdtzONtVSvU83CHi+cM6yFLjsgf2HVE74uLQrGjrW6GhB4oEdw+aC96Qhxkx
	9cftH7UQu5AxM6628/2XyIBoy1CEyU7xnwbNE0DM4xFK252wpFXSmcCau2yOCofI/HBLk4kIxfU
	NmDL9dQo=
X-Google-Smtp-Source: AGHT+IFPGH87UvKLPtcsS+0ChZc0vSXakJkusasnxnIuLcbUigE5VUVXp9gDO71AyOWRGLX6+TwZWQ==
X-Received: by 2002:a05:6214:e89:b0:6ef:3de:5ff7 with SMTP id 6a1803df08f44-6f230dc788fmr217939096d6.15.1744727655677;
        Tue, 15 Apr 2025 07:34:15 -0700 (PDT)
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com. [209.85.222.173])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f0de980872sm102100126d6.56.2025.04.15.07.34.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Apr 2025 07:34:15 -0700 (PDT)
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-7c560c55bc1so568270385a.1;
        Tue, 15 Apr 2025 07:34:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU3OTMaDhhFpIPhP4S0ods1zEArFIF4LePY/blP+bFS+IOaRqrxzUXmzYEsKPaOEFxDcGZNJyPz+5ES7i1qCE7ExCw=@vger.kernel.org, AJvYcCV8C86ZXpGPmFWkGuRxkkvaW17zlgCdW1mD2kSFQyJ2CvqKfvUvIFxkizkIhPRWdOxZX5t0C/6syKwg@vger.kernel.org, AJvYcCX62nzufXhVrrkubfzFeVoKkLoV2hRRnUAg0KNKlrXufbumjkFqGnduDfCi7tlsT/Pf59G/rsmAevup@vger.kernel.org, AJvYcCXSIXnnReMk9g46AWCG5I+dLB3CrZblX4dVvRhf386qyeb2x55DezdoAXzZFiDgwQE53mVxgtXQpdXm+EP+@vger.kernel.org
X-Received: by 2002:a05:620a:47d4:b0:7c7:b4de:12f0 with SMTP id
 af79cd13be357-7c7b4de12fbmr1765094085a.32.1744727655101; Tue, 15 Apr 2025
 07:34:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250407165202.197570-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250407165202.197570-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250407165202.197570-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 15 Apr 2025 16:34:02 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVdw1fRitLhtnLVtndyMMTofPu86Jeo9Gi+jN9JBvp8gA@mail.gmail.com>
X-Gm-Features: ATxdqUE8ACu1iJO5kseLLN5xUAKGwC10AYneSDKQpjFfffR_bcDoB9ebuNmS9yA
Message-ID: <CAMuHMdVdw1fRitLhtnLVtndyMMTofPu86Jeo9Gi+jN9JBvp8gA@mail.gmail.com>
Subject: Re: [PATCH v2 1/9] clk: renesas: rzv2h-cpg: Add support for static
 mux clocks
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 7 Apr 2025 at 18:52, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add support for `CLK_TYPE_SMUX` to register static muxed clocks on the
> Renesas RZ/V2H(P) SoC. Extend `cpg_core_clk` to include parent names,
> mux flags, and a new `smuxed` struct. Update clock registration to
> handle static mux clocks.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v6.16.


> ---
>  drivers/clk/renesas/rzv2h-cpg.c | 21 +++++++++++++++++++++
>  drivers/clk/renesas/rzv2h-cpg.h | 32 ++++++++++++++++++++++++++++++++
>  2 files changed, 53 insertions(+)
>
> diff --git a/drivers/clk/renesas/rzv2h-cpg.c b/drivers/clk/renesas/rzv2h-cpg.c
> index b8bed0c1d918..4cda36d7f0a7 100644
> --- a/drivers/clk/renesas/rzv2h-cpg.c
> +++ b/drivers/clk/renesas/rzv2h-cpg.c
> @@ -399,6 +399,24 @@ rzv2h_cpg_ddiv_clk_register(const struct cpg_core_clk *core,
>         return div->hw.clk;
>  }
>
> +static struct clk * __init
> +rzv2h_cpg_mux_clk_register(const struct cpg_core_clk *core,
> +                          struct rzv2h_cpg_priv *priv)
> +{
> +       struct smuxed mux = core->cfg.smux;
> +       const struct clk_hw *clk_hw;
> +
> +       clk_hw = devm_clk_hw_register_mux(priv->dev, core->name,
> +                                         core->parent_names, core->num_parents,
> +                                         core->flag, priv->base + mux.offset,
> +                                         mux.shift, mux.width,
> +                                         core->mux_flags, &priv->rmw_lock);
> +       if (IS_ERR(clk_hw))
> +               return ERR_CAST(clk_hw);
> +
> +       return clk_hw->clk;
> +}
> +
>  static struct clk
>  *rzv2h_cpg_clk_src_twocell_get(struct of_phandle_args *clkspec,
>                                void *data)
> @@ -483,6 +501,9 @@ rzv2h_cpg_register_core_clk(const struct cpg_core_clk *core,
>         case CLK_TYPE_DDIV:
>                 clk = rzv2h_cpg_ddiv_clk_register(core, priv);
>                 break;
> +       case CLK_TYPE_SMUX:
> +               clk = rzv2h_cpg_mux_clk_register(core, priv);
> +               break;
>         default:
>                 goto fail;
>         }
> diff --git a/drivers/clk/renesas/rzv2h-cpg.h b/drivers/clk/renesas/rzv2h-cpg.h
> index 59f72fbed133..03e602d70f69 100644
> --- a/drivers/clk/renesas/rzv2h-cpg.h
> +++ b/drivers/clk/renesas/rzv2h-cpg.h
> @@ -53,6 +53,26 @@ struct ddiv {
>                 .monbit = _monbit \
>         })
>
> +/**
> + * struct smuxed - Structure for static muxed clocks
> + *
> + * @offset: register offset
> + * @shift: position of the divider field
> + * @width: width of the divider field
> + */
> +struct smuxed {
> +       unsigned int offset:11;
> +       unsigned int shift:4;
> +       unsigned int width:4;
> +};
> +
> +#define SMUX_PACK(_offset, _shift, _width) \
> +       ((struct smuxed){ \
> +               .offset = (_offset), \
> +               .shift = (_shift), \
> +               .width = (_width), \
> +       })
> +
>  #define CPG_CDDIV0             (0x400)
>  #define CPG_CDDIV1             (0x404)
>  #define CPG_CDDIV3             (0x40C)
> @@ -96,8 +116,12 @@ struct cpg_core_clk {
>                 unsigned int conf;
>                 struct ddiv ddiv;
>                 struct pll pll;
> +               struct smuxed smux;
>         } cfg;
>         const struct clk_div_table *dtable;
> +       const char * const *parent_names;
> +       unsigned int num_parents;
> +       u8 mux_flags;
>         u32 flag;
>  };
>
> @@ -107,6 +131,7 @@ enum clk_types {
>         CLK_TYPE_FF,            /* Fixed Factor Clock */
>         CLK_TYPE_PLL,
>         CLK_TYPE_DDIV,          /* Dynamic Switching Divider */
> +       CLK_TYPE_SMUX,          /* Static Mux */
>  };
>
>  #define DEF_TYPE(_name, _id, _type...) \
> @@ -125,6 +150,13 @@ enum clk_types {
>                 .parent = _parent, \
>                 .dtable = _dtable, \
>                 .flag = CLK_DIVIDER_HIWORD_MASK)
> +#define DEF_SMUX(_name, _id, _smux_packed, _parent_names) \
> +       DEF_TYPE(_name, _id, CLK_TYPE_SMUX, \
> +                .cfg.smux = _smux_packed, \
> +                .parent_names = _parent_names, \
> +                .num_parents = ARRAY_SIZE(_parent_names), \
> +                .flag = CLK_SET_RATE_PARENT, \
> +                .mux_flags = CLK_MUX_HIWORD_MASK)
>
>  /**
>   * struct rzv2h_mod_clk - Module Clocks definitions
> --
> 2.49.0
>


--
Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

