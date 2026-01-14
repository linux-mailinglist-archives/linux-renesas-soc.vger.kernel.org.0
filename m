Return-Path: <linux-renesas-soc+bounces-26750-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 22823D1FB10
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 Jan 2026 16:20:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 45F133012948
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 Jan 2026 15:17:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EC1F225397;
	Wed, 14 Jan 2026 15:17:23 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f68.google.com (mail-vs1-f68.google.com [209.85.217.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A4DD31D36A
	for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Jan 2026 15:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768403843; cv=none; b=rCJEA3vqj6CDoZOu59USR9rAH4O7ts5gjdOnTjCl+3vfx9es126/JoPuQCy2VTpJDEHhRERKjF16nfITTnj46fG5dI7XuLXgSzPrnPupWFruApbBATvMJyoQ1vhiLlvgLGX4kFSNkw9PNFmDdtKD+H/Dh8H/z1N4D341WzOI+bE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768403843; c=relaxed/simple;
	bh=INLiR/9sKC5Ezv7y9MjS952KSFl9npMrRQs9Q37l+jo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WVwKcvMxXV9c1rt6Y1KqDRqeX+GuTq0NlCzJXo/LLfPdo0eBUrR4OZp4XTiIEyoroEFQF9V8a1CeSoZ5lZOVoOc0HMHGtQTBbX7zWrpzfRBKh76p9lT1F2tmSIzABUvJQT/OjbuHsi8MT0dE+Q7mJwsH4VSBPHAiMj5x+9fo+yY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f68.google.com with SMTP id ada2fe7eead31-5eea9f9c29bso4293203137.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Jan 2026 07:17:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768403835; x=1769008635;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fL62Bf3LdEer05zL+X5t7sIPwEJerT2IEVhS6PXvpSg=;
        b=KfqlOg+Oia/ZwHKnv5WgHnDC5Nn+OlIqAEH7cyEGRxYur5fO3SCulSbloMvDFTjw/k
         vvk2FP+jepVyjmJyncfzVAdE62YI3F6q5HJV1xhCmz9O9TaSlqQ0dXmM7qrE72ZKdKIB
         13cxKA/a0uwzHGoIyPjSJIWVl+BmF4+2TaqfReOzf0QqemJLNJZh0FsD0uePhqU7Q6b+
         vg+Pbla6W7X5rIRl7ZfUHqIp47g6Fk2eS9vsCMC6Ibsgeza5g+n7qOZ43AnbZ6A0Ljee
         l20lrpm5isb+WnyOSL4LDbm9zZ5Cp6Y6FbCP5sSj+wGayOM4sm/L/JY/2jE98tNjbgVR
         xw9g==
X-Forwarded-Encrypted: i=1; AJvYcCV+Ea6E5iQzkjmrmNBAYKwBh4l2RcutlDlfe8q4Yaw4PUwlpR+IjjKUGHRPpBJYfy/BuHPE9ANvwgfxb850E8LPJA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzx8jHeT0eusqg/ERk4a9VYP4W3xFSIKttrv6fy96yWgusSo8RI
	24lZZit8Xpzg8dsmPrMr99CgS4u1JEdStEzRuH9dTvp4d+naq5p9/yJgQE1yLQEfBtE=
X-Gm-Gg: AY/fxX5F9WZyKqC6wjhd6sMQhVHWJZDUtRUkZmog+kpPaqZEy7/AOtfbRBv+v6/BjqO
	tzrIVDOBGi3Supj0EUfjteDqtewOs+a9cilIdm94NwhafxsEj0iwPq5A5n9ZssZrgF9v0b9rLym
	Z0dCrmQZKgZBxp2qnZnSPo2cOOfSAUQEx25XGuXnBbM5KtNLpp1WOtxERccDky/48KRV8yq3z2o
	dVAyjJEzZ7D8sVTbypafxwtdrP16MkX2Z9juAjzUNC0E7cnH2u6M/+5ihosc8/mTpZ1mPlpxROc
	Qq9trGOHuxNlvCQfDrZoxRoBemQZko2rZfBvURvPdRHrIcB7pg6FogaJ/W0tknqB1KNomE2yWcY
	Z9Xxw7/MKJZEPuUtApcUt/Ud07nFf/E8WIge/zuFGlsYMYOZB5gdTEIf4fm0l0kqLLtWUfpY0DW
	cn//x4GvGIvscHXKqhXkdcvrNjuQxVsCTiaXoroiZ6tj8mHWcI
X-Received: by 2002:a67:e708:0:b0:5ee:a0e6:a9f4 with SMTP id ada2fe7eead31-5f17f484fa3mr1576847137.12.1768403835251;
        Wed, 14 Jan 2026 07:17:15 -0800 (PST)
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com. [209.85.217.43])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5ee9d013b3csm19342058137.5.2026.01.14.07.17.15
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jan 2026 07:17:15 -0800 (PST)
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-5ec87b1f525so3660209137.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Jan 2026 07:17:15 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVYsqXZ3DfG02Mg4F8tTDmdADQ6fYYZC+YQfdH8tOi0tf6xqhQf099cIPDbwWGbzev8e1C3MvGYgvJBdC8qr78zZw==@vger.kernel.org
X-Received: by 2002:a05:6122:3113:b0:55a:ba0d:d84d with SMTP id
 71dfb90a1353d-563a093abc8mr1234630e0c.7.1768403465377; Wed, 14 Jan 2026
 07:11:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1764165783.git.tommaso.merciai.xr@bp.renesas.com> <2483415f35dabe42ba3c35a0c50a3e9b28dd724a.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <2483415f35dabe42ba3c35a0c50a3e9b28dd724a.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 14 Jan 2026 16:10:54 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVrr11wufh569kSyCo72bEknos7UiuyxadThRQmt2_5rQ@mail.gmail.com>
X-Gm-Features: AZwV_QhVNfKomHEkvFsmWk2qp5dVEkSvsae2sIrEVsngj9ZQvyn6LkRdKtdcLBk
Message-ID: <CAMuHMdVrr11wufh569kSyCo72bEknos7UiuyxadThRQmt2_5rQ@mail.gmail.com>
Subject: Re: [PATCH 15/22] media: dt-bindings: media: renesas,vsp1: Document RZ/G3E
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

On Wed, 26 Nov 2025 at 15:10, Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
> The VSPD block on the RZ/G3E SoC is identical to the one found on the
> RZ/G2L SoC.
>
> No driver changes are required, as `renesas,r9a07g044-vsp2` will be used
> as a fallback compatible string on the RZ/G3E SoC.
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

