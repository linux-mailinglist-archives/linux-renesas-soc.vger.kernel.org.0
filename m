Return-Path: <linux-renesas-soc+bounces-11020-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FA6B9E6F70
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Dec 2024 14:44:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A87021882CDF
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Dec 2024 13:43:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 066691FCF55;
	Fri,  6 Dec 2024 13:43:46 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2573779D2;
	Fri,  6 Dec 2024 13:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733492625; cv=none; b=BqEHzWiQawIflm8F2S+BvkN+OJrpXIV93tRxebkg8PeGs5NruI9kc59CL7QPHSvvjrtdxTHdCUgVGcxqwuN5aK/WccRVNOcLRAaL5KIyC/zzXghnXMGCoqRmWRkti/616/cy+wYlQWW/8zH7n7riRfzpMGi+n0Zhvr5x4W7k2YU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733492625; c=relaxed/simple;
	bh=4VIWnKLXzlNjSDmAn7audAaynV7vNZUM2t5pSNM66X0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GMfVeJaae0LbD/uWS1fDeAiYtQh2zyPKGVhhNR6ixMpjKWTIa9oFrnON0eZMpmF7ZOQwdmndkALUKpniKxePQRggCsAxquC6rZJdEsl6TZswbgNV4Kkyp2Xxj/jrjD7OvkqYFIsEpaHajbLDncjL8/LZ7CBMQ42H91UX9irR34I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-515e1d6d0aaso629851e0c.3;
        Fri, 06 Dec 2024 05:43:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733492623; x=1734097423;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J/8NncUiLlBJXWiu+rkQNo8aljW5FrHLP4iwjw0aFZc=;
        b=VEO4FDqaMJ+1Yjb/jA5ezfA1byzOx1zl1vK5nIS7b+f3nk7CWK5AgcPDV5589DaOSH
         +g99NIHE1hE1Us2gBPODCkL7VcN59yHoqS2Sn23ZltTVBuPfhcpbMg1WgMRFZbe6qnZi
         QeeZip+yuEuRBwd92UWh5c4axt+wBShn/jb9/wOIyjxNwc/ZIhMQ6Ohm6/q5F/rsD5TJ
         x0rz49j++2+hmC9sEsBoQ5u21NhwUJGGEz48+rBr+WUMPqvIN/IrBqF0X6dRe76cZWV0
         zAc+6SxkfurD4myUdznrzdhtzbz/h1SCHh0SEo7SKUFI2MSJgsCnJxQBhmPcsE5ath2V
         7HCQ==
X-Forwarded-Encrypted: i=1; AJvYcCUDnZFsI69EH8iF02batB9GXcBfa78PFS7pOxReXTJQ8hMcIH1QjZGBCvJ7BbIBwLndBX73/gP0hCBh2fz7@vger.kernel.org, AJvYcCVqXZ0b21FFsugLzu/o6aStqIyV5AA/hkHoiqoHC5xIUGDfnSslZESwI8R5QWyUxas8i79S8pS1C9k5PJLSAxoJZZQ=@vger.kernel.org, AJvYcCW9QUGwAYWlItfJRPNFp7P9fs6NhqVinlQ26z5MCf6YouwcK0iB3IkPZDJxGzh28l0OFSIJt8V4uc9p@vger.kernel.org, AJvYcCWqRTxJlml2yubtroSW0bc5I9mZbDPyI2vN0Rgw6FQpqVx8aWTgYnkgSrw2cZF91SmFPMvs5tAemjZN@vger.kernel.org
X-Gm-Message-State: AOJu0YxwLqxntXNbkLw2rSbUF5eM3n/nGXIWLHr6O4EDwHZQHPc/5Y+a
	sh4Bg1KZlsNVw/6JQOFOdUjsfVApXYslQ4BPgGqeTgl0TpbVsOTXJSWf+Ax2
X-Gm-Gg: ASbGncvdg5lxUHsUL5vlDIdC3gHYaQBVZUrrIst70BYLXTDzMvGk6Wsn9xgqLKjpiwU
	CjO9wLyiBZlnFajiSjFRKKiOq4Qh/LpqwJwSa473iTso6/CoaG+TqaZbRwHeVDAz0L1DJ7ABT67
	aZZEMNTT6Ust78D5YKSuicUSnhydqZFvyjVCthnyscDM252y/pF+Kd7Bnan1dCcozJQfyCo/kZa
	usNa5nDFk/WIr7aWuLPIqOp/zXQ94lwl1aF6VGrzxs6YOfsog0q19EuapawBGzmQsApbVbHZhI1
	16I5TMSfXKhZ
X-Google-Smtp-Source: AGHT+IHs8PfwrYhKXodXNW2JGh7xh9XljmjSlRM+Ly+Ld9qCseQRYpkGWWy6c7SOwSNCAZ99T87gVQ==
X-Received: by 2002:a05:6122:3716:b0:515:3c4a:3c0f with SMTP id 71dfb90a1353d-515fc9d6fbamr3594918e0c.3.1733492622719;
        Fri, 06 Dec 2024 05:43:42 -0800 (PST)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com. [209.85.222.41])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-515eaf32e2fsm331147e0c.40.2024.12.06.05.43.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Dec 2024 05:43:41 -0800 (PST)
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-85bc5d0509bso442971241.1;
        Fri, 06 Dec 2024 05:43:41 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU+miavtn7fPjI/bg+6kJqqFeDzO5jX5BzYI2YX+z3fm0GJAH7XtWitI48c7dRqiafmeOEpQS223pk1@vger.kernel.org, AJvYcCUxITwGap5YnNsBwfvONWcWxgW4UCD4xbxpZU80so9ub4Im806jhs78LURuM8plwnFq2Griu1/FV+QX@vger.kernel.org, AJvYcCXGQ0h/2aPK3XuAZImGrFOhFJq7pcABcTa3bwrgMAb3ueEHA29KbQfOgchTITjzuk4vuY45/MAy/WVqVOMP@vger.kernel.org, AJvYcCXT/cjbGQTwj8ML13SAl9W3acxf/jtQac7P7MHp9HboUxbTGP0o/cVIgOS7SkYC5v+0eeklGUao30SfKdQLoWxrVDU=@vger.kernel.org
X-Received: by 2002:a05:6102:4689:b0:4af:cbf7:99d4 with SMTP id
 ada2fe7eead31-4afcbf79c13mr1996237137.10.1733492621216; Fri, 06 Dec 2024
 05:43:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241206-rcar-gh-dsi-v3-0-d74c2166fa15@ideasonboard.com> <20241206-rcar-gh-dsi-v3-5-d74c2166fa15@ideasonboard.com>
In-Reply-To: <20241206-rcar-gh-dsi-v3-5-d74c2166fa15@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 6 Dec 2024 14:43:29 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU+PPeCNb5y75A1YTf1EvvCQEgD1t-=6C_YyK0gDK3R8A@mail.gmail.com>
Message-ID: <CAMuHMdU+PPeCNb5y75A1YTf1EvvCQEgD1t-=6C_YyK0gDK3R8A@mail.gmail.com>
Subject: Re: [PATCH v3 05/10] clk: renesas: r8a779h0: Add display clocks
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	LUU HOAI <hoai.luu.ub@renesas.com>, Jagan Teki <jagan@amarulasolutions.com>, 
	Sam Ravnborg <sam@ravnborg.org>, Biju Das <biju.das.jz@bp.renesas.com>, 
	dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, linux-clk@vger.kernel.org, 
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Tomi,

On Fri, Dec 6, 2024 at 10:33=E2=80=AFAM Tomi Valkeinen
<tomi.valkeinen@ideasonboard.com> wrote:
> From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
>
> Add display related clocks for DU, DSI, FCPVD, and VSPD.
>
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v6.14.

> --- a/drivers/clk/renesas/r8a779h0-cpg-mssr.c
> +++ b/drivers/clk/renesas/r8a779h0-cpg-mssr.c
> @@ -179,6 +179,9 @@ static const struct mssr_mod_clk r8a779h0_mod_clks[] =
__initconst =3D {
>         DEF_MOD("canfd0",       328,    R8A779H0_CLK_SASYNCPERD2),
>         DEF_MOD("csi40",        331,    R8A779H0_CLK_CSI),
>         DEF_MOD("csi41",        400,    R8A779H0_CLK_CSI),
> +       DEF_MOD("dis0",         411,    R8A779H0_CLK_S0D3),
> +       DEF_MOD("dsitxlink0",   415,    R8A779H0_CLK_DSIREF),
> +       DEF_MOD("fcpvd0",       508,    R8A779H0_CLK_S0D3),
>         DEF_MOD("hscif0",       514,    R8A779H0_CLK_SASYNCPERD1),
>         DEF_MOD("hscif1",       515,    R8A779H0_CLK_SASYNCPERD1),
>         DEF_MOD("hscif2",       516,    R8A779H0_CLK_SASYNCPERD1),
> @@ -227,6 +230,7 @@ static const struct mssr_mod_clk r8a779h0_mod_clks[] =
__initconst =3D {
>         DEF_MOD("vin15",        811,    R8A779H0_CLK_S0D4_VIO),
>         DEF_MOD("vin16",        812,    R8A779H0_CLK_S0D4_VIO),
>         DEF_MOD("vin17",        813,    R8A779H0_CLK_S0D4_VIO),
> +       DEF_MOD("vspd0",        830,    R8A779H0_CLK_S0D1_VIO),
>         DEF_MOD("wdt1:wdt0",    907,    R8A779H0_CLK_R),
>         DEF_MOD("cmt0",         910,    R8A779H0_CLK_R),
>         DEF_MOD("cmt1",         911,    R8A779H0_CLK_R),

As mentioned by Laurent during his review on v1, all clock parents
should probably be some form of R8A779H0_CLK_S0Dx_VIO.
So I'm inclined to replace all of them by R8A779H0_CLK_VIOBUSD2 while
applying, which would match R-Car V4H.

Are you OK with that?

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

