Return-Path: <linux-renesas-soc+bounces-17262-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 404ADABDD51
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 May 2025 16:38:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7414D501562
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 May 2025 14:28:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02E48248873;
	Tue, 20 May 2025 14:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="lLOoKyl8"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6194E22AE75;
	Tue, 20 May 2025 14:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747751211; cv=none; b=bpn6H4dPs3uxVaFwXUi8DDAUPWNXdaYQyiBAs339iIQSE1WHh8tUgxwmOMxjsP6wra1CzUWtnXr7vYf28C8ORpu/mEex1ZHxTmE+UHF2YnoF9+nUJMQdXqjJaZD7JLzYQg+wQa2flPLeUB/8ddK7HByzlSuNZwSd2lHjd5s8WE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747751211; c=relaxed/simple;
	bh=w9icpQsgrGNjR6K6qPPXvDTkb5teyRmMFTM80GcS1us=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ui47Cm0qq170XNB8xCn8rRttbx8RxUNF5pFShpR1/EZaAVRQZ8blhix+ZfVgRm8SB7pno5LaWrwS4vq/L7rYsNOjrkjBfA2KKejYUuW5XJFfEkZGUO0pD9wlTMwf1LvUVUFNoBLhjXM0i17EPPAIQg0dogMJe74few/6Uhz85W4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=lLOoKyl8; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (179.218-130-109.adsl-dyn.isp.belgacom.be [109.130.218.179])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6E4752EC;
	Tue, 20 May 2025 16:26:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1747751188;
	bh=w9icpQsgrGNjR6K6qPPXvDTkb5teyRmMFTM80GcS1us=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lLOoKyl8NpCeTZXW2Mq6J4UmQhCiz4Q2tJ3RihwwZCyJp1Vc2yr1n8EqqfA7ylGzV
	 oEUu+jD67QLNt/uDcIFSP65wRMi8rWSrT/zwDeIb6dh8NOfdEOWC9+EBblOZL6iWlm
	 APaNF6NKOT3xQ58nNWNEkEHm8GOyVtERxgaeZ2D4=
Date: Tue, 20 May 2025 16:26:43 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v5 07/12] drm: renesas: rz-du: mipi_dsi: Make "rst" reset
 control optional for RZ/V2H(P)
Message-ID: <20250520142643.GI13321@pendragon.ideasonboard.com>
References: <20250512182330.238259-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250512182330.238259-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250512182330.238259-8-prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi Prabhakar,

On Mon, May 12, 2025 at 07:23:25PM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> In preparation for adding support for the Renesas RZ/V2H(P) SoC, make the
> "rst" reset control optional in the MIPI DSI driver. The RZ/V2H(P) SoC
> does not provide this reset line, and attempting to acquire it using the
> mandatory API causes probe failure.
> 
> Switching to devm_reset_control_get_optional_exclusive() ensures
> compatibility with both SoCs that provide this reset line and those that
> do not, such as RZ/V2H(P).
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
> v4->v5:
> - New patch
> ---
>  drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> index 00c2bc6e9d6c..5fc607be0c46 100644
> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> @@ -748,7 +748,7 @@ static int rzg2l_mipi_dsi_probe(struct platform_device *pdev)
>  	if (IS_ERR(dsi->vclk))
>  		return PTR_ERR(dsi->vclk);
>  
> -	dsi->rstc = devm_reset_control_get_exclusive(dsi->dev, "rst");
> +	dsi->rstc = devm_reset_control_get_optional_exclusive(dsi->dev, "rst");
>  	if (IS_ERR(dsi->rstc))
>  		return dev_err_probe(dsi->dev, PTR_ERR(dsi->rstc),
>  				     "failed to get rst\n");

-- 
Regards,

Laurent Pinchart

