Return-Path: <linux-renesas-soc+bounces-11939-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 83C58A04B0D
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Jan 2025 21:36:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6DA64161F0F
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Jan 2025 20:36:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1DEA1F63F8;
	Tue,  7 Jan 2025 20:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="gOoPXZIt"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EB0B1D958E;
	Tue,  7 Jan 2025 20:36:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736282193; cv=none; b=s7oqHzvBMGrNMjZmNiNWc9wWZtqEBckrB2Z9LPNau+a4oPOWfke6CQzVQ6zEId4VXJU3VCLJV8lFMJBxj4N3n02F5A0SkI2au8PlmfAA2KZqjo69UJOrBzL0QlvoPso7F4afYLWwevAeDFnvrlMhuRko3/w2F/ksEWp7HcXZ2xY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736282193; c=relaxed/simple;
	bh=qYQ7E76CkhHf7z8mHbaeAvsIbpxTsY/ZInvAEaM94Hs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FwLreq1Wq7Hb3B4t1nra8pZgNYTQqCXfPMPvaPNGl+5rWULld90XGfoA7wy8YrRiPL4e/gQBkG94THH0/hFX02zmpC0VK5VUIzoo3KfpKh0HDpVsMB4HLWOnfm8mvQrzrAoYa6bmjEdDoqjBPrO4lslGJSe68nlxim/wcQQZu68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=gOoPXZIt; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-219f8263ae0so187687045ad.0;
        Tue, 07 Jan 2025 12:36:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1736282191; x=1736886991; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k5J+gh+iXgRwyFdRk/bfAnhtBt/J24ElglqD+pzBrcM=;
        b=gOoPXZItkNmvG+cOTN9duR16l4hSV1Wg/Wz6ZVjNDEb2+naIpk3+zmHfkV7F+wirnj
         K0i6u06apIU/nPL5nHFojuFBX0n3gxSUyrnVIm3XhjOvtT9RqGGu1Qn10qJqocSM4dqw
         boz0fXVTXlGEW5VnHhW3I0e/GHyuO+MGky1LV6n3mlmQUdu+xzdyIUHh/qx/p/C8Gh+m
         b04EzFJuOBX4Ekn+z0bW7NYSM1YIH8ePUbUAYtgp4CC8xZyb2fsXa8HKAf6zBNuO9qkk
         SjSc9XsxmZDrgR19+n6SqmlnK5S01pF5mlwSHfd/En8rlN8CvZcG/5mjh4N0jVld+9Uu
         zOFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736282191; x=1736886991;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k5J+gh+iXgRwyFdRk/bfAnhtBt/J24ElglqD+pzBrcM=;
        b=EBZ+wACUMf7I1aoksf+GWi0jrT8R/GIdsqP/pFCpCDrC3gYy2/4v+188gdGm2s6bsW
         0ZoOxZEjT3rJ4T7MsScDBwf52PBf0QIuYVulBh5pgF3sTOapw6iAmTacD8IKTZ1Qe5wp
         GcdsKvgiB50fkTXy9ZiXL3wPelCX4W+G5UQyzN33PEJBy1G21VOGYo2g08D6g6PnX+GK
         9DwYQWyt97J/3LuTb1eKx/5dAFaD578zyg/2lvE6rvFaeZIDp0yqF6+7LQ4Zd5SedXM1
         m3Lv56F4aFUXEzAZIZnDItHscvD4t+bQJ3XMcmCgbRIAFX71Cre6gSz50Egi7ewsmhga
         fQfg==
X-Forwarded-Encrypted: i=1; AJvYcCU3BWUnNzt+4JTJ+iqenqwqOVgNki/QjJJqc7VyIqNo3GuHtdd3Xj/e2M0xlZPeh5Mv7i4sRCgyoWGPBR6rExYuQxM=@vger.kernel.org, AJvYcCUt7WdZLiCtH3QIaJE8JTgbo8hDH2oZU2EkEYdU9sL7cJS5VWBPbrltjUc4NEGnd5Zf18rYHcgvtUIc@vger.kernel.org, AJvYcCVDFTYzARPkf3VBodit4y/AYEHt0bERZXkgvdAM9dnppKzAbLl+o3QiQShw32hpSGSVPEdTAlu+2YY3IiHi@vger.kernel.org, AJvYcCXckck7LPJzUG4SIMxlDEXoLygWV8J6JtCPE8CXScja8CMKk8GDdYU+6xk3/CXEEvLtKLjmn+twbjlOz0X7BA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyMRkVX2wt4ML6fG40CwrZomDlbKoOMjok0V1wIeTQzy7If9X6j
	XotZdcfSKfbqSiq13PeRIQtv/gVYKvM/4iBDF0UcY+07r1rWxS4+NdRGebUcBe1ToJvrSHDruMM
	cWuaAW4Bg+6MIDIG/cdahH4TIG48=
X-Gm-Gg: ASbGnctohPRNzGda0zQ1FFx2pg740mWONcJsH676WoMa7kLzgrmNxLbgkyhgGBt5ql4
	ERp/awS6rng5+XLjYKkTlDrCxc136WxKWFCItMnWaxaq2irGdGJMn
X-Google-Smtp-Source: AGHT+IHgiQDN0G5/PdDd430gJpVrEIqkV02owORB8V1V6tlHZDq0VmXjlHDjVTSTRjC3ezsidQtyveZkFyttC72Msfc=
X-Received: by 2002:a17:902:f70a:b0:216:8319:2949 with SMTP id
 d9443c01a7336-21a84000ae2mr5997805ad.56.1736282191527; Tue, 07 Jan 2025
 12:36:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250107125854.227233-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250107125854.227233-1-krzysztof.kozlowski@linaro.org>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 7 Jan 2025 21:36:20 +0100
X-Gm-Features: AbW1kvat2n17hvPwDrGQUj8U_8QFAMpbYP8hJMpXB_xRYGmIfR0aXMkOm1WMYyw
Message-ID: <CAFBinCCqekcg75YPnck5NEiLftpiDR5KhX7Ngc2xuRKpbMik+A@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: display: Correct indentation and style in
 DTS example
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Inki Dae <inki.dae@samsung.com>, 
	Jagan Teki <jagan@amarulasolutions.com>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Lucas Stach <l.stach@pengutronix.de>, Krishna Manikandan <quic_mkrishn@quicinc.com>, 
	Jonathan Marek <jonathan@marek.ca>, Mahadevan <quic_mahap@quicinc.com>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Jacopo Mondi <jacopo+renesas@jmondi.org>, dri-devel@lists.freedesktop.org, 
	linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, linux-mediatek@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 7, 2025 at 1:58=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> DTS example in the bindings should be indented with 2- or 4-spaces and
> aligned with opening '- |', so correct any differences like 3-spaces or
> mixtures 2- and 4-spaces in one binding.
>
> No functional changes here, but saves some comments during reviews of
> new patches built on existing code.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../display/amlogic,meson-dw-hdmi.yaml        |  8 +-
For amlogic,meson-dw-hdmi.yaml:
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

