Return-Path: <linux-renesas-soc+bounces-12824-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 340EAA26099
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  3 Feb 2025 17:52:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EEF5C188700C
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  3 Feb 2025 16:52:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C04DC20B218;
	Mon,  3 Feb 2025 16:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G7mIBH2P"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96A351FFC55;
	Mon,  3 Feb 2025 16:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738601569; cv=none; b=Nmzdj0KkmIWhqpCiIGMhjEiMrcb4DZJ4az52p11eCE+sZhLNksWQpLmCyLFcgaI1++j3GGi+I4AIzp5tj8oDtLzUmR5GW/y4EwrXlzW+XNbYwh8zRBi2gvdUC3pqAnF5IGiwQM/Mn5IUox1KB5VG6ln+lmb5U/ssvg8GFzK7tro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738601569; c=relaxed/simple;
	bh=KYAHdnV48fxBXFY3qpA0uvflhDKLsBpZZvc4LapIXn0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BfdUpTAHGywVAuL7fXLPXY1zZqPsM+7vUQtYWVu4s0Ft3F+ED4GU/ZClRaFBWZfF3d8Dj6Kgd8cT7EqpyQYBbHMPR2z4nI9aMCdhMR3Z/fYypCyyBwzpVS8KjkAP7d5+/g2Ppf+ZHySmo6K5Qi25r/slCtUKxVbbqzO+zDqyu3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G7mIBH2P; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9B61C4CEE5;
	Mon,  3 Feb 2025 16:52:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738601568;
	bh=KYAHdnV48fxBXFY3qpA0uvflhDKLsBpZZvc4LapIXn0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=G7mIBH2P4HK3Aq4bXSlhbtIMBpYTrg2+v0OvAbisU3D9+c97/HSQ+BbO6c9M06WAW
	 lGda6NIPV2pyXnLSGpO9+fJt1jFZ+8vo6Zq93gmb+y5Zs0uB1q4wtZhQzgLcGvd8Ua
	 WJOS65LLuOzhXtVZ1H6FuinmYAbWuhoc6oyy49o7myFhE+/6duQeEJjDWtjMIF7BeU
	 8LtdiAE4ebHPrHle3X193ynz4YJ7FkIUd1KHL2HaLfdEsqwMvzBZ2s3EFTMCCO2SuV
	 ja42yDWbcT3Qa+a1X1uuHCQPW+OxE5UiXr37wbZNRsnRRjDzSPIwuX+lWAMSckdWD2
	 hVXKGTWlbblpw==
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5d90a5581fcso8406120a12.1;
        Mon, 03 Feb 2025 08:52:48 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX12YxRVZuRsXn17cfRhUspU9u8eMEOsuycTKELpBnmxCCC2bmuY/Dk/uZgxhZwO0cEPeiXmqLXLZgAYBrVmFw47rw=@vger.kernel.org, AJvYcCX5byuweE31zqgeeAl3yeZddbeC3m0pHJ8gU2oC1ju7J2pOyDPhfyHhAuRylgTLHYY4DYSJu8h1ubZE@vger.kernel.org
X-Gm-Message-State: AOJu0Yzhn3ln+swhJSskBxjcCFYOjjp5r7obpj0vmjFFCtXfOPNq6D1w
	NTWHu+zhdyisTtdEtCpWoYR2uSetPJLnnXr891fCtxvsIrp1Mqe1+hR4md5crrhw2B+gP8SRX4u
	IDkZIwHGpA7LN7DCqW4bZD9QRUw==
X-Google-Smtp-Source: AGHT+IEV2/Sd6DHIrU3ZrbIJ2gYXXde46QL1lRAjvii+LibXZWGhqkpzoCzlCNNSLJ03B11qDzWWSKexPZQSYJB0dD8=
X-Received: by 2002:a05:6402:4026:b0:5dc:7fbe:7303 with SMTP id
 4fb4d7f45d1cf-5dc7fcdb6afmr18086193a12.5.1738601567417; Mon, 03 Feb 2025
 08:52:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250201093126.7322-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20250201093126.7322-1-biju.das.jz@bp.renesas.com>
From: Rob Herring <robh@kernel.org>
Date: Mon, 3 Feb 2025 10:52:35 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+dn5wyEKbvAT8M2V=nM-vV_eHiRtwO_0h6EiJ=8OkHSw@mail.gmail.com>
X-Gm-Features: AWEUYZk6vEuoN17Xf_joz3957pyiXnco-9SecodVg5pP8U1SPnSpTkxx0rjtOhE
Message-ID: <CAL_Jsq+dn5wyEKbvAT8M2V=nM-vV_eHiRtwO_0h6EiJ=8OkHSw@mail.gmail.com>
Subject: Re: [PATCH v2] of: base: Add of_get_available_child_by_name()
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Saravana Kannan <saravanak@google.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Geert Uytterhoeven <geert+renesas@glider.be>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 1, 2025 at 3:31=E2=80=AFAM Biju Das <biju.das.jz@bp.renesas.com=
> wrote:
>
> There are lot of drivers using of_get_child_by_name() followed by
> of_device_is_available() to find the available child node by name for a
> given parent. Provide a helper for these users to simplify the code.
>
> Suggested-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Rob Herring <robh@kernel.org>

> ---
> v1->v2:
>  * Updated commit description.
>  * Updated kerneldoc comment block
>  * Avoided code duplication by using of_get_child_by_name().
>
> Note:
> grep showed the below files will be the users for this new API.
> I will be updating these drivers once this patch is in mainline.

No need to wait. Please convert all the net ones and send this patch with t=
hem.

>
> drivers/net/dsa/rzn1_a5psw.c
> drivers/net/can/rcar/rcar_canfd.c
>
> drivers/net/ethernet/mediatek/mtk_star_emac.c
> drivers/net/dsa/mt7530.c
> drivers/net/dsa/sja1105/sja1105_mdio.c
> drivers/net/dsa/qca/qca8k-8xxx.c
> drivers/net/wireless/mediatek/mt76/mac80211.c
> drivers/net/ethernet/ibm/emac/core.c
> drivers/net/ethernet/ti/am65-cpsw-nuss.c
> drivers/net/ethernet/actions/owl-emac.c
> drivers/net/ethernet/mediatek/mtk_eth_soc.c
> drivers/media/platform/samsung/exynos4-is/media-dev.h
> drivers/gpu/drm/tegra/rgb.c
> drivers/gpu/drm/msm/adreno/adreno_gpu.c
> drivers/clk/davinci/pll.c

