Return-Path: <linux-renesas-soc+bounces-17378-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 76F99AC0DAC
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 May 2025 16:09:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4E9B51C00308
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 May 2025 14:08:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05DF328DB59;
	Thu, 22 May 2025 14:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="K1dDjXeE"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52DEA28D8F3
	for <linux-renesas-soc@vger.kernel.org>; Thu, 22 May 2025 14:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747922824; cv=none; b=cFYbG4LvY/XbQAA/KUZbUeDymFsBCRD1e/cqxVvPeBWn6nABsBboGf/XKPCs5ZkrSSvBctlhJqVCO2Qmll6tybH2NJhK/SSfxRH0Zy4WiXKDjg6m5jluDBQvx3d4kyg4J2yH51kLabuTKY2peQSYB8Nl2Bh58peF8knrqxdeik0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747922824; c=relaxed/simple;
	bh=Pp+0WI4KVMPMC1aLKziFoXuVm2ds8cB+cqIQ4CFIyMc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U2Rc+Qi/5jSP/S8kvmfVw/frBOeCromOGh9QN8ybCUK+yNTvSXExm7Y4U/qyKAjRPwwe/Ep0uuta9V/SM7OEZc/DBp907Q5SFNo7ZQir1UtfFl02CXJhhUH/QddvTW2DjaKQWf5tH3iRUPODXhakFkXE3iRZH2Km5mx/h5I4TYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=K1dDjXeE; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1C5A6605;
	Thu, 22 May 2025 16:06:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1747922793;
	bh=Pp+0WI4KVMPMC1aLKziFoXuVm2ds8cB+cqIQ4CFIyMc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=K1dDjXeEsU5I7iqBo5TqZyTpd4Y+AP7c+TEDSaP1oGmRaG/2fhPYRQp/vTa7oIRcA
	 sVGb4O/3bjnuROtXV9pbE4nveQJjKbFCzzZIIN3GXgHjztTF8dFmhL9azh1c3iJt9h
	 VR6SpmC3xQNMXU70VUeG0ueLO2/5OIsSkvQFrnxM=
Message-ID: <cdb5ad54-c02a-420d-acf6-c11f39c6c58a@ideasonboard.com>
Date: Thu, 22 May 2025 17:06:52 +0300
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND] drm: renesas: rcar-du: use proper naming for R-Car
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 linux-renesas-soc@vger.kernel.org
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Magnus Damm <magnus.damm@gmail.com>, dri-devel@lists.freedesktop.org
References: <20250522103530.51972-2-wsa+renesas@sang-engineering.com>
Content-Language: en-US
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
In-Reply-To: <20250522103530.51972-2-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 22/05/2025 13:34, Wolfram Sang wrote:
> Not RCAR, but R-Car.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  drivers/gpu/drm/renesas/rcar-du/rcar_du_plane.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_plane.h b/drivers/gpu/drm/renesas/rcar-du/rcar_du_plane.h
> index f9893d7d6dfc..e9e59c5e70d5 100644
> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_plane.h
> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_plane.h
> @@ -16,7 +16,7 @@ struct rcar_du_format_info;
>  struct rcar_du_group;
>  
>  /*
> - * The RCAR DU has 8 hardware planes, shared between primary and overlay planes.
> + * The R-Car DU has 8 hardware planes, shared between primary and overlay planes.
>   * As using overlay planes requires at least one of the CRTCs being enabled, no
>   * more than 7 overlay planes can be available. We thus create 1 primary plane
>   * per CRTC and 7 overlay planes, for a total of up to 9 KMS planes.

Thanks, pushed to drm-misc-next.

 Tomi


