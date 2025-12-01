Return-Path: <linux-renesas-soc+bounces-25478-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 36F17C9833C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 01 Dec 2025 17:16:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 0819A4E16AE
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  1 Dec 2025 16:16:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBF1A1E5B60;
	Mon,  1 Dec 2025 16:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VYIvbo3Z"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92210191F98
	for <linux-renesas-soc@vger.kernel.org>; Mon,  1 Dec 2025 16:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764605760; cv=none; b=kr50A/tadXhNCGm2Ny8+9qffIw204verkisKAoN7402XTSYtZL2K+x/j/4bLuInbUQ2hEtPFOHZN6OXCpA2nKN2MzqOPVSYMmghQMSA6Jf1KuQSPxZXljWUzxHckq5lvFsX9KF5dR+fjAqZ8Ksb6B27YpXVzJ65cKS9HWqc1QsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764605760; c=relaxed/simple;
	bh=KMpNii9f1ysxkehwWWbCSPq9fB5hHf3WRe2rpemaKNQ=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=SMo9HdgIxbq4vwLECUZMTAzRJFoFrknWEzmgvaLmIUZRuG97WRtdh6unlZGIHNJ1BxbgCtRYK6PQgZ8pD0v0XJ8yj9W6DXJHP5zokOZV4EayI0Qr2hD7cgr2CFf2ZiSTgifzkvhA9bHeJzxcnzu8D6VouBIzgEYCIOYQCxqEvzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VYIvbo3Z; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A79C3C4CEF1;
	Mon,  1 Dec 2025 16:15:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764605759;
	bh=KMpNii9f1ysxkehwWWbCSPq9fB5hHf3WRe2rpemaKNQ=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=VYIvbo3ZIIexTpOO8p3DxitBrcyDdPAGFgD0rKeooEiuv263cHykr5qHXXyLnb+QB
	 FbqpdNZmFJiFD+EJr5ehGvL+gQ8mcbAOOJWrLCRngPiOaXIKPy46W0iEy+EW4loSA0
	 ZBpmc2NzTpfWeB8oGTVQ/vS7pkTvOhUw8YD/A7JYj+r803ZiZPvLqHz0IVtpM5fy4F
	 rLa8OoFhfe+ts3nazq7wHwaPrPy4loKyi23AvRS8KSgHosEQ3GNE6F5/1aX9BbLGho
	 vdHpKYTXbo+0/s4r923Y0NdOyzZEfxzo34SIGUI16w7dr0O+dWxwt5osjlxMq7dpsV
	 0/I8uLx7V/Phw==
Message-ID: <3fefc78f97adc63c7ce6526049e58133@kernel.org>
Date: Mon, 01 Dec 2025 16:15:56 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Linus Walleij" <linusw@kernel.org>
Subject: Re: [PATCH v5 1/3] drm/atomic-helper: Export and namespace some
 functions
In-Reply-To: <20251130-mcde-drm-regression-thirdfix-v5-1-aed71a32981d@kernel.org>
References: <20251130-mcde-drm-regression-thirdfix-v5-1-aed71a32981d@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org, "Aradhya
 Bhatia" <a-bhatia1@ti.com>, "David Airlie" <airlied@gmail.com>, "Dmitry
 Baryshkov" <lumag@kernel.org>, "Geert Uytterhoeven" <geert+renesas@glider.be>, "Kieran
 Bingham" <kieran.bingham+renesas@ideasonboard.com>, "Laurent Pinchart" <laurent.pinchart+renesas@ideasonboard.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Magnus Damm" <magnus.damm@gmail.com>, "Marek
 Vasut" <marek.vasut+renesas@mailbox.org>, "Maxime Ripard" <mripard@kernel.org>, "Simona
 Vetter" <simona@ffwll.ch>, "Thomas Zimmermann" <tzimmermann@suse.de>, "Tomi
 Valkeinen" <tomi.valkeinen+renesas@ideasonboard.com>, "Tomi Valkeinen" <tomi.valkeinen@ideasonboard.com>
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

On Sun, 30 Nov 2025 13:11:17 +0100, Linus Walleij wrote:
> Export and namespace those not prefixed with drm_* so
> it becomes possible to write custom commit tail functions
> in individual drivers using the helper infrastructure.
> 
> Tested-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

