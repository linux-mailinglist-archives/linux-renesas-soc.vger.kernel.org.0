Return-Path: <linux-renesas-soc+bounces-21096-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CFA5B3D4B9
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 31 Aug 2025 20:57:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DFB821899B2B
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 31 Aug 2025 18:57:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD5E21DEFDD;
	Sun, 31 Aug 2025 18:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="AyvTp4G8"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1131119755B
	for <linux-renesas-soc@vger.kernel.org>; Sun, 31 Aug 2025 18:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756666644; cv=none; b=U/gMGiaNHrvzTAK0nDSa1zcpgDJzwBLZaS0HtB2RTeXtqutmekqDv4oOKHmwpi8wz62D+D8jsm6h7vm18g0oEwdms4HN228D6fGY2qGbo+2MHlqzM/5Vh6Ag+UF7pl38pRTxopDMqNpuOZjleDOS+3cN3lUQlOJG1jv5oevojXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756666644; c=relaxed/simple;
	bh=4+sKHD764dGadoPWi90JSB9b2LNtcOyqJ7NzfKc7fzY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pcGMc6bcNmaltLgMewvFfGXyZN+aSc3SZv30Z0enCe23O+zSgB2lx816qrrUqYnOHqn1Kvb6ndUgabeaUaiee8yS9VdyQW5L9wOQxnI8Wy8TZljoCUEQtwSTJdkKhmv1c035guWSHg1Cp3bgCGp98D5/pyyfQVujOB8wjnyl0NU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=AyvTp4G8; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4cFLpk2hh9z9t8J;
	Sun, 31 Aug 2025 20:57:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1756666638;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QeaRV7P6N6ZM1GcWf6vERJOPSk2++35V6rxs2DnRh5A=;
	b=AyvTp4G89OnGttTR3iXyrULy12IwhQT/Ic6gQMeQbFoYaopOfJyXhZtBQQz3IT/LsYH8cZ
	8F1QvckPLvpDiWHhrclbAO/rmdMqfcScbC9p38mRYvKyViLS6rMKMrm0LKDnJhLZLtUpls
	39ZtBfzxEz40oOYzCDeEyVW4tZIm9LlJf2Kc09sIjH7cIbe/KzOznr6oCQvY7B+rtlaiv2
	x/hWdDDk0bzmgDenKv14zejUDVuMeXezBnGKpShdmnpUzVCI7YfEuOK/RhnKb6TQ+B1ID1
	QNk0LRCLmFvsO792rzGhp8zi5Y1J6+nMkD434D6zfdvtV8vI5CDI/ADbJEutpg==
Message-ID: <8ec996f2-8c2e-4e81-95da-d466120b9723@mailbox.org>
Date: Sun, 31 Aug 2025 20:57:14 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 4/4] drm/rcar-du: dsi: Implement DSI command support
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
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
 <20250608142636.54033-5-marek.vasut+renesas@mailbox.org>
 <4d0f2b7c-d44c-4dc2-9996-3cbbf3bf68b0@ideasonboard.com>
 <ac748c7e-d367-4569-9d9a-ac424c813f14@mailbox.org>
 <3f0fc2a6-6e12-45ff-a153-71661ddd236d@ideasonboard.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <3f0fc2a6-6e12-45ff-a153-71661ddd236d@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: cxji3839fhxspsfbuwajhgdhtwdzct3a
X-MBO-RS-ID: ccbe6eb40132fc3cf14

On 8/18/25 9:20 AM, Tomi Valkeinen wrote:

Hello Tomi,

>>> If yes, then it might take
>>> much longer until the command can be transferred.
>>
>> Do you know the upper limit , is that one or two frame times ?
> 
> If using DSI video mode and the stream is on, the DSI TX has to
> interleave the commands either to the line blanking or frame blanking.
> Usually this is configurable in the DSI TX (if the chip can do
> interleaving).
> 
> A read command will be the most difficult to interleave, as it takes
> more time with the BTA and reply.
> 
> I think the worst case is one frame delay (next vblank).

I set the timeouts to 50ms, which at 60 Hz refresh should be a bit over 
three frame delays, which should be safe.

>>> If not maybe the
>>> function should return an error if the video stream is enabled.
>>
>> I haven't seen any drivers special casing that, I'd prefer to increase
>> the timeouts. For V3, I'll update the timeout to 50ms , which is about 3
>> frame times.
> 
> If the docs have no word about interleaving the commands and there are
> no related registers, I would guess that it's not supported. If this
> can't be tested, I suggest just returning an error if a command is sent
> while the video is on.
> 
> You should be able to test this, though. E.g. just add a debugfs/sysfs
> file to the panel or dsi tx driver, which does a DSI command, possibly a
> read. See what happens when the video is enabled.

I patched the ili9881c panel and triggered DCS read of its ID via sysfs 
attribute , I could always get valid ID, so I think we are safe here.

[...]

>>>> +    /* Wait a bit between commands */
>>>> +    usleep_range(1000, 2000);
>>>
>>> Why wait and wait a bit between what?
>> The consecutive command transmission was unreliable unless there was a
>> slight delay between the consecutive commands. Hence this delay.
> 
> This sounds like there's a bug in the driver, or the TX or RX hardware.
> Please document the sleep clearly in the comment.
Done.

