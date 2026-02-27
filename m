Return-Path: <linux-renesas-soc+bounces-28517-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QPBnK5F2oWmutQQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28517-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Feb 2026 11:48:49 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 24D861B62D4
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Feb 2026 11:48:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CE4C830233F3
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Feb 2026 10:48:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 703523803CE;
	Fri, 27 Feb 2026 10:48:12 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20E40394465
	for <linux-renesas-soc@vger.kernel.org>; Fri, 27 Feb 2026 10:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772189292; cv=none; b=HqwEM8ntwNHoltKyiTJOBM5L/y5bitdKEuz2L7cpsDNdtElzAUA90uwJLTZKlV8M6bGqCZ94aQM/Sf1hZyWLkkb4hAxIwLo2G9agXr6ZA8I7Q0WaZW4mIA7vSV/s4VHg0bCwJoxUBRDCYx0kRG/wWS22Abp1v3yVM6emRlwmdCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772189292; c=relaxed/simple;
	bh=2dyKtNyh+VYQgv3RdAGTDcERo7pDX5CfMVIb/NziIdw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tAG3gY1UklrBpG4uxKper0UTPWsHL8h5Z6EelolqTYPO+xHsGKMToEpK1axBFEA6M/5MkkQdRvMMiHTlMwAfgR+QMeHXRs9XVBMjSrufUMqfNSV5YwU1wTwuBY701lDOfIPRnYTLEuhr3gn+z6quAsYtHgJa4qRd+Ya6xRSHas0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-56a9076813bso755830e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 27 Feb 2026 02:48:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772189290; x=1772794090;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3FlwDAQHs4Ab188Hz8URDAmWORYubm2PaVsA0iFMwu0=;
        b=u4SkIQ4zEoHpXMDLXRZt3Y5in4QCC9A7UCfpjmwH/3e68nO3OlcWvt9+y/6GxFoq2g
         aDFKNdxkvMK/l9DbW9S1SwQlvjOqSe7J4c4nfmkmsHsp8mXCv3S/ctBrgvB7NYiNiFrZ
         wqfHcDdAWqYfZkduxQBlyUKnfzh8euMQiOsfPTQo0skrf3/VV6LMAdjHPIDmXfjuxXud
         VxFMh/Dm+4gpYMBGICC7MkqfOtWz0P1dX/Bu+zW6zFz26wkFPwsKVk6SN48BmqHDq0kj
         l2nfzrMIYjecKThApX1qya7QDQxfFyXjTbRJH2CLfN5zIMst/W/CpC8mDbQK+eCeMDY3
         1foQ==
X-Forwarded-Encrypted: i=1; AJvYcCUTVbXjpNFXBM8sWm1Hi8Vyn38xQUMKi5CTXwhmnKJJS1nqPVro/EbcQwN5kgWBdUk7BO4LRW/8rL/WJX8BVeUKSA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwV5i9pL7pxfblDy5zmiaje+ERy7T43LgzfUTZVd5faoJyx66Up
	hrF/Ki8xm+RLjQAVZiC/j17gD97UPlC/FTQ0/Lvan+dBqgmwpMeQzHVTNqKVPc7TRkY=
X-Gm-Gg: ATEYQzzEYKYoNtLp9IF+KYWhgAZgKPD2h7gx3pA+hYrr6kzmyuz+Pr/bnpoq7QcRtSj
	zOP9+CGjpBYNMPPzPVB8uvic+rm9z04d78K4J7wi1nS2m5iGTH3XsGpCEL/q1raXq47/eyc9a0Z
	js9NhFLTpylvlDW9IsreHXzOUccT0gkO2Lyqu4R5FYXi5iGRpy3PHFFWathM1v2z6CaoQ0xa+MK
	WACEJaF5Res/xH9geNkZev7srdiiUAJI4JRSYFe+s7U2QVnhXOpT623go5o72xkS+5I7OsdODW9
	dh+s3KknJHTEuG+wKzuc4S8NN4/LASGL2YP7S4G1yGYb+lex0+33bcWHbG5iDaXCMbrLtYs7b+B
	Y7uhbXbbHi0gTJ+Kx/eKsHR759dv7Tu0a46NbiYt7bOpOfeTNsN7HBwcA+QMT/UjBcD5MMopf3f
	kJGjc0halDDO/DfjQYMl0DhCfDphaFDLbPYDhcuXNyqVaMr77pnpUuZXSpj4wM
X-Received: by 2002:a05:6122:a0f:b0:566:963a:165e with SMTP id 71dfb90a1353d-56aa08cc5bfmr1223860e0c.0.1772189289924;
        Fri, 27 Feb 2026 02:48:09 -0800 (PST)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com. [209.85.217.42])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56a9228d776sm5634500e0c.18.2026.02.27.02.48.09
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Feb 2026 02:48:09 -0800 (PST)
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-5fdb47d6131so478923137.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 27 Feb 2026 02:48:09 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVmajEqR/MF1ITMOJNtC0R5oFBRbSm8HQNaWYbJPZnKj6Itt/EdR/NYb6g9ZQZhJcfaRDCOXb4wOxkA8/jcRu+LRg==@vger.kernel.org
X-Received: by 2002:a05:6102:3583:b0:5f9:3a74:e17b with SMTP id
 ada2fe7eead31-5ff3232afd6mr1008069137.13.1772189289126; Fri, 27 Feb 2026
 02:48:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1770996493.git.tommaso.merciai.xr@bp.renesas.com> <53c8d9e7fde7b176e05503a72af81e74c7a8a1c1.1770996493.git.tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <53c8d9e7fde7b176e05503a72af81e74c7a8a1c1.1770996493.git.tommaso.merciai.xr@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 27 Feb 2026 11:47:58 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVAf=GyDR95BFD0Q3Wbjo5n5vnqSsfue=7fRWxs6=Hdgg@mail.gmail.com>
X-Gm-Features: AaiRm51h4Q-XTgbNeUvH0Ox5Heqc-6O0OJ_Dv-XNFtKtSDZR5vc0E3M-GeWzDIs
Message-ID: <CAMuHMdVAf=GyDR95BFD0Q3Wbjo5n5vnqSsfue=7fRWxs6=Hdgg@mail.gmail.com>
Subject: Re: [PATCH v5 01/20] clk: renesas: rzv2h: Add PLLDSI clk mux support
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, laurent.pinchart@ideasonboard.com, 
	linux-renesas-soc@vger.kernel.org, biju.das.jz@bp.renesas.com, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,ideasonboard.com,vger.kernel.org,bp.renesas.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,glider.be,baylibre.com,lists.freedesktop.org];
	TAGGED_FROM(0.00)[bounces-28517-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-0.950];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linux-m68k.org:email,mail.gmail.com:mid,init.name:url]
X-Rspamd-Queue-Id: 24D861B62D4
X-Rspamd-Action: no action

Hi Tommaso,

On Fri, 13 Feb 2026 at 17:28, Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
> Add PLLDSI clk mux support to select PLLDSI clock from different clock
> sources.
>
> Introduce the DEF_PLLDSI_SMUX() macro to define these muxes and register
> them in the clock driver.
>
> Extend the determine_rate callback to calculate and propagate PLL
> parameters via rzv2h_get_pll_dtable_pars() when LVDS output is selected,
> using a new helper function rzv2h_cpg_plldsi_smux_lvds_determine_rate().
>
> The CLK_SMUX2_DSI{0,1}_CLK clock multiplexers select between two paths
> with different duty cycles:
>
> - CDIV7_DSIx_CLK (LVDS path, parent index 0): asymmetric H/L=4/3 duty (4/7)
> - CSDIV_DSIx (DSI/RGB path, parent index 1): symmetric 50% duty (1/2)
>
> Implement rzv2h_cpg_plldsi_smux_{get,set}_duty_cycle clock operations to
> allow the DRM driver to query and configure the appropriate clock path
> based on the required output duty cycle.
>
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/clk/renesas/rzv2h-cpg.c
> +++ b/drivers/clk/renesas/rzv2h-cpg.c

> +static struct clk * __init
> +rzv2h_cpg_plldsi_smux_clk_register(const struct cpg_core_clk *core,
> +                                  struct rzv2h_cpg_priv *priv)
> +{
> +       struct rzv2h_plldsi_mux_clk *clk_hw_data;
> +       struct clk_init_data init;
> +       struct clk_hw *clk_hw;
> +       struct smuxed smux;
> +       u8 width, mask;
> +       int ret;
> +
> +       smux = core->cfg.smux;
> +       mask = smux.width;
> +       width = fls(mask) - ffs(mask) + 1;
> +
> +       if (width + smux.width > 16) {
> +               dev_err(priv->dev, "mux value exceeds LOWORD field\n");
> +               return ERR_PTR(-EINVAL);
> +       }

I am totally confused by this: smux.width is not a mask, but the size
of a register bitifield.
Perhaps:

    if (smux.shift + smux.width > 16) { ... }

?

> +
> +       clk_hw_data = devm_kzalloc(priv->dev, sizeof(*clk_hw_data), GFP_KERNEL);
> +       if (!clk_hw_data)
> +               return ERR_PTR(-ENOMEM);
> +
> +       clk_hw_data->priv = priv;
> +
> +       init.name = core->name;
> +       init.ops = &rzv2h_cpg_plldsi_smux_ops;
> +       init.flags = core->flag;
> +       init.parent_names = core->parent_names;
> +       init.num_parents = core->num_parents;
> +
> +       clk_hw_data->mux.reg = priv->base + smux.offset;
> +
> +       clk_hw_data->mux.shift = smux.shift;
> +       clk_hw_data->mux.mask = smux.width;

Again, smux.width is not a mask.
Perhaps GENMASK_U16(smux.shift - 1, 0)?

> +       clk_hw_data->mux.flags = core->mux_flags;
> +       clk_hw_data->mux.lock = &priv->rmw_lock;
> +
> +       clk_hw = &clk_hw_data->mux.hw;
> +       clk_hw->init = &init;
> +
> +       ret = devm_clk_hw_register(priv->dev, clk_hw);
> +       if (ret)
> +               return ERR_PTR(ret);
> +
> +       return clk_hw->clk;
> +}

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

