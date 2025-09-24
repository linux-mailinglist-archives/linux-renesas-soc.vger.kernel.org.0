Return-Path: <linux-renesas-soc+bounces-22270-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C8B5DB98146
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Sep 2025 04:36:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5DCFB1B206C5
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Sep 2025 02:36:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E3E560B8A;
	Wed, 24 Sep 2025 02:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="gc3Jmdsr";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="rwJS4DJt"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C3A0221723
	for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Sep 2025 02:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758681371; cv=none; b=uZXJy3xnatOnkUzB4xzz0alj9CQKTfuXer2g9apML34atIuAgmy94x5BKgVPLlOYmgtwjvqKLo6tD6AQKzrR06ErefuzZecokM4jWYfGM49Y6/34HTrBC0GSwdDjKYtMSFr3LLxbxVRxYZu2kuPJcHq5Bfho04cEF8LBhAUzhbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758681371; c=relaxed/simple;
	bh=9wLJvV2KhvbLPfWz3uHmlKkc/g0v1bo0+2HkygS+bC0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=esIoDyJwpS30aMqyv3bJnfG4gm5+5ik/za+ycoh0RuGy1iWtzAWLpAciXg3SjfwQS/WhD7pXKmpplvlxEd9eobtpgJy6hcWvVGCK5gZ7zTufB+8PMjXQO1GcejfZKgCDcycnKRnBJvLXMgIuyNwq75TeGGxRc6SXBbiuDAT3JOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=gc3Jmdsr; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=rwJS4DJt; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4cWgvT6x3Hz9tcd;
	Wed, 24 Sep 2025 04:36:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1758681366;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1X+b8eYA18qdB9fk9NBLnujBWFMpVGzWKUpTehx56Ho=;
	b=gc3JmdsrXyddjsg5Zf4RDxj8l1eGKhnrf3hOX7eZQ1VBTC0sMEZgWM8sljFJ3oXPQ82PMA
	uN4JRD31DJMDF6+13bc+TQJo31qiPi9UC+RXrJ7HrHJ3XbX+/jotMzsgXys/voGgwuUtdy
	G1ZMNog34OjUgIkeGg6yOwDzPw+xgFzIAV2ELEIyDQxfpIyVv/YEba2gFJpBJnR/AkuIL8
	SWwGNaFfJXKLdfVpHvMLhhbtro3yzGDIURqbXySlN1w2lZEh7Bpdxgwc10lkvdKsNge6NU
	tBQ9TFBNqnhI3kulLgucdI2IPFD4rMJKJholP1j0l6fbnLnrcHuYwD/teIaBlQ==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=rwJS4DJt;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut@mailbox.org designates 2001:67c:2050:b231:465::2 as permitted sender) smtp.mailfrom=marek.vasut@mailbox.org
Message-ID: <ddae2f06-b800-4d21-83ea-f06aa4b1f2ba@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1758681364;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1X+b8eYA18qdB9fk9NBLnujBWFMpVGzWKUpTehx56Ho=;
	b=rwJS4DJtz/frvF5Gb2SFLZhpX7tlSZhncZFeVKmxLc4cZclyMnYXKMyFf+TXc6T50vbBbh
	KSxAPq0LCkJKwSt61Ns8/T/41wgRFQwxiIKNDLlqtSzPWFqquiku2pE7Osq/rQhWK+02CG
	3a0eXa/+jDwR/6o1L3htDYTAHzQpyhvXr0FhQlKU0vGVv4V24KT5DqDSOYttDb7+ykqkTK
	1gWQxLIT5pnPY3/rK4s2t2xxl42DA2dN5AobjdLwZrKwCUu7yQHaIE9hFFQcPIVbPlb3pd
	T4RBFHSIMBDkcT9skuW5v0urrPL+LDP9I16D/tBSmtr5USxmFe4ivv8LxLRKQw==
Date: Wed, 24 Sep 2025 04:36:00 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 7/9] drm/rcar-du: dsi: Clean up handling of DRM mode flags
To: Sebastian Reichel <sebastian.reichel@collabora.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 linux-renesas-soc@vger.kernel.org
References: <20250922185740.153759-1-marek.vasut+renesas@mailbox.org>
 <20250922185740.153759-8-marek.vasut+renesas@mailbox.org>
 <20250923132616.GH20765@pendragon.ideasonboard.com>
 <lzimjanf6sajxusigstmc7lpeujcq63yff5gyw22hh2bnsbt4h@cbpoc3u257wg>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <lzimjanf6sajxusigstmc7lpeujcq63yff5gyw22hh2bnsbt4h@cbpoc3u257wg>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 47e39ff994df550d5a2
X-MBO-RS-META: 8gmtg81t7qda7s5654as69md16zh5nuh
X-Rspamd-Queue-Id: 4cWgvT6x3Hz9tcd

On 9/24/25 3:18 AM, Sebastian Reichel wrote:

Hello Sebastian,

> On Tue, Sep 23, 2025 at 04:26:16PM +0300, Laurent Pinchart wrote:
>> I wonder if the DRM_MODE_FLAG_P[HV]SYNC flags are always the exact
>> opposite of DRM_MODE_FLAG_N[HV]SYNC. It's probably fine to assume that
>> here. A quick grep showed one panel driver setting both the N and P
>> flags (drivers/gpu/drm/panel/panel-sitronix-st7789v.c, see
>> t28cp45tn89_mode, which I assume is a bug - Sebastian, could you check
>> that ?).
> 
> Yeah, it was supposed to be
> 
> static const struct drm_display_mode t28cp45tn89_mode = {
>      ...
>      .flags = DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_NHSYNC
> };
> 
> The driver works with the panel, because the driver defaults to
> DRM_MODE_FLAG_N[HV]SYNC and ignores the related flags, so just the
> DRM_MODE_FLAG_P[HV]SYNC one is applied:
> 
> static int st7789v_prepare(struct drm_panel *panel)
> {
>      ...
> 
> 	if (ctx->info->mode->flags & DRM_MODE_FLAG_PVSYNC)
> 		polarity |= ST7789V_RGBCTRL_VSYNC_HIGH;
> 	if (ctx->info->mode->flags & DRM_MODE_FLAG_PHSYNC)
> 		polarity |= ST7789V_RGBCTRL_HSYNC_HIGH;
> 
>      ...
> }
> 
> Greetings and thanks for the bug report,
Will you send a patch ? If so, please CC me, so I can provide RB.

