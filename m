Return-Path: <linux-renesas-soc+bounces-20482-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A6FFB25B57
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 Aug 2025 07:55:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E8ADE8853C5
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 Aug 2025 05:55:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD80222836C;
	Thu, 14 Aug 2025 05:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="wBUdpOaP"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C827225791;
	Thu, 14 Aug 2025 05:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755150905; cv=none; b=XEuiL+mVf6WNNGKhHEOGVKBvM4J2qwUIWqtf9wyVJ/wXzZdvjOc9YlYEbbqbWw+0Td/OSyjuzSFKmfBaEt7mcapUGhKwTUELyjWOQhv+BWtTwYQVJTTkhqwOa3yJhpqBSm+FJzl+HWAT99wnHgrWP09Ia2Rwj+XGhkUY67jbTxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755150905; c=relaxed/simple;
	bh=G6Z0ufc5WNkKpCSEZu+QYMKhZukGjdwDhLd3PZ7XxTc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FyhCj5YSE4piOQx1vYkEeme3ubI5Pg5Fr5FdD3hUVX88yZEXP8Tp/rFqNRHAHiXNqMwK9orzoc9npD6Ol5ZNaf3yUu2sIlKQYSDf1TQk91BQr2Ekhbzt1rK6sCyYJk92xVRGQ4LnIwD4vvJ0ZhtfRzgMCUAXQiSLV2ZzNbOE2UQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=wBUdpOaP; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id DD11C15B2;
	Thu, 14 Aug 2025 07:54:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755150846;
	bh=G6Z0ufc5WNkKpCSEZu+QYMKhZukGjdwDhLd3PZ7XxTc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=wBUdpOaPkUUQ5CjsWLre9KZuRRMfF5jEprVlnem0TnRBU3Y4fQ7br1nOV0HkcSqVx
	 V6tiDaIetQqh5CEpcRrunZOwPcmCfUawtZEvqjW7M7wP9+/Y3D/5dwiqT+xc2g6LSb
	 M7OKzjyz/Uu5G0WZJFNgmoPUE8Y2vXbedLAezECw=
Message-ID: <d1354951-cbd3-4216-970b-e1e130f58522@ideasonboard.com>
Date: Thu, 14 Aug 2025 08:54:57 +0300
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/rcar-du: dsi: Fix 1/2/3 lane support
To: Marek Vasut <marek.vasut+renesas@mailbox.org>,
 dri-devel@lists.freedesktop.org
Cc: stable@vger.kernel.org, David Airlie <airlied@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-renesas-soc@vger.kernel.org
References: <20250813210840.97621-1-marek.vasut+renesas@mailbox.org>
Content-Language: en-US
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
In-Reply-To: <20250813210840.97621-1-marek.vasut+renesas@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 14/08/2025 00:08, Marek Vasut wrote:
> Remove fixed PPI lane count setup. The R-Car DSI host is capable
> of operating in 1..4 DSI lane mode. Remove the hard-coded 4-lane
> configuration from PPI register settings and instead configure
> the PPI lane count according to lane count information already
> obtained by this driver instance.
> 
> Configure TXSETR register to match PPI lane count. The R-Car V4H
> Reference Manual R19UH0186EJ0121 Rev.1.21 section 67.2.2.3 Tx Set
> Register (TXSETR), field LANECNT description indicates that the
> TXSETR register LANECNT bitfield lane count must be configured
> such, that it matches lane count configuration in PPISETR register
> DLEN bitfield. Make sure the LANECNT and DLEN bitfields are
> configured to match.
> 
> Fixes: 155358310f01 ("drm: rcar-du: Add R-Car DSI driver")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> ---
> Cc: David Airlie <airlied@gmail.com>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Magnus Damm <magnus.damm@gmail.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-renesas-soc@vger.kernel.org
> ---
> V2: - Split this out of a series, update commit message, combine from
>       drm/rcar-du: dsi: Remove fixed PPI lane count setup
>       drm/rcar-du: dsi: Configure TXSETR register to match PPI lane count
>     - add Fixes tag, CC stable
> ---
>  drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c      | 5 ++++-
>  drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h | 8 ++++----
>  2 files changed, 8 insertions(+), 5 deletions(-)

Reviewed-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>

 Tomi


