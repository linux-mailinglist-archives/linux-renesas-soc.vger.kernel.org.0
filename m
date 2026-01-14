Return-Path: <linux-renesas-soc+bounces-26723-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 30201D1E343
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 Jan 2026 11:47:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 729C130708E0
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 Jan 2026 10:43:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81A24163;
	Wed, 14 Jan 2026 10:42:32 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2431238E11C
	for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Jan 2026 10:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768387352; cv=none; b=XPmJvMYHn0F9DupdrYOPpmWKdcd568f3O58LzEaJRqTsyQ3+6xo0WtCLUqwb3tFU3d9Gc1zyVEY4gzWbF53L3sEHP1IgsWLaJcZ4VxJ8WbdVYoHnie/koELPr6Go0Y2yNIfwZB+F8k977RPiC/jpZsAZ/RJPbzmonAJTa4GpkQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768387352; c=relaxed/simple;
	bh=E0LywgZ6Y5OBOHF1U8Vz1IKUxUwFm8uKutML5xWZ8GI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jPASauu9UE/Hsr2xAf4viGfZw3Zom9F/czQvYwtSaryxYnLVLQffjQ6ZfXTTxxHKBhRLJah98HR6USYldKIiW8GLJ1u+WvtSvfkJYlfffxsXdVK1E9t+8erIF9InCT96f3GUbzBWdbR8DkOFC5to+EeSg2QMgs/M3b1iThpnP/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-5eef115c781so2516655137.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Jan 2026 02:42:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768387350; x=1768992150;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H1Uaum6XUOb9s+vI8xOa+5r0BhzYwNGBohqUTsxTR+M=;
        b=A5GE5Z068ZAemkrA+Mw695TMun5UBZhnufZIWFFUGamFAqEKhXapEAhXnoPk0cw/k7
         bgBMLv+N0t5juj7wPzBl73Mx4v5JGZoJhGtbd4PxYblAvrbjSdIW026lyhsPiJgnFATP
         dGgZ95drfDg7BL99h3fax2AAenz9eZfGPFtBtOjYwt+4XkwuEy4EUO1sMCxJyligPRfR
         fse2mUT0jQD9nTSJ+qRCOGKPHITFY5NBEYPx37BjfkkBVLPXmWVozuIjI6v0EIFHGCi3
         H5iGCv0EXIlFX/zGRgQe53Xskop8IYrt0HrhAVZYggRJVtubIBF6lNZDXJVWZUjvxdSA
         WPIQ==
X-Forwarded-Encrypted: i=1; AJvYcCWa4Yt/bohP/f9srsfxHOyhYlxp7JlbMV/Trn38clHnZ2X6ff9UvhXJ2g67UuXmnf6IGFSzYjgNGQ9fRB6leehHng==@vger.kernel.org
X-Gm-Message-State: AOJu0YwXO8lb+kxFmmYNwEAEte8XDobtRxWl8JfXc1B4zU+V+Wkm6urZ
	yFeJS65S7A8AYWk/C7dRge1dPSWietvAXCpnDyopJ2w1l4uupwEEwiQ+B1VnmFFi
X-Gm-Gg: AY/fxX7GJ4mzVPfnyjfAkf/irg1gWznryIIqg04W1mHe5kklaFulq2QJXC8YP6rCp5l
	4q2ufxr/fVzQRSuEsMi7wvflscw2SjALc+mV/Q9Nf7fcsdlLHqch1oGjTv2bHJ9cy/6y8p31jeH
	PhdGSO2wLwzOelU++z0Dj/85MsQQuFn3P7SjrBkWWHwldrBX1NMManUXJWdYjj6eJrf++vKUIv3
	sa9rLmnXCxLgOmEqIog9aU1yj36EcbHh4VtC6J5KrpAp52rSGzdfDyD5L6sL8qKLG8G1NSnUSMq
	54BPFNpYDptX0u+ScIj5xSLS4KVDms0Rr9lUcsm50g7StZ9Nl5Z6KGrGiH2Yt7LHMRZii2at45u
	2QxHT07dQ0TgquqSOHvnpoa8fNYM30ryBlDR8YgG7kYwaqK1zOUKpXJa/6ZXX+NkxpyZtz43IHF
	EXeZ5+B5+KG2XiOh5uDhCRwF47oycjposGgDHJ++pNbLOjdeTezS1C2RCFfyI1sEk=
X-Received: by 2002:a05:6102:2ad5:b0:5dd:89c1:eb77 with SMTP id ada2fe7eead31-5f17f61dc64mr743795137.29.1768387349964;
        Wed, 14 Jan 2026 02:42:29 -0800 (PST)
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com. [209.85.221.178])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5ed082abc75sm22061872137.1.2026.01.14.02.42.29
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jan 2026 02:42:29 -0800 (PST)
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-5636274b362so1673105e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Jan 2026 02:42:29 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUMVbHnfn4xK1tdiF7xuvQ0e5rVn59M3lupqQrMnKJG7P4HkYIzZQHlFNzo8RlitSuL4VmEowEqQoLG7KKkldcB7A==@vger.kernel.org
X-Received: by 2002:a05:6122:628b:b0:559:58a5:f6cc with SMTP id
 71dfb90a1353d-563a093a463mr686310e0c.4.1768387348943; Wed, 14 Jan 2026
 02:42:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260114093938.1089936-1-herve.codina@bootlin.com> <20260114093938.1089936-9-herve.codina@bootlin.com>
In-Reply-To: <20260114093938.1089936-9-herve.codina@bootlin.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 14 Jan 2026 11:42:18 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUPJrqem_pKkQKU7qjkA6-6OEYW0Av3EvDr5hAO1U5ZQw@mail.gmail.com>
X-Gm-Features: AZwV_QhQn91-1OqqAw-EDfsNXlhnKQ09Nmhqb35fWgFytnsII83O23rtSSh3XAo
Message-ID: <CAMuHMdUPJrqem_pKkQKU7qjkA6-6OEYW0Av3EvDr5hAO1U5ZQw@mail.gmail.com>
Subject: Re: [PATCH v8 8/8] ARM: dts: r9a06g032: Add support for GPIO interrupts
To: "Herve Codina (Schneider Electric)" <herve.codina@bootlin.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Saravana Kannan <saravanak@kernel.org>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Pascal Eberhard <pascal.eberhard@se.com>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 14 Jan 2026 at 10:41, Herve Codina (Schneider Electric)
<herve.codina@bootlin.com> wrote:
> In the RZ/N1 SoC, the GPIO interrupts are multiplexed using the GPIO
> Interrupt Multiplexer.
>
> Add the multiplexer node and connect GPIO interrupt lines to the
> multiplexer.
>
> The interrupt-map available in the multiplexer node has to be updated in
> dts files depending on the GPIO usage. Indeed, the usage of an interrupt
> for a GPIO is board dependent.
>
> Up to 8 GPIOs can be used as an interrupt line (one per multiplexer
> output interrupt).
>
> Signed-off-by: Herve Codina (Schneider Electric) <herve.codina@bootlin.com>
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.20.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

