Return-Path: <linux-renesas-soc+bounces-32647-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wKEpGmXRBmqKoAIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32647-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 15 May 2026 09:55:17 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 106A154ADA6
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 15 May 2026 09:55:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 94C57300CCBA
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 15 May 2026 07:55:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2FFD3EFD27;
	Fri, 15 May 2026 07:55:09 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C15FF3E92B7
	for <linux-renesas-soc@vger.kernel.org>; Fri, 15 May 2026 07:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778831709; cv=none; b=aRT2uX5qBEwOYmPpRuC/eWmN/xBFUQejCyB4Sb+7nI4J0FIDbVFSYh5tnQlH2w/RF8Gvn2Hc1V16z8C7vGOiwZQzhMdsEvLg5CHpRPFUGWpY1HQe61JogG/pUQ/9t9QJeKU5seXEkbKcMyjPX90q1S7A9M0CMdiiDmmZfAeGLlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778831709; c=relaxed/simple;
	bh=IF78aL4qhYcYFoQ/xoUYLUDn+1jiumlt7gMiBumVb88=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hz5k5xsQKpmm8OVtYcXyy89v1dc8itQVAgwCl5CTVI5ti0Y8+1Fgv/YhAY6jQpkgbklpY9h3JKV2NqfpXLVCDaCzJ9tk6Wu1n5xVvRthOj1rgTTu5VMC/DSw6FHdbOvEdM8xuxqkVlq5jjJUc6iedJCmZ3Grr7aIh0KVOpL7g8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-c801912c903so4255832a12.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 15 May 2026 00:55:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778831708; x=1779436508;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eAZHu6XpvwN5l5f2FSQxtIsJfHFz80+bclBZd6bS4os=;
        b=QN6c45q/HM299w2O7mzl8FRI2Y5Iafw9YvkpIhW1HK0w4P/G95pgoqFpEWh8fuZGQ+
         OTM4F0+3HvIG7ZLfEXAiycNOo2FdK16YFWh7dzr398eC5vPYjWE+BjwJCqeD/c1SVcVc
         5rZxlhvnR5zS60xQPZs6C868JvKGlzGxGz64WXihdt/isAYoXHrUfQO7HoG7YicW3lQc
         CiyfM5x/uwB+dX3A3TooRYa3BTrPxxqTrY+1gbczgtUPuiepWzz+9RMZ6CbHsUxO3U+a
         DRTMb/14fLoQNoEuMki5mENdU9xtr+uf2weespdZ9K6rO+aqH41aM7pobViFJPVPFyjm
         XG8w==
X-Forwarded-Encrypted: i=1; AFNElJ/jcsROv/s01zu5mVlFFpo7oCBX3hQI97ciaUPjmn79n0FkgcnA+I5z7eQLEkAK0lUdVq/sde9aoRy8Ossml50e2A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxoBQ3zIv+87ENPSz/5FfMJ21liNXC098rpW42tmaItpj7+M1B7
	kExj8gi3v7ZgWXUFdQ8UZw52yQgF4pbXlMEhbk2mbEZU7nIwzTR4Hu9Q36fsOaQn
X-Gm-Gg: Acq92OF05xOjRUQpGkQTUDQ2rbCE+EWQwcLke9oIJ14UvljSa1mqneatfkeyDFNPoYZ
	XJQMWgcCj3wFIcd/FbFuvMRF/aKM1xiMqKRN0zM66Hny26+pXWoml+Cycj32jyboG4F7oQGf1as
	abvPHX/R4y42CZIQ0eQ4CJI/aElJvARR65d2/c6+d4QOP44XnvJNd0nQUlvTFXivklthwbKbLhG
	F4V9UCDuhxaumY9ABpyy/pAhL5vO+iklzSYv1qRSKqIMqK80wR7GutelufiyyiFhmXWMdB0BwVm
	6MYK7JokXbpDAZp0iNweyk88ab0cnvqzfPKQQjvsfgpiGkCQCRG+FJnlSY73WrB7MsXYgozD1Eu
	07SjcBc/V7BWarbosaSx3/iWUiufBBELnImlCV1WgEVgHw8d24kZU++X2v6jD8bKRPr8ggztLoh
	LpVoTE+FdiGVX2FmEwtXy5RH7CZcGSh2zg02VswMNj29g6nQhvHa4ljd+NApA=
X-Received: by 2002:a05:6a20:3d8f:b0:3a1:90ef:7e2d with SMTP id adf61e73a8af0-3b22ecf9a9amr3001570637.26.1778831707854;
        Fri, 15 May 2026 00:55:07 -0700 (PDT)
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com. [74.125.82.48])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c82bb062941sm6002438a12.2.2026.05.15.00.55.07
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 00:55:07 -0700 (PDT)
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-134ac81c445so829731c88.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 15 May 2026 00:55:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9Sbqa+Fmian7Yrvh90Hsughrbm93igd6OznQKiWMe6rvAgq/Xbnn48+xfBiqLS6sdsLu3V0rrgk1uFO671VaWYhQ==@vger.kernel.org
X-Received: by 2002:a05:6102:3f05:b0:62e:63e8:427b with SMTP id
 ada2fe7eead31-63a39a5f9e4mr1494077137.0.1778831365156; Fri, 15 May 2026
 00:49:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260514-rcar-du-dsc-v1-0-d65f7a9e9841@ideasonboard.com> <20260514-rcar-du-dsc-v1-3-d65f7a9e9841@ideasonboard.com>
In-Reply-To: <20260514-rcar-du-dsc-v1-3-d65f7a9e9841@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 15 May 2026 09:49:14 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVTgQp9WRiFpLX+pP7kOGF2v6oButALPu1B8QkYhVyvJA@mail.gmail.com>
X-Gm-Features: AVHnY4KQ6u1JetcDt3qGv1sa7SAF13W-c5qtL3drtJoKYhKLpQQVXnl4eLgch0w
Message-ID: <CAMuHMdVTgQp9WRiFpLX+pP7kOGF2v6oButALPu1B8QkYhVyvJA@mail.gmail.com>
Subject: Re: [PATCH 3/5] drm/rcar-du: dsc: Add rudimentary Renesas R-Car V4H
 DSC driver
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
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 106A154ADA6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[baylibre.com,kernel.org,intel.com,linaro.org,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,suse.de,ffwll.ch,mailbox.org,pengutronix.de,vger.kernel.org,lists.freedesktop.org];
	TAGGED_FROM(0.00)[bounces-32647-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-0.992];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,linux-m68k.org:email,mailbox.org:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,ideasonboard.com:email]
X-Rspamd-Action: no action

Hi Tomi,

On Thu, 14 May 2026 at 14:25, Tomi Valkeinen
<tomi.valkeinen+renesas@ideasonboard.com> wrote:
> From: Marek Vasut <marek.vasut+renesas@mailbox.org>
>
> The Renesas DSC Display Stream Compression is a bridge embedded in the
> Renesas R-Car V4H SoC. The bridge performs VESA DSC encoding of up to
> 8k or 400 Mpixel/s . Add rudimentary driver, which currently acts as a
> pass-through bridge and allows DSI1 to be operational on R-Car V4H.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> [tomi.valkeinen: use bridge->next_bridge, minor changes]
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>

Thanks for your patch!

> --- /dev/null
> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_dsc.c

> +
> +static void rcar_dsc_atomic_enable(struct drm_bridge *bridge,
> +                                  struct drm_atomic_state *state)
> +{
> +       struct rcar_dsc *dsc = bridge_to_rcar_dsc(bridge);
> +
> +       WARN_ON(clk_prepare_enable(dsc->clk));

Who don't you use pm_runtime_resume_and_get() instead, like
rcar_cmm.c? Then you don't need to get the clock at all, and the driver
will keep on working if the DSC ever ends up in a power domain.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

