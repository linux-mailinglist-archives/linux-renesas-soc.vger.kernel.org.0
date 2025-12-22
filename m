Return-Path: <linux-renesas-soc+bounces-25977-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F2959CD5B85
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Dec 2025 12:05:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F12C23006468
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Dec 2025 11:05:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D6372745E;
	Mon, 22 Dec 2025 11:05:57 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9DB61FC0EA
	for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Dec 2025 11:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766401557; cv=none; b=iGynYbdTYKXJvs3eXkDJOO5TCllfkvi4CNiyOOzBULpqiHHnFNeqc153LIqTa9qRSOF+/wr44pQjoIp8wrUsPybkIy2a2NRQNTYExU61xte9BkXrxA7OfyoaD/N4HE9HXQwQVDTWtIAL7pfujBMGy+XpmD6u089O8+2WL2kXc8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766401557; c=relaxed/simple;
	bh=Sa6vRFp+J8CzdQeFDX4yWNCdRt01fLLpAObxTP7lVIs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mBMaGz/fYCYIAjueHKJoHEb6y/rH+8u/3dImCx1od664WcD5EVHZW+tIuPOsE3nnwXccbyOwWREPmf7B/Ej9SdqobmpXwmvLM2PXFyYTy6yA1Hh1ZMlvv4oBqWAVLnU0nlLKfPVxyZnBUsetItl+DKczP92k9eOHYTMTL62vo+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.161.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-65d0441b6feso2206083eaf.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Dec 2025 03:05:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766401555; x=1767006355;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Er9fT5sSTO9v6Ol7FhPUI+D4OHHff+0Re947MEjlztA=;
        b=UpwqL1tZHhft9Q8S1BypoYaA1HtjW2M/YGJ0EIBA0qEYavr11rLZ9Cf/G+orENEWIq
         IGmtjrpsyfZA112PSrkuE6O4n76jcQU+sEW0ORCz6+W9GSV+/HwEP4PaPqlwaNAzjrN6
         pg5SHOOcYq/3I7y/zGiX5st94pXVjhvifOhP/4pAZkid+vQj1qlO4Hc0XCn+bEsnRARK
         eLxqlvYhf2dtI6zpL9cDZRUwu72680cuiA9JZm6LjUmEPvb1y2EtikZ2juGIfomEsHth
         F2EvKxeNPcBxMjbuNaIxO0qgqr5PgK3FaFqymyND/cYmkW2c/LkM3gYbWii6UNn8xN0G
         5PZQ==
X-Forwarded-Encrypted: i=1; AJvYcCWA3RMCS/Rbp4k9jQgRR/aLwfo21gFza/8SA1GI3bRAzf4/bxk140PwMlJScT7EOk3oeqvTAWlDIz7aneYXzydgRg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxgXHUp4Tj0IDAZQqxxELzsubIWxXzfSkbM3Sq619ftPh4wIy9/
	gVNx9MisW/tqNW71LGH8wGXOZghewxHrOvdLpwhpQRBimbdIphBtD24o168xUIE7
X-Gm-Gg: AY/fxX7yrUjep4CfcYyGvQ1Jh8SDmB9LTL12CGX4x31vlJ8WjfHT5kzYnEXV+TiqtyH
	FQGksfYYhTZg5QEIy0TkHZZHkWMEzH26si7/A2WnJwlyrJYgbXLmo24jXz8mQ27jyvlRMR+ycx+
	jLarGAPhL6kHqpco896GCzvzrZENJt45/eWsaj52pDFJ0acgfcjUEvZd1g7WHnhryrogP43JQfr
	2ccTDJt0m8gfKA+dnbaV5T/zfWH2SzXI5lpFBEcPT2HoXm28iIx/yhreHMDkpm0rEbUSsr3/9MD
	xQtRRGlmEbcvPTEVUpfdFxXCF15gxwhYu/t3dJ0fuNZH2+z7HJjgMOKYj2gyKVvuKnC89NuyGiv
	+maiGUDeE+UELrvZU5nYBinoPTovsMytSVD25xBsn5ljySabCrGfw6f7xq0paRMJQhI7vt1cBoF
	FZrrtmusaDcr/ecHPdxFzs/MrWVNwFUtp7hwrBKZavuDls1qmk322mRoHhPkE=
X-Google-Smtp-Source: AGHT+IEzqJp+S3gyDDNHi+2alQwRKzvCzi7B10BD/3BKUbenKYAycOIHlxdSSmOuGEe2LDmPRkwlTg==
X-Received: by 2002:a05:6820:4181:b0:65b:f0da:31d2 with SMTP id 006d021491bc7-65d0e9fa600mr4374852eaf.37.1766401554681;
        Mon, 22 Dec 2025 03:05:54 -0800 (PST)
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com. [209.85.160.46])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-65d0f6f0e78sm6527356eaf.15.2025.12.22.03.05.53
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Dec 2025 03:05:54 -0800 (PST)
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-3e0f19a38d0so2748868fac.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Dec 2025 03:05:53 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWeN5xlB2KlEwIpxYp8vtTtYuQB3XXG6HvOsSKmQ2L/Nklv6jXik/rFqLWs2TYwX2UF7IvRj6rUCLh3M4gsr4kbgw==@vger.kernel.org
X-Received: by 2002:a05:6102:e0e:b0:5e5:5ed7:60ae with SMTP id
 ada2fe7eead31-5eb1a817635mr3544923137.31.1766401227460; Mon, 22 Dec 2025
 03:00:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251210-rz-sdio-mux-v3-0-ca628db56d60@solid-run.com> <20251210-rz-sdio-mux-v3-3-ca628db56d60@solid-run.com>
In-Reply-To: <20251210-rz-sdio-mux-v3-3-ca628db56d60@solid-run.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 22 Dec 2025 12:00:16 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXmKPe6AyfAeD9nObqVhofZ4a5559_=DbDZzJ57A7=k9g@mail.gmail.com>
X-Gm-Features: AQt7F2qYMU-2Y0vKWd5gUo3SltdOK-02OVX3vIl9B9fuc7xPsFnO8gx3yQGyGmE
Message-ID: <CAMuHMdXmKPe6AyfAeD9nObqVhofZ4a5559_=DbDZzJ57A7=k9g@mail.gmail.com>
Subject: Re: [PATCH v3 3/6] phy: can-transceiver: drop temporary helper
 getting optional mux-state
To: Josua Mayer <josua@solid-run.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Marc Kleine-Budde <mkl@pengutronix.de>, Vincent Mailhol <mailhol@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Peter Rosin <peda@axentia.se>, 
	Aaro Koskinen <aaro.koskinen@iki.fi>, Andreas Kemnade <andreas@kemnade.info>, 
	Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>, 
	Tony Lindgren <tony@atomide.com>, Vignesh R <vigneshr@ti.com>, 
	Janusz Krzysztofik <jmkrzyszt@gmail.com>, Andi Shyti <andi.shyti@kernel.org>, 
	Mikhail Anikin <mikhail.anikin@solid-run.com>, Yazan Shhady <yazan.shhady@solid-run.com>, 
	Jon Nettleton <jon@solid-run.com>, linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-can@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-omap@vger.kernel.org, linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 10 Dec 2025 at 18:39, Josua Mayer <josua@solid-run.com> wrote:
> Multiplexer subsystem has now added helpers for getting managed optional
> mux-state.
>
> Switch to the new devm_mux_state_get_optional helper.
>
> This change is only compile-tested.
>
> Signed-off-by: Josua Mayer <josua@solid-run.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

