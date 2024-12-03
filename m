Return-Path: <linux-renesas-soc+bounces-10810-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 96E659E164A
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Dec 2024 09:52:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5C378280ED3
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Dec 2024 08:52:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 841A21DDC26;
	Tue,  3 Dec 2024 08:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="gXvliHOy"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD0841DC734;
	Tue,  3 Dec 2024 08:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733215928; cv=none; b=IO6SQbRH7lzmc5q9oMGTo0Y22pt4Qzl4+sjV+WU3QUVrXIZ3yVjlDsh/LVp/G5F/meiUfEuG1DSAUzzJXKhxUh9txSg3o9j5jXuaKmyH8mgkN+m9Bn5qL7BNPdghWT8H+PQnbNkmSYbjD7A6NToFwQQ6s/+f4JOMFuoG06IDNFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733215928; c=relaxed/simple;
	bh=k/CPAkTCH4GNXfNu6lVPOl9bbkd52/w6hAyXN88j4w4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lW3AnHdcyAUfPHDoRpUHogU9VBr6uMmymifX18E6vplS4coDJyjZvKPnBYg397Z78ThntGKGum4v+FL3s7V52050AXMkN95yiMiVVWCPo37kUhPJzapy4QdpJ9h407pJeJyYNWNsS+y1AAFucxxwwe7Imj/3yChVyEUmWzHN/A8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=gXvliHOy; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id CC0CA8DB;
	Tue,  3 Dec 2024 09:51:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1733215898;
	bh=k/CPAkTCH4GNXfNu6lVPOl9bbkd52/w6hAyXN88j4w4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gXvliHOyMmVoBYe8JEjRWOz/dNjDe1fuhFjNNgdumVKIs8l7gpkffffKNm1VK6Vh1
	 VarE4e6BB8k0y4cqcxkmLDCWlEAUSlU0XbJDjSeY/nmuLJQKQSD1oaHqtQ73ZbE+kM
	 JqzIq+MAYOs80ijIBBtJxWNlEYywnjI0x6hfn+4Q=
Date: Tue, 3 Dec 2024 10:51:53 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, LUU HOAI <hoai.luu.ub@renesas.com>,
	Jagan Teki <jagan@amarulasolutions.com>,
	Sam Ravnborg <sam@ravnborg.org>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Subject: Re: [PATCH 5/9] drm/rcar-du: dsi: Add r8a779h0 support
Message-ID: <20241203085153.GI10736@pendragon.ideasonboard.com>
References: <20241203-rcar-gh-dsi-v1-0-738ae1a95d2a@ideasonboard.com>
 <20241203-rcar-gh-dsi-v1-5-738ae1a95d2a@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241203-rcar-gh-dsi-v1-5-738ae1a95d2a@ideasonboard.com>

Hi Tomi,

Thank you for the patch.

On Tue, Dec 03, 2024 at 10:01:39AM +0200, Tomi Valkeinen wrote:
> From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> 
> Add support for DSI on r8a779h0. As it is identical to DSI on r8a779g0,
> all we need is to handle the compatible string.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
> index 92f4261305bd..36e902601f84 100644
> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
> @@ -1081,6 +1081,8 @@ static const struct rcar_mipi_dsi_device_info v4h_data = {
>  static const struct of_device_id rcar_mipi_dsi_of_table[] = {
>  	{ .compatible = "renesas,r8a779a0-dsi-csi2-tx", .data = &v3u_data },
>  	{ .compatible = "renesas,r8a779g0-dsi-csi2-tx", .data = &v4h_data },
> +	/* DSI in r8a779h0 is identical to r8a779g0 */
> +	{ .compatible = "renesas,r8a779h0-dsi-csi2-tx", .data = &v4h_data },
>  	{ }
>  };
>  

-- 
Regards,

Laurent Pinchart

