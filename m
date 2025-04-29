Return-Path: <linux-renesas-soc+bounces-16453-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 31C39AA05FA
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 29 Apr 2025 10:41:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EB89A3A6C99
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 29 Apr 2025 08:40:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D98129617A;
	Tue, 29 Apr 2025 08:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ansbdwJx"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 124DD2798FB
	for <linux-renesas-soc@vger.kernel.org>; Tue, 29 Apr 2025 08:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745916057; cv=none; b=VyXEvtLGJsfyc18zW9cQDnnBrMk/QZXl/UCRlEIRR0MJI3nGFzDdA6+I6y7U9auUsv/sVc4tmKtc5kuNbDT2iUdIcBTZJJZJvYrR/gu16Rkbt3Yv57HCjtwSkv+i9E1unWaX9tlXa9vZHDSzW6ck8M6AR9EpKYkQrXP0d3G6wY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745916057; c=relaxed/simple;
	bh=KyAtXWPUARsz+iDauIm3noZwAgvzeeeL/6Xih7T8GDE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EhTIIafaMccgihbAIq1ZcouR4SBi7EQ+df9UqX04X3SbUSpw0K+td1A8u9LZ7t1sJaL4Tpxpc8VM9zhN+ppvvE03M78CcC294cPISPf1L8gRW+S4hOdbyM3VQSpHWK5rxcbyA50aL6wATZ11MxGQ/SkHA2TjTy6pAK2to/aFYcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ansbdwJx; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-30ddad694c1so63175151fa.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 29 Apr 2025 01:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745916052; x=1746520852; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KyAtXWPUARsz+iDauIm3noZwAgvzeeeL/6Xih7T8GDE=;
        b=ansbdwJxsueyefFM/ctUcCC6V8SAelIg4fyKH0DNmeisPkebKtqXUHrNQVqfENhfvo
         /+xit3qJOdMQNIxjRfKCjBsxY2jgxaKdC9yYi5qsMAbJn/zV1cYNMbu/w4+loB87L643
         DH0iVgtbCj6WQeJ0sbJ7sNEfSrSsGMP1adYk92DE/R/9ycX53FcJURUwQsxFhMD6m4Ai
         T+HRIAFJccEWJbCk8+vatZJzmsTisFrWvgBUure1gbQ0+JaJ9Of4s58IKYvHqEa8LScR
         UCmvWxEUobYTFF9R4MH7dqF8MXy9MWi4sSVnogYjOCJV9F0dCattldNwJT0oODZa8Tnd
         BmBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745916052; x=1746520852;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KyAtXWPUARsz+iDauIm3noZwAgvzeeeL/6Xih7T8GDE=;
        b=o2fzNdheTbU2QqJuK0CcOe1w29zZhobqz242gwIx8VVyO/DS6pFHMUaeVz3zGYH9oi
         g/UBLPWlqV7eqUXIQL/z2SGHAXtP4oKO7wmD7BEU9kJc4bCwHrxrhg+yJHzDHis6q0yH
         xYkzVAct8R1u6qIeqgZo06ejyGU5iBl+XEGHLd28EXfS2/RKACyMgoLR34mEmuUiYRx2
         eRBGhgxJUKLnF6te6w25x+vQVgZylJR/G2BA7jSQjoNRHT88cjaRHt2tJ2vqbf2PikWX
         p0PUyykTli6f5vZ4vxOrf9iwue2dWG11kI1RjO1QwZhW2BT8qeE1BVGq3F5OQQnPG0+h
         ENuA==
X-Forwarded-Encrypted: i=1; AJvYcCV6EnCdow70A10Jo2XN3F3DVo2TCGoPV3KV9gozJQb9dPBQPHs7JAlOdd9zZy3GRtAOznCiDBNPvec5FyI1ZzCcYQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxer3vSMkr5KIb8el6T4qXRpZo/vsXmZ+1leLcd60xRjLhS4xDl
	bEmMpgWnvo7/L6GM+PQMK6akCNFi/O58fR4eDP0qUQZy22ev+8oI0brI/BfoVibg90shcGtHl2u
	ASnXMIa3+sHU8Dlf1eN2CPSooTwSSRGajMuyHDw==
X-Gm-Gg: ASbGnctwN/cooCbcy99DnqR2RuPKb3BWef2Ml5aPgzvtvlqCiRRE0xTLTHIZ0c6nLyQ
	L+CxUbD/TNhEnegpWTExHEX1JnSCy3oYayULwqf5ztYG4iZAf5yACWw8LN7W7Knss9cq0yoBrhY
	lqm5EfrVH4DPE4Qq3VSR6WQg==
X-Google-Smtp-Source: AGHT+IEUiqYB296CVrwZ+xxBw7BC+pTcJa/x+6Bu5GNB2EvNhnBwa7BLSUJNRUMp+Ehtf1mLBoE9JSmzpMhMYJBukms=
X-Received: by 2002:a2e:bc0b:0:b0:30d:894a:a538 with SMTP id
 38308e7fff4ca-31d34b6c243mr8766341fa.21.1745916052135; Tue, 29 Apr 2025
 01:40:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250424-drm-bridge-convert-to-alloc-api-v2-0-8f91a404d86b@bootlin.com>
 <20250424-drm-bridge-convert-to-alloc-api-v2-15-8f91a404d86b@bootlin.com>
In-Reply-To: <20250424-drm-bridge-convert-to-alloc-api-v2-15-8f91a404d86b@bootlin.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 29 Apr 2025 10:40:41 +0200
X-Gm-Features: ATxdqUEhPh2HxY_cKMawBJnfuogL8n7jPhFvg8U9jTR5km8hYrNkb1VPdIYXtGQ
Message-ID: <CACRpkdZt8zem0hFUiq3-Z1feNZHRh3R=Y0cEtK=pVt=bJ9Qf1g@mail.gmail.com>
Subject: Re: [PATCH v2 15/34] drm/mcde: convert to devm_drm_bridge_alloc() API
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Jagan Teki <jagan@amarulasolutions.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Douglas Anderson <dianders@chromium.org>, 
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Anusha Srivatsa <asrivats@redhat.com>, Paul Kocialkowski <paulk@sys-base.io>, 
	Dmitry Baryshkov <lumag@kernel.org>, Hui Pu <Hui.Pu@gehealthcare.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, dri-devel@lists.freedesktop.org, 
	asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	chrome-platform@lists.linux.dev, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
	linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 24, 2025 at 9:00=E2=80=AFPM Luca Ceresoli <luca.ceresoli@bootli=
n.com> wrote:

> This is the new API for allocating DRM bridges.
>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

