Return-Path: <linux-renesas-soc+bounces-27097-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C9257D3C4B9
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Jan 2026 11:12:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id BE6CE5AAA8C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Jan 2026 09:59:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EF2D346782;
	Tue, 20 Jan 2026 09:57:34 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com [209.85.210.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A18853C008E
	for <linux-renesas-soc@vger.kernel.org>; Tue, 20 Jan 2026 09:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768903054; cv=none; b=Am2pIpl/Mk1OcIzlsUaPakfBpUTiIclVbULW/vvAYY80JasXWoTkfYEbZoRLqD9Es2npcVRZ6y0uao4+l1Pcsjlnlbb31AjymDgrFC22Xhd5I/QmJbnWY/fQ+bTC7KyqC3Dk6AyS0ig0RLY2Llm1ZfD08Vd456VvHXQYINKCjYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768903054; c=relaxed/simple;
	bh=PhelJ3YKLy0g5664IUc1xRM3vK2MnAcXyilLWshEZX0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q6KrBisI7qlkZR7t40RF0KuHauZICPD1X50jZDyFiuIPuQlfB0+K8ALfMOCiJ0TRNcoetvO6jhKgcl5nq928A7rhP1G0Vj/+efDpXeXudbI+CHvPneF/LQXT0mx19FbsANapYprh4Qu76ZTx2myaSzMoAKjQV2c+OBOXEEvRhwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f66.google.com with SMTP id 46e09a7af769-7cfcebf1725so3340710a34.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 20 Jan 2026 01:57:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768903051; x=1769507851;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cMqHiB2kIqqBrLa59wdqxa2/T5exJBY1xL1A1svqwlE=;
        b=sdbxFiV5wmxGOcuAY15ng4cz39rMXx3H2k3X6HlGDMdBtehLlzAQnEDdLWhUQQ8xQy
         Mr4LTW2jQcOFdhgmPxQMpuiLYrL38V93Cjf98xjY7moSzoZ9MBrLE1ekN0JXKjk68dxT
         FeTQYXJQxDHCuXHmvfXmi4AsB3ISU01lcwCI9Xb0Nl7+2rNDLHaY4EGZWqji+4pR6G/r
         zCVSzHm0uyOdaUcMn7kZzg3YvIqxJcwWNTMrnoGLjdZn9po7N82JQKqEhqZBW5Sbmhwe
         pboLSZfcPRMUDm+65Jtqi8bczYOQlhz5F9Y8PaQ3JBC8dK+0OCyn8aINAaUfyfQo2khM
         ZPMQ==
X-Forwarded-Encrypted: i=1; AJvYcCUeov+GEOljx5ZMZZyC0+0HfafoMekeZgdmK61p1bhkh8ClZflF6R6Vvi6NYlYVHKc5i5dZ0Bp7VKqXK61xMZkzkQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwNJzTlsJNuHcBb7n9BSxk74LMXDgCAW4KcJUpjCPLJqBPYRxeo
	kUi7vuuvHLv5owRsVg150PFYjRyFF5138J0VtRjL+kvBRkw8wqjbmVKqCjbPd6R3uf0=
X-Gm-Gg: AY/fxX6BUGM9fI9lTSWtOdiX/2f1nNmC+UqNxvZHIw/hR9+r7DILrShAuO/0TKOziS7
	nFR3spk8amI5EAtSIIrZ5f6aHz+pXa+fqesmiiMJ3rrsseAGl3/jIjWv9rg4z9zrq4DZ6oxMRbj
	r4K81gV90DGuyk31xUt60avrhZyfU92urxyuH1GVXiXiil5OJQzxGBmq/ZbBrFwXBs8BwI6wxhG
	cKun+tVIvVLBQFE4ICNLPfy/bK33X+L2j1WmBdvtr/DfAnxUkS8KP7I/sl1+yfsfCtWCTakLkXk
	IQ/DJ4hXbXfq7BSQiYqISv4GjnPzktasP7RLTnPC78Vy11H0KfvRmlGJySPNZJFjw8q/c7GkBCi
	+auLlePkQq/UQoOCCMz54WjcuQDJKCMNONQKfBAq42eJDUBbaDYqgNwFTCm5cA4ncLzZAZCnmwj
	rZufwEv5ruyRQFOa4pgi+rJ4PqadPB/BHKm+f7u1/YaTdlLOxA
X-Received: by 2002:a05:6830:6afa:b0:7c6:9eac:2385 with SMTP id 46e09a7af769-7d140a3a75dmr644231a34.5.1768903051417;
        Tue, 20 Jan 2026 01:57:31 -0800 (PST)
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com. [209.85.161.54])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7cfdf28f223sm8200841a34.19.2026.01.20.01.57.30
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Jan 2026 01:57:31 -0800 (PST)
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-6611c401aa2so2135924eaf.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 20 Jan 2026 01:57:30 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVtUNKmP3TxOmzImiPXdRqTNNGC9vw1Ps8E/DY5EzgpvPGf1A5yOmh1eFL3ts2aOjSXP2q9PVry1Oe7+7i05Zquhg==@vger.kernel.org
X-Received: by 2002:a05:6102:2928:b0:5db:f6ef:560 with SMTP id
 ada2fe7eead31-5f50ae0a099mr264663137.28.1768902583158; Tue, 20 Jan 2026
 01:49:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260118-rz-sdio-mux-v5-0-3c37e8872683@solid-run.com> <20260118-rz-sdio-mux-v5-7-3c37e8872683@solid-run.com>
In-Reply-To: <20260118-rz-sdio-mux-v5-7-3c37e8872683@solid-run.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 20 Jan 2026 10:49:32 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU5shzYs27wO2A0SoisGBMo8RHf9DO-ubC6VrhWECEPCw@mail.gmail.com>
X-Gm-Features: AZwV_QjEUqevj8OUxZ5xnP3V3BgNbEzQSiuy0CgomAkdvyQGaaSlv633jCWavtA
Message-ID: <CAMuHMdU5shzYs27wO2A0SoisGBMo8RHf9DO-ubC6VrhWECEPCw@mail.gmail.com>
Subject: Re: [PATCH v5 7/7] mmc: host: renesas_sdhi_core: support selecting an
 optional mux
To: Josua Mayer <josua@solid-run.com>
Cc: Marc Kleine-Budde <mkl@pengutronix.de>, Vincent Mailhol <mailhol@kernel.org>, 
	Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Peter Rosin <peda@axentia.se>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
	Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
	Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, 
	Janusz Krzysztofik <jmkrzyszt@gmail.com>, Vignesh R <vigneshr@ti.com>, 
	Andi Shyti <andi.shyti@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Yazan Shhady <yazan.shhady@solid-run.com>, Jon Nettleton <jon@solid-run.com>, 
	Mikhail Anikin <mikhail.anikin@solid-run.com>, linux-can@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-omap@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 18 Jan 2026 at 11:29, Josua Mayer <josua@solid-run.com> wrote:
> Some hardware designs route data or control signals through a mux to
> support multiple devices on a single sdhi controller.
>
> In particular SolidRun RZ/G2L/G2LC/V2L System on Module use a mux for
> switching between soldered eMMC and an optional microSD on a carrier
> board, e.g. for development or provisioning.
>
> SD/SDIO/eMMC are not well suited for runtime switching between different
> cards, however boot-time selection is possible and useful - in
> particular considering dt overlays.
>
> Add support for an optional SD/SDIO/eMMC mux defined in dt, and select
> it during probe.
>
> Similar functionality already exists in other places, e.g. i2c-omap.
>
> Signed-off-by: Josua Mayer <josua@solid-run.com>

LGTM, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

