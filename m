Return-Path: <linux-renesas-soc+bounces-26553-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id A6F77D0BE0B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 09 Jan 2026 19:39:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 115C83019BDE
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 Jan 2026 18:39:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7E7A29AAF3;
	Fri,  9 Jan 2026 18:39:35 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FF0B290D81
	for <linux-renesas-soc@vger.kernel.org>; Fri,  9 Jan 2026 18:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767983975; cv=none; b=pHUPzcByViO5JbGaY5s7YxJEB4P67VrJTI+fM6uaoBYo/F+JyVr56sohI0/aZ/Ff4kmcLL2nR5kzRuwwYMV9XTU1ScCis6tOt54juI6s3mDUlRLGhrEJ0AbyfSr7R0JlpfQcb47OyT6mzanyEKyeci7CL9hdSrc2sROQ+B+Dzd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767983975; c=relaxed/simple;
	bh=y1gtTxi2yb3k6kp7O25uyIdCMmBuVjPt0jggABGGS+M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Eu8g/DN/txaErn/F1U1Am9MoYIL7BdNPPXZq9ax89lKXllkApeXhFlPvArmJ+yIRF7JpgQUJpIBDyq3apy/9PdKpXiuCe3CHtD0SDnz2gGJDHq3v+wV0MGBVXIQhV4n3/X8eCRZuyv7wa3weVZ+Pw3jyvP2346LMGjxoZYV8bCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-563610de035so1188157e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 09 Jan 2026 10:39:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767983973; x=1768588773;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DI2vaQ4j4Y7F+Kqlo0E9lSJxr88gYTxnhRjrPcAUZdM=;
        b=SP4t1oeR0jYOFWOuSsU1zi2B3J6UVt9dcwigXAGN5MN7qpYyAotJYst6f8FXrk2g/g
         cXgbvbKXQ0LCpKLOu55LuMU4455d2RCFisBdc5PdLaoPwajITRiqSETC9VVRx4DMB6pG
         p5MD4ffQxddHWPNB6miCIJYJ4Xf5e00uzmVBL7z8V6ly3zk/3vWFGu8tg0cBHR5IIrOT
         rpBaR9x0fNZSJuh8NcWKzrIzqaIs/OzMN7EJR1GdEHGVWIR4jpeLLCfF3k90lsHWTxCp
         uKornX7we7K9hXwLvjA2jUl4bKJp6HkggofaUh+22sPfflJ/BlPQaEukt+IJT95bM/A/
         Yopg==
X-Forwarded-Encrypted: i=1; AJvYcCUMXFPET40vPE+wSYqcGHTojmPez2ToNpFTP+BKfISYWIkVtfkAATw6cpYxaCaSdJvbADLHkxWWLhtB9EVKdm35VQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzTRrrQzoDfw3ztG6BnvFjb3Vu54X9BEN5sY+2+ZJ+QKqk7fiXL
	1y/MLYWiSwOOlS7tldgvqXMatvTbqy3O2duLJAf803fdUTfxYWGzLnP68Ml5rodk
X-Gm-Gg: AY/fxX7cK0Qk7mCau7Y40eRrzGP6pgLkPe38i9Cs22YpJMHnT4f7X7LIBceaEvvdNmj
	Vm5/vOVFTXS3oBEw7xO+KOJMZhHJvIbbJleB8J4cRUyJGZb+aTZMsn4UgRvAmvSSF/PRN82GM0N
	F8cfUH87qaEET7eLuX6o8681xYx797SW6UcAeW14zN2+tA9jwa78BfH1Sj4EnwyvdJ41YKJl/cd
	xMwpn5FVFbUdde1t1ke/T89E7C0w//L5ygaiBX+00yDbSSfyLKCjGJ9u5L2ZvyNF5Fvqgkli1Tw
	gBykKygrmpZnbfjPgEJSW5XYDsGocTmFlIBCAOgWHxTFOg02xMGrRK0ZY3riDIwqUg5pRE1CP/E
	eCZZOQ7jUjfJrCPKpMi42Yi8Ue4qjvfRuojIAJ9pArGV7F/8sAa1oC/s+BkynojU0Q0NudByzDT
	9Q6XKtb08TT3H6WP5thEr9oCzIHBd34DDVbwUzlcEi8KKuLmR9LnmI8PKJ3Lc=
X-Google-Smtp-Source: AGHT+IEjmZ98hRhGz9g25K4mnF3oewa/cepvWeF3Zxc9+CC4YBHuwwl66E7hKixdmzcGCwtrY1YPoQ==
X-Received: by 2002:a05:6122:4899:b0:55f:e6f5:4794 with SMTP id 71dfb90a1353d-56347d7ee69mr4007945e0c.6.1767983973269;
        Fri, 09 Jan 2026 10:39:33 -0800 (PST)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com. [209.85.222.54])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5634e959afbsm7882277e0c.1.2026.01.09.10.39.32
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Jan 2026 10:39:32 -0800 (PST)
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-9413e5ee53eso2766942241.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 09 Jan 2026 10:39:32 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXxmPz5KDIEadMGfsxLOQfjFb65BnGALiyQ2M8Mk2eoAenmRx4tagnPhPobvTRJatJIerMKeSqjCQfIGa2w/qLGLw==@vger.kernel.org
X-Received: by 2002:a05:6102:26cb:b0:5e5:5ed7:60ae with SMTP id
 ada2fe7eead31-5ecb6900d02mr4442716137.31.1767983970833; Fri, 09 Jan 2026
 10:39:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1764165783.git.tommaso.merciai.xr@bp.renesas.com> <679042b205b9596b79463b89c31d9e3f74cd0e63.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <679042b205b9596b79463b89c31d9e3f74cd0e63.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 9 Jan 2026 19:39:19 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUt=yQwGw3sgQ9gBhOEa6TWW59srEE69dyzr+Fq6j+=Yw@mail.gmail.com>
X-Gm-Features: AZwV_Qj05tdYznd7IbXD-D9LpPaUhjdHWee49H2zOy9lEKLzWfR8oEQJBva10AA
Message-ID: <CAMuHMdUt=yQwGw3sgQ9gBhOEa6TWW59srEE69dyzr+Fq6j+=Yw@mail.gmail.com>
Subject: Re: [PATCH 08/22] clk: renesas: r9a09g047: Add support for LCDC{0,1}
 clocks and resets
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
> Add LCDC{0,1} clocks and resets entries to the r9a09g047 CPG driver.
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

