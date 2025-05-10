Return-Path: <linux-renesas-soc+bounces-16935-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 059A1AB2301
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 10 May 2025 11:42:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9A0491BC4663
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 10 May 2025 09:42:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E676F221DA8;
	Sat, 10 May 2025 09:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ldIPC27B"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2C3D221726;
	Sat, 10 May 2025 09:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746870156; cv=none; b=ovhQKj4sKUtLjmBJ3Htc/CL7jd47h7czpp5QNz2tO81OZOVxZdXQDTaJGQy7/AiiTCsOpemTy9I2wk1j+pCujKwOEzkBX+9pwqdepVGQq0QfYy08bk0e8wThy00ACV4FF7ygVAuovw2hRMgdtYdjYl6Mcl0c03YLlpBNuzWLqLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746870156; c=relaxed/simple;
	bh=mvGfz4+zhaqRCocFMaf0hgjCnm1CJTvyI1js5uNHlJs=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=HaP5s9Fr56ThhtdMKtugkPHP1PPdGMAR0IIsIkNgDTPlyCPFIlIxpZdea/5A1HsjuSBMLJZE8dpJXTDCg4mjeEGh5RjeBhKXxsuqeyXwOgufQSfhK1NbeZ8T67/R+efsA6IQQIhVEFUl9HQhWqBBBJ99x7sgBTRAi3w7VVm1QB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ldIPC27B; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67518C4CEE2;
	Sat, 10 May 2025 09:42:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746870156;
	bh=mvGfz4+zhaqRCocFMaf0hgjCnm1CJTvyI1js5uNHlJs=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=ldIPC27Bt9cUfcjCameGNcaKJEAzqc7AUG4thRUqo3qyHbBIdcMs8n0bTUIlQ5Tym
	 TJ7a9nhwlFa6+4GEQwIXU2cFx+VvQ3OOD4XQqH+HZ6e6O5slyTKfu+IY7orStEmsf7
	 eC0/5x1y0Vg6Xmq3EiJb6IJts6XegY1Z06KyQ77eaEbMVXv3ghE27h09P69DXIY8Gf
	 9QftRl1mTZGBFVanZ/8Q7gRLFPXgadbF10wjnLH+hZH7YFIa/GdZ/yr013KSFD4rSd
	 NWLTE5kwJ+ijvBSyCwBPXOzsriTpRCh+eVuiXMtGgY+rum+32WSQ8qr99iOs9aGbQ2
	 Y6mdWOA3Vy+qw==
Message-ID: <0bc432f67dc0cdb5fa307565df72af34@kernel.org>
Date: Sat, 10 May 2025 09:42:32 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v3 22/22] drm/todo: add entry to remove
 devm_drm_put_bridge()
In-Reply-To: <20250509-drm-bridge-convert-to-alloc-api-v3-22-b8bc1f16d7aa@bootlin.com>
References: <20250509-drm-bridge-convert-to-alloc-api-v3-22-b8bc1f16d7aa@bootlin.com>
Cc: asahi@lists.linux.dev, chrome-platform@lists.linux.dev, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, imx@lists.linux.dev, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-renesas-soc@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, platform-driver-x86@vger.kernel.org, "Andrzej
 Hajda" <andrzej.hajda@intel.com>, "Anusha Srivatsa" <asrivats@redhat.com>, "Chun-Kuang
 Hu" <chunkuang.hu@kernel.org>, "David Airlie" <airlied@gmail.com>, "Dmitry
 Baryshkov" <lumag@kernel.org>, "Douglas Anderson" <dianders@chromium.org>, "Fabio
 Estevam" <festevam@gmail.com>, "Hui Pu" <Hui.Pu@gehealthcare.com>, "Jagan
 Teki" <jagan@amarulasolutions.com>, "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Jonas
 Karlman" <jonas@kwiboo.se>, "Jonathan Corbet" <corbet@lwn.net>, "Krzysztof
 Kozlowski" <krzk@kernel.org>, "Laurent Pinchart" <Laurent.pinchart@ideasonboard.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>, "Neil
 Armstrong" <neil.armstrong@linaro.org>, "Paul Kocialkowski" <paulk@sys-base.io>, "Pengutronix
 Kernel Team" <kernel@pengutronix.de>, "Robert Foss" <rfoss@kernel.org>, "Sascha
 Hauer" <s.hauer@pengutronix.de>, "Shawn Guo" <shawnguo@kernel.org>, "Simona
 Vetter" <simona@ffwll.ch>, "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>, "Thomas
 Zimmermann" <tzimmermann@suse.de>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

On Fri, 9 May 2025 15:53:48 +0200, Luca Ceresoli wrote:
> devm_drm_put_bridge() is a temporary workaround waiting for the panel
> bridge lifetime rework. Add a TODO entry to not forget it must be removed
> after such rework.
>=20
> Suggested-by: Maxime Ripard <mripard@kernel.org>
>=20
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

