Return-Path: <linux-renesas-soc+bounces-18673-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B387AAE6F4A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Jun 2025 21:13:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1677617E7DA
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Jun 2025 19:13:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF6EE2E62BC;
	Tue, 24 Jun 2025 19:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EcEWnDsQ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 192E324169B
	for <linux-renesas-soc@vger.kernel.org>; Tue, 24 Jun 2025 19:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750792385; cv=none; b=plew2EFGt/1AMHtnKJ2EubAEl67fiIHw30iQv6jlrCmi8aiUW6JXa/QM7ou0zuUFUJA4fvq3b4A6VTIPlJo622E+MmiJfZkC3gG/2DGGbzcMW4lpvP+aBWbbvrxQC794+T5aVBfaJ3TiBWvXkOmSuEX0fSiF1g0ZI/prdZeBa90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750792385; c=relaxed/simple;
	bh=42g0mLF/csycd0PbqCpM2WtITkGugXfu8fIaTZhFhBc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o6ao0m0CVJ8GlK7vD/EKkf6QyQ2DddthCOuCoEm0YMVUEJJCez+/kIa4a575C9tuXF7vMgQn6O0G/iRKc/D8ltnngBHgXvLm5PylqHeKRd2S+xlgpeqIeQ6HNZkqy3ecicsJ3sUe0OQJrhhr2uAUjt9YkPXMvfhMFwtCQaBWX9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EcEWnDsQ; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5535652f42cso866959e87.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 24 Jun 2025 12:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750792382; x=1751397182; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=42g0mLF/csycd0PbqCpM2WtITkGugXfu8fIaTZhFhBc=;
        b=EcEWnDsQfqK3E2EJB3dSSxyDt0C+Yl+uTkYLfXeSmKYzT9k+qyXXhAgorEZFjBsZLv
         Ym0ZGZOpq2VlG8WbfzGDrgNTLZRQbANcwtIMvlechN+AUTBychff0jY3NbL4GYnNZQ0v
         rbulk5r3iyvPqfnpSAYbtrosRJfLTnZrPapMuLJyWlRlB5BWE4fNwaNIpullHPyKRI9p
         ddjOhwA71dlrjBeARBDS7le5jENBtbwsuy3+p6YRBPXJ9PcpFDsGHQ+elcOna52o79B4
         HNqk3eRRco0LJE6dJPFcuSFtvtBLWk/FUBj5GoKwJs71m+U1QnwFMTJzIdTx7cA7Y0bb
         7lRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750792382; x=1751397182;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=42g0mLF/csycd0PbqCpM2WtITkGugXfu8fIaTZhFhBc=;
        b=i3pMG/wsmCVte37buGoo/GF3tLfd4gTT153WhzpQy5MlyFBgnRN7G3IhyhPgjxFoUc
         hE5VAAXomkUidZ3ER4AUtwi0aCJhaA7/LQ4PQmJd9piXl8DQzg0gl3R8i6yAXCCC4bkY
         uLZc7jqJmlBR2dNqYGCVBWs4WeTjCr6Qhi46EsA2D7wNP86mToxuN0LHZ/bT+AhNBaSL
         hl6hmPAZFg8JNN4D+C65TYfHu8t8clhjIhBZlHqcLXihhRXRIj1+e/sS2bONtOtRGGuM
         DXYe7FsqW5xDNF6J28hP+orfECFygTExiKs/JMirdJWgPVShYAkJAXzrLqBo6bWK6ZIZ
         x6MA==
X-Forwarded-Encrypted: i=1; AJvYcCXVhj8f6mHlBZE0ROZmmFWodCGDG5k1wzSC1kIRJqfZBjDzXiFhu5LfdW72Ln8md+L1UzKDhlavGX3ZQNMrgpB7kQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzLVquzfEkm3MI3zaucea7gU1sjnyDQBH3AZOJpAJ8phDVNYPQG
	I6LHVMzUkE5XtMpiXPJbEUsvOkzzLlGx8wGJQXYz/uFLJLs2G85aJv1DYzW8cT/VlszHJPlTVzh
	kLNMEgOyAV9e+/6iAu3yG6q+T9byHush9VVDNG4WkyA==
X-Gm-Gg: ASbGncsCaEaqzWt4ltxQvUWnxSEokPVi15tJWjuktGC2q+tIdZuKlG2KRAmTCryKnQv
	QxizYrjDw7lQ0JXiKWIRv33wclrUWrJltIdIWgf4275UklOW81i5DOLtzFxzGRb0DcpzVJJxjEu
	7/4d0peMhqlwzFNJtz6lE4xEAgF1Y6JoD2cyTjQriBVi0=
X-Google-Smtp-Source: AGHT+IFcvsv4Jx0wPVU5q9HdOKD/NjVsRLZ8GzOGiSq6bCzhKJUr6IeEsytMxz0Nq3UnxW9fjOmi1xt9+Qqg6x/9RLE=
X-Received: by 2002:a05:6512:1247:b0:553:35ad:2f45 with SMTP id
 2adb3069b0e04-554fdf7c090mr5733e87.50.1750792382134; Tue, 24 Jun 2025
 12:13:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250619-b4-of_drm_find_panel_part1-v2-0-0df94aecc43d@redhat.com> <20250619-b4-of_drm_find_panel_part1-v2-14-0df94aecc43d@redhat.com>
In-Reply-To: <20250619-b4-of_drm_find_panel_part1-v2-14-0df94aecc43d@redhat.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 24 Jun 2025 21:12:50 +0200
X-Gm-Features: AX0GCFsyGEH8PEzLkMow539_Cj69jbmDRSN9FsVHKoXlbloZW-99abb_OrCBGA0
Message-ID: <CACRpkdZM75HEZ0DACqC3iY7S1gLurw29Z--C7TJxUVxPUTuNqA@mail.gmail.com>
Subject: Re: [PATCH v2 14/16] drm/mcde: Keep up with refcounting
To: Anusha Srivatsa <asrivats@redhat.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
	Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Inki Dae <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>, 
	Samuel Holland <samuel@sholland.org>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
	Kyungmin Park <kyungmin.park@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Alain Volmat <alain.volmat@foss.st.com>, 
	Raphael Gallais-Pou <rgallaispou@gmail.com>, Stefan Agner <stefan@agner.ch>, 
	Alison Wang <alison.wang@nxp.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Mikko Perttunen <mperttunen@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-samsung-soc@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 19, 2025 at 9:19=E2=80=AFPM Anusha Srivatsa <asrivats@redhat.co=
m> wrote:

> Put the panel reference returned by of_drm_find_panel()
> back when driver is no longer using it.
>
> Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

