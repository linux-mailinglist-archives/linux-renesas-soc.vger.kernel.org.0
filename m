Return-Path: <linux-renesas-soc+bounces-31756-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AHRVO7v28WmElwEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31756-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Apr 2026 14:16:59 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E2289493F6F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Apr 2026 14:16:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C92983003BE2
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Apr 2026 12:16:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 423D37404E;
	Wed, 29 Apr 2026 12:16:53 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A41DF34EF0F
	for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Apr 2026 12:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777465013; cv=none; b=V7AIvqKbEQox/h1ZFV3HC0emPZGoaTTWJOFB7ypO6+L4scRuz4LIIJ4UZpNFSU1a1d/hmOH1J0CW92910pX91Drfc75UklFyxuGaJsP3y+tPKQy0ALGhDY/Gmu6GxKnSejL9cEhkO5reN3ssEGXbhXk0z192aMnBKucW9PfvbyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777465013; c=relaxed/simple;
	bh=KOGV9jLH5RXBywSOyxQCqGJvaYR1+Y2TL0szPQtLy74=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=payG6mSP5FR6yp4oXnlPbwB3LU7C4snB4LYeWds3VpcTmyxLpP0iEt1CALMvumE4ihM4hbiDA2vUcpmzJcBUnPngZUpeKtXZi0elj2PQ2jRnmsz2Q7QJ+wzfFhO74TcFGFPhiBzEz7KSMwbIOAd5+yPdDYOaFvPYGql/3XbbE4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b941762394aso1723987266b.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Apr 2026 05:16:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777465010; x=1778069810;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DYIYCIsBtJDK4jXwWO2JUdTXoGJvuUmgU1KwSHdoXoc=;
        b=FmCGYMOBt5Uu4yL2rnMWapcWsHfghrD9qmBe5IeAMbsaB69PmAJhcNxB2palZIKWV+
         7xDHmGJk8nNEsGuOF2JUDNB7wvMN+c9kO5Ie9hfXQrWSMrnk6Wc6GfQneyX20A+RM9uY
         pqgETq2aGN5x3kqFi/sHtpRR1ZHOT6sbDn9WV5Q4sVH3UuNsqRXAnxZJSYUdpIii0yJh
         w5YtlGcrbnHmdtJPHKGBABpgNr979cbdy9ZvYHRbo/3m8tKfzhWnVAFkC2l6F/edP7vY
         ZY/SPFr3nwnvj0vI4MgUhk2lkN3VQtGM535pOMDJ16XKnYm3xeXvT8Nf2oUQfCR9gDu6
         M6aw==
X-Forwarded-Encrypted: i=1; AFNElJ88GkVUhIk7eurlMcbwuKHgqCNZ4fAgR9X3gu5eDRwgRoKsB4Rhqmv1vmk9VECIwaYmTVgJF0q3YdVQiOighaSQfQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxJQMxue3n3uXTGamjs0Izzm8I9PsUu/tPm4245c84zZ4pPpVmW
	kU9dzGGbReGE2ZBHhjQ3DL1wf5chvzqblgLyCf3nfJlVywq9ScVXEwjvOhsVvVJjl0U=
X-Gm-Gg: AeBDiesik4fbaeHlZUo5pMZVeIjKYeL7lcCHZ+4iXJpJEVHHPRSnLFQWgTBPe+fZCI1
	rCnE8QTKcSyAh2l3YMC29LvCc61gkAbzZtLgcbyyd6Kx//u1Q16BPK/IMxDL7+lauoA1gABr12k
	MjA3hYnzWt65BUtjBXOoLpuYYS46MpJC7uSHvIRU7T+ucDEfBpCMNmRSWTpMarUSdpuGMecm7B1
	2HibWUyjmK3p/NdvlWb+/V6BSpYGY1fNd0XWjRKyDHxmW64raJrFB+/2KwA2uk7/eepkFjVZH5Y
	+RMSvqTnAkTHjk/Pq2ivxXw1o9QwNy/n4e8h6Sa16ltgtKd+1fIgv+/Xy+6lNWkyMCf0fKFo4/7
	vLLg2XF/OyGDb7D1Z6gQPlkxHtN6n/CUMkLe8SGGSEFaXxtOG5aLQr9brtJaxr11XC6ELDproZ/
	gyBGy/rQjK03SBQgXS+tQvxhAFQm7WnSNZEsoW9t1CfksAULpdTQI3JTbEYklqlEVoQUOGgC0=
X-Received: by 2002:a17:907:8714:b0:bae:8734:18b4 with SMTP id a640c23a62f3a-bb8023bc02dmr328224566b.16.1777465009691;
        Wed, 29 Apr 2026 05:16:49 -0700 (PDT)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com. [209.85.208.53])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bb9859381fcsm85966966b.45.2026.04.29.05.16.47
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Apr 2026 05:16:48 -0700 (PDT)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-672c12e95e9so17484259a12.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Apr 2026 05:16:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9JAXTGZBibV3KayFVNRiu2DbkGo0KUGkUGgxH4zNF73p9p7rKYuwRwI+frIqzQQY5y4R6YcLLxDqrVYmElXCmtkg==@vger.kernel.org
X-Received: by 2002:a05:6402:2b8d:b0:676:9c6d:7448 with SMTP id
 4fb4d7f45d1cf-679bb0969d8mr3789280a12.22.1777465006980; Wed, 29 Apr 2026
 05:16:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260419193718.133174-1-marek.vasut+renesas@mailbox.org> <20260419193718.133174-7-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260419193718.133174-7-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 29 Apr 2026 14:16:33 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV5NRFjGmLLSAFkst=y_v=haZ9_-oiZ7_3M2J1s5jiJSQ@mail.gmail.com>
X-Gm-Features: AVHnY4J_eIQauePt3-ENfJ0vvJTMmNJqoEy-L_5paGzJVO5LgQ5rAyTsYv0XxdM
Message-ID: <CAMuHMdV5NRFjGmLLSAFkst=y_v=haZ9_-oiZ7_3M2J1s5jiJSQ@mail.gmail.com>
Subject: Re: [PATCH 6/7] arm64: dts: renesas: r8a779md: Add Renesas R-Car
 R8A779MD M3Le DTs
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, 
	Nguyen Tran <nguyen.tran.pz@bp.renesas.com>, Conor Dooley <conor+dt@kernel.org>, 
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
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: E2289493F6F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-31756-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[lists.infradead.org,bp.renesas.com,kernel.org,gmail.com,ideasonboard.com,renesas.com,baylibre.com,ffwll.ch,suse.de,vger.kernel.org,lists.freedesktop.org,sang-engineering.com];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	NEURAL_SPAM(0.00)[0.033];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.1:email,renesas.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,mail.gmail.com:mid,mailbox.org:email]

Hi Marek,

CC wsa

On Sun, 19 Apr 2026 at 21:38, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> From: Nguyen Tran <nguyen.tran.pz@bp.renesas.com>
>
> Add support for the Renesas R-Car M3Le (R8A779MD) SoC, a variant of the
> R-Car M3-N (R8A77965) SoC. The Renesas M3Le SoC is a register-compatible
> variant of the R8A77965 (M3-N) with reduced set of peripherals.
>
> Signed-off-by: Nguyen Tran <nguyen.tran.pz@bp.renesas.com>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Thanks for your patch!

> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/r8a779md.dtsi
> @@ -0,0 +1,48 @@
> +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +/*
> + * Device Tree Source for the R-Car M3Le (R8A779MD) SoC
> + *
> + * Copyright (C) 2025-2026 Renesas Electronics Corp.
> + */
> +
> +#include "r8a77965.dtsi"
> +
> +/ {
> +       compatible = "renesas,r8a779md", "renesas,r8a77965";
> +};
> +
> +/delete-node/ &csi20;
> +/delete-node/ &drif00;
> +/delete-node/ &drif01;
> +/delete-node/ &drif10;
> +/delete-node/ &drif11;
> +/delete-node/ &drif20;
> +/delete-node/ &drif21;
> +/delete-node/ &drif30;
> +/delete-node/ &drif31;
> +/delete-node/ &hdmi0;
> +/delete-node/ &mlp;
> +/delete-node/ &pciec1;
> +/delete-node/ &sata;
> +/delete-node/ &sdhi3;

I am not sure disabling sdhi3 is correct.
The R-Car M3Le documentation says:

   "M3Le does not support MMC1.
    M3Le supports one MMC channel (MMC0) only.
    SD3 is used only for SDHI and is not used for MMC.
    M3Le does not support MMC HS400 class transfer rate."

The main R-Car Gen3 documentation says:

   "This LSI has four SD card interfaces (SDHI0 to SDHI3), two of
    which can also be used as MMC interfaces (SDHI2 and SDHI3)."

So while MMC1 is indeed sdhi3, sdhi3 can still be used in SD mode?
Do we need a new compatible value, as R-Car M3Le does not support HS400?

> +/delete-node/ &usb3_peri0;
> +/delete-node/ &usb3_phy0;
> +/delete-node/ &vin0csi20;
> +/delete-node/ &vin1csi20;
> +/delete-node/ &vin2csi20;
> +/delete-node/ &vin3csi20;
> +/delete-node/ &vin4csi20;
> +/delete-node/ &vin5csi20;
> +/delete-node/ &vin6csi20;
> +/delete-node/ &vin7csi20;
> +/delete-node/ &xhci0;

Shouldn't the following be disabled, too?
  - ohci1, ehci1, and usb2_phy1,
  - cmm1 and vspd1 (cfr. DU below).

> +
> +&du {
> +       compatible = "renesas,du-r8a779md";

Assuming the DU needs a new compatible value...

> +       renesas,cmms = <&cmm0>, <&cmm3>;
> +       renesas,vsps = <&vspd0 0>, <&vspd1 0>;

Shouldn't this be

    renesas,vsps = <&vspd0 0>, <&vspd0 1>;

? DU1 is unused, but DU3 is used.

> +
> +       ports {
> +               /delete-node/ port@1;
> +       };
> +};

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

