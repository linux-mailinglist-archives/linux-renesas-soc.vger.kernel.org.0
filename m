Return-Path: <linux-renesas-soc+bounces-26552-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5983CD0BDDE
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 09 Jan 2026 19:38:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B1F34301E165
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 Jan 2026 18:38:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 895FF2777F3;
	Fri,  9 Jan 2026 18:38:08 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A0792773EE
	for <linux-renesas-soc@vger.kernel.org>; Fri,  9 Jan 2026 18:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767983888; cv=none; b=AwZkpOAbKuh8FhEjnQqSU1KadLLqzMwILzx4IwuEISeU/mYX09SSQ7KAbrQjocV2x8NOQokrh7CK7Y8477HQMEZyvHwxvoqRmaNKEUej2Rm4ZWOhSZIpU5ou3K3CSw4Dsbnb36IrH0dkgGFZfESwAzooIRsOOUTp1rnL6bAXV58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767983888; c=relaxed/simple;
	bh=xPYDi2PcZo5deiOcw0lB7iYzQ4VCFpOyH/0YueLqgmk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WPerf54npPwe253LRDbHnn70Ln4d8LLMjZEcE79SJ27cOpow6t9zANEjtcT1ouqgmnfG1id1g15qyJ4cavFnRDlQfL6z3tl5WtRygkWKaK5f44dwIX7yVmKmX4caHgjghL9RCQfhM2BJKWLK7RKsk2Ro1rlrtPwBiHhTDpwmrUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-5eea9f9c29bso1010908137.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 09 Jan 2026 10:38:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767983886; x=1768588686;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gRHLGasfyR69c6srR1G3LqlEAk+Zi7+IjINLOavqaCU=;
        b=t9zLqEyL3bnrU/+oUBRaNbycxgJNz9KtB0OJ2OqR6laIe6jzOsxjD5+3StCwsLj17V
         lRqVFMAD0kfQ/+4WXsBakCnvlV+UhoAp/Bm2xWgHd4YiNvJUeZLa7/5GJSesV8IWVPvr
         ZLhZX+SzdGCpxG0kXyzP1MZltPIOC5voxatPF9LAje3WKXknr12swYQ1c5bgmhjkQa/b
         naj6J2TZEs+JBzw4SRAWiE2AU8CQU1bMOnQCwecS5WQ6vp47F1H61BbuM2umZ9JPEiW2
         zyT4P9339mtlG7nghvJ2D0/pWnW0f1mGz8p2A/7M3PuvBnmdyBFHGeEeRSj9JqYGIiu0
         9OrA==
X-Forwarded-Encrypted: i=1; AJvYcCXaL6C9WuvxwIOKx1t9J5N40E9MJTuBBbqfeNyFvdUrN8abksapo1ulKommFjx8O6utgysTwvlYyZs3jY4WA1PoEA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxQ2J++a+UzNukvVJ5BAXQtlRV/KsKOnaLjG+M42y3N3xD+jFNU
	b8K97+vnZWIKaQWhxU9FBgyh3EJ7zlGHK+r9v2OMF2avomKTKZXA0+pvelbohkYd
X-Gm-Gg: AY/fxX5k8RNUKpihBVnLa5DjoTGJoJqnoMt7O+AmrzEJw4w0IWDO3bMEQaxCPzixobN
	6B84aUsNKn56lSOlIfcy0pV5wbHfLDDS0NnPMI/z4YP0m/vLixF5IVya06YTppBny38latCbXDG
	JafPPCTODm9JPq03qKrGVjk6wZzKHSwnqqdYkf48QpJrxyKJFqEcn96SDlfUuB6jGOBS90uqeGj
	qQvfMktcKtYGETekTpaevkpWgVKUPjPB7aDIFlKQzMwQ/9Bh0gW879MA7823DqvlKSJZNI9jWzV
	6rfCfWU+DvcKyl0mYO1buWFpsRc+5CZtP0l12D0q/di1+xZo2utRKeDc/OqNPspUmL/k8LTWZB+
	ipmMTSftV3U3oO6ps+7GDcB/vCjuyR9H8heIJiUtCMIzxObvy6d4LKQLp6akLfg1lfVmul3uduf
	/PneHjqJnU8uqv2d1Vw3AJZgVEptT5GxsaAK+K+g7Rkwook74ozzGu
X-Google-Smtp-Source: AGHT+IFgNQ9DLY8nd7EJUyDnUkPctB30y3RHbZHP9k5Py2zx/JNueV/l1fFw9oOYO/DH0rTg8IAgWQ==
X-Received: by 2002:a05:6102:5714:b0:5df:b2cd:12c9 with SMTP id ada2fe7eead31-5ecbb14239emr4282886137.40.1767983884728;
        Fri, 09 Jan 2026 10:38:04 -0800 (PST)
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com. [209.85.221.172])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5ee9d013b3csm5746008137.5.2026.01.09.10.38.03
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Jan 2026 10:38:04 -0800 (PST)
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-5634d866615so1777669e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 09 Jan 2026 10:38:03 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUu7XBrH7iAg+l1rnBs46m/eCTLmpkApqgYASx7uww1i4cxff6xe510hPkQ71y46c/Wz0Azv7ZEmNEqe0pNHCzuKA==@vger.kernel.org
X-Received: by 2002:a05:6122:459a:b0:563:6d01:a514 with SMTP id
 71dfb90a1353d-5636d01a684mr805296e0c.17.1767983883673; Fri, 09 Jan 2026
 10:38:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1764165783.git.tommaso.merciai.xr@bp.renesas.com> <f7130b18f20fe80f4187cf0b024dc10438f2820e.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <f7130b18f20fe80f4187cf0b024dc10438f2820e.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 9 Jan 2026 19:37:51 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW74u0a7eKN_xS9hc6Y0GycGbnwF7170KjV5oNi3QnY2Q@mail.gmail.com>
X-Gm-Features: AZwV_QjTECnB1PZN8BE8Sxq6bqzf7JgBJC7TEeRima6lECENgoL1jMbZT1RrYiI
Message-ID: <CAMuHMdW74u0a7eKN_xS9hc6Y0GycGbnwF7170KjV5oNi3QnY2Q@mail.gmail.com>
Subject: Re: [PATCH 05/22] clk: renesas: r9a09g047: Add CLK_PLLDSI{0,1}_CSDIV clocks
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org, 
	biju.das.jz@bp.renesas.com, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 26 Nov 2025 at 15:09, Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
> Add the CLK_PLLDSI0_CSDIV and CLK_PLLDSI1_CSDIV fixed-factor clocks to
> the r9a09g047 SoC clock driver.
>
> These clocks are required to enable DSI and RGB output support.
>
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

