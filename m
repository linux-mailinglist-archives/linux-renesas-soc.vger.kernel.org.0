Return-Path: <linux-renesas-soc+bounces-8161-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E15195CD88
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Aug 2024 15:15:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2B3B0286526
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Aug 2024 13:15:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14DA3186E36;
	Fri, 23 Aug 2024 13:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="rMM0u8aZ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EE9E186612;
	Fri, 23 Aug 2024 13:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724418923; cv=none; b=Fcug7mm2+d3xlc2Tl/rET5w00oYUhtmkCkmxoi23JrMOiANzgna6vS+YRN9oT+OA4kY+h9xAHCmq1gQAWeRHYeUWNItWnvYer5MMAGO7wu5JvURbMnPJm+faf8LaLwj1ibrR9M7tZLDqBlVkfSxAQj25v+8iOI4hwuMQQmycF6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724418923; c=relaxed/simple;
	bh=0J1A20zaaxasXrjQbzzkc87YPheUgUJeOswx8vmbDaQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jq0zceYZUXg1OK3gMw02e2LrUhx/yNUEIYSknbM+eCfkp8c2isKzn1OxpOvTpaYp0zpF633vHejO/6md3AYo7WbK85ag1bTT9D8+FnoOfS2tvkjCnvoD2KRBnwHzJGg/tPTS5kYCK0/JzYNXJW9HBpeLWrQqCsVNymfuh2ug1Cc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=rMM0u8aZ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id DF26A2D5;
	Fri, 23 Aug 2024 15:14:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1724418855;
	bh=0J1A20zaaxasXrjQbzzkc87YPheUgUJeOswx8vmbDaQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rMM0u8aZAbb6nlpTeDOwd9oZ+izXYvVDR76S4mM7MrNiUu7yZu9tUQU0o5Y0yTX5B
	 omLuiCp5ofFltu5hL8Ck1EgPv38qBg3HT7rTZ+QQnrJ8///w3jH9guaoDA3UQot0wb
	 B4B/dO6jostqRTr6ZFTKXzgryA7BLDmNYI/+GuDs=
Date: Fri, 23 Aug 2024 16:15:16 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Conor Dooley <conor+dt@kernel.org>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: Re: [PATCH v4 0/4] Add support for RZ/G2UL Display Unit
Message-ID: <20240823131516.GD26098@pendragon.ideasonboard.com>
References: <20240822162320.5084-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240822162320.5084-1-biju.das.jz@bp.renesas.com>

Hi Biju,

On Thu, Aug 22, 2024 at 05:23:13PM +0100, Biju Das wrote:
> This patch series aims to add support for RZ/G2UL DU.
> 
> The LCD controller is composed of Frame Compression Processor (FCPVD),
> Video Signal Processor (VSPD), and Display Unit (DU).
> 
> The output of LCDC is connected display parallel interface (DPI) and
> supports a maximum resolution of WXGA along with 2 RPFs to support the
> blending of two picture layers and raster operations (ROPs)
> 
> It is similar to LCDC IP on RZ/G2L SoCs, but does not have DSI interface.
> 
> v3->v4:
>  * Restored the ports property for RZ/G2UL and described port@0 for the
>    DPI interface in bindings patch.
>  * Restored tags from Geert and Conor as the change is trivial
>    (Replaced port 1->0 from v2).
>  * Used "&" instead of "==" in rzg2l_du_start_stop() for scalability.
>  * Restored port variable in struct rzg2l_du_output_routing
>  * Updated rzg2l_du_encoders_init() to handle port based on hardware indices.
>  * Restored ports property in du node and used port@0 for connected
>    DPI interface.
> v2->v3:
>  * Split patch series based on subsystem from DU patch series [1].
>  * Replaced ports->port property for RZ/G2UL as it supports only DPI
>    and retained ports property for RZ/{G2L,V2L} as it supports both DSI
>    and DPI output interface.
>  * Added missing blank line before example.
>  * Dropped tags from Conor and Geert as there are new changes in bindings
>  * Avoided the line break in rzg2l_du_start_stop() for rstate.
>  * Replaced port->du_output in  struct rzg2l_du_output_routing and
>    dropped using the port number to indicate the output type in
>    rzg2l_du_encoders_init().
>  * Updated rzg2l_du_r9a07g043u_info and rzg2l_du_r9a07g044_info.
> 
>  [1] https://lore.kernel.org/all/20240709135152.185042-1-biju.das.jz@bp.renesas.com/
> v1->v2:
>  * Updated cover letter header "DU IP->Display Unit".
>  * Updated commit description related to non ABI breakage for patch#3.
>  * Added Ack from Conor for binding patches.
> 
> Biju Das (4):
>   dt-bindings: display: renesas,rzg2l-du: Document RZ/G2UL DU bindings
>   drm: renesas: rz-du: Add RZ/G2UL DU Support

The first two patches look good to me. Do you have access to drm-misc,
will you push them yourself, or do you expect a maintainer to pick them
up ?

>   arm64: dts: renesas: r9a07g043u: Add DU node
>   arm64: dts: renesas: r9a07g043u11-smarc: Enable DU
> 
>  .../bindings/display/renesas,rzg2l-du.yaml    |  32 ++++-
>  arch/arm64/boot/dts/renesas/r9a07g043u.dtsi   |  25 ++++
>  .../boot/dts/renesas/r9a07g043u11-smarc.dts   | 111 ++++++++++++++++++
>  drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c |   8 +-
>  drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c  |  11 ++
>  drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c  |   3 +-
>  6 files changed, 185 insertions(+), 5 deletions(-)

-- 
Regards,

Laurent Pinchart

