Return-Path: <linux-renesas-soc+bounces-17256-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3028AABDAA3
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 May 2025 15:59:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 79EA93BBC1D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 May 2025 13:58:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F2B824337C;
	Tue, 20 May 2025 13:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="irkDxLfo"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A26D7DDA9;
	Tue, 20 May 2025 13:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747749511; cv=none; b=ennp3aD1lPykGzPqFpqSEhb2AwinkdMPBvwwk2dUz2GvLYI1jacUbm2p2onrEq1avi6bWWjnRvYeaTDTX2nhtJ62Sfe551jUhIgVslgixprVO//XiAq8KJztvc8ZXmeqMgVcWU8M0d8vzIFnayfU4zXm2qtDiWWqsSrZ9kgaDTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747749511; c=relaxed/simple;
	bh=cm5wVB1zkoN7qTN0thweIU/9ukqLpIMprRnoqNWzwd0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kAXl81jHSMSsQzkvLR/akUPrRRM7s7GpxjMf8CthR0xADYlqWUNIeH1SFgXMJednkt/Q+Gpyz1VTnw13GVHZU4ZTCs2SXcxdYERcdXXKUB5oz95DZr/foCtrRmtL1G20Gw7JPCi5Jq6vE51GIhZUKYmfowUmbySRv/10hBMvNPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=irkDxLfo; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (179.218-130-109.adsl-dyn.isp.belgacom.be [109.130.218.179])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7E47474C;
	Tue, 20 May 2025 15:58:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1747749486;
	bh=cm5wVB1zkoN7qTN0thweIU/9ukqLpIMprRnoqNWzwd0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=irkDxLfokkR8JHr7+faQlFKUx6GtK4yylbKoAkYPCZMmIA/D/tsQCxCFOYIYcjan9
	 59yA9y/rRUi8eckwercodkDWcQtxGqS9Oe9jE3zFNaQiIQFkqvRNqT/R0z7z/0hd7U
	 q5p4gUp9tqRIO4SnXrNURgGo4u7O/udoVpltWbDk=
Date: Tue, 20 May 2025 15:58:20 +0200
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
Subject: Re: [PATCH v5 03/12] drm: renesas: rz-du: mipi_dsi: Add min check
 for VCLK range
Message-ID: <20250520135820.GC13321@pendragon.ideasonboard.com>
References: <20250512182330.238259-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250512182330.238259-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250512182330.238259-4-prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi Prabhakar,

On Mon, May 12, 2025 at 07:23:21PM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> The VCLK range for Renesas RZ/G2L SoC is 148.5 MHz to 5.803 MHz. Add a

I would write "5.803 MHz to 148.5 MHz" as ranges are usually expressed
in increasing order.

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> minimum clock check in the mode_valid callback to ensure that the clock
> value does not fall below the valid range.
> 
> Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v4->v5:
> - No changes
> 
> v3->v4:
> - No changes
> 
> v2->v3:
> - No changes
> 
> v1->v2:
> - Added reviewed tag from Biju 
> ---
>  drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> index 4550c6d84796..ec8baecb9ba5 100644
> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> @@ -584,6 +584,9 @@ rzg2l_mipi_dsi_bridge_mode_valid(struct drm_bridge *bridge,
>  	if (mode->clock > 148500)
>  		return MODE_CLOCK_HIGH;
>  
> +	if (mode->clock < 5803)
> +		return MODE_CLOCK_LOW;
> +
>  	return MODE_OK;
>  }
>  

-- 
Regards,

Laurent Pinchart

