Return-Path: <linux-renesas-soc+bounces-26554-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B644AD0BE62
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 09 Jan 2026 19:42:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9ED05304B4C5
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 Jan 2026 18:42:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3326029A9E9;
	Fri,  9 Jan 2026 18:42:16 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF6A2278E47
	for <linux-renesas-soc@vger.kernel.org>; Fri,  9 Jan 2026 18:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767984136; cv=none; b=tGRk6BdgGzal7VyLdi80zhUlCVHBJehe0HlRwng8pYgZ4TAMeL0Li+YoFeL+U77fGnLZAAWOuJ/76/gL7kva5EAWl9AfRTzQJJLwm+fnjZyW2aWWUopH0OclAMslRQcy560A5Ed4vpiYdQpxN41ryn7zu7T44pN+chGSWheVD0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767984136; c=relaxed/simple;
	bh=Siz+EqtF2DEyDXXm9dI9ms1Z1FX41pT/fgVeq5GfFg8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZqTuqVaHQpgNmIjxvPrMferhFyrUKsZu6wTsYwgPnvyR3q7mz6znDDxpCkMLXv5K21Eoah9FUDQ/6hf1bYbKox3JLDe4YTKe0B0PpRPqPpXhqIwdWnL3k/QHhRbxoU9g9ahV6JPui/pK6egXoc0s4gOha1wXP96A5NcRQlGV1jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-c1e4a9033abso2413133a12.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 09 Jan 2026 10:42:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767984134; x=1768588934;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fa2jKIqs2yYTNXV3hdw53GbF0voF5R+l35nND2b7JKA=;
        b=blAEuTHHjBaFGuwEjmkkrD/pW4IpoTjuWEixqMRc4uTY40whdwRCUbuxFPkHarSef/
         VoBB0YQaWNrLo4pDq+i31Y5pGFEX8+jem7GrF3PQvR+43NLr+w6a9nOcIsjsgq9czxb2
         kUfG3NkszAkEdR5s8Y6aNSZ0IB5cyE65su/RekMosEvpKxo8/YHVXiwonh/PVJLp8igk
         aWaFE2cdyK6WogHTbeo5np4Tg63Y4JS3pI8NlroRX0KPxMQ+39LMIA1LzY+TxRRfGFZx
         dRIjjYev2T34rtqQpMCVU2+u6yxpz6h3fpZ3CZ3zSVG62pI87UEGzCf5NZZw4vS4XbVz
         8s8g==
X-Forwarded-Encrypted: i=1; AJvYcCULjOMOXKr2vNXM+HEe0rY7ljV+diTgRuzaBzXDgxmtBrGPAGGrpYArDMwT3ousI5qTEYxuQWZstOYJBgFgLL1U4g==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywov1etcAQq9jJKiJ8/u3HLEWPQQWYCJRVi1R9FE9cP7uIgd7Q3
	QYpdRjulFsp+pdl0NJ/vxCIY5t/jDR1+uMy6x5f/wpzX152eOxtCFOhnynX+PkRi
X-Gm-Gg: AY/fxX53k8zSkAMBKEw1H4GHx6vQDASBtHyl1xxRUGQm68jPrUTds0AA0TOjRoL6ciG
	N04AGhShJhdyCIjw3bsbG+6XJHdHQJzcb0Y0YBIhmpcAl8ECbVRbIh9HF/VUP238eV6l/cEi396
	DrC8WkybYOLH4n+RxkbbIfMF+VgrNKDZ+iyUp5AS6LOL5qk2EIprK0+Alx1KiyzkGsWYRyJpUK0
	7XaeIR3EBgDoTv5Dm437/BT7hQIMRMrbEPDcsgsK/PeJH3UqCS9Xb9L2KHHU3ME9dpcXoP/Flbr
	jv9dsVwBQkfebiu1dTYERk9y6i+feNEQGQF5uhTY+jK2Y8PaU3nW019AOqIHSLopcUOkQ5RLA3a
	KZgMae+bVB4EvVQvUYH679H97mKYvGDQiaSd40dKPFHWq0lbi04YsoxosP9IPsuxtOGfQQA0ODI
	F9n/adzOosKzpqV/E0YQxKd8V0wsGSgNGAGY5NL1V6PtCA0rPlkWA=
X-Google-Smtp-Source: AGHT+IFDn2+DlYDO68ugmVFyyvDoD6IHaSasrxMcjd+vg7yc7Cv1YzT3X3CiOeIV8Ks19bguSQo33A==
X-Received: by 2002:a05:6a20:3d93:b0:34e:7bef:e820 with SMTP id adf61e73a8af0-3898f997696mr10493174637.41.1767984134262;
        Fri, 09 Jan 2026 10:42:14 -0800 (PST)
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com. [74.125.82.169])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-81dab89f2a5sm3492389b3a.56.2026.01.09.10.42.13
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Jan 2026 10:42:13 -0800 (PST)
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-2ae2eb49b4bso3316951eec.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 09 Jan 2026 10:42:13 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVsttfpygFEBHaYxicYpmihJooKhLHcjRCcK+E2HH7mQ/4Ol8xOK3DJ/Pmn159uKAK4nCXv9Yay1b1Ucer4P+g/uQ==@vger.kernel.org
X-Received: by 2002:a05:6102:dc9:b0:51f:66fc:53b8 with SMTP id
 ada2fe7eead31-5ecb692ea6emr3804438137.25.1767983778284; Fri, 09 Jan 2026
 10:36:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1764165783.git.tommaso.merciai.xr@bp.renesas.com> <0cdcfb470dbc4e897db049cf09f5d579f2035270.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <0cdcfb470dbc4e897db049cf09f5d579f2035270.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 9 Jan 2026 19:36:07 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVfXnmDs6UkEmGT_AR9YktEGZqAWaWiu9AijhsvWfgorQ@mail.gmail.com>
X-Gm-Features: AZwV_QjUM7Wb6ei547ywW3OJAaC3IFOVWsMcEtNjkONgJiVb3Bt1YrhDacYAZYY
Message-ID: <CAMuHMdVfXnmDs6UkEmGT_AR9YktEGZqAWaWiu9AijhsvWfgorQ@mail.gmail.com>
Subject: Re: [PATCH 04/22] clk: renesas: r9a09g047: Add CLK_PLLDSI{0,1}_DIV7 clocks
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

On Wed, 26 Nov 2025 at 15:08, Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
> Add the CLK_PLLDSI0_DIV7 and CLK_PLLDSI1_DIV7 fixed-factor clocks to
> the r9a09g047 SoC clock driver.
>
> These clocks are required to enable LVDS0 and LVDS1 output support.
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

