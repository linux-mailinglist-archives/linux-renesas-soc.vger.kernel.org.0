Return-Path: <linux-renesas-soc+bounces-23834-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DAF71C196B8
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Oct 2025 10:41:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 798D6464E73
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Oct 2025 09:40:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9298A2F619D;
	Wed, 29 Oct 2025 09:38:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="qSEUtqdy"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37F26253F39
	for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Oct 2025 09:38:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761730700; cv=none; b=liKlc06o3Npy3NB3VsmZo+eQ7zP9lgKwf5UTTGxLiE8/QBzPQRlXvTQB/HVH9jfo3xsCfGmL6gyHxbkjZ457GMi1C2P0N/+BxFcyfJSYYN2Q04ZtunuV8IDkmaUlGlBiRWP43Xpw4tpoF4PET4djQZbJYzzKqUO/4SdCQbeWIVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761730700; c=relaxed/simple;
	bh=cRIf+e/n3q6TwK3NBgQC1vfGqYEGytuJACJoL4HVTkk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hKM3QvpxxhHuX+sLPkwef9dj4FX38aIPyuCS0b9eIuGX0D+eUO7fIVRskQTj45v7Disu5289wTuFZAWnfJvOFdG1/lFtMGAhRFTJfc25PwWnph1nzV6Ck0av01L8OEgAid3yA0BZ8M5fBCXujhNTZLWAofCHTTCQP3pJVQn6ls0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=qSEUtqdy; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8C3E311DD;
	Wed, 29 Oct 2025 10:36:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1761730581;
	bh=cRIf+e/n3q6TwK3NBgQC1vfGqYEGytuJACJoL4HVTkk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=qSEUtqdymPPbyqmJDUNNfJQowDBQZNd5B1Txsf1N7qdK7qh03E6Mk37iJJl0/p0l0
	 iTxg5X7jYVSpJaHJtiWtjG7Tq+xKFXuNPlMMqB1iE3MGhokk9NPEyMEUoWBY27V0o5
	 q23e1dMbkYlhTdsPx+z+ERdmZoZiyb+g8E7Qgkeo=
Message-ID: <b44112ed-2c41-4e33-953b-8031fd29a97d@ideasonboard.com>
Date: Wed, 29 Oct 2025 11:38:06 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 00/11] drm/rcar-du: dsi: Convert register bits to
 BIT()/GENMASK() macros
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
References: <20251028232959.109936-1-marek.vasut+renesas@mailbox.org>
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Content-Language: en-US
In-Reply-To: <20251028232959.109936-1-marek.vasut+renesas@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 29/10/2025 01:28, Marek Vasut wrote:
> Convert register bits to BIT() macro and bitfields to GENMASK()/FIELD_PREP() macros.
> Most of this patchset is boring mechanical conversion.
> 
> Noteworthy patches are 8 and 9 , those introduce handling of DSI mode flags
> and convert use of DRM_MODE_FLAG_P.SYNC into DRM_MODE_FLAG_N.SYNC, but that
> should not have any adverse effect on existing hardware.
> 
> Marek Vasut (11):
>   drm/rcar-du: dsi: Fix missing parameter in RXSETR_...EN macros
>   drm/rcar-du: dsi: Document TXVMSETR PIXWDTH as bitfield
>   drm/rcar-du: dsi: Document PHTR TESTDOUT as bitfield
>   drm/rcar-du: dsi: Deduplicate mipi_dsi_pixel_format_to_bpp() usage
>   drm/rcar-du: dsi: Clean up VCLKSET register macros
>   drm/rcar-du: dsi: Clean up CLOCKSET1 CLKINSEL macros
>   drm/rcar-du: dsi: Clean up TXVMPSPHSETR DT macros
>   drm/rcar-du: dsi: Respect DSI mode flags
>   drm/rcar-du: dsi: Clean up handling of DRM mode flags
>   drm/rcar-du: dsi: Convert register bits to BIT() macro
>   drm/rcar-du: dsi: Convert register bitfields to GENMASK() macro
> 
>  .../gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c   |  50 ++-
>  .../drm/renesas/rcar-du/rcar_mipi_dsi_regs.h  | 387 +++++++++---------
>  2 files changed, 237 insertions(+), 200 deletions(-)
> 

Thanks, pushed to drm-misc-next.

 Tomi


