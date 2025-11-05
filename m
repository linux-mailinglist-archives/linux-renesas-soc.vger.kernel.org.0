Return-Path: <linux-renesas-soc+bounces-24181-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id B1261C373C0
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 05 Nov 2025 19:00:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 65B77348AEC
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Nov 2025 18:00:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E70E927A900;
	Wed,  5 Nov 2025 18:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="O5/TgQxv"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 552DB2580F9
	for <linux-renesas-soc@vger.kernel.org>; Wed,  5 Nov 2025 18:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762365622; cv=none; b=UvAmtdhc+3tIxJsZF4DhKfXj/rDLlSaLN9RacnvhIyvVCSgVrZSkZQVSHk/oRNtO3nMmCaFelTJqLkZ39plcR29Bh9hVYLjN+bPU2RyG4VOngHj5GX7HJEacN8nRRzuojz34k8vrHCA59wRtHg4hWoYcDumbbzp85mZUf7OFL04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762365622; c=relaxed/simple;
	bh=nz3bISnDxmCHHhZcg+KWGE1EdAp8NDjOQmxD5VzsLgk=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=BMityFsO+2xo+wuZ/hEFa4M67rWBuz+SGz4N0lSUDE1c+UiSlKutfNxHlcj8eYaXQJnP5ZZtm6KK1bCBkbvYj7PgDRWTooSe3rUI+p3XYfbIgzjc3ztpHaiZ70HPJpVDMMLSPlyHRGT+mGPtyuVroei/t2tN/Z7vB92Bph4qcHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=O5/TgQxv; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 928791A18C5;
	Wed,  5 Nov 2025 18:00:17 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5114460693;
	Wed,  5 Nov 2025 18:00:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3AC3F10B50BBB;
	Wed,  5 Nov 2025 19:00:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1762365615; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=xP7Y8koYi9IHWBME2pD01BGWN60oH+3eeZKFFJBDguI=;
	b=O5/TgQxvbOZwMSLzDkfWNh/06f7nw7AFufES2OlcLyo+LXhav7H0gtouWCTedfTcOvNRVi
	01BTge6Ydlbt9mbzFt4n78mvqhMFFOz0x4RvOBjR5B3jYhxjtHMZ9FMR+vRGSDiXP4zXL/
	8gf/0LZXaXk+PbvQRmeQKi3QR/0XVzK+OMDs3Hylpji1e6sLs1spDW7byBkkVHBH0BAokb
	PNkP3WrE1ayorpDfQ07YcUbncyE5ylDRVSUF/4e7e2OhLryXPccy2CAByIYK4ej31VVm4N
	VeEambZXxQ7jTFPeoF4hc9qSkxH5lWYHb8PwoNgsIDZFSwi4Z1Y8AvVruK3+cg==
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 05 Nov 2025 19:00:08 +0100
Message-Id: <DE0YGVJR925W.3HZY4SQ8B7UBQ@bootlin.com>
Cc: "Andrzej Hajda" <andrzej.hajda@intel.com>, "David Airlie"
 <airlied@gmail.com>, "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Jonas
 Karlman" <jonas@kwiboo.se>, "Laurent Pinchart"
 <Laurent.pinchart@ideasonboard.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Neil Armstrong" <neil.armstrong@linaro.org>, "Robert Foss"
 <rfoss@kernel.org>, "Simona Vetter" <simona@ffwll.ch>, "Thomas Zimmermann"
 <tzimmermann@suse.de>, <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH] drm/display: bridge_connector: Assign
 bridge_connector->bridge_hdmi_cec before drmm_connector_hdmi_cec_register()
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
To: "Marek Vasut" <marek.vasut+renesas@mailbox.org>,
 <dri-devel@lists.freedesktop.org>
X-Mailer: aerc 0.20.1
References: <20251103200316.172531-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20251103200316.172531-1-marek.vasut+renesas@mailbox.org>
X-Last-TLS-Session-Version: TLSv1.3

Hello Marek,

On Mon Nov 3, 2025 at 9:02 PM CET, Marek Vasut wrote:
> Set valid bridge_connector->bridge_hdmi_cec pointer before calling
> possibly calling drmm_connector_hdmi_cec_register(), because
> drmm_connector_hdmi_cec_register() directory calls
> drm_bridge_connector_hdmi_cec_funcs .init callback,
> which does access and use bridge_connector->bridge_hdmi_cec
> and expects a valid pointer there.
>
> Without this fix, on Renesas R-Car E3 R8A77990 , the system
> crashes on NULL pointer dereference.
>
> Fixes: 2be300f9a0b6 ("drm/display: bridge_connector: get/put the stored b=
ridges")
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Thanks for the report!

A fix was committed to drm-misc-next last Monday. It's actually a revert of
the original patch followed by a correct implementation:

  b4027536933f  Revert "drm/display: bridge_connector: get/put the stored b=
ridges"
  13adb8c97846  drm/display: bridge_connector: get/put the stored bridges
  a3f433c57c46  drm/display: bridge_connector: get/put the panel_bridge

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

