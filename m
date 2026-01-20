Return-Path: <linux-renesas-soc+bounces-27095-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id A00F1D3C55D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Jan 2026 11:34:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id AC4B9701A04
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Jan 2026 09:45:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0398E3491C8;
	Tue, 20 Jan 2026 09:40:22 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69B6C35B12B
	for <linux-renesas-soc@vger.kernel.org>; Tue, 20 Jan 2026 09:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768902021; cv=none; b=neMpClGnFLceuOLDP8WktlPMLrhNVuDWnrkoACnRqyQIcRD4m48aGjT4orMXg6yciZZAyUXCinsRNOiflacM69PWp1bL5nknqR49ofFlrsSAaACXsQ4TwMvzZFlu8w1BknMb8Z4tudG5D3+O2moCmGDgz99CpQzaSJX7oeMB/0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768902021; c=relaxed/simple;
	bh=8oF7WvkLTpbnCP6yb2DMCynlFu+13M83ZUzjQuNxXOc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FbJHrUjcAR9Nbc8oEFT2xHIMUomNxTWUSRPqEr87S0UaROu8k6XzRQPTO3qEsniJf3aR3eipGVI+o6yFxjGL7h+B5ONjUA4RAojTQC8AQIe7r2Sg8178eXKrgsksN+tfI3ZZjxKJsm3rOQ5tp2krXxn0MzQ9b0uNQuJEc+HzQKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-93f56804894so3322899241.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 20 Jan 2026 01:40:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768902019; x=1769506819;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=97LNh80TR77S8pwS2e4ZBU/MTmpHjj3Q16znIrdsedk=;
        b=Bopz6YNddeTHjzFmNhI+t9d5WqsFaOrXzHCRaVoEpGLoFGD1jqAOt6WK39vKn0YRPj
         rNwTCmIPbn1kqr0ZE8I96stI+O/dBaDhtBH+lCabyKpGIAhJjUYGScGT+ZXI6tF5tKyQ
         8LT0YeCDq4LnFs24BVoj+dlFHmRJL8FV3pCqtTn8YYLvh+AobMgtvxxbKspdIIQFLk8K
         hvKV40ZaGY66KpvabLIZDvlI986BQP5PXP2OWL8XaKA4P19hgrfZmjXrZt2yzTmAeEZN
         /icjCHg76ftt6Y4JsHajiu/E2JCzk6hH4ezZ0BXL3FdZPxAdzWJWjMPMGxhrlXF6MlsN
         tIcw==
X-Forwarded-Encrypted: i=1; AJvYcCXAJ1WvqiW0FFxyX+BAFgK9UEqWAjUmsqTBnjyBkFr0BfyoloE9r9dI51EWWXAeJUozU3f+wdfl6EGJUCYHgjo7Uw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzmLV53x1rRj3798c9qrStPvYV1a5wwGVBMKseY2Xkf/2Kr/Mwh
	5gwnhbU1TVJQd5yAGW+TBL6oqTCO8bf8AXecweCP3Y8k5VRCUelNt2+UsigWb/wI
X-Gm-Gg: AZuq6aIfmylouz2I+CqhvIaqjIcZrOWj4PePojmW1LnQs6uidVTWgV59QrHzt++Z4uk
	f/1hjCzFzUEPo4wevefzvV7/qpdm/jJZoEsMKs2pV1reDp0dEz5EnzBcZKSIUI/8oNO+PCyNqvp
	zQTonKM+TXg935q25edOnuRH65F23aaeENaX8RXvoDFCjkDFMwRq6AMFnaCkGKKqT40ePQLFa7q
	wPgo7XwJj64oFXDy5bAxyn2f4b0lM4QIZ/e24fNvLyMuQS8z6r8uugCIZjnY7Yean6b+vikOoB6
	pBSxgFThbOqoYh6xPLGOuS8vsGQGowOkFhCM/wI5YQdxTwmXq6U9NlV5LPPqKaoSfS5UdJPnTwl
	oKQP7wNwpaOR094VzMli5tVm2OgHhVutK2Q7KATGoWW55CeztFPl43oyxhu8cJ65cXiPDd9qLXd
	3WndeiwaVNHuZgaoBTLYCfJQXdwKl3IJCHIk3Zlt9SSZJU0dcs
X-Received: by 2002:a05:6102:3a13:b0:5f1:9641:4f2a with SMTP id ada2fe7eead31-5f1a700db3dmr5035334137.18.1768902019282;
        Tue, 20 Jan 2026 01:40:19 -0800 (PST)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com. [209.85.222.48])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5f1a68ff962sm4365298137.1.2026.01.20.01.40.19
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Jan 2026 01:40:19 -0800 (PST)
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-93f56804894so3322891241.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 20 Jan 2026 01:40:19 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVSMh8G8uEn/xnwE3K6oCYcv9ZVYrZpAAVsvcfvxdqj0JxzE1q0HuU/ctJDwwfR1lhrI4zQfYbCWgMhzbkGrFHmeg==@vger.kernel.org
X-Received: by 2002:a05:6102:1610:b0:530:f657:c40 with SMTP id
 ada2fe7eead31-5f1a712440dmr4338759137.22.1768901715766; Tue, 20 Jan 2026
 01:35:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260118-rz-sdio-mux-v5-0-3c37e8872683@solid-run.com> <20260118-rz-sdio-mux-v5-1-3c37e8872683@solid-run.com>
In-Reply-To: <20260118-rz-sdio-mux-v5-1-3c37e8872683@solid-run.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 20 Jan 2026 10:35:04 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVf7MjEAaTAy3kgaTcfs240UcnL_yFWfYH_eqVfp-6jvA@mail.gmail.com>
X-Gm-Features: AZwV_QifN5dzgWIfmsNWfdw085d37JEd6a5y3M-TObPOlkszfcRmE9SintqdNzo
Message-ID: <CAMuHMdVf7MjEAaTAy3kgaTcfs240UcnL_yFWfYH_eqVfp-6jvA@mail.gmail.com>
Subject: Re: [PATCH v5 1/7] phy: can-transceiver: rename temporary helper
 function to avoid conflict
To: Josua Mayer <josua@solid-run.com>
Cc: Marc Kleine-Budde <mkl@pengutronix.de>, Vincent Mailhol <mailhol@kernel.org>, 
	Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Peter Rosin <peda@axentia.se>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
	Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
	Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, 
	Janusz Krzysztofik <jmkrzyszt@gmail.com>, Vignesh R <vigneshr@ti.com>, 
	Andi Shyti <andi.shyti@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Yazan Shhady <yazan.shhady@solid-run.com>, Jon Nettleton <jon@solid-run.com>, 
	Mikhail Anikin <mikhail.anikin@solid-run.com>, linux-can@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-omap@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Josua,

On Sun, 18 Jan 2026 at 11:29, Josua Mayer <josua@solid-run.com> wrote:
> Rename the temporary devm_mux_state_get_optional function to avoid
> conflict with upcoming implementation in multiplexer subsystem.
>
> Acked-by: Vinod Koul <vkoul@kernel.org>
> Signed-off-by: Josua Mayer <josua@solid-run.com>

My
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
on v3 is still valid.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

