Return-Path: <linux-renesas-soc+bounces-21094-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 92283B3D486
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 31 Aug 2025 19:01:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 499833B9DDD
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 31 Aug 2025 17:01:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A3FC25BF13;
	Sun, 31 Aug 2025 17:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="GOdAHYwx"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 373F71AA1D2;
	Sun, 31 Aug 2025 17:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756659687; cv=none; b=dTYqwRH2ylcomBXTJQnv134XZbct8bYe+mhdw6LFnfhF1g7kdU7AFPYep7cFK5nzdlw9EAyuSk9zWVgqRcgkBeaN2MT5c3qIPbubli20sTLmp5mryxA3CVrFvzzZOCOLPIJPFrRwACIt8+3+8foGiHF3+Op4HYvTJWLAz1Yl13I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756659687; c=relaxed/simple;
	bh=Y5cwQs3NUjRKrMCDoJKbmtxezPYrymGigXfCfSKG6QU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OfGJp121BYFn9g3AgnV1Y6F9+pMfXgDic9uk9vBZ4Acv9c6TbYvAo5LOOFgvvmUDfeTEtLZjHHQJnJnGMbezzkK2LdSNaI666X0RxySaY3BRww6ZxJZb/KVVVXRXgNE9E1UYozSHkOAV9MBpKrweI4//SJsXVBVpvMroLsOo9As=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=GOdAHYwx; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4cFJDq4xWZz9sQK;
	Sun, 31 Aug 2025 19:01:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1756659675;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=A7GEQBYNbyunVEo4I3Gbg8TbyHclBPj4LrGMEV9WsWw=;
	b=GOdAHYwx5DVYCNt6yIcPSCQgXsjMTlMQ716xIOS4auH+7sNDa7zmeg/DHUrPuGvQpU3GUO
	uE5KtO1hyeJ/j715yVwT471kLW2XUtP67Jss9NEjhpD5Bq3XyQPEeu72V8f59ohLB3kobz
	8bsgq1vXaRBynQ6wxIge0sB/GyzcaVo4gyhhdRytIr/JsAgPexUvixbW9JJb6Bb7bvji8R
	P3s037x09d6YW0cYkB258RuQyHzEPlYEDJKwp4bZxZAMUk+pk6WSgyvgMUxQQOrhDNmUz/
	aOeNb9GVZiIRwLO38JGC5SLDhhbb3dm9VnOBk1J8H6jyhWX1WhlwBmoSFGanvA==
Message-ID: <fa0d9882-aadd-49e4-8a39-e0d0c321ecc1@mailbox.org>
Date: Sun, 31 Aug 2025 19:01:09 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2] drm/rcar-du: dsi: Fix 1/2/3 lane support
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
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
 <d1354951-cbd3-4216-970b-e1e130f58522@ideasonboard.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <d1354951-cbd3-4216-970b-e1e130f58522@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 3c0f5edf151ecbf2bbb
X-MBO-RS-META: xcsbqa76psbanfbngsgahm7qji8s7z7d

On 8/14/25 7:54 AM, Tomi Valkeinen wrote:

Hello Tomi,

> On 14/08/2025 00:08, Marek Vasut wrote:
>> Remove fixed PPI lane count setup. The R-Car DSI host is capable
>> of operating in 1..4 DSI lane mode. Remove the hard-coded 4-lane
>> configuration from PPI register settings and instead configure
>> the PPI lane count according to lane count information already
>> obtained by this driver instance.
>>
>> Configure TXSETR register to match PPI lane count. The R-Car V4H
>> Reference Manual R19UH0186EJ0121 Rev.1.21 section 67.2.2.3 Tx Set
>> Register (TXSETR), field LANECNT description indicates that the
>> TXSETR register LANECNT bitfield lane count must be configured
>> such, that it matches lane count configuration in PPISETR register
>> DLEN bitfield. Make sure the LANECNT and DLEN bitfields are
>> configured to match.
>>
>> Fixes: 155358310f01 ("drm: rcar-du: Add R-Car DSI driver")
>> Cc: <stable@vger.kernel.org>
>> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
>> ---
>> Cc: David Airlie <airlied@gmail.com>
>> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
>> Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>> Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>> Cc: Magnus Damm <magnus.damm@gmail.com>
>> Cc: Maxime Ripard <mripard@kernel.org>
>> Cc: Simona Vetter <simona@ffwll.ch>
>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
>> Cc: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
>> Cc: dri-devel@lists.freedesktop.org
>> Cc: linux-renesas-soc@vger.kernel.org
>> ---
>> V2: - Split this out of a series, update commit message, combine from
>>        drm/rcar-du: dsi: Remove fixed PPI lane count setup
>>        drm/rcar-du: dsi: Configure TXSETR register to match PPI lane count
>>      - add Fixes tag, CC stable
>> ---
>>   drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c      | 5 ++++-
>>   drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h | 8 ++++----
>>   2 files changed, 8 insertions(+), 5 deletions(-)
> 
> Reviewed-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Would you like to pick this up via drm-misc , or shall I ?

