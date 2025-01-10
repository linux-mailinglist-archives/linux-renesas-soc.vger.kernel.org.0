Return-Path: <linux-renesas-soc+bounces-12048-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F1981A09628
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Jan 2025 16:43:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D25AF7A3A84
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Jan 2025 15:43:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DECB72116F2;
	Fri, 10 Jan 2025 15:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Lic+hpVt"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DA172066E5;
	Fri, 10 Jan 2025 15:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736523825; cv=none; b=MgzCvEACj3caUd1lVDqhm25PE0PeVa94lcBloVfclVSaLzTxdG64EyND42D5sW5sIElekqIrKhyMHsJ2Y1y84BweD2+Oua0E02y0uyeo25u1WHlXb5mxff1gtxcDCWnOLsd6lMG6Ot2D4aGvTKLF40xx5d1gZr3mQZCaQGGNQ6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736523825; c=relaxed/simple;
	bh=TV8hH/0bAnpkstoi+VL/fkUNsub1wZaqlJIrE9SAU0w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DzPGO8YXDc7g85X1YW0BdSVkNPryQ81foI/CZ2O2XdP5zKPThEuLsOu/j4BSQ1nUSfiaGFVmsb9d6HlghmS4YIOjDZZAYOfC80BmlI2Bn6sa+XvyY7+yxeYGJbfuxmdjdrptgr4woV6vOWQE7PJkUudf6+z9gx3MQDqcpzWFBWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Lic+hpVt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44BC1C4CED6;
	Fri, 10 Jan 2025 15:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736523825;
	bh=TV8hH/0bAnpkstoi+VL/fkUNsub1wZaqlJIrE9SAU0w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Lic+hpVt20oa1Er3C2FAYUyESVm4xI1R5bOB51Lwq0HcLGCnKiblgXYVwUJx+/x3a
	 cUE5/C15iWRWcxYhQ7FuprRryHpctO62F6THJqi2kKfvk+Cas5eVF9GJond+7Czs0d
	 Sq9ly8reE9HqyyBdXXjI0k88f1kqJDIhQFJiodC0JNkBeXYmpGF7K8ilc84gnppjoF
	 SObGl+J0WXIvuLoL9DwLURXjeeO8Y9vQ6JFj9FQST227QrX0RRiLxlawuiBkm+o9PR
	 EjrKls13caeEu3LbAmQPkHNAfWXJM9HbtT18cmZWIhTYGjs5UGCWbp1gXqVGH8hy5u
	 3+HsR8OYmgQAw==
Date: Fri, 10 Jan 2025 09:43:44 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: devicetree@vger.kernel.org,
	Krishna Manikandan <quic_mkrishn@quicinc.com>,
	Jagan Teki <jagan@amarulasolutions.com>,
	Lucas Stach <l.stach@pengutronix.de>, linux-arm-msm@vger.kernel.org,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jonas Karlman <jonas@kwiboo.se>, Maxime Ripard <mripard@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	linux-amlogic@lists.infradead.org,
	Mahadevan <quic_mahap@quicinc.com>, Rob Clark <robdclark@gmail.com>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Sean Paul <sean@poorly.run>, Simona Vetter <simona@ffwll.ch>,
	Robert Foss <rfoss@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Jacopo Mondi <jacopo+renesas@jmondi.org>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, imx@lists.linux.dev,
	freedreno@lists.freedesktop.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Inki Dae <inki.dae@samsung.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Jonathan Marek <jonathan@marek.ca>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	David Airlie <airlied@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: Re: [PATCH] dt-bindings: display: Correct indentation and style in
 DTS example
Message-ID: <173652382248.2923092.2349362703621090098.robh@kernel.org>
References: <20250107125854.227233-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250107125854.227233-1-krzysztof.kozlowski@linaro.org>


On Tue, 07 Jan 2025 13:58:51 +0100, Krzysztof Kozlowski wrote:
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
>  .../display/bridge/fsl,imx8mp-hdmi-tx.yaml    | 28 +++---
>  .../display/bridge/samsung,mipi-dsim.yaml     | 66 ++++++-------
>  .../display/mediatek/mediatek,aal.yaml        | 46 ++++-----
>  .../display/msm/dsi-controller-main.yaml      | 98 +++++++++----------
>  .../bindings/display/msm/dsi-phy-10nm.yaml    | 40 ++++----
>  .../bindings/display/msm/dsi-phy-14nm.yaml    | 34 +++----
>  .../bindings/display/msm/dsi-phy-20nm.yaml    | 36 +++----
>  .../bindings/display/msm/dsi-phy-28nm.yaml    | 34 +++----
>  .../bindings/display/msm/dsi-phy-7nm.yaml     | 34 +++----
>  .../display/msm/qcom,sa8775p-mdss.yaml        |  7 +-
>  .../bindings/display/renesas,cmm.yaml         | 12 +--
>  12 files changed, 221 insertions(+), 222 deletions(-)
> 

Applied, thanks!


