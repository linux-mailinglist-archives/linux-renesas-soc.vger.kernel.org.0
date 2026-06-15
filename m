Return-Path: <linux-renesas-soc+bounces-33995-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ndIIIIbGL2r/GAUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33995-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Jun 2026 11:31:50 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D00068512D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Jun 2026 11:31:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33995-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33995-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E0A82300B9FF
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Jun 2026 09:31:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F49C238C0A;
	Mon, 15 Jun 2026 09:31:36 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1B8B30D40C
	for <linux-renesas-soc@vger.kernel.org>; Mon, 15 Jun 2026 09:31:34 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781515896; cv=none; b=Kdq+bNHYv3Z3yujULRL6KrdjNtLy/9gS2Aij5IhvsxBVdMXHDrLU+Z3d1b3xL8r2SmHaG8IJnG0pJHgSd0MoyyE56IhWS7vINe817I+X4OQ99DffcS5EQIYmJfgPx5fg8fs5pe+xFmz5bvmtXJt1EcCwYAtQ1j1f4zyNvl98d2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781515896; c=relaxed/simple;
	bh=cokh81Cx7W15QrHxXBRjalQp7kxTMzsuksUx0kqLiGU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=blOASX4+hxRwnnXPNTH+JkChlBve8JgWf6vhTNy9ZJwb8BFkviiWNm1I23B4/XU1NXwRQU682o0BTkwikC2w4r5rEA8IHvoYSVWLJjqKNbGQbNYyWwjHQhlAOXgKalKKf6rHMOWgDw4UU5IKo4U5pP9Q72KsTe05TVutetBMnGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.160.177
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-5175eab3a93so25734541cf.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 15 Jun 2026 02:31:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781515894; x=1782120694;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ekHktY4/Tubvm6BgE1BfS1UNgz1F/icrKZN3pNx8f0Y=;
        b=X3ghHtBmc0K4mYKp1jyyvF9Rup2l5DJ7oL5//PteBPSh90sYPJL0y5RzIty4sS6GBN
         8mNr6I21Y+N6F3vWpdtBqKHvtlJLC7S/VtSwy2LOkuNDSgvw8Gf1g1soCB1WMZNbyLq/
         cQcOkSa2xJsoksnXt9xjEz5q3zqaugnJiKvrQsr2WJ158qkUCrVeODWznHVP4z2HNEo6
         Km+oopm5jhZ6vaR8HQ4LYwOqaKgAJq+7oSNQfK7dAByrtc0hD1+MpG5Zr0/G69iyud2k
         7hzccMgRKj4s2cUV3GUB9Fgdd5wFinNHEKR6wFWTxKU3j/kEUVGYr1fTW9VhbL8KB9ir
         AB5A==
X-Forwarded-Encrypted: i=1; AFNElJ8iiS8/kaKKT/lgw8GF9D9IlRmJN7aLH0XiokNYQus5ge+t3kEbmCH7/rOhWWJgstuVJzl86k+mNjBxGOkilw9iwA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyRwSyVpH43AIbVYtcRHFu/6h4lE+GZ82umYM9aDa6JMZd3e4jW
	y1xfIkZiRMZHONiOWfdeHKYR25T6K2jHB5e+Dbx6PbbfN5Fl/mPXkeA/KEWONk1p
X-Gm-Gg: Acq92OELxXtzfxWFX6x2PLpuZlWAHloXDJGZna2UgVJKlklbm67r8nT+U1NOLt1BQy1
	wVcIvxd46WIBZT+FTfKKLjIXUDDLk2RhtAtrOroJxUrRtXvTqWcoEkA7+BtgjhSfCoBaTi50Q10
	We9Kbh5okZuEnHZRGsTo0ZwHczP8eod9QWhguV/rLOTeJ/cq8Rbs5xx/oqOUKcsxJLiYAIaXtKK
	NgFMoFv7NTtLSAyRcFaZRs9huZoHmZFk1aX+LJN0g4oUBDXTyJVYZ9kPawenpDseV2PyqMXSiVU
	mghI7qU3dEj3I9g32qfW9K0Sn3iGcSS/7fZqt8B7JQvWcbYrzqu0y19Ee8kBeoVu6ltc3Pov0v6
	IbbiAI7huRyPgQ9MAoTfw+IG6+AUfvGXsh6E93rtCHFNiA9+Dy9nY4SBv8vUm1miYZHsHAxIlTC
	uTWH2gCxM46H1hchL7boRJidDyTa1vtmmvW4z3907AAxBKQksP5ylLTY6Zfxy+KdMsIHYRkGDnW
	ak=
X-Received: by 2002:a05:622a:1315:b0:516:e1a0:e28a with SMTP id d75a77b69052e-5195355451amr162589551cf.45.1781515893732;
        Mon, 15 Jun 2026 02:31:33 -0700 (PDT)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com. [209.85.160.179])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-517fb83db58sm101032801cf.27.2026.06.15.02.31.33
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jun 2026 02:31:33 -0700 (PDT)
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-5175eab3a93so25734471cf.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 15 Jun 2026 02:31:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/ycnJJSKKaFq2YUbbrIygjyjc6c7m6rZ8Ciqixar8SVfUKOWtP5j6Iz2/HJJsD95pbtc7BAN08jx8yM9+Dyc+tww==@vger.kernel.org
X-Received: by 2002:a05:6102:32c4:b0:6c2:e290:cc69 with SMTP id
 ada2fe7eead31-71f60e0fc5bmr5388435137.23.1781515508903; Mon, 15 Jun 2026
 02:25:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260615-rcar-du-dsc-v4-0-93096a1b56a3@ideasonboard.com> <20260615-rcar-du-dsc-v4-2-93096a1b56a3@ideasonboard.com>
In-Reply-To: <20260615-rcar-du-dsc-v4-2-93096a1b56a3@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 15 Jun 2026 11:24:57 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVxwvDmRqsdbA_ReCnnaDWbzzTKGCXw-64U-bSJfgiy7g@mail.gmail.com>
X-Gm-Features: AVVi8Ceq73VEJddOjmb1j9jjrYgT5rbGI4-mYSdD7C_MYewqPqxZACymjTcgJ3U
Message-ID: <CAMuHMdVxwvDmRqsdbA_ReCnnaDWbzzTKGCXw-64U-bSJfgiy7g@mail.gmail.com>
Subject: Re: [PATCH v4 2/7] dt-bindings: display: bridge: Document Renesas
 R-Car V4H DSC bindings
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	Conor Dooley <conor.dooley@microchip.com>
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
	TAGGED_FROM(0.00)[bounces-33995-lists,linux-renesas-soc=lfdr.de];
	DMARC_NA(0.00)[linux-m68k.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:tomi.valkeinen+renesas@ideasonboard.com,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:magnus.damm@gmail.com,m:marek.vasut+renesas@mailbox.org,m:laurent.pinchart+renesas@ideasonboard.com,m:kieran.bingham+renesas@ideasonboard.com,m:p.zabel@pengutronix.de,m:linux-renesas-soc@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:conor.dooley@microchip.com,m:tomi.valkeinen@ideasonboard.com,m:jernejskrabec@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:magnusdamm@gmail.com,m:marek.vasut@mailbox.org,m:laurent.pinchart@ideasonboard.com,m:kieran.bingham
 @ideasonboard.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[28];
	FREEMAIL_CC(0.00)[baylibre.com,kernel.org,intel.com,linaro.org,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,suse.de,ffwll.ch,mailbox.org,pengutronix.de,vger.kernel.org,lists.freedesktop.org,microchip.com];
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
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	R_DKIM_NA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,vger.kernel.org:from_smtp,microchip.com:email,linux-m68k.org:from_mime,linux-m68k.org:email,ideasonboard.com:email,mailbox.org:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1D00068512D

Hi Tomi,

On Mon, 15 Jun 2026 at 08:28, Tomi Valkeinen
<tomi.valkeinen+renesas@ideasonboard.com> wrote:
> From: Marek Vasut <marek.vasut+renesas@mailbox.org>
>
> The Renesas DSC Display Stream Compression is a bridge embedded in the
> Renesas R-Car V4H SoC. The bridge performs VESA DSC encoding of up to
> 8k or 400 Mpixel/s .
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> [tomi.valkeinen: fix the example]
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Thanks for the update!

> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/bridge/renesas,dsc.yaml
> @@ -0,0 +1,99 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/bridge/renesas,dsc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Renesas R-Car DSC Display Stream Compression
> +
> +maintainers:
> +  - Marek Vasut <marek.vasut+renesas@mailbox.org>
> +
> +description: |
> +  This binding describes the VESA DSC Display Stream Compression encoder
> +  embedded in the Renesas R-Car V4H SoC. The encoder supports all DSC1.1
> +  encoding mechanisms, configurable bits-per-pixel, resolution up to 8k.
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - renesas,r8a779g0-dsc
> +      - const: renesas,rcar-dsc

Please do not introduce new "renesas,rcar" fallback compatible values,
unless you are adding new support for a hardware block that is present
in SoCs belonging to multiple (nowadays I would say at least three)
R-Car generations.  The DSC is only found in R-Car Gen4 SoCs, so
"renesas,rcar-gen4-dsc" sounds more appropriate.
However, so far R-Car V4H is the only R-Car Gen4 SoC that has a DSC.
Even the very similar R-Car V4M does not seem to have it.
R-Car X5H has DSC-functionality integrated in its DisplayPort TX
controller, so that seems to be a different implementation?
Hence that rules out any family-specific compatible value for now.

The rest of the (system/core) SoC integration LGTM.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

