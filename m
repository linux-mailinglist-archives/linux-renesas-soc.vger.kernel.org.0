Return-Path: <linux-renesas-soc+bounces-32659-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uJa1GZbpBmpKowIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32659-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 15 May 2026 11:38:30 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A7AF154C908
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 15 May 2026 11:38:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 355D63137EF2
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 15 May 2026 08:54:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 736DD3E63B4;
	Fri, 15 May 2026 08:53:57 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AD38426697
	for <linux-renesas-soc@vger.kernel.org>; Fri, 15 May 2026 08:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778835237; cv=none; b=SObfzn0BzX8ERYcPZWlKdCYTAxF1kwFUyvFLAs0O5z3XOzLP+muOT95sr+ZQ/+5xtSQJHROiOPJ3VWpswLBYvRZxFOF+nvQMr3oFcATnrlDmgW2/BNjD11LzLzxhYFBmXnZP5AmI2K6xEsBp3ZFjDiszPJGYXPBqmPeELi+k4f4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778835237; c=relaxed/simple;
	bh=5yHoGKC4E/Rf7XOzxXWV+p/WVrFvuJccWmdeQGZVtoM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mrs5YOcruS0POQ+WYKhoEmWnIBbkQyPTvI6uit4TplgZEWxyRiRV1xE8ng53T8qQOi14LzS2CKMAksYVKDwOTCGnNjUSHwnrG9Umh6Bka7IGg0hAC7eNLxvhHycTKyTF+4WppjiV2lXGPQUX3mFRUG+UGORnI2NUG6vvVzvKDDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3665a90bcd3so7135736a91.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 15 May 2026 01:53:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778835234; x=1779440034;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VVgJPqzdVEsAMlVw8p1sldLEqlhvUsFX5k1afv6GStQ=;
        b=SnPomAkQ2k79uXSso4roxZGLSZ3DawOfo48luu6maK22FTOwPNHCdfAKLZKg/6YF70
         zUSeFCikETRr42WF4/b3olq8p8RVfpfZF6kntTXlFX8VTcosverOEq2iKMAVxVQveXsd
         xXUQy0cq3d70juvq8ASamxicBtftWfOJsYK69jlJXVHyfJ4ZNUAxTqwl4lbnh10FqoeE
         5vv1qGl1LVLejhC/Cz8KJhZibZawaXBlaArLpWIsPm8EK2SrS5HV39q47koCGAYBDXwd
         foGpDxOAW+0iA50l0yQ7pFTbGJk9mv97XLNvZjpM3h92n2kogZOVPSqV6B2qEfMnSVOr
         Jlow==
X-Forwarded-Encrypted: i=1; AFNElJ8C/mdPA8y2jsuNnQLVI4sLPkfnupX+/0STAEqO1VB+2gPqbKfbUKfhRCVg3meOLBblX08vNZmXfW0eyLvme13aPQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyWuh2FyqKdCfMXy66bAlpOm7K6vibip5KqQEQ3ZsJhrhVNomtV
	Mfthq9rIjEUqecnfPOXEA6aAgKQdgumraVF9rtF6WaiGHdtU+PWspbQkKhLc3GN1
X-Gm-Gg: Acq92OGRALlwllPjOCht1epDF9U7jaIH77oYLxhyNoz5HZcoDiExor4sjSaoU0jv2w9
	yPpfmPb/qawu8u+AORdvT05PlQ3/MCYBs6r0mwORf69oQaQWvd8fVh8CGiwSu/G8Ik4aCuMb6uf
	n++2XK9ahr4thb9+LyZ2qLy/8YWVI9Z7J5RxDWYmRaraJcl1o5dryD/gGc8nfLcoRcaNn0SaoZ4
	K9+gpSeNwCazm0RYV4jQDtFZOE0ciNLU1QxT5EG/XShKBDPf3fxhrWjDjDFEqXBkjMv5kujQTXC
	zGpJ5PN+GoB/D+gJ7HdJNvK3okl9EGxCW0Gf99yo1ngGbZ9deUcWtbPyR/jNwe998ObCd5Y6pzB
	BnwvGHbixSSzlSLghQII2N32av49gHxcFvnxa+tCXERlh+wFaWGx2HvZ2+jXz+TOKJ4IPFTaIVS
	xRUIk6h9lN1w1ISeIRcMN9dChwD5Drb5c1HCc1B1gUjzj/uf9i6gcGEDoo98cc9EQk
X-Received: by 2002:a17:90b:2649:b0:366:2b56:3eb0 with SMTP id 98e67ed59e1d1-369519f354emr3283860a91.10.1778835234212;
        Fri, 15 May 2026 01:53:54 -0700 (PDT)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com. [209.85.215.181])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3695155a0d7sm2025115a91.2.2026.05.15.01.53.53
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 01:53:53 -0700 (PDT)
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-c796163fac5so6636073a12.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 15 May 2026 01:53:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ92Jh5T6la3xQ/5kpeRXydi1ZbHpnKAKqIMY8kbP3qW9RxOo8n5WuGbYXbSgImBUXOoPvtI1RS5zRv+5025g62oKg==@vger.kernel.org
X-Received: by 2002:a05:6102:358e:b0:62f:34db:9474 with SMTP id
 ada2fe7eead31-63a3ee86884mr1297663137.20.1778834878086; Fri, 15 May 2026
 01:47:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260514-rcar-du-dsc-v1-0-d65f7a9e9841@ideasonboard.com>
 <20260514-rcar-du-dsc-v1-3-d65f7a9e9841@ideasonboard.com> <CAMuHMdVTgQp9WRiFpLX+pP7kOGF2v6oButALPu1B8QkYhVyvJA@mail.gmail.com>
 <6db159d9-56af-4d79-a1f1-9d5a6349b5ac@ideasonboard.com> <CAMuHMdVL9s=EHbw38kBzEVGa5-LawVY4YBUfSMA-6U+i3OSrbw@mail.gmail.com>
 <d7447f51-c2f7-4947-9fd0-ac0d45027c59@ideasonboard.com>
In-Reply-To: <d7447f51-c2f7-4947-9fd0-ac0d45027c59@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 15 May 2026 10:47:46 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUS9jrsjqqPRKXJa9978kj1aYZ9aPrepv5kueiHGGLkCg@mail.gmail.com>
X-Gm-Features: AVHnY4JCOAjr3bsj3LmrYGms2JUgvp1AhIShwYqx91e-BUfZ61J5zvr2A9mA72E
Message-ID: <CAMuHMdUS9jrsjqqPRKXJa9978kj1aYZ9aPrepv5kueiHGGLkCg@mail.gmail.com>
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
X-Rspamd-Queue-Id: A7AF154C908
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[baylibre.com,kernel.org,intel.com,linaro.org,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,suse.de,ffwll.ch,mailbox.org,pengutronix.de,vger.kernel.org,lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32659-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[27];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.993];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

Hi Tomi,

On Fri, 15 May 2026 at 10:17, Tomi Valkeinen
<tomi.valkeinen@ideasonboard.com> wrote:
> On 15/05/2026 11:05, Geert Uytterhoeven wrote:
> > On Fri, 15 May 2026 at 10:03, Tomi Valkeinen
> > <tomi.valkeinen@ideasonboard.com> wrote:
> >> On 15/05/2026 10:49, Geert Uytterhoeven wrote:
> >>> On Thu, 14 May 2026 at 14:25, Tomi Valkeinen
> >>> <tomi.valkeinen+renesas@ideasonboard.com> wrote:
> >>>> From: Marek Vasut <marek.vasut+renesas@mailbox.org>
> >>>>
> >>>> The Renesas DSC Display Stream Compression is a bridge embedded in the
> >>>> Renesas R-Car V4H SoC. The bridge performs VESA DSC encoding of up to
> >>>> 8k or 400 Mpixel/s . Add rudimentary driver, which currently acts as a
> >>>> pass-through bridge and allows DSI1 to be operational on R-Car V4H.
> >>>>
> >>>> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> >>>> [tomi.valkeinen: use bridge->next_bridge, minor changes]
> >>>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> >>>
> >>> Thanks for your patch!
> >>>
> >>>> --- /dev/null
> >>>> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_dsc.c
> >>>
> >>>> +
> >>>> +static void rcar_dsc_atomic_enable(struct drm_bridge *bridge,
> >>>> +                                  struct drm_atomic_state *state)
> >>>> +{
> >>>> +       struct rcar_dsc *dsc = bridge_to_rcar_dsc(bridge);
> >>>> +
> >>>> +       WARN_ON(clk_prepare_enable(dsc->clk));
> >>
> >> Ah, just missed your comment and sent the v2.
> >>
> >>> Who don't you use pm_runtime_resume_and_get() instead, like
> >>> rcar_cmm.c? Then you don't need to get the clock at all, and the driver
> >>
> >> Hmm, why wouldn't I need to get the clock? What does the runtime PM do
> >> on Renesas?
> >
> > Runtime PM powers on the power domain (if present), and starts
> > the device by enabling its module clock.
> >
> >>> will keep on working if the DSC ever ends up in a power domain.
> >> I can add runtime PM. I just felt that it was overcomplicating a "dummy"
> >> driver that just needs to enable the clock when the video pipeline is
> >> enabled.
> >
> > Funny, I would say you are overcomplicating a dummy driver by adding
> > explicit clock control ;-)
> Well, now that I know the runtime PM does magics behind the scenes, you
> are right =).
>
> How's "module clock" defined? Is it the first clock in the clocks DT
> property?

It's the clock pointing to the cpg device node, and having "CPG_MOD"
as its first cell.  Usually it's the first clock.  Note that e.g. the
DU is special, as it' is represented by a single device node with
multiple module clocks (and multiple (but less) resets), due to the
tight integration between the individual channels.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

