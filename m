Return-Path: <linux-renesas-soc+bounces-22703-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C9CCBBE16F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 06 Oct 2025 14:49:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 47E3A3AD99C
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 Oct 2025 12:49:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A14DC280308;
	Mon,  6 Oct 2025 12:49:43 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09F6078C9C
	for <linux-renesas-soc@vger.kernel.org>; Mon,  6 Oct 2025 12:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759754983; cv=none; b=cpVb1ZJH7COq3YUZtMlmH8Ryq564KRZ0wHnXWBZrFfR+IPm7+O2G6EOoVqAQqOJ8kvhZSpN4m+mE0sbdpYQYEVUgPWLSSkWp2PT9xZHMA9a3BTKNK85hK9pte+R4C6Zt/Pdx+fFURDJmoU57rlZ4E+J8j7Bi73/s/j6xQpK0Os0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759754983; c=relaxed/simple;
	bh=W/ngLzzEijzJIH8PvuzO5TM2e6lsyzUmai6PG+VNePA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DATmvJePcGPM4zE7HBXvVspUXJf0D9lFQpL8+kNvzArKrXK0t4KqTdSaZUB2y+j4kOAw2dFic3mfRvVxgaLVmdKAFgsp28v43QUTu99oCqSgM7MZsOVWe+BxVf3rlzmzIpTha2d0gpQKLqR9TtZLoyrzBL0xn0kr0iFgpWUXjnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-54a7bf06edfso3410661e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 06 Oct 2025 05:49:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759754981; x=1760359781;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OwPjpMz/0J4A8goGwBvaeTijAxI7KyJ1C6GbFZyEwbs=;
        b=O5+bHA2THLxLJ+ndLYbMcF6wufDjvH1TNyUj9K0kdfJCG0iAadlzr94sUZW9pJp7CY
         NPeKuQUBr5ORSbBBxZ9yXajAVRerOJ90hblT8kcuKSrpahSh40Sz3SU16gd6F3DEzLX9
         c0mTqc6mF4JUdeyO2pL4ZqV/jB4qWVpIiLT+wj0P1eeR/UA1PA+//WCYwKQxTiAESjxO
         327aGSPavDC0fw+KEy0115CJbw2cPjNHd3LsSwmdrDwHTLz/bugazD2sA4de0jJT4zwT
         X+61ryARKCoBZZ5aqXhTsawSChMf3pfbabyXAyTMjUHiL79Zstl7zL6gaXa9iouKIb6n
         cgMw==
X-Forwarded-Encrypted: i=1; AJvYcCVbErpgrWpNj3NUo0CJdFlY8DLIQQd/tccYU760UFye4y31KDYwzJJtU8fC3ii/1oDPVONNHkKd2mH9R8guKxwBZg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyyarGP01ce6NwMTGvOfoBMan3gUVgBqrhlr32dydQAIWl0GnuZ
	S3lWZrWtpLFqb4EAeERHtiAyrA8zzpcCFSnoFSf0ahvry5e4y+wfm6hThy+tF+UL
X-Gm-Gg: ASbGnctc3YGiX4JTTCvpT+RwDStARyakaal/C1FGAid4oal0kSjh/70FIPYEmul6CcO
	iNwnEy1cSZSuM1gPo+q97LkyYII2lWU7bH74AWcKNjn6BJf5Bc18fydZ8xOiwOCr8MSD3B/l/Am
	JhKUlXA8tFyI9xAF2U1J5s63riKZXqtcLribOQXYTmve+AGOOq9fwz1j36sk59psPynolZyR8/O
	JwP7/kvVRW48JO6wZr/LlZdBgtlppz5FRkenkicIXU8n08ugUoMnNfChgwLt3CC+ZHlgNyQpitK
	YJFcP7ixMukBX6iJAMDfMbHgP8uKKDA5JSA6s3ZIzL+5qAZxlzm4CU9ea1Xa16YQRgx+uAnu+Hu
	vSOxJFfVnS1j3jIgt+r4mpp4yVkAvZ9uPLqBdXbel27wBsvFsSWI6yOEb+MsLiamIvvsQ06JkJI
	QSZ9P5RIH1kfHFOvAc1UE=
X-Google-Smtp-Source: AGHT+IEmS4eXAIElsxCVCbcp5lHBfjcKIiUM99j97kmsaOOrtXlXbxG8ozNHdePY7PPKQfegSxObrA==
X-Received: by 2002:a05:6122:2190:b0:539:3bb5:e4d6 with SMTP id 71dfb90a1353d-5524e8669f3mr3742148e0c.1.1759754980905;
        Mon, 06 Oct 2025 05:49:40 -0700 (PDT)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com. [209.85.222.43])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5523ce69b52sm2948715e0c.12.2025.10.06.05.49.40
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Oct 2025 05:49:40 -0700 (PDT)
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-8d02f793882so2833855241.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 06 Oct 2025 05:49:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXWHBI9OjlGExIY7/35MZsdMPMSzrzjc9Jj7geMLglKmmxs3r5pwA3sv+ngiku0jdfWKVzSOsA3v8N/d+DoGjCjyQ==@vger.kernel.org
X-Received: by 2002:a05:6102:1620:b0:520:c4ea:4bcd with SMTP id
 ada2fe7eead31-5d41d055f58mr4323006137.9.1759754980548; Mon, 06 Oct 2025
 05:49:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251002161728.186024-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20251002161728.186024-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20251002161728.186024-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 6 Oct 2025 14:49:29 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUugFOOvHqjRyoPErh6rqpVuAS_Yr6mGqerKT0VQ-Y6KQ@mail.gmail.com>
X-Gm-Features: AS18NWBb9B-DekEKpQfUFSovMcE6-nb-Pn4OxZ0U_p0Jp7pux_ucj5r-aIzp9-s
Message-ID: <CAMuHMdUugFOOvHqjRyoPErh6rqpVuAS_Yr6mGqerKT0VQ-Y6KQ@mail.gmail.com>
Subject: Re: [PATCH v9 6/6] drm: renesas: rz-du: mipi_dsi: Add support for
 RZ/V2H(P) SoC
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, Magnus Damm <magnus.damm@gmail.com>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Prabhakar,

On Thu, 2 Oct 2025 at 18:17, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add MIPI DSI support for the Renesas RZ/V2H(P) SoC. Compared to the
> RZ/G2L family, the RZ/V2H(P) requires dedicated D-PHY PLL programming,
> different clock configuration, and additional timing parameter handling.
> The driver introduces lookup tables and helpers for D-PHY timings
> (TCLK*, THS*, TLPX, and ULPS exit) as specified in the RZ/V2H(P) hardware
> manual. ULPS exit timing depends on the LPCLK rate and is now handled
> explicitly.
>
> The implementation also adds support for 16 bpp RGB format, updates the
> clock setup path to use the RZ/V2H PLL divider limits, and provides new
> .dphy_init, .dphy_conf_clks, and .dphy_startup_late_init callbacks to
> match the RZ/V2H sequence.
>
> With these changes, the RZ/V2H(P) can operate the MIPI DSI interface in
> compliance with its hardware specification while retaining support for
> existing RZ/G2L platforms.
>
> Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> ---
> v8->v9:
> - Updated Kconfig to select CLK_RZV2H
> - Updated to use renesas.h
> - Added reviewed-by tag from Tomi

Thanks for the update!

> --- a/drivers/gpu/drm/renesas/rz-du/Kconfig
> +++ b/drivers/gpu/drm/renesas/rz-du/Kconfig
> @@ -19,6 +19,7 @@ config DRM_RZG2L_USE_MIPI_DSI
>         depends on DRM_BRIDGE && OF
>         depends on DRM_RZG2L_DU || COMPILE_TEST
>         default DRM_RZG2L_DU
> +       select CLK_RZV2H

As the kernel test robot has already told you, this is not a good idea.
RZ/V2H support is optional, just rely on (dummy) rzv2h_get_pll_*()
helpers returning false if CLK_RZV2H is not enabled.

>         help
>           Enable support for the RZ/G2L Display Unit embedded MIPI DSI encoders.
>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

