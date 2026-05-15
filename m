Return-Path: <linux-renesas-soc+bounces-32656-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yAZIEevTBmqKoAIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32656-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 15 May 2026 10:06:03 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 0439D54B062
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 15 May 2026 10:05:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D148430041D8
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 15 May 2026 08:05:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7549E2D5941;
	Fri, 15 May 2026 08:05:55 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CA15334C39
	for <linux-renesas-soc@vger.kernel.org>; Fri, 15 May 2026 08:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778832355; cv=none; b=PD83z0TPaTBKXaCy5XPpa3UD8itZAwyozC74GfHC4PPIpvmnQOF90oao5ZxZdZV8wMNdML4AbRj9jCw+FNi6PR3E4/EEPlO+UMA5l6HTA3pGmSP+S6Nk/ojwnPXLSBtDBPN+kGgsjd+F0YU73Osq3qNyNcEJtRGkfI7FMJZOmm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778832355; c=relaxed/simple;
	bh=JnpkHgeRaLIklyrr/tYaJR4akkRsVCzKpHaRqDOKORg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C1B+VM8zVN5yIqdyZcnJsjtpfAuR4dS/cJmcmQcOXe+2hXkwWNwrnXoKWA+5seGeczmmDH/ZhhtOUHVsGs/ZJiO8Whmf3P7Wj6zsT3wSlXQpY2li8/TgVUy2uItrKMkvNz0agyY88YcOXbA9J+VpljF5yLwpsgobK3h9sWsD304=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-5752b279662so3026547e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 15 May 2026 01:05:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778832353; x=1779437153;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FTMs9H2zcG/hkZo7rCavYzdXjSvd0E+3ghPib3tFoJI=;
        b=BrDNvhXcFf5IJ4G1e9lWZOMvZham3jvhS/v+tBsDDFSL5JS7ibnLn71BQL3shGdGON
         /8CdVIioq7YHd9JDsl2D/RT3PCSmIs3hO0Q6hMsPMenKX2+nJDwDp7FLKWdMp3Tfp4DS
         CMHOHGa7rVyzsIS9+E3d38o/tZ7Q53m0nArrhxHvI31/mmJg8wHexj7nUAQnuB/okPNS
         2feYYXDE3CbXBYWlPhtaVUSWbVQI0S+uRom2frK0mhgiNnrt5AnZ1K11lGQbgCvgg75Q
         9/oVpcxkwL8Zpw/qBahpE8ds07OiQxXiwwWAYjGGFKL9rPX05EZL+JQa4e4O9nYxHuGK
         Q68g==
X-Forwarded-Encrypted: i=1; AFNElJ+nlcQ6oDNxc6MUXU4LmxERJxJIMDxae3PEGwBuinIJeFOzXhSCP5zzv13b7JopGsO5xRCRyuru+RWYpFPBvwu1Ug==@vger.kernel.org
X-Gm-Message-State: AOJu0YyAyA7oNBVZ/+pkMx7spiXJkXnWbBFZFFkrYCEWFCnGsuyULj2r
	s8xemXwr16wJ6dlvcfLUYjCemkjmv2fZEq6dwUf+Ib2UOGzAxT5Fx+YLebneG1Xd
X-Gm-Gg: Acq92OHtA6uPxtIRMOJrlZeEpHYd1NGIr2xJ6ZqLR1TfJfCuwjbcqcGSts9NmlyqC1M
	5n1fMNh9IEiQhck1tR5dUCOdzbSWpt4GyWy/wbOPJ0xn9zx3JB56nCWL5EcOFBo3JtlgcGjsk+B
	kRB9dYAQlST34FRqGNncCPGjb84uY1gpgOtWAZaC14D8MBgVgDY86SKeKJH03D3xBGU5R3BuiL9
	LpzCKBZXAqgHm0TOsvNOp/8tVIY5EWls43jLyXJsPUR7HXH5B6q8oOlIF8NEE/tjlYdPrMl4By2
	bTCxrbLKIibDLnDhfP5SuW6na/WBedv/A7qLlHXh2VZJhv1ehxY8K1RQfkTc1mz/0nl9gmGFxje
	Fpg8LABFIVqbGIRSRkOXjBTa0uD/Vv+2nFE/FNzCjw2UtmKJMPXEh5EZ8t1iHW77cJkr+naxTqc
	mJ2pfevoiYDZAc4O82LJ80lBzVxNIy++/ZqSsm4SzBjn3dO/MbKvZnmTRX6D7N6BEnOBZOsMg=
X-Received: by 2002:a05:6122:3c4d:b0:575:a6f4:46b4 with SMTP id 71dfb90a1353d-5760c0b790bmr1484313e0c.9.1778832353123;
        Fri, 15 May 2026 01:05:53 -0700 (PDT)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com. [209.85.217.44])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5760fadc1dasm820274e0c.16.2026.05.15.01.05.52
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 01:05:52 -0700 (PDT)
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-631333ee9e4so2602747137.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 15 May 2026 01:05:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+nQCLDAhLIIqZX5UyCY2qP/fWRuWF0I05YkT8yYgcAcgUqtmzNQDAO/Gy2H/LBqHqmPqmQatIV0q9jv7VuXhU0CQ==@vger.kernel.org
X-Received: by 2002:a05:6102:f94:b0:631:5ef5:8325 with SMTP id
 ada2fe7eead31-63a3d93b73cmr1247586137.8.1778832352115; Fri, 15 May 2026
 01:05:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260514-rcar-du-dsc-v1-0-d65f7a9e9841@ideasonboard.com>
 <20260514-rcar-du-dsc-v1-3-d65f7a9e9841@ideasonboard.com> <CAMuHMdVTgQp9WRiFpLX+pP7kOGF2v6oButALPu1B8QkYhVyvJA@mail.gmail.com>
 <6db159d9-56af-4d79-a1f1-9d5a6349b5ac@ideasonboard.com>
In-Reply-To: <6db159d9-56af-4d79-a1f1-9d5a6349b5ac@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 15 May 2026 10:05:41 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVL9s=EHbw38kBzEVGa5-LawVY4YBUfSMA-6U+i3OSrbw@mail.gmail.com>
X-Gm-Features: AVHnY4IeYtwx3NtqULFNQ1UNiQVfhuhx7vVBY8D7FKyQ3HU9Ed8VUzHO4jOvKfs
Message-ID: <CAMuHMdVL9s=EHbw38kBzEVGa5-LawVY4YBUfSMA-6U+i3OSrbw@mail.gmail.com>
Subject: Re: [PATCH 3/5] drm/rcar-du: dsc: Add rudimentary Renesas R-Car V4H
 DSC driver
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
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
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 0439D54B062
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[baylibre.com,kernel.org,intel.com,linaro.org,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,suse.de,ffwll.ch,mailbox.org,pengutronix.de,vger.kernel.org,lists.freedesktop.org];
	TAGGED_FROM(0.00)[bounces-32656-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[27];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.992];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mailbox.org:email,mail.gmail.com:mid,linux-m68k.org:email,ideasonboard.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Hi Tomi,

On Fri, 15 May 2026 at 10:03, Tomi Valkeinen
<tomi.valkeinen@ideasonboard.com> wrote:
> On 15/05/2026 10:49, Geert Uytterhoeven wrote:
> > On Thu, 14 May 2026 at 14:25, Tomi Valkeinen
> > <tomi.valkeinen+renesas@ideasonboard.com> wrote:
> >> From: Marek Vasut <marek.vasut+renesas@mailbox.org>
> >>
> >> The Renesas DSC Display Stream Compression is a bridge embedded in the
> >> Renesas R-Car V4H SoC. The bridge performs VESA DSC encoding of up to
> >> 8k or 400 Mpixel/s . Add rudimentary driver, which currently acts as a
> >> pass-through bridge and allows DSI1 to be operational on R-Car V4H.
> >>
> >> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> >> [tomi.valkeinen: use bridge->next_bridge, minor changes]
> >> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> >
> > Thanks for your patch!
> >
> >> --- /dev/null
> >> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_dsc.c
> >
> >> +
> >> +static void rcar_dsc_atomic_enable(struct drm_bridge *bridge,
> >> +                                  struct drm_atomic_state *state)
> >> +{
> >> +       struct rcar_dsc *dsc = bridge_to_rcar_dsc(bridge);
> >> +
> >> +       WARN_ON(clk_prepare_enable(dsc->clk));
>
> Ah, just missed your comment and sent the v2.
>
> > Who don't you use pm_runtime_resume_and_get() instead, like
> > rcar_cmm.c? Then you don't need to get the clock at all, and the driver
>
> Hmm, why wouldn't I need to get the clock? What does the runtime PM do
> on Renesas?

Runtime PM powers on the power domain (if present), and starts
the device by enabling its module clock.

> > will keep on working if the DSC ever ends up in a power domain.
> I can add runtime PM. I just felt that it was overcomplicating a "dummy"
> driver that just needs to enable the clock when the video pipeline is
> enabled.

Funny, I would say you are overcomplicating a dummy driver by adding
explicit clock control ;-)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

