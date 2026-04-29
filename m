Return-Path: <linux-renesas-soc+bounces-31746-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mLuGL1/a8WmokwEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31746-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Apr 2026 12:15:59 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 34D62492B62
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Apr 2026 12:15:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 89AC0300B993
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Apr 2026 10:15:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8678126B75B;
	Wed, 29 Apr 2026 10:15:55 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 298BB3191D6
	for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Apr 2026 10:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777457755; cv=none; b=IklxMkxESOnwvisKvWjtsCpY5o/5vEl97FrRDzwVzhIeGRT3X4BRjWGUaS3ho6ymnl7UNHqa94ZODv5Rl9GtlrYPhALoCnRqpFDCOq5Fn7rMrr0P+X9mH9vg/FrGTjA27eVcFgPmN5tAWIkpTSh5NrATdavN/xb3B3YAEqpM8Ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777457755; c=relaxed/simple;
	bh=a58EuFGZxQ5yCYnA9qrvXyLI+dMZJByadlX6j/LFqVo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eh8rC2O5IXIsMO5cCOVUpjUKYIjL+ajjuxtLT80nhrHP0O2SOFXR8owl2WiEaPlbjiSAMKsKdvrRVXj1d9E8IvvL2nJRME/XzddFQmtFRfKvzEQy0lC8fqSXEXQSvL+8ixxdQZYsNcJ6U1NP7dsPVuCtg13twtjKw7r2rx03SiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-8a3970f1a0eso129967536d6.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Apr 2026 03:15:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777457753; x=1778062553;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JlgSQf9TVaIeapbi36V5Bh/+HrPzPP7kpOmKArKJl0Y=;
        b=oN8b48vMjTEkGPvFu0oFGQqAtu8Sdhxcrvu/gRL4Kxx7TYcLvO9MXfvwekq25IAei1
         sR+FoY6aJvPa2Fb6eK6a9yl+sFr8Q5EU8KwPbl+u021GHdpymFmPrSNapsMCRmifd+hF
         vxQmrwRsmm/pAJrQGYMKYpeoohlq8aQnYeYHc3HPSOXxJWxMV9WwjrYQaa+XGGaUK+gb
         1/PA2mii10Ys93wh8EnlVR2NOSEV6qV6mZMJqdqukRxvpTs/wf5fPDjOiFDmTvay2fci
         nD9lDm/K/uAqEOizb+7QU5+s+njCZiwNm8ucpYJxoWuz+/Fg/OvSxRp7yWtSMkwgbFOq
         9I8Q==
X-Forwarded-Encrypted: i=1; AFNElJ/GIQdnKzrbkJsRDsH92nmAjX631fI5v6ErTlUqgylhs6cmZ2xVO3HaG3+Kl/JQQs/Qu374OWsUjrxknXcLCeQjTQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/kV/fYCV1f8K/DmNEY1vPX3Rd0BHVMRksuILMawc8T806Rlj9
	qzIBg4BgtNIvkHf6eAuzyo7V3JqWt4069bUjT33jC/H3InGJdv4drN4TamTxOgVoGYg=
X-Gm-Gg: AeBDievRNfxYe+dZ5t4t0nlNTNo4d8Tkm8n7K8l0RXkpJttydRrak+hI2DjJfCS+/C6
	cMe/c5F3gQRPBfaLQQqRSFMsy7yG5NoF5IBYIr1rfTdDoR8oYUP0sYZpD8vL7iQXZ+T0ErmBMvg
	ai6ZzP1cwwNTQ+M/H2zAHw27NM/p8XpjEHTW7YvTof0m+HebdmcfMSO2yFlCLPZMlwxgRkC2cWF
	biMqiTLJpnhJFwjXUAE/b8lxSIT8kHYW4A5JuHHWb1OBvYe7HiyE11zSslREdaiEGkqxYIZGIhz
	KfcrpmC/NJgJxiU6UkE5FWnPzJzIbnYCdYKtViMAENzJ/K3Lb4YUZPSmFjaOWyg81ExLSx3TzYn
	8OPRImacNeq7dTCbmL39g+rMX13EoJQxYMd5GYETqW2p+oU6g070BMYbbcoEFKx/Svt1nOi7AgU
	CRhLMxGknBTGjPMmyz9bnNa7MHDHYWMt4Cyx7HgGzqz6L0hExQpSuOX0JJuZynKsVfduImUao=
X-Received: by 2002:a05:6214:311b:b0:8ac:ab31:0 with SMTP id 6a1803df08f44-8b3e31fb96dmr104586016d6.40.1777457752949;
        Wed, 29 Apr 2026 03:15:52 -0700 (PDT)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com. [209.85.219.46])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b3ef70dcd2sm16202396d6.17.2026.04.29.03.15.52
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Apr 2026 03:15:52 -0700 (PDT)
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-8aca2726f61so147333906d6.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Apr 2026 03:15:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9eFzxBDV81YmCgFtwsDJ3cG4RMdKjqpDWnDDLx9kQcntvcKQ/gsB2N0die1QCmUazoDZFIkBrYulpXj6oz4XxoFA==@vger.kernel.org
X-Received: by 2002:a05:6102:5808:b0:5fd:f2ad:c653 with SMTP id
 ada2fe7eead31-6280a4a8859mr3233756137.16.1777457422707; Wed, 29 Apr 2026
 03:10:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260419193718.133174-1-marek.vasut+renesas@mailbox.org> <20260419193718.133174-3-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260419193718.133174-3-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 29 Apr 2026 12:10:10 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUHKQwX43=c9JR67=x1EvWzdHTiXdUnPV2bDKU7PV_EnA@mail.gmail.com>
X-Gm-Features: AVHnY4JG2nQR3icySEfGRtnnQzDT9zHNQTQkbpTpvtHZyLM3-S0niXuSWkJz0jc
Message-ID: <CAMuHMdUHKQwX43=c9JR67=x1EvWzdHTiXdUnPV2bDKU7PV_EnA@mail.gmail.com>
Subject: Re: [PATCH 2/7] drm/rcar-du: Add support for Renesas R-Car R8A779MD M3Le
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	David Airlie <airlied@gmail.com>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Simona Vetter <simona@ffwll.ch>, Stephen Boyd <sboyd@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, 
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, devicetree@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 34D62492B62
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-31746-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[lists.infradead.org,kernel.org,gmail.com,ideasonboard.com,renesas.com,baylibre.com,ffwll.ch,suse.de,vger.kernel.org,lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	NEURAL_SPAM(0.00)[0.672];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mailbox.org:email,mail.gmail.com:mid,0.0.0.1:email,linux-m68k.org:email]

Hi Marek,

Thanks for your patch!

On Sun, 19 Apr 2026 at 21:37, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Add support the Renesas R-Car R8A779MD M3Le SoC. This SoC is
> similar to R-Car R8A77965 M3-N SoC, except the HDMI port@1 is
> not present.

"and DU1 is unused." (whatever that may mean...)

>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c
> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c
> @@ -564,6 +564,30 @@ static const struct rcar_du_device_info rcar_du_r8a779h0_info = {
>         .dsi_clk_mask = BIT(0),
>  };
>
> +static const struct rcar_du_device_info rcar_du_r8a779md_info = {

Assuming for this review we do need a new compatible value...

> +       .gen = 3,
> +       .features = RCAR_DU_FEATURE_CRTC_IRQ
> +                 | RCAR_DU_FEATURE_CRTC_CLOCK
> +                 | RCAR_DU_FEATURE_VSP1_SOURCE
> +                 | RCAR_DU_FEATURE_INTERLACED
> +                 | RCAR_DU_FEATURE_TVM_SYNC,
> +       .channels_mask = BIT(1) | BIT(0),

 "BIT(3) | BIT(0)", given R-Car M3Le dropped DU1, not DU3?

> +       .routes = {
> +               /* R8A779MD has one RGB output and one LVDS output. */
> +               [RCAR_DU_OUTPUT_DPAD0] = {
> +                       .possible_crtcs = BIT(1),
> +                       .port = 0,
> +               },
> +               [RCAR_DU_OUTPUT_LVDS0] = {
> +                       .possible_crtcs = BIT(0),
> +                       .port = 2,
> +               },
> +       },
> +       .num_lvds = 1,
> +       .num_rpf = 5,
> +       .dpll_mask = BIT(1),
> +};
> +
>  static const struct of_device_id rcar_du_of_table[] = {
>         { .compatible = "renesas,du-r8a7742", .data = &rcar_du_r8a7790_info },
>         { .compatible = "renesas,du-r8a7743", .data = &rzg1_du_r8a7743_info },

I also don't know where "M3Le does not support 4K output." (which is
a VSP2 limitation) is to be handled.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

