Return-Path: <linux-renesas-soc+bounces-33861-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6KE0AoBrKmpVpAMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33861-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 Jun 2026 10:02:08 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D15E466FA7D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 Jun 2026 10:01:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ideasonboard.com header.s=mail header.b=T4vzXzg3;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33861-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33861-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ideasonboard.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 774A032248DE
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 Jun 2026 07:56:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F0393446CE;
	Thu, 11 Jun 2026 07:56:33 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7FCB355057
	for <linux-renesas-soc@vger.kernel.org>; Thu, 11 Jun 2026 07:56:31 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781164593; cv=none; b=aB+Oc4EmocQmewc0WvdNuPYrm9Nlmp8RtgKHz54a6huC9VfqFrZvTJIvlw4BVTLwtL6rlAmdQPzDCnvrznfLpH17oDuhEQz6QoOKfL/eSAQ6GQ+hxEq3Q/bBpTCOZWMX46ZPQrZIQU3rLOCcwMvwsdhfVUYlDZtCDZBUXjvFmVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781164593; c=relaxed/simple;
	bh=QkMxJVv5RNjTeesSINsxfa55tjcPiIQrQEaY+ggrTNU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UpWSHnP0Nju8WhYKxG/aa/xeqqmQdRmXGBQFsYxpgO1OHQbnvier8gwwigyV0AdSvA5iC88irYU6luYAMZYQJLcOgmBTeABb4VxUUklZqRhpcILIkX2jxINjzVg8PeIOMjr4go8HtGEvAz4E0ip6fKbcodkCQoZ0yUW5AFzdIYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=T4vzXzg3; arc=none smtp.client-ip=213.167.242.64
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 681D59D1;
	Thu, 11 Jun 2026 09:55:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1781164553;
	bh=QkMxJVv5RNjTeesSINsxfa55tjcPiIQrQEaY+ggrTNU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=T4vzXzg35iMSykaCbXcVa5X5i+jNULm3yLfeipv4KWW7DY2kJBWTX+fGspy4JjU0i
	 gLmJkeTlrsmW8GIIqrEM4y6haeERdbzBeyIke+JO3aRAhbgWvML4ewLN4DUDaSdgmU
	 di7o6q4uUuFmSRh5mWf6OGEUS+vJbF2oAFpCwQvg=
Date: Thu, 11 Jun 2026 10:56:21 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] drm/rcar-du: Drop superfluous spaces after assignments
Message-ID: <20260611075621.GB1758601@killaraus.ideasonboard.com>
References: <80e30578b6dd86664112320616c460c48dbd79f6.1777881435.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <80e30578b6dd86664112320616c460c48dbd79f6.1777881435.git.geert+renesas@glider.be>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[ideasonboard.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,lists.freedesktop.org,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33861-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:geert+renesas@glider.be,m:tomi.valkeinen+renesas@ideasonboard.com,m:kieran.bingham+renesas@ideasonboard.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:dri-devel@lists.freedesktop.org,m:linux-renesas-soc@vger.kernel.org,m:geert@glider.be,m:tomi.valkeinen@ideasonboard.com,m:kieran.bingham@ideasonboard.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER(0.00)[laurent.pinchart@ideasonboard.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	RSPAMD_EMAILBL_FAIL(0.00)[laurent.pinchart.ideasonboard.com:query timed out,laurent.pinchart@ideasonboard.com:query timed out];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D15E466FA7D

Hi Geert,

Thank you for your space-saving efforts.

On Mon, May 04, 2026 at 09:58:23AM +0200, Geert Uytterhoeven wrote:
> There is no need for a double space after an assignment.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
> This started with two instances, and got copied each time support for
> a new SoC was added...
> ---
>  drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c | 20 +++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c
> index 031d07f4508e9762..d9926c24984eb3db 100644
> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c
> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c
> @@ -137,7 +137,7 @@ static const struct rcar_du_device_info rcar_du_r8a774a1_info = {
>  	},
>  	.num_lvds = 1,
>  	.num_rpf = 5,
> -	.dpll_mask =  BIT(1),
> +	.dpll_mask = BIT(1),
>  };
>  
>  static const struct rcar_du_device_info rcar_du_r8a774b1_info = {
> @@ -168,7 +168,7 @@ static const struct rcar_du_device_info rcar_du_r8a774b1_info = {
>  	},
>  	.num_lvds = 1,
>  	.num_rpf = 5,
> -	.dpll_mask =  BIT(1),
> +	.dpll_mask = BIT(1),
>  };
>  
>  static const struct rcar_du_device_info rcar_du_r8a774c0_info = {
> @@ -196,7 +196,7 @@ static const struct rcar_du_device_info rcar_du_r8a774c0_info = {
>  	},
>  	.num_lvds = 2,
>  	.num_rpf = 4,
> -	.lvds_clk_mask =  BIT(1) | BIT(0),
> +	.lvds_clk_mask = BIT(1) | BIT(0),
>  };
>  
>  static const struct rcar_du_device_info rcar_du_r8a774e1_info = {
> @@ -227,7 +227,7 @@ static const struct rcar_du_device_info rcar_du_r8a774e1_info = {
>  	},
>  	.num_lvds = 1,
>  	.num_rpf = 5,
> -	.dpll_mask =  BIT(1),
> +	.dpll_mask = BIT(1),
>  };
>  
>  static const struct rcar_du_device_info rcar_du_r8a7779_info = {
> @@ -385,7 +385,7 @@ static const struct rcar_du_device_info rcar_du_r8a7795_info = {
>  	},
>  	.num_lvds = 1,
>  	.num_rpf = 5,
> -	.dpll_mask =  BIT(2) | BIT(1),
> +	.dpll_mask = BIT(2) | BIT(1),
>  };
>  
>  static const struct rcar_du_device_info rcar_du_r8a7796_info = {
> @@ -416,7 +416,7 @@ static const struct rcar_du_device_info rcar_du_r8a7796_info = {
>  	},
>  	.num_lvds = 1,
>  	.num_rpf = 5,
> -	.dpll_mask =  BIT(1),
> +	.dpll_mask = BIT(1),
>  };
>  
>  static const struct rcar_du_device_info rcar_du_r8a77965_info = {
> @@ -447,7 +447,7 @@ static const struct rcar_du_device_info rcar_du_r8a77965_info = {
>  	},
>  	.num_lvds = 1,
>  	.num_rpf = 5,
> -	.dpll_mask =  BIT(1),
> +	.dpll_mask = BIT(1),
>  };
>  
>  static const struct rcar_du_device_info rcar_du_r8a77970_info = {
> @@ -502,7 +502,7 @@ static const struct rcar_du_device_info rcar_du_r8a7799x_info = {
>  	},
>  	.num_lvds = 2,
>  	.num_rpf = 5,
> -	.lvds_clk_mask =  BIT(1) | BIT(0),
> +	.lvds_clk_mask = BIT(1) | BIT(0),
>  };
>  
>  static const struct rcar_du_device_info rcar_du_r8a779a0_info = {
> @@ -523,7 +523,7 @@ static const struct rcar_du_device_info rcar_du_r8a779a0_info = {
>  		},
>  	},
>  	.num_rpf = 5,
> -	.dsi_clk_mask =  BIT(1) | BIT(0),
> +	.dsi_clk_mask = BIT(1) | BIT(0),
>  };
>  
>  static const struct rcar_du_device_info rcar_du_r8a779g0_info = {
> @@ -544,7 +544,7 @@ static const struct rcar_du_device_info rcar_du_r8a779g0_info = {
>  		},
>  	},
>  	.num_rpf = 5,
> -	.dsi_clk_mask =  BIT(1) | BIT(0),
> +	.dsi_clk_mask = BIT(1) | BIT(0),
>  };
>  
>  static const struct rcar_du_device_info rcar_du_r8a779h0_info = {

-- 
Regards,

Laurent Pinchart

