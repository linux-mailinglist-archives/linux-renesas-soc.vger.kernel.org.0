Return-Path: <linux-renesas-soc+bounces-26432-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BA34D04186
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 08 Jan 2026 16:58:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 907F93105F8B
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  8 Jan 2026 15:39:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A033F34888C;
	Thu,  8 Jan 2026 15:18:13 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 082883033F0
	for <linux-renesas-soc@vger.kernel.org>; Thu,  8 Jan 2026 15:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767885493; cv=none; b=ZZFefCOtDfTYwbZNezOb8bSC8uU0HifKnM5rHO/8pfd0fYPgKCLLjVIVt5h/ibcHPvvJk8h2srDfrXhCtp1ObDf3J0cfvx+MCz52G9tgZdF9hrBqFtPwFocQ12WnxHCmzZ/h1moqa+0jyV0Hx5kFS6EEZOUJhy088Uv/ssCEQNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767885493; c=relaxed/simple;
	bh=VOCoSE33VyqEDpE4ACcKTOqSkK66W3Ph4z6ZWtitcKc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uhclKC+uzZvWKETH5CO0i3F9fYYSAZ8mlEGPssDtymP0ZckLZcBdZdZw5VgsTWk7uuSs7GKz1E+8iIx2gy1EBFi8pAIL77ACir+skpwKs7neML0QY/7ghJSAt7y0NXqTx3nA2yGGJr9CH4jTL3eVUQB5VZqIEUu0ZqEGClhxfjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-941063da73eso2257783241.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 08 Jan 2026 07:18:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767885487; x=1768490287;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K19XWsL2sU1kQtxYfF0RYQ4zBuQAgGCyhs+nui2BEig=;
        b=Q0FRgpZXquaB7Yg00dUvuQ/K7n10lQIH6RKdCctX6Kz1B9o13fF0v0uYe1eUAV+kwt
         4/xUBUh+40RD7xvHPcVjmuKeQ1fj43+uie4vP2vvu+UJuAeZaS5Fc8yBfnsK9EgSDR4n
         UCNZVyGIxGH7Dfva2ACNBp52x6RGuDLL/1J504JcikmaSQ3ewAb0LhQHFCqcfPLLMGh2
         Q/PH76EGKrV1nCswi7pmjYVwnZrZm17/zm0vPJBTioCPQg9vRBWmdhANByWS5YN0TMY0
         Au3Tt+vaUJddOy3MIt3seZUwAse+9MG4xQ15yYMToV2noRfWa+gwGBwYfg6bYDJhAapO
         comw==
X-Forwarded-Encrypted: i=1; AJvYcCXWoD7profa//w+4VKoRmBTZPqpF9duyin6q2XKNeus/OE9+tI7je2f4gOCoBU+9+dH+A6XCtB6nZ8i+ghDvYYaBg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxsgVo15CBmH1DjY8urPO5uxffquDr2pENb9VSey7bhBLzZicyW
	PclNoKqEJElRZO7c30oUJXzEjV+9ww5tr8vkJjIaFfQAtYteflse7ZiyOXEn86Km
X-Gm-Gg: AY/fxX5KkKVpqu/QNTSl7xvD2mh/wGoAaRJoeFW4RAyOjXI2FkOaLtRk/rMF8zrKezO
	F1YQ36masFcoy7pYW3BtAL9kC3V0bM0a3KBWU7AlP8sTaB+riU61CJ3TYJUNS+XhT2+OXWiOYfY
	4vH3OPeTH8gXJguf57WvKtg0fywX9KRwCqasZIRTM1q4YKJHKbWs98QV3BTT48BEybyJS27T/o3
	H2yeUpaEFnFXhrtaql5kl0931fOSwjgSv9WdDjBLeL1lGtzmRH4qNsPragvoX+F5PCgzW+Jctc6
	KPchFb7nAWWnTOEC4bKHLSjzlkFgAx186Y4dNkAtBheb1nMOn0Q359HOonQKSKv4cAKUryp1f6e
	kJ35YNunJjqdmIqDyggt99PfE++11j6xbdzbeswGZAoHBdL8XTIHEKwEzeed7J+5BV7YEwwndbu
	96TziD6v0PxgctL3mqbQv6oyLA5J6PCf71fMV9FLJonBmT0SlL
X-Google-Smtp-Source: AGHT+IFgLGrjHUMrFfpexf1x3R6bnNymUaBJHfWooStQWx4B1CpjXg8Gr1SQZS7xF0ct+m1tIueMgA==
X-Received: by 2002:a05:6102:cc8:b0:5b2:d28a:8937 with SMTP id ada2fe7eead31-5ecb1ea86f5mr2571203137.12.1767885487354;
        Thu, 08 Jan 2026 07:18:07 -0800 (PST)
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com. [209.85.217.46])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5ec772e322asm6711729137.13.2026.01.08.07.18.05
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jan 2026 07:18:06 -0800 (PST)
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-5eea6f90d7fso151214137.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 08 Jan 2026 07:18:05 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVq0U8RuSWIj1Wq6m0Zk5lebBVMxrDjIA6Mh49Z95JYG2yDrvfb81/3ini02+Fnki2FwaF2VN2RxBjrjDoCZNnxRA==@vger.kernel.org
X-Received: by 2002:a05:6102:441c:b0:5df:af0f:308c with SMTP id
 ada2fe7eead31-5ecb692dc87mr2494543137.38.1767885484850; Thu, 08 Jan 2026
 07:18:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251126130356.2768625-1-cosmin-gabriel.tanislav.xa@renesas.com> <20251126130356.2768625-2-cosmin-gabriel.tanislav.xa@renesas.com>
In-Reply-To: <20251126130356.2768625-2-cosmin-gabriel.tanislav.xa@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 8 Jan 2026 16:17:53 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV9jwRL4=hAKgakymVY1fyUHG5ALg3Dd19aKeCNTC+ZtQ@mail.gmail.com>
X-Gm-Features: AQt7F2rGh841rSfsaYiGZnB2YxsDi_NtDLARw02BQ55fscjhbxfqeMGfvtv6Y0A
Message-ID: <CAMuHMdV9jwRL4=hAKgakymVY1fyUHG5ALg3Dd19aKeCNTC+ZtQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/9] thermal: renesas: rzg3e: make reset optional
To: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: John Madieu <john.madieu.xa@bp.renesas.com>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
	Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 26 Nov 2025 at 14:04, Cosmin Tanislav
<cosmin-gabriel.tanislav.xa@renesas.com> wrote:
> The Renesas RZ/T2H (R9A09G077) and RZ/N2H (R9A09G087) SoCs do not have a
> reset line.
>
> Prepare for them by making it optional.
>
> Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

