Return-Path: <linux-renesas-soc+bounces-16428-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F35BA9FAD4
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 28 Apr 2025 22:54:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0028E7A5C15
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 28 Apr 2025 20:53:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6A6D1F91C7;
	Mon, 28 Apr 2025 20:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="YHujt9MM"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35C821F63F9
	for <linux-renesas-soc@vger.kernel.org>; Mon, 28 Apr 2025 20:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745873647; cv=none; b=oUXqsHL7BYuRLfZuo5cMT0R0Fv35rQGY8ZJeHKqRSE+WMSTZ0snumIn08dxeRiO4oe725ZciU8KEGg+wMGOVX9kyVKkHVeOPMQXbMJSGh5ZKBnk0gsZBsk+liAPMQTOMcx2ejl18H68GNK+6CZYsBgXcUp7h9rNNcn9dOn6jM4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745873647; c=relaxed/simple;
	bh=n4WGwCItyZewiOJcBSp4Eaj+wnGcnc5O6i3QGT0fNG8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MZ2Lf/RA6MTSmWfFbpW9cTajJFe0hlDqO+p1WpWPBJ0SZKN+BM9ml9hegospsoO/4EnCNmGG3XJhP8DsREU0YoUFuIwIU9gel9SgbsirZE4pGxmiC0grb3wpK/HmcLzjxVuSjREE6T8qc5hnFuFe0tUPw3CPV3p1N3JOeCwp4hg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=YHujt9MM; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-22c33e4fdb8so56821345ad.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 28 Apr 2025 13:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1745873645; x=1746478445; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=duqrSY39uZvRf9QP4FI5wn82Hvp3y0G6BGsbl6wCfsU=;
        b=YHujt9MMTp8bKrMsFmXM63bMM8a+I2YXydtfpVDqQAF3DVIzLp41fZ7aZMRYjXHg1l
         DhEJEskBspuF4q7G933v3fo40LBtspLETpFYAIzL7KWa41H2k04Aq+LRX3YOefHIPU/Q
         nfKgompPqt/dqYsgIAhR4l+BSNllmue2YLiEI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745873645; x=1746478445;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=duqrSY39uZvRf9QP4FI5wn82Hvp3y0G6BGsbl6wCfsU=;
        b=baBDFqCe8F109wKC+dnyhN1KNKvR/tKo6nYhS4S6u60FuMahFOZh0pQYg6yN3mJlKk
         Yp6e/sbk3CBaLmSFBGZaRjg/X1qYd5OfmF04S1CZu9BTSnln7Aoffri9TPB55mLfFlhe
         E2fmQZSURZ85/uQaBSFt19IgvbDMqx8i1msTlsFhJ/3rxW0rSAWTts30p/2Y1HWGyek0
         fHHlIR6fiBFL0a8JJRXEJGPjiZ7p9/mxZVrhA8LLkZR7QT6U8L0lWYB+IO/sCmxtO8N8
         55p78oRQMy2em7/Xl03wNhFLCUhEFzS/0ujurDlFsWluY2ZHsTzDDlIGgvH79Y/EPYJQ
         M4OA==
X-Forwarded-Encrypted: i=1; AJvYcCXERrL6/c6Jy8zRr+3MHMVPcqt1jqVjo2DYFQpCgz3Tg25tM2kjyl2lDoeQPaL4wFzxRQBA9JRKjnmyF5IbPK+1ww==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6Jc17DzJa1WOjEdZlH46RtEvbODpVjb3v5FdJ+ZCD4ybmE7ho
	ywRPBuY0Uhxs9xdOAiJVuD3Rj4PWS2j9KkSdr06gtzuWRTzKlclW9FEfxXHPmrX5BMu67LMRhSY
	=
X-Gm-Gg: ASbGnct97zULQgtA5JjCi+HLBNhNoCaE55BBQ8f2fGNlWwuQZ9rFkegYt+O5v6MQGAZ
	utW3zKfAJUiAwFa7YIp4P4ZrB8DfE66Szj6he+hw7ov0BCDEHp7RcZ0YzITOu1LByYDLtVkxFUm
	6H0TzYlvL/DNl1/TS7zr43hW4W8F5A2ng18zbu5xGMg42zUDIIekEZhFCBOlFtxvIGAzG1aL9o4
	ULtBjIsU/0BYQU36D+OkaQrINV8e8nRGzuYJNpIsK2494RJP70MuYIutjZQh1C/AZroJNz9pSiS
	8UM17DoBUnqxQdRAJ2eG0zanvmCYvW80LTxWYTkP+GD2LA0bZglF1lwALHCeOAhMfhA53qUCOhf
	ygAW3
X-Google-Smtp-Source: AGHT+IGtbikx9xpxHqKO5brA+d4P+0Vv5gpoRI06YLY5QRPUU/K/7gtuus3M4a/wj9TXOvPLeBR2qw==
X-Received: by 2002:a17:903:3d0e:b0:215:acb3:3786 with SMTP id d9443c01a7336-22de5fd2481mr16482395ad.19.1745873645390;
        Mon, 28 Apr 2025 13:54:05 -0700 (PDT)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com. [209.85.216.41])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db50e7613sm87633655ad.143.2025.04.28.13.54.05
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Apr 2025 13:54:05 -0700 (PDT)
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3035858c687so4431849a91.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 28 Apr 2025 13:54:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUjjmd0XU2RqqhoJOJ0pOu/KglrhFoTxs6jnLDqYe44wT++LJpVOLqcizBEi5oHQdlAGNLviboRSmB9xVUh5ueStg==@vger.kernel.org
X-Received: by 2002:a17:90b:2d08:b0:2fe:b9be:216 with SMTP id
 98e67ed59e1d1-30a215a9e35mr1596359a91.31.1745873644318; Mon, 28 Apr 2025
 13:54:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250424-drm-bridge-convert-to-alloc-api-v2-0-8f91a404d86b@bootlin.com>
 <20250424-drm-bridge-convert-to-alloc-api-v2-13-8f91a404d86b@bootlin.com>
In-Reply-To: <20250424-drm-bridge-convert-to-alloc-api-v2-13-8f91a404d86b@bootlin.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 28 Apr 2025 13:53:52 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WBxgJ9HZK=UyE8R17OiM0+ME2Lp5O7zoZRVOw2z6_sng@mail.gmail.com>
X-Gm-Features: ATxdqUGX6srhk44LYXds4__tJ7VKjYOOGbCee4VbhetmdBaO7SswZM-oniFpcj8
Message-ID: <CAD=FV=WBxgJ9HZK=UyE8R17OiM0+ME2Lp5O7zoZRVOw2z6_sng@mail.gmail.com>
Subject: Re: [PATCH v2 13/34] drm/bridge: ti-sn65dsi86: convert to
 devm_drm_bridge_alloc() API
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Jagan Teki <jagan@amarulasolutions.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Anusha Srivatsa <asrivats@redhat.com>, 
	Paul Kocialkowski <paulk@sys-base.io>, Dmitry Baryshkov <lumag@kernel.org>, Hui Pu <Hui.Pu@gehealthcare.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, dri-devel@lists.freedesktop.org, 
	asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	chrome-platform@lists.linux.dev, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	Herve Codina <herve.codina@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Apr 24, 2025 at 12:00=E2=80=AFPM Luca Ceresoli
<luca.ceresoli@bootlin.com> wrote:
>
> This is the new API for allocating DRM bridges.
>
> Reviewed-by: Herve Codina <herve.codina@bootlin.com>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>

I can confirm that I can still build/boot on a board with ti-sn65dsi86
after this patch. Thus, happy with:

Tested-by: Douglas Anderson <dianders@chromium.org>

Happy to have someone else land this through drm-misc-next or I can
land it there myself.

