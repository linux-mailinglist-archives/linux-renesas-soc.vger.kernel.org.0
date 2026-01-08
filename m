Return-Path: <linux-renesas-soc+bounces-26435-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id EB7D7D04222
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 08 Jan 2026 17:03:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id AE56D30AF0C0
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  8 Jan 2026 15:43:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B452F3451C6;
	Thu,  8 Jan 2026 15:30:07 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f67.google.com (mail-vs1-f67.google.com [209.85.217.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C5A3346E64
	for <linux-renesas-soc@vger.kernel.org>; Thu,  8 Jan 2026 15:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767886207; cv=none; b=WJbaUpZNxXSnGYOcnDCzCceAvbwoRkjRoRFUhT6bBAomHXnF5yC50P8iEWSQ4awBQcp23fa4adU5moE846VgklOKHkuzF3AHoP7K43wtE8W94D3JAjYipou4icI/VAdjF50OYG4u5pY5B25m5T2AGNE5vkw4wtxdGDvC7KKbRWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767886207; c=relaxed/simple;
	bh=H92scwhcHsTzYF+JJDH8TYSFfm64EL5HDb8BXyhP6pQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GIjNztGrDHky8JmDmfDdZCcqE0/Ab/ejpdxlmTK4m3evEZT82TVnyzDOy33oN4pu21Em+uowDutflBoQeIByMQdLb4aBJHqNkU/GjN0akjsr8hShEEwAe5rlp6+ruJPlvlyg9cJv7HQEKV6bOBmcB4wD0f3roxEo4IHpaUqVMgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f67.google.com with SMTP id ada2fe7eead31-5ed0a9cbb3fso1094563137.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 08 Jan 2026 07:30:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767886205; x=1768491005;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rovq4lx6YcS995FtLIZSuYUGfhyo5V2P5Hen4vNwCUQ=;
        b=PvDToqCuMe1YYTQJ0sX7eujrEe/tWrkqRqMcqRDxV6IDMlttM5AaSeJuSOy6WHtB5C
         zdcQ/u6cUMKnUinBqw+iB6g0pXbSNV4nxpxHpi4/hz8c6kqrlcbOoxKdfrhokaNjOxzI
         NAkSdVQoRA9x+9IPs5ZVT0m+lqEeGEgHbrZ4FoZjQEd7ad16nhjrvkcHq71vnUo/he32
         gQ9cp4PhTsym+9or3MKS6ftT3+nfe5DwedsJcExInQWDh1BzFY4yLC1zK3WUC7qx9L2Q
         /mu63JtZ38Wap8tAl1qP4cUvMWOf3ETE8/J4afRzoZxzyyWP/lu923TMqMiDUgtFBrVT
         9E6Q==
X-Forwarded-Encrypted: i=1; AJvYcCWtI9UQlX6hyLXZtTXGSSN6ZxcPgFIgAk6XxLctZP5l/AiUe3QFbb+0B16wI90HIQYWdDFkrE/LdCcfnzMho0f01A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8qfGq/tBmwVgd0XtPDqoSGmoIezn2ZDeNFMxkHLVQ9SOhhKti
	KVaNDxlwQ2UBymMZeZiFHNIxcGkslFuqVsSZ36jNXJVFs2E5vVKSmau0eVRYnG/tYCI=
X-Gm-Gg: AY/fxX6zdjBc4LKf7buB3BZPcLfZiMt4QS1oCiwml/gZbIU3NPMjCNJUM/lR8WVfWut
	klsS7buwimCb11KOWaxkgi/Pff46d/wVWmZ54FipWkygkTNKqf9IdguJdnhyAWH1f/Sl49EpZA0
	Od/zX9fJI/69VKulaBvVgNowL1n6WvaHM/FMGde6Rei44WOP9vdpljpKZNNOGzl+aVa9zb6874N
	zHDJXhPbW+Rfbwp9gWOpVuKXFWSSIrgoNQDgSYOqOBtwp0TrxZlBLkwnW2FmEP0lnS4WgsNV3qs
	JwJV58jZ39XOMasTmNgkiWpbyXkPj4Q3jvWaRwj2udH+piFYvZEzsnrH/rQBB+3jB71z5uAyCL3
	CKUJ7tRyJoPaQcKP94cxAbe3EyPKzUW8AFwojTULjC1EYnJLI6HkrR3mWuhSjjh3ptFV9ML7GrS
	Hbub1ak6zvoQLshk6SWDoqLFbJ52Spa431IyE6BXZ+hLd07ZBP
X-Google-Smtp-Source: AGHT+IEMveEa/EKCRPjyow8dlWpLo0fssukGGDbwygxBIaV962XSz3VGRwBCLmhoO+S8hPwh9oKLrg==
X-Received: by 2002:a67:e112:0:b0:5ee:a03c:8782 with SMTP id ada2fe7eead31-5eea03c97cfmr778464137.21.1767886204960;
        Thu, 08 Jan 2026 07:30:04 -0800 (PST)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com. [209.85.217.53])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5ec770644d5sm6554782137.8.2026.01.08.07.30.03
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jan 2026 07:30:03 -0800 (PST)
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-5dfa9e34adbso2334707137.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 08 Jan 2026 07:30:03 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWrPTjjH4vwIeP00XY0m+oPczrbo9RWLK5EvzqWS1B+TLNrLquy3wq3tvBfFNjQzkmPoin5yNW6SZIzl+LIYB6xwA==@vger.kernel.org
X-Received: by 2002:a05:6102:4412:b0:5db:f352:afbe with SMTP id
 ada2fe7eead31-5ecb5cbb3e6mr2954223137.6.1767886202897; Thu, 08 Jan 2026
 07:30:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251126130356.2768625-1-cosmin-gabriel.tanislav.xa@renesas.com> <20251126130356.2768625-5-cosmin-gabriel.tanislav.xa@renesas.com>
In-Reply-To: <20251126130356.2768625-5-cosmin-gabriel.tanislav.xa@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 8 Jan 2026 16:29:51 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWtq7Pgc5rcbqJFT3BcL-MvHyuVih+g1iASbCSTOOcq0g@mail.gmail.com>
X-Gm-Features: AQt7F2qqUb7XWItwy_vEzBypL3W9hCnaGdamO5-CeWaKe53eXmGweAS7Tn7G13I
Message-ID: <CAMuHMdWtq7Pgc5rcbqJFT3BcL-MvHyuVih+g1iASbCSTOOcq0g@mail.gmail.com>
Subject: Re: [PATCH v3 4/9] dt-bindings: thermal: r9a09g047-tsu: document
 RZ/T2H and RZ/N2H
To: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: John Madieu <john.madieu.xa@bp.renesas.com>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
	Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 26 Nov 2025 at 14:05, Cosmin Tanislav
<cosmin-gabriel.tanislav.xa@renesas.com> wrote:
> The Renesas RZ/T2H (R9A09G077) and RZ/N2H (R9A09G087) SoCs include a
> Temperature Sensor Unit (TSU). The device provides real-time temperature
> measurements for thermal management, utilizing a single dedicated
> channel for temperature sensing.
>
> Compared to the previously supported RZ/G3E, the RZ/T2H and RZ/N2H SoCs
> do not have a reset for the TSU peripheral, and the OTP data is exposed
> via ARM SMC, as opposed to a system register.
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

