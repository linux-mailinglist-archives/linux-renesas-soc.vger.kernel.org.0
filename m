Return-Path: <linux-renesas-soc+bounces-6483-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A2EAE90E6E6
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Jun 2024 11:24:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 40AAAB22262
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Jun 2024 09:24:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 479297FBBF;
	Wed, 19 Jun 2024 09:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Qn/DeSoe"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D75C7D07F;
	Wed, 19 Jun 2024 09:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718789081; cv=none; b=GnBt5ECRMrBg42y7715SCnhDFn2NVuKz8sqiRBW0S700D1zCW6w5+/1M43I2lQ0LsV5UxD7/Ixhe/IftTBwudYyUotsbyp08iKOGkjEjSd9+wddk6HyWKbhnNdloNtWs+Q556Ev0WL/cY9Q64On7QF2616V4Vxcd4f+LkEaJmN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718789081; c=relaxed/simple;
	bh=h/iCqsrqGKzzT1b99RkG5kUY08OuMh64fA4WZzWOod0=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=s4d2GUw6CbJkAZMRvlg+vFNybPR4lIClK948tL13fYr8yrasEIsq+EVgg/xJ8T4u/BAjZqnYoUBG8YrZXFdiE/2pNDM+x09uZi6eo3wbd4zAscPBwpg9Wir/dzVHJnMiPq/CGzawvAWkwPMuOz1iGi0kdvWpMEsZ31rP7069q+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Qn/DeSoe; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 93C5BF89;
	Wed, 19 Jun 2024 11:24:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1718789059;
	bh=h/iCqsrqGKzzT1b99RkG5kUY08OuMh64fA4WZzWOod0=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=Qn/DeSoe8PsmDvbpU16McoVFN+Hmt76a9BbHc07g1dpyThhFbWcY3vKKxlP3Nj1o+
	 0OrmOGOw8IL5GcTHudXKgMFY741K3xoWjRHmxKMBnJWZQhfMW3vjxE143v7GNnQRFz
	 bPJbPvOVGAGoD+4BuYU4yh6A5OhHhapjZDjsBDPg=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240619075436.86407-1-jiapeng.chong@linux.alibaba.com>
References: <20240619075436.86407-1-jiapeng.chong@linux.alibaba.com>
Subject: Re: [PATCH] drm: Remove unused function rcar_cmm_write
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc: airlied@gmail.com, daniel@ffwll.ch, dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, Abaci Robot <abaci@linux.alibaba.com>
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, laurent.pinchart@ideasonboard.com
Date: Wed, 19 Jun 2024 10:24:34 +0100
Message-ID: <171878907461.2248009.5135990660675548248@ping.linuxembedded.co.uk>
User-Agent: alot/0.10

Quoting Jiapeng Chong (2024-06-19 08:54:36)
> The function are defined in the rcar_cmm.c file, but not called
> elsewhere, so delete the unused function.
>=20
> drivers/gpu/drm/renesas/rcar-du/rcar_cmm.c:35:19: warning: unused functio=
n 'rcar_cmm_read'.

Indeed it's unused.

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=3D9364
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
> ---
>  drivers/gpu/drm/renesas/rcar-du/rcar_cmm.c | 5 -----
>  1 file changed, 5 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_cmm.c b/drivers/gpu/drm=
/renesas/rcar-du/rcar_cmm.c
> index 26a2f5ad8ee5..883b960e9acc 100644
> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_cmm.c
> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_cmm.c
> @@ -32,11 +32,6 @@ struct rcar_cmm {
>         } lut;
>  };
> =20
> -static inline int rcar_cmm_read(struct rcar_cmm *rcmm, u32 reg)
> -{
> -       return ioread32(rcmm->base + reg);
> -}
> -
>  static inline void rcar_cmm_write(struct rcar_cmm *rcmm, u32 reg, u32 da=
ta)
>  {
>         iowrite32(data, rcmm->base + reg);
> --=20
> 2.20.1.7.g153144c
>

