Return-Path: <linux-renesas-soc+bounces-20406-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CBD99B22847
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Aug 2025 15:23:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6CAFB3A8A56
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Aug 2025 13:18:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EC43276022;
	Tue, 12 Aug 2025 13:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="XotDFpj8"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F2E6275B19
	for <linux-renesas-soc@vger.kernel.org>; Tue, 12 Aug 2025 13:18:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755004701; cv=none; b=WUt56CFvlTn/5CHw6LABaYd0XGUkz2jxmSb5A3abdgzr+QUwuQvxQJSYGHOX+wArTH+giIvU13HSGEfML0fD0QugGelz8xeIFKAvUM/lxDeb1wsX9aye49D6KqHkwp2lNMSPBpGBGn0gVcjWaBdwQyyP2Sdaz53oxQCxjcgZsT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755004701; c=relaxed/simple;
	bh=0qQHOlkougQ4fBmXW9qVusGrHDCSGa3hVR2itJ/ouJg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p3Zijc3t/ON7UQJXPgszURlEnOz93JnpAMFqfJzRt9ByAlQgLqUz/3OJ4tpKktMBzSDcXyn1tq4VFM8LokliIJ3FzybtpTtxL6IAgVRbzXIKxJS+jyWjNWS+uOLDgVkDNNQA6PpjqjjuncP0OlWyIEgNkqMxNdjV46/W6oco4k4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=XotDFpj8; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 427073DC;
	Tue, 12 Aug 2025 15:17:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755004642;
	bh=0qQHOlkougQ4fBmXW9qVusGrHDCSGa3hVR2itJ/ouJg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=XotDFpj8qPJK/REqY+LBeR7zC3T1wXpXEG96zjUQzBS4tLmaK93SdBQXQiRIHk/Dl
	 Y2ay9Xuw3Bk3Z4orTSNj+4mOe2jGFm1rsDJFgixLx5GnFub721I2neK3oRzL6k1Kfg
	 iKRt4TXg8nuABeer+lJIS8XquaSX1J/GuZPVtfuw=
Message-ID: <64b49da6-15ae-45e1-a4af-c1f08f80cf3a@ideasonboard.com>
Date: Tue, 12 Aug 2025 16:18:12 +0300
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] drm/rcar-du: dsi: Remove fixed PPI lane count setup
To: Marek Vasut <marek.vasut+renesas@mailbox.org>,
 dri-devel@lists.freedesktop.org
Cc: David Airlie <airlied@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-renesas-soc@vger.kernel.org
References: <20250608142636.54033-1-marek.vasut+renesas@mailbox.org>
 <20250608142636.54033-3-marek.vasut+renesas@mailbox.org>
Content-Language: en-US
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
In-Reply-To: <20250608142636.54033-3-marek.vasut+renesas@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 08/06/2025 17:24, Marek Vasut wrote:
> The R-Car DSI host is capable of operating in 1..4 DSI lane mode.
> Remove hard-coded 4-lane configuration from PPI register settings
> and instead configure the PPI lane count according to lane count
> information already obtained by this driver instance.
> 
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
>  drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c      | 2 +-
>  drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h | 5 +----
>  2 files changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
> index 7ab8be46c7f6..373bd0040a46 100644
> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
> @@ -576,7 +576,7 @@ static int rcar_mipi_dsi_startup(struct rcar_mipi_dsi *dsi,
>  	udelay(10);
>  	rcar_mipi_dsi_clr(dsi, CLOCKSET1, CLOCKSET1_UPDATEPLL);
>  
> -	ppisetr = PPISETR_DLEN_3 | PPISETR_CLEN;
> +	ppisetr = ((BIT(dsi->lanes) - 1) & PPISETR_DLEN_MASK) | PPISETR_CLEN;
>  	rcar_mipi_dsi_write(dsi, PPISETR, ppisetr);
>  
>  	rcar_mipi_dsi_set(dsi, PHYSETUP, PHYSETUP_SHUTDOWNZ);
> diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h
> index b3e57217ae63..cefa7e92b5b8 100644
> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h
> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h
> @@ -80,10 +80,7 @@
>   * PHY-Protocol Interface (PPI) Registers
>   */
>  #define PPISETR				0x700
> -#define PPISETR_DLEN_0			(0x1 << 0)
> -#define PPISETR_DLEN_1			(0x3 << 0)
> -#define PPISETR_DLEN_2			(0x7 << 0)
> -#define PPISETR_DLEN_3			(0xf << 0)
> +#define PPISETR_DLEN_MASK		(0xf << 0)
>  #define PPISETR_CLEN			BIT(8)

Looks fine, but do you know what the TXSETR register does? It also has
LANECNT, but I don't see the driver touching that register at all.
TXSETR:LANECNT default value is 3 (4 lanes), which matches with the old
hardcoded behavior for PPISETR... So I wonder if that register should
also be set?

 Tomi


