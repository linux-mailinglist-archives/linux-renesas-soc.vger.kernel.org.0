Return-Path: <linux-renesas-soc+bounces-11382-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E74289F3197
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Dec 2024 14:34:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2508D1687E6
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Dec 2024 13:34:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 790EC205AD8;
	Mon, 16 Dec 2024 13:33:37 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 550772629C;
	Mon, 16 Dec 2024 13:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734356017; cv=none; b=W8WYNE0uFezm2gdJnBJd1+WnRdh/pf6WZ7x5YGZl3+WJ34qz2lV/a2BlY6iXrPheSTBOHHWbQk2qc6MuU9M/0KDTT965BBhhTkpeQ0jwDcxY9AaMhng48OLe+zKMRI6HnjCz9Vpl+CYd2kaVFlX4pLYShmAzcOBgDnRHl2YjsR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734356017; c=relaxed/simple;
	bh=/ZHLX7pS2TYrCKb1KFxzJ/agCTsC58ROi/NT2ImpY1Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fuk5x5dZlObsIsjKDvPhNEjLnnP0HURdc2liXXQzFw3oNHjCIkM/IwHUM7Q2WaSVes9bDrYmjyXbUYZ63pWB8wsSzph1HSZpCsPa2IOet/PtG6d8onM4KN+D+B8Y0VPTBg+vNTCwVhZXCTXvfx9GOXuPBzG76AMkKRN3drKYhU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-4affd0fb6adso1040505137.1;
        Mon, 16 Dec 2024 05:33:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734356012; x=1734960812;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2YeQ/juaU1aTYjB8NikAS7tXvAIBonFs53JoSLLpdzU=;
        b=qnjtPeh8cSCZ3aw9gYwdEoeAiQAoOR45ZsZ6AirPb/00leDDmQJNwi5lPWhUkm1Cb9
         9oMiWA22giSS1aWIKJ0sAC3DnllvRVlm+F1V15d5YH4T6gLpK3ArtjOp2k9uJ/iCShf4
         s9IOmcUsdOki0ojbMOfh9GTBjhtD3GVfFLKZd/9HzzqMOmM4WdxKUZbwz0KZs+csmBYr
         +Y262DQr6/ynKE391UxLvOfVzTpDIq7zTxxoRLgv1t+l8e1fbVoZrvG9jLGsJ6jsZuHD
         mnH3g/j/MODRsxj8xzMKfAwaJY3XxmU4+pW5IIck9A3JQlwB1+dV5I3o5jOg0SqOC89c
         TrmA==
X-Forwarded-Encrypted: i=1; AJvYcCU72BEgMmiAqB2qZ64gQk9jqzjoHqiQe+bhhzmb3BM43H6xKU3bLUQXXJ9wvYVI9BpGfYNjXYXDYGGqaKyN@vger.kernel.org, AJvYcCUXMz7Qnt6JNzCtN182v65t9ZhkoifYu/hKdLO+xfBuZy0JwGaTYDZgqKtIKvzCkTVhWwgPjtsz6gKqzJoWsTptwDs=@vger.kernel.org, AJvYcCV/M3gQdvRnlRsbUjmaGLkqKhrbw5Gi6RjTdJM+tsMz3vr5oZYOjXKk4n10LOxccNPn1TQLaxByXT1K@vger.kernel.org, AJvYcCWwkjiIVYw3GJJ3CYfiBIAoAi0bs26kCHtd0w2UVzwUGVFwqADiRVmjntHtfksCzRxdNbBEeIDyHGsB@vger.kernel.org
X-Gm-Message-State: AOJu0YxDA6FtdVN0azzK2nnFADbaIYDGK9rugzNxq7cieIRF+8X1D6XD
	EWmRqq+r95RkrVb5xSilMBdyDYWjyPv7FIpK/M/9LU0EZUmXNPdp33cLSUrZ
X-Gm-Gg: ASbGnct6AfU/WFT9xO4dDNZZybnF0TNpX2ipIqASI386kjlfwshFkCGxwK2j+BF3Oow
	x3fHhWPpGkFTO2xoBixBQ+UpViV3qu8wE+0Ed8URMxAqwmFJ4MtvDFbZp6SAjnI/H4P0xAlLlD2
	McBXHSoFbQO6vdVSjxnYCcRu7j+hllskx/UjkIQvS0rdM2eikKo1CCJ8bNsJl4lZxLRIg0UePuG
	S4vzhf044X9lLRXsaS7pvxgOk/Ah5px6G08Km7OZJi+x7LI/AxEeakhdxze5vkryQNan479Q943
	vi172ZIhqwTcr3sRNO8=
X-Google-Smtp-Source: AGHT+IG3cWzqsckGVqnZxVs+MG5R8tf/WggJwYXvY4XH8HoHD/9rMk7zbIXTYHMdlVsK5CSDAIahCw==
X-Received: by 2002:a05:6102:418e:b0:4b1:1b33:eb0f with SMTP id ada2fe7eead31-4b25db3f6a0mr10921745137.24.1734356011808;
        Mon, 16 Dec 2024 05:33:31 -0800 (PST)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com. [209.85.217.44])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4b27023368esm816594137.11.2024.12.16.05.33.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Dec 2024 05:33:30 -0800 (PST)
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-4afefc876c6so1100594137.2;
        Mon, 16 Dec 2024 05:33:30 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVJq6WNQgyRcbQYhcS6aeUOJQ3bm5muFWGQ0r2eokoKc8souk+CVU8YOz2c3LLxwD9wunJvvBOq/L/y@vger.kernel.org, AJvYcCVdEdmiboFXN7usU0ZXAY//mjOyOVfrVUPScBx1F0Vzv0IKW2u/K2wWzMYmgzxfAiCF3qslpy0oBqSonD/7@vger.kernel.org, AJvYcCX1drt9s5D6jV6uiG/5mqAyruiIXUwDs36jvRnr7f/FXlQMvb5jTcvxClk1efXx5IjIt/hZrwwrpbW89FDfOlnu+Ho=@vger.kernel.org, AJvYcCXnJsjwTUgifohk6VIiUFGBrjCUAOZPD6+259m9CtZ25R8YROe0ml9kxiMx2NktPVbSU9kser8tyJuO@vger.kernel.org
X-Received: by 2002:a05:6102:b02:b0:4af:dcbe:4767 with SMTP id
 ada2fe7eead31-4b25d98d34bmr10283091137.10.1734356010555; Mon, 16 Dec 2024
 05:33:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241206-rcar-gh-dsi-v3-0-d74c2166fa15@ideasonboard.com> <20241206-rcar-gh-dsi-v3-10-d74c2166fa15@ideasonboard.com>
In-Reply-To: <20241206-rcar-gh-dsi-v3-10-d74c2166fa15@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 16 Dec 2024 14:33:19 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXkXx6+0nJn+uLCAWOXvEYWLJXzLu9J7ksinn_z3bEfHQ@mail.gmail.com>
Message-ID: <CAMuHMdXkXx6+0nJn+uLCAWOXvEYWLJXzLu9J7ksinn_z3bEfHQ@mail.gmail.com>
Subject: Re: [PATCH v3 10/10] arm64: dts: renesas: gray-hawk-single: Add
 DisplayPort support
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
> Add support for the mini DP output on the Gray Hawk board.
>
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks for your patch, which is now commit b1000645dc29701f
("arm64: dts: renesas: gray-hawk-single: Add DisplayPort support")
in renesas-devel/renesas-dts-for-v6.14.

Apparently this patch breaks s2idle on Gray Hawk Single when "[PATCH
v3 06/10] drm/rcar-du: dsi: Add r8a779h0 support" is not present, or
when CONFIG_DRM_RCAR_USE_MIPI_DSI is not enabled. If the DSI driver
is not available, the ti_sn65dsi86.bridge part fails to probe with
-EPROBE_DEFER and "failed to attach dsi host".  Still, the sn65dsi86
driver must do something critical, as resuming from s2idle now hangs.
I haven't identified yet where exactly it hangs.

As a result, s2idle is broken in current renesas-devel, which only
has the DTS changes.  Perhaps I should drop the DTS until the issue
is resolved?

However, I suspect White Hawk has the same issue (if
CONFIG_DRM_RCAR_USE_MIPI_DSI=3Dn), but I cannot verify as my local White
Hawk is currently not available for kernel testing.

Do you have a clue?
Thanks!

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

