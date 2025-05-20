Return-Path: <linux-renesas-soc+bounces-17255-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 55CD9ABDA59
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 May 2025 15:56:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 897731BA4B3A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 May 2025 13:56:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAC68245019;
	Tue, 20 May 2025 13:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="IS4jLfRB"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 276411922ED;
	Tue, 20 May 2025 13:56:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747749388; cv=none; b=gOSD5Al8uAuCxHoO4L3Z1Nuc79uPCTchbp+qLne3Jh6q8DOxYKozraSRGA4UCc4EokNt9ZjTMoELu9ZENop9va77mEl0uwxnz+jPqPkreai6fp5GLgKuhUIHDAl2F6cCopT+GAMgeu6eYesorr+3mHIgbB89xYRs8tMTJC88BOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747749388; c=relaxed/simple;
	bh=OHmDN00xEkaC4fAUGAlMTkU7bkR+7EGoeEpeS0/TJSY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YjOhT5DvbWzt6C4Xml6HI9nsa2S1t+SkbZ25e6YdNi5AEpY2oFtpX0yopVJiFPNbWLkXQy4somk1L5PQ5eBb/nQrR7kaqqkUn9mumxgbBXMZF3hvpErMGXXSdqGtXqYYg0aoW0B2wqfmcDtf2HS4aVzOJAsvdhNp+/RmkcbE5K0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=IS4jLfRB; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (179.218-130-109.adsl-dyn.isp.belgacom.be [109.130.218.179])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4A1A374C;
	Tue, 20 May 2025 15:56:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1747749364;
	bh=OHmDN00xEkaC4fAUGAlMTkU7bkR+7EGoeEpeS0/TJSY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IS4jLfRBk1h90D8NbD9qWWAITzKI05v0ES/e6kHp0lmQRjoXfrtfmbG0xqUswLBFW
	 TcztWlf60V7mDtyKPy31Cyq4Hk96glNhZkuYsXwZ47iO6Vg/dZYoV+xi+qNJ+ulZBV
	 rE7xF0PqQmYTJHCu+xhEE2RU926Zfa+RDZc24XIg=
Date: Tue, 20 May 2025 15:56:19 +0200
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
Subject: Re: [PATCH v5 02/12] drm: renesas: rz-du: Add support for RZ/V2H(P)
 SoC
Message-ID: <20250520135619.GB13321@pendragon.ideasonboard.com>
References: <20250512182330.238259-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250512182330.238259-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250512182330.238259-3-prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi Prabhakar,

Thank you for the patch.

On Mon, May 12, 2025 at 07:23:20PM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> The LCD controller (LCDC) on the RZ/V2H(P) SoC is composed of Frame
> Compression Processor (FCPVD), Video Signal Processor (VSPD), and
> Display Unit (DU).
> 
> There is one LCDC unit available on the RZ/V2H(P) SoC which is connected
> to the DSI.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
> v4->v5:
> - Added reviewed tag from Biju
> 
> v3->v4:
> - No changes
> 
> v2->v3:
> - No changes
> 
> v1->v2:
> - No changes
> ---
>  drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
> index 5e40f0c1e7b0..e1aa6a719529 100644
> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
> @@ -50,9 +50,20 @@ static const struct rzg2l_du_device_info rzg2l_du_r9a07g044_info = {
>  	}
>  };
>  
> +static const struct rzg2l_du_device_info rzg2l_du_r9a09g057_info = {
> +	.channels_mask = BIT(0),
> +	.routes = {
> +		[RZG2L_DU_OUTPUT_DSI0] = {
> +			.possible_outputs = BIT(0),
> +			.port = 0,
> +		},
> +	},
> +};
> +
>  static const struct of_device_id rzg2l_du_of_table[] = {
>  	{ .compatible = "renesas,r9a07g043u-du", .data = &rzg2l_du_r9a07g043u_info },
>  	{ .compatible = "renesas,r9a07g044-du", .data = &rzg2l_du_r9a07g044_info },
> +	{ .compatible = "renesas,r9a09g057-du", .data = &rzg2l_du_r9a09g057_info },
>  	{ /* sentinel */ }
>  };
>  

-- 
Regards,

Laurent Pinchart

