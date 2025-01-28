Return-Path: <linux-renesas-soc+bounces-12646-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 27AB8A20911
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Jan 2025 11:56:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 601D33A2EDA
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Jan 2025 10:56:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F2BF19E98D;
	Tue, 28 Jan 2025 10:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="L1hr0C/n"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAE2019E965;
	Tue, 28 Jan 2025 10:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738061787; cv=none; b=urNdd7C85WSNLNy1I2n3JXTILDp+DRq67EaYHHHAyLxvItlUDW5iIFH9JO2n0/T24sqUWbnnHs7Kc8vtoPRzTtywRkC00kYzgBXHb/ABQQH9WoIKUC/h0y41MK0AMty9J9SmmLbyxTOhKDmXInM6vwnJZrkA6KruTCE/alhKIjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738061787; c=relaxed/simple;
	bh=FoU1Bn2fATcpBi0/ZF4ZzVjOlm3v0fAt6pCwFUvlt2w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U2NQYkxiH75t/gv9WQorvACOkv9OO8OXnMsDCBxYki+vNi9uBn5HnJoS889k7tAroRbda8voizKtvKmL2ZhTvRFAQcDtp1sKfOdWSYKRuhqU4p6wD0sf/wrgrbalqx9+8vi5XSCdpahdCetJrF83iwzAD/1tlX2ovFN0eh7xu/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=L1hr0C/n; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 968EC6DF;
	Tue, 28 Jan 2025 11:55:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1738061716;
	bh=FoU1Bn2fATcpBi0/ZF4ZzVjOlm3v0fAt6pCwFUvlt2w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=L1hr0C/nku3UQfyc+n71GfVy68QOpkXUcTJnmma5QpyfmRnHh5uGD1a39L2S//L8F
	 qJTcASuKvE1NLl+CPmLMdmkRKyhqWf9HSeZ6gO02R2O47pS4Lkia86PIYs0Oh+H5CW
	 PBRNeifTryjVn06kSWjTiOPw+ISoBZS+3+oO5RcA=
Date: Tue, 28 Jan 2025 12:56:12 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH] MAINTAINERS: Update drm/rcar-du maintainers
Message-ID: <20250128105612.GC13628@pendragon.ideasonboard.com>
References: <20250128-rcar-du-maintainers-v1-1-c429ca421c52@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250128-rcar-du-maintainers-v1-1-c429ca421c52@ideasonboard.com>

Hi Tomi,

Thank you for the patch.

On Tue, Jan 28, 2025 at 12:28:48PM +0200, Tomi Valkeinen wrote:
> Add myself as drm/rcar-du maintainer. Switch Kieran from a maintainer to
> reviewer.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
> Cc: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  MAINTAINERS | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index ed86d884ee0d..5b1bf5fd56fd 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7760,7 +7760,8 @@ F:	include/uapi/drm/tegra_drm.h
>  
>  DRM DRIVERS FOR RENESAS R-CAR
>  M:	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> -M:	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> +M:	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

Shouldn't this be

M:	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>

? While at it, you can add +renesas to my e-mail address too.

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> +R:	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>  L:	dri-devel@lists.freedesktop.org
>  L:	linux-renesas-soc@vger.kernel.org
>  S:	Supported
> 
> ---
> base-commit: e2a81c0cd7de6cb063058be304b18f200c64802b
> change-id: 20250128-rcar-du-maintainers-34ee66948f04

-- 
Regards,

Laurent Pinchart

