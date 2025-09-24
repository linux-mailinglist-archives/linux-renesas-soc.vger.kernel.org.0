Return-Path: <linux-renesas-soc+bounces-22253-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DDEFBB97D96
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Sep 2025 02:13:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 91C2D3B98A0
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Sep 2025 00:13:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BEC21C27;
	Wed, 24 Sep 2025 00:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="hXvGrFbX"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C10A186A
	for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Sep 2025 00:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758672784; cv=none; b=XTH5U3z3wF/COtEDaCYO5yJbSDZW6sCEqgS4XHNYC8Kg86vU5//o+ZHryyNlHQMRQpcV24rIe6VD4uNrOcHH7jyQYPgnD0P1KqgxD5F30vXkmv2LE4jWXdd45TO4YgFI78IxiDUf9myO1dPj7XOXHerFDdqbiUuO57Ucgxw8k3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758672784; c=relaxed/simple;
	bh=dIHgnh5BA4ECgg3QV4jV0K4EMBoNkFufTt5XVFxqKms=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QIUBbGt5KIkmsy7AiPq/HmwOFmp9M5Kfujgrb3QgjQe4n8FHdoFYmDvf5BEUl0nQz0RkVBKh5c+lI2uhhoa0JIcYOGmcQZfyj/MicRJ8E+WDlT+wCdTz84AHedDYH5AcH+fXKw3uFQ/OyTEghcyWSlfAIRWJLDv1yefAbhFETKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=hXvGrFbX; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4cWckM3wfFz9v1T;
	Wed, 24 Sep 2025 02:12:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1758672779;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RkwsfrWFijrTMkqrvyuobCGTWoBCwmeED3SJNQLA3xE=;
	b=hXvGrFbXzJlEEYtymgUy0Q5qwceghDt3oVCzViQ0bPvRSta2Y0J/YEx4lvyoCTGWbTyA6P
	OKl5IfSO8PCeBiLTHdWIwRjaP2gxeeKgicXsyG+qQgmqq5/AdrG7ejZkIycqhd8aBwWyYt
	ogsbNzemkad8vUfh3IHsxJPBiz46n2mQBJAfoNk0ojoa1rdNQsC5JW0zPxbGZfyHlZLuL5
	7yY0f6tUnmNRCku6/9KWpRq6Oj2pYBGpdK/X/FKIIgXWKR4php2grGVTTY++qIyvHobkij
	8LhgiMk8bPlARXjtHEkIob4qNBcJYPX8Weia5A3ioyUxT5LkSK1OXzutAtVO4g==
Message-ID: <e4e07d4d-2b9b-4ec5-a013-5415472b12b6@mailbox.org>
Date: Wed, 24 Sep 2025 02:12:56 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 7/9] drm/rcar-du: dsi: Clean up handling of DRM mode flags
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org, David Airlie <airlied@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 linux-renesas-soc@vger.kernel.org, Sebastian Reichel <sre@kernel.org>
References: <20250922185740.153759-1-marek.vasut+renesas@mailbox.org>
 <20250922185740.153759-8-marek.vasut+renesas@mailbox.org>
 <20250923132616.GH20765@pendragon.ideasonboard.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <20250923132616.GH20765@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: zg17zs4tz9g9ko8oyroaodfsnus9cqbw
X-MBO-RS-ID: 97bbbd742b2de6ece61

On 9/23/25 3:26 PM, Laurent Pinchart wrote:
> Hi Marek,

Hello Laurent,

> On Mon, Sep 22, 2025 at 08:55:03PM +0200, Marek Vasut wrote:
>> Introduce TXVMVPRMSET0R_BPP_MASK macro and use FIELD_PREP() to generate
>> appropriate bitfield from mask and value without bitshift, assign this
>> value into vprmset0r. Remove TXVMVPRMSET0R_CSPC_RGB which is never used,
>> replace it with code comment next to TXVMVPRMSET0R_CSPC_YCbCr.
>>
>> Replace (mode->flags & DRM_MODE_FLAG_P.SYNC) test with inverted conditional
>> (mode->flags & DRM_MODE_FLAG_N.SYNC) and bitwise orr vprmset0r with either
> 
> I wonder if the DRM_MODE_FLAG_P[HV]SYNC flags are always the exact
> opposite of DRM_MODE_FLAG_N[HV]SYNC. It's probably fine to assume that
> here.

Maybe not _exact_ opposite.

DRM_MODE_FLAG_P[HV]SYNC set -- devices with HVsync pulse active high
DRM_MODE_FLAG_N[HV]SYNC set -- devices with HVsync pulse active low
Neither flag set -- devices without HVsync pulse, like DE panels or so
Both flags set -- invalid

> A quick grep showed one panel driver setting both the N and P
> flags (drivers/gpu/drm/panel/panel-sitronix-st7789v.c, see
> t28cp45tn89_mode, which I assume is a bug - Sebastian, could you check
> that ?).
This looks like a bug indeed. Also, the ST77xx are DSI-to-TCON chips, 
they directly drive the TFT matrix, I don't think they have a concept of 
sync signal polarity at all.

