Return-Path: <linux-renesas-soc+bounces-25975-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F2236CD5B3A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Dec 2025 12:02:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5B15A3064FCF
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Dec 2025 10:59:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05ECC314A94;
	Mon, 22 Dec 2025 10:59:59 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B0B630AACF
	for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Dec 2025 10:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766401198; cv=none; b=T5g5FhXvLO+3QeUrerXXaw3n3P2HWFvpS6NymfTqMN0g+NdEasp1zlCLOoUPG0E0j6DuFXVkjMgRPWWPqxQ7HqU5X4vHf3smaR46R9OmtIyg+CJZbxwf05sbxMukS5oud59XnCXKHqedMgDyUDRuWqHmTdZXlgoBdaRX942vnJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766401198; c=relaxed/simple;
	bh=hQz8inePYy4z7kE2ZTh8btcX7ZL/LHM5S3zx3idHlV0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZUON7Y3sWsrYr6rXSvHlH5+aqWROra/09zDnlO90qtzLu03UKEH+bXJvxCU5eZihyEgygThvlp23Lz68bEeLTH66FYWg0zwDyUREyCRW+QLKwURInlnvWSItIZhV3Czm79LZR9qT4qhSNsx9MZR9vVbj6g4LqYWZYPjtwrdSLSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-5dbde7f4341so3770241137.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Dec 2025 02:59:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766401196; x=1767005996;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iVlS5J1HzuVScBDeCBX0VxoypelfY5sXHRtDOTQInFQ=;
        b=KISBsskL0tfWfr33zY3VeOxxK7v4+YowM3f3Zv9xy3rwatKR0t8DguD7sHtq6zNHVd
         CrR0mE0dMKAFTHLemrkc2v2WniMnyoKlCYEzm5KUl41lhCwrn7dkcKoqoYJhOrAre3bb
         3vzBzFdhWMfxKWOh7tEuhy90RyK2b9sFO1SpT9pwq6gpgRhLfiN6TLD7dEWLwjmuAyER
         UzCm7h8mmGsEa1SSoxpLhXX9T3rQJKV/9nMl8iSNREfEKvdRFt3ATw4mYxRLoO/C8LzE
         6jVMEIBdosQKYLTdpd0ZkQYHqp30ahAjpHxtO+hLwfO6hJpnK0U5Zlle2LmrdgWGzTPv
         sueg==
X-Forwarded-Encrypted: i=1; AJvYcCXZVTz6s1QWYzDXr+KGBj2phURMMN9jlN2DlVe+7z3i19BHqEtwfXVYgryXLorkjpYzpWgGoCe/RdVlEm5oyJ3OUQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0q6ppvtYUFkEEfdBP7IpASsmy8WeafMrooQtANnCzDraMTHXd
	VtadpXKd9jhhhiVgGPvZEB9oXBHP0iACqkBBfGOdobLc69oJOcTyuCrg8B/nG8hZ
X-Gm-Gg: AY/fxX5LDQPKSOv3So5TYvwiZ55OyhscN0nvetTiznJumKCxlxeze7OeFqdsz2g59yT
	V24FArv45pP9jsPTVtEpJefKSDLcpAwVUfdiZMh/MZSKjcNoJBodHzU9AeZg1nEJzTUNeJXY8Q/
	2gHgfHc4By6RUac61GNRXGfS7haHF0KLvKEhtDrsnAsj1SBNzxuLe3isC4Age/sYU5yuZC6d+vL
	ZUHMFcWgUqgbMnWaHfBGHM6FJK6/E0dNnpFIoft7lrmtd5qPxfx8yWum1opNJC8crKMjCWfd4ES
	FA8SyrRgROzUh9Amcbu2IFO14v4CDYCj/9JOZQBJC5CIR5xt5F2Z7pzkn4jNYNNBPkBkgW8ZFzs
	2nzWIyhtKGAPMs4EvgLYk8xqSQcaIlZaJitnT0Bj6umVqK1NEKzldEmgk2Msmlm2oEUhoRErMfA
	EkfQdjfWazo4DjjDQIsElAtvlRwza/2froePHJOnu+fhsb+E2gGHbS
X-Google-Smtp-Source: AGHT+IFLquL7s2o+hvgV5atRiK0EqYFFoGAlyDz+NTMBsJU6cVhIYV26462y7aNdnyIG74JvFf6Tdg==
X-Received: by 2002:a05:6102:3a0d:b0:5db:e2f8:cf35 with SMTP id ada2fe7eead31-5eb0237d816mr5588298137.3.1766401196443;
        Mon, 22 Dec 2025 02:59:56 -0800 (PST)
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com. [209.85.221.177])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-943417972f5sm2845102241.14.2025.12.22.02.59.54
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Dec 2025 02:59:55 -0800 (PST)
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-55b4dafb425so3127824e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Dec 2025 02:59:54 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVcYeiKWJEeq9CTs64asfFOjDAt9OtyvF7egZhfCjjNPAiNIY25fcTY4fXQa70+WAjQ2j90yfiV7caWxZOxeJC/nA==@vger.kernel.org
X-Received: by 2002:a05:6122:6790:b0:559:7faf:a276 with SMTP id
 71dfb90a1353d-5614f7ae2d0mr3069797e0c.7.1766401194470; Mon, 22 Dec 2025
 02:59:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251210-rz-sdio-mux-v3-0-ca628db56d60@solid-run.com> <20251210-rz-sdio-mux-v3-1-ca628db56d60@solid-run.com>
In-Reply-To: <20251210-rz-sdio-mux-v3-1-ca628db56d60@solid-run.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 22 Dec 2025 11:59:43 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVqSPQ_rCY1mPxyAw1=WwK2VX9bxMKQQuVEe75u5hTvsg@mail.gmail.com>
X-Gm-Features: AQt7F2qvtAFJTZWBdh_71wFZZJPHL2v6ti7TTVpa1qQd7XzzszUS-LtvxMifYms
Message-ID: <CAMuHMdVqSPQ_rCY1mPxyAw1=WwK2VX9bxMKQQuVEe75u5hTvsg@mail.gmail.com>
Subject: Re: [PATCH v3 1/6] phy: can-transceiver: rename temporary helper
 function to avoid conflict
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
> Rename the temporary devm_mux_state_get_optional function to avoid
> conflict with upcoming implementation in multiplexer subsystem.
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

