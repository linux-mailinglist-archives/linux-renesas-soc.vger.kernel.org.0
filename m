Return-Path: <linux-renesas-soc+bounces-16933-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3317DAB22CA
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 10 May 2025 11:16:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AD6444E0188
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 10 May 2025 09:16:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0674721B19D;
	Sat, 10 May 2025 09:16:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VvYmN0+u"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0B101D9A54;
	Sat, 10 May 2025 09:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746868563; cv=none; b=MYg5bEeL3T09bhCLqL5mLsJJzBK8tCFmg7dRo0UueYWAWXtwjpUhxAeB6kP/DJrPbvon2SL/Qs6nG5KUuZOwguRs2e/KPD2D9WHoaT6n7CmI2K9pxvQiZkzABVL5eCQu7DwDyTkFTedlj+ttB3NBnYvRR27m/96ZQSL1Jubrvbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746868563; c=relaxed/simple;
	bh=N0WvBWcRaJqlD2szj6a2rYDUoL1UN49lZxJeaXuaiUU=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=MFZTbtn33eHjMFUzxiVEZdT6vgOxnZsBBplqsnFMVwnfzfbNITj4bv+wLWNHWarPoj+acNIz8PLBPejgInsW51TCKMxnf2PsVD6uth8oEqb+6GxGZo4r6G3PqwXHWqQh7qejjoD852hdjXDUv2yjxAkMlMlz56zOMlg6PzXe8xo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VvYmN0+u; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD385C4CEE2;
	Sat, 10 May 2025 09:16:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746868563;
	bh=N0WvBWcRaJqlD2szj6a2rYDUoL1UN49lZxJeaXuaiUU=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=VvYmN0+u/+1ASx2sAgrFMXwxnbL4R8LTOb4fp5TRJiniNv7KQl4+Ko4mrQqrrmSiv
	 aIJZpmqGS6WATO9zy7I4vWEcUrjRedeUn22W/+Z64/vXNQB0K6K2DOfyap4M+hIkQM
	 bVSL32xrhuFlldAJlKiev8inl8mb6ymCVkXdehHO+DbHWmmFEctDdkzPJjjSiND8eV
	 c7SzIiOVfp/y0EZ2iv6Jk1GPLKIC3eudGEY+06DAuceIuoFBMJPPdMJrkf1SSOP2QY
	 uEdNQ1ZHxAeU13oIdbeG0Zqd93huOcbCF3gB2LNDuRmTaziGz5ij6FyhXHkj9w9DZ+
	 6XSyjUEIUexLQ==
Message-ID: <13d5e1fbe12e289da1d1e5184eb5277c@kernel.org>
Date: Sat, 10 May 2025 09:15:59 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v3 20/22] drm/bridge: add devm_drm_put_bridge()
In-Reply-To: <20250509-drm-bridge-convert-to-alloc-api-v3-20-b8bc1f16d7aa@bootlin.com>
References: <20250509-drm-bridge-convert-to-alloc-api-v3-20-b8bc1f16d7aa@bootlin.com>
Cc: asahi@lists.linux.dev, chrome-platform@lists.linux.dev, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, imx@lists.linux.dev, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-renesas-soc@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, platform-driver-x86@vger.kernel.org, "Andrzej
 Hajda" <andrzej.hajda@intel.com>, "Anusha Srivatsa" <asrivats@redhat.com>, "Chun-Kuang
 Hu" <chunkuang.hu@kernel.org>, "David Airlie" <airlied@gmail.com>, "Dmitry
 Baryshkov" <lumag@kernel.org>, "Douglas Anderson" <dianders@chromium.org>, "Fabio
 Estevam" <festevam@gmail.com>, "Hui Pu" <Hui.Pu@gehealthcare.com>, "Jagan
 Teki" <jagan@amarulasolutions.com>, "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Jonas
 Karlman" <jonas@kwiboo.se>, "Krzysztof Kozlowski" <krzk@kernel.org>, "Laurent
 Pinchart" <Laurent.pinchart@ideasonboard.com>, "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime
 Ripard" <mripard@kernel.org>, "Neil Armstrong" <neil.armstrong@linaro.org>, "Paul
 Kocialkowski" <paulk@sys-base.io>, "Pengutronix Kernel Team" <kernel@pengutronix.de>, "Robert
 Foss" <rfoss@kernel.org>, "Sascha Hauer" <s.hauer@pengutronix.de>, "Shawn
 Guo" <shawnguo@kernel.org>, "Simona Vetter" <simona@ffwll.ch>, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>, "Thomas Zimmermann" <tzimmermann@suse.de>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

On Fri, 9 May 2025 15:53:46 +0200, Luca Ceresoli wrote:
> Bridges obtained via devm_drm_bridge_alloc(dev, ...) will be put when the
> requesting device (@dev) is removed.
>=20
> However drivers which obtained them may need to put the obtained reference
> explicitly. One such case is if they bind the devm removal action to a
>=20
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

