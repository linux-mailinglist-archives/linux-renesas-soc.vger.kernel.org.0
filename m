Return-Path: <linux-renesas-soc+bounces-31703-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0FZxJiq48GkyXwEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31703-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Apr 2026 15:37:46 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 525F8486012
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Apr 2026 15:37:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id DF58030553A0
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Apr 2026 13:21:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D8583F23D0;
	Tue, 28 Apr 2026 13:16:22 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0087E3ED12B
	for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Apr 2026 13:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777382182; cv=none; b=K5ofOi6/lyABDD42wx6msON09F/Qwh2xHh7MEOM/aT+zMrNa6HrbcRL3LJU+p2HD7FW8iLWuaNI0uoliLUZpudgTiWgBxWew7biWY7GKCsIvFuQ5E8BdVG60gHdahN5Yq1igf5TKWh+GgG5yjTQdYmhkiWg/7u7CRVHI5a5Wf8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777382182; c=relaxed/simple;
	bh=monmkM7gb21wo+8zqTXXwraI3buKDt+F0QM6dED3Cro=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bF+kM0q8uVB2BZAUp5ZhkFb7fEZ5895asRU3/gv0Q6kqu7vdanGrsnEltkNQxAsToZ6nBKFYkcXi3yr8cp+5/4xKrDm5u1p1ewh/OziV/QKRhl/yS2dy/syMDUN4mEtHGWjfb7RVYO2cPBrOI5Nmg4wP/hmMyushzyQgwMCs6KM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-ba8472c1613so1636620466b.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Apr 2026 06:16:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777382179; x=1777986979;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZKb4w8sEYs/FkHjZOB3gkPShePsdAuMuIqa1z3/FMfo=;
        b=oH/PakT8ruMYPFWSvJmcXjhs0fGFdNyltvPonxWVQIqe1eljh0cwa7uBG+s9pcINm3
         UuR2M/dxewnkJcUe8MKplvO8sGaw/iOF88E0Rym42G0dtdgoo+KDxngso9QOLWkGMDfZ
         W+oxNztBmEEPs4RpvMHWFLETSa9RuuTNpPRjQaq84dagvT5uZgVZDFzUDPfxlz+2KUEc
         kaOgmROj0rS7DhyBHMn1uTT+g5wEWLYcKBWZ077xV6kkoadTFATbf5Ng2DW9YcYXZ0MN
         0T5w2RNbr6AVMzNFlMcpFZoWpJ/fmjHRuA0n0hnWq7QKWpz6BIqcvFjBDcv+Z1SGuLwU
         wnLw==
X-Forwarded-Encrypted: i=1; AFNElJ/5j6tdCKRh1DFy3H5nd9qtTdSOqB0j1/KkptdEFwdt0MCpFIqGVXKzSgEClgAll6gg+8z9AEixhdKWUMcgobmq7g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yys/haqG3/7GQElv5MZeb19HnAXbZjB3mhpnSjdoDbmP08icZjv
	Il/g8CFyESZFwuFBV1vMxVW/5LH4gH210EFHZjhC2JQ0i+e4Kt5HhSCn1S33uCW7Jsc=
X-Gm-Gg: AeBDiet6/caIiZ2XkWO9Vl5IL+M/HE4XxSgPj2GhYz/6bfSaZJyEDIeMx1qPIdX8rvC
	QtldlQJirTb8R5tQU6LfQ23hyG6F004GDIQIQ54TW+fSeLqobA/4saZXKz9trq7nbZO5e9AX8rN
	BLwjqEatVeS5XTHbm8gorpM/X1EgusA3QjYcZEiKIedQB60zh2KxZecGRz2Qfqx+GDhfvJ7J79n
	9SdjslPLafhWOVKb2kW6JxNua2J7EQvUzCdWiA6qaPfwEEBZnpU5jWNHVQX5iX9V4gZz9EwVvtu
	mFyqB3495tuCf32OdkJbq7lKZMkfx1WPPCKFJKmFB+NKs7SfCm0QrB0D9XKrIDzjAbgVqFM5Spe
	qi0G7T0hfHU88vMbVKcEA7U2BU+vHszaFsmTg2f1YQb3m5PYkrWLqmrrs5jelNKC1OL4sGVbaY3
	Z0QT1BFgBjpn2myi4E2OY4DMOMttkh/5lRAF5mhZmt4p/1SB725uSmc6cIRnZuoEruAEXn2Kk=
X-Received: by 2002:a17:907:2d8e:b0:bae:3bbc:f290 with SMTP id a640c23a62f3a-bb803975194mr180012466b.28.1777382178806;
        Tue, 28 Apr 2026 06:16:18 -0700 (PDT)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com. [209.85.218.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bb80bd9377bsm102731866b.53.2026.04.28.06.16.16
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 06:16:16 -0700 (PDT)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ba5b107eaa2so1237148566b.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Apr 2026 06:16:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ810RI6juMxEplG0H0BN8y9ri6b2hxxeHlK4r6JZ/A8fiowQkCFQ4V74kvrTxMZj3KSEeRduOFDykZ0WvgeQM8f/A==@vger.kernel.org
X-Received: by 2002:a17:907:98e:b0:b9c:1a5:acb4 with SMTP id
 a640c23a62f3a-bb804537566mr167279766b.45.1777382176315; Tue, 28 Apr 2026
 06:16:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260317101627.174491-1-biju.das.jz@bp.renesas.com> <20260317101627.174491-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260317101627.174491-3-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 28 Apr 2026 15:16:02 +0200
X-Gmail-Original-Message-ID: <CAMuHMdULLMbsGf+1Jp0aRFmT=CFD3fY0LvgjHyqVS7-Q-OMBGA@mail.gmail.com>
X-Gm-Features: AVHnY4JbgjbQ08KrMbRoT9ZVPhT2gDYodCeLz6_HhhBZr500c6s0xEMp8-01NFU
Message-ID: <CAMuHMdULLMbsGf+1Jp0aRFmT=CFD3fY0LvgjHyqVS7-Q-OMBGA@mail.gmail.com>
Subject: Re: [PATCH v3 2/8] dt-bindings: pinctrl: renesas: Document RZ/G3L SoC
To: Biju <biju.das.au@gmail.com>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 525F8486012
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31703-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,bp.renesas.com,vger.kernel.org,microchip.com];
	DMARC_NA(0.00)[linux-m68k.org];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.812];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,mail.gmail.com:mid,microchip.com:email,renesas.com:email]

Hi Biju,

On Tue, 17 Mar 2026 at 11:16, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Add documentation for the pin controller found on the Renesas RZ/G3L
> (R9A08G046) SoC. The RZ/G3L PFC is similar to the RZ/G3S SoC but has
> more pins.
>
> Also add header file similar to RZ/G3E and RZ/V2H as it has alpha
> numeric ports.
>
> Document renesas,clonech property for controlling clone channel
> control register located on SYSC IP block on RZ/G3L SoC.
>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- /dev/null
> +++ b/include/dt-bindings/pinctrl/renesas,r9a08g046-pinctrl.h
> @@ -0,0 +1,39 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +/*
> + * This header provides constants for Renesas RZ/G3L family pinctrl bindings.
> + *
> + * Copyright (C) 2026 Renesas Electronics Corp.
> + *
> + */
> +
> +#ifndef __DT_BINDINGS_PINCTRL_RENESAS_R9A08G046_PINCTRL_H__
> +#define __DT_BINDINGS_PINCTRL_RENESAS_R9A08G046_PINCTRL_H__
> +
> +#include <dt-bindings/pinctrl/rzg2l-pinctrl.h>
> +
> +/* RZG3L_Px = Offset address of PFC_P_mn  - 0x22 */
> +#define RZG3L_P2       2
> +#define RZG3L_P3       3
> +#define RZG3L_P4       4

GPIO P4x do not seem to exist, so drop this line?

> +#define RZG3L_P5       5
> +#define RZG3L_P6       6
> +#define RZG3L_P7       7
> +#define RZG3L_P8       8
> +#define RZG3L_PA       10
> +#define RZG3L_PB       11
> +#define RZG3L_PC       12
> +#define RZG3L_PD       13
> +#define RZG3L_PE       14
> +#define RZG3L_PF       15
> +#define RZG3L_PG       16
> +#define RZG3L_PH       17
> +#define RZG3L_PJ       19
> +#define RZG3L_PK       20
> +#define RZG3L_PL       21
> +#define RZG3L_PM       22
> +#define RZG3L_PS       28
> +
> +#define RZG3L_PORT_PINMUX(b, p, f)     RZG2L_PORT_PINMUX(RZG3L_P##b, p, f)
> +#define RZG3L_GPIO(port, pin)          RZG2L_GPIO(RZG3L_P##port, pin)
> +
> +#endif /* __DT_BINDINGS_PINCTRL_RENESAS_R9A08G046_PINCTRL_H__ */

The rest LGTM.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

