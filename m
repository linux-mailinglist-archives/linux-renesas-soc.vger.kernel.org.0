Return-Path: <linux-renesas-soc+bounces-32654-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WEJ3NIzTBmqKoAIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32654-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 15 May 2026 10:04:28 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C697254B005
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 15 May 2026 10:04:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8BA1B3036AEA
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 15 May 2026 08:01:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEE813F7AA2;
	Fri, 15 May 2026 08:01:27 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f65.google.com (mail-ua1-f65.google.com [209.85.222.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BD073FADEB
	for <linux-renesas-soc@vger.kernel.org>; Fri, 15 May 2026 08:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778832087; cv=none; b=FkqxUbyovEPKSvg1I0gROgncM0bWvF6nUJQdpUCjQOQUHH7Vvo2YZxknHsB6SHUUmdeMzQlWPgOT5wLCxhVTk6u6KfqvVJ0f9bjhtnJC5ouNsOll5XBQSGoAFhW1O7k4tdqswVjOFVnZdb8feC7RBEZlrsxts1eFnSYCeXIB8U8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778832087; c=relaxed/simple;
	bh=li6NXU7sST/n8eXTPpy/Kpdi+fuxsdYH6rwtrEYDBl0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XihljvR81XlDQwa1Z3akRrGrSOe7XBqAf11RB3Apb7Opewzco3LbjPcCdN0Rftnb56rxJydCE7iApZY2dLIsm8rsfwwo8YlFGuQpNQYwElQBA7NUzBSv57iOva7yLlcvSOLnjLMs/bc2KetEdc/RCdW7+TK+iSVKq0bYlBt8QcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f65.google.com with SMTP id a1e0cc1a2514c-94de664b541so2877621241.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 15 May 2026 01:01:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778832086; x=1779436886;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mk3+gk0uvDvPr4J0ZYYOynNFHdcw9MrgwNKr9DcQAuQ=;
        b=IP8E82B4dpqderyVfNwXGSWmEkjy3pLGp8myHjvdnBvPOMZf5qjz10Iw+o6FxMT3lP
         dHYts3ten0l56vYuDVkr4S+Oh55P1UkRkLTSJcOzZUwZ7RYghE9KDQ6TIyefxcFLiUNx
         Qg9R9TIQE0DRptNVqTxLmzr5vOG3HTDiuyp2JVfpla9ssTQjKmed0FnoqeWcOysSqG46
         uWBbLoGM0i6RB5ySUDPmay2nRtOPXZT5hUldhUw5gBT7/9aoXwKuq+gcRJ8Rh+/VnWZU
         urWf160OVd7O4m0nj1IVKwl+N0bcCRNFWOfwf0pjmeL0+ervYrqBd8lUQg/GnbtKy2lv
         6akA==
X-Forwarded-Encrypted: i=1; AFNElJ/XjV+QG0duYtCdMrV98HG3fRjgCz7/Oh/ugEJ0B/R1cywm4tN8EVUKxfEFWF1OlEnCiDnJ6ykr4IQUuxpaHOic+w==@vger.kernel.org
X-Gm-Message-State: AOJu0YySkFxp4Oo3IqjpofkXdW0Nx9WHaQ0hoXpUXEddR9UY4ZXraM/6
	apmd4u5zcarGLnGgL/Jn8aVbTmdjGSFrV27hZFL9XF4RmcRZmfdExZ0T8otopMX2mhk=
X-Gm-Gg: Acq92OFwv3s3gdVxcblAxCeSIKKTE6bU5ewbzs8uOIN0r9OxvaI3Amci4dgfRkIfvGm
	U28TX8mLiskoLagJfbIxQzJXK27qhOdxw+0fw1+nSEOCIzaCn/zIvXL5DIb/VPmy5zz1+Q75HVk
	oPHzsWXUWFLT9fRjbN3ojHkRTi7sQ65QNB8+JOLSbfO5XC3BQQGwjPfRc5rDvy8VfoZKqx1EJ+V
	zw+Yk0Z1XHkvYPjQ0wQ4olYfgOxzgzx9BC+yOPItZLawcyKDHSB3CJ5l1AB7viGzEpXINt0kiPV
	E8A0wTft/KtUInPFGIvtKRfmCBzBTxrMjM1I8mSgS3Fq5Z0OydbbSUrSiZmzJg1ecOIMrg6nwBL
	XXUcFY6Ii/5M/bh96LtQcAQ92HOhaztW1/vU+EEvoBohgYObW0JS4VvUF1YVLIrNcoBKHsEHXLL
	HMf/fJkYWsb08frOT+is4sE6qo0py7K10tkhefoM7B72GF7VLcqI7fzsmE/jboc/dj
X-Received: by 2002:a05:6102:cce:b0:634:d42d:15dd with SMTP id ada2fe7eead31-63a3ec83b21mr1207017137.14.1778832081200;
        Fri, 15 May 2026 01:01:21 -0700 (PDT)
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com. [209.85.221.174])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-63cea37bc47sm410427137.11.2026.05.15.01.01.21
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 01:01:21 -0700 (PDT)
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-56a8fdaddebso3324620e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 15 May 2026 01:01:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+eIJMZAcriQERFfdGW7fSBiEkiHaNVPLDeItXCT/OQ7tQCye6LeebRDn78HhzFIOixfAc1ianwd9+byBp4gSwrug==@vger.kernel.org
X-Received: by 2002:a05:6122:ec7:b0:575:44b3:300d with SMTP id
 71dfb90a1353d-5760c0528f5mr1639450e0c.10.1778832080852; Fri, 15 May 2026
 01:01:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260515-rcar-du-dsc-v2-0-f6b9240a1240@ideasonboard.com>
In-Reply-To: <20260515-rcar-du-dsc-v2-0-f6b9240a1240@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 15 May 2026 10:01:09 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU_HF-L+KrMNTUMO0_ukfVJE=nZLjoadFFWf0qDopKs8A@mail.gmail.com>
X-Gm-Features: AVHnY4Juo1yrSdWSEhGd8PIKGe45raKjJnOdNJywoBplErTdAE8Qpe6uxcK4nzs
Message-ID: <CAMuHMdU_HF-L+KrMNTUMO0_ukfVJE=nZLjoadFFWf0qDopKs8A@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] drm/rcar-du: Add support for DSI pipelines with DSC
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
	Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: C697254B005
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[baylibre.com,kernel.org,intel.com,linaro.org,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,suse.de,ffwll.ch,pengutronix.de,vger.kernel.org,lists.freedesktop.org];
	TAGGED_FROM(0.00)[bounces-32654-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,mail.gmail.com:mid,ideasonboard.com:email,linux-m68k.org:email]
X-Rspamd-Action: no action

Hi Tomi,

On Fri, 15 May 2026 at 09:56, Tomi Valkeinen
<tomi.valkeinen+renesas@ideasonboard.com> wrote:
> Some DSI pipelines have DSC (Display Stream Compression) IP block
> between the DU and the DSI. Even if DSC is not needed, the IP must be
> enabled for the DSI output to work.
>
> This series adds a basic DSC driver, so that the DSC IP gets enabled in
> bypass mode. This enables DisplayPort output on Sparrow Hawk board, as
> the DP output comes from DSI and sn65dsi86 bridge.
>
> Original series from Marek.

Thanks for your series!

Now we can revisit "[PATCH/RFC 1/1] arm64: dts: renesas: white-hawk:
Add mini-DP output support", too?
https://lore.kernel.org/05e43f61321b4191d5f97dec2349facd4b56c899.1729240989.git.geert+renesas@glider.be/

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

