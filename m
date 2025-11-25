Return-Path: <linux-renesas-soc+bounces-25129-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 40DCEC86B59
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Nov 2025 19:54:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id E23393522D3
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Nov 2025 18:54:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96FEA18BBAE;
	Tue, 25 Nov 2025 18:54:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="QrWfddZX";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="t/FnXYSe"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B1DC332EC7
	for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Nov 2025 18:54:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764096865; cv=none; b=ngZ2cFK03K9krChuRDzD2OaavVDRZJIAtGZplHKeYR8tr4P8K3IOtEiAid44f9g2oPI/+sZ0ZzvjHOVNwGfxfkIHjYo9WIVf/69ip9yik2baYgpUt/PmaD7JhRs/ri8I7J4I99yjVpFM8wQG373LFV3IoEbF+92fwE9Uig3ojk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764096865; c=relaxed/simple;
	bh=ZV9loJicxWcKVHqZrYhy9Rd11n0cTqglIUEJbl4oY0k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qnBKrQYwSDiTGYANb0jpcKj+QTXOudNenFR10UkLKlWbTt8jPU2Tgk1psCc1g8hyxmS5T2vhbaHbNWt729Sy7xuo0mf7PgFBx7D+8C5EQXoIHFx/U0Cxmo/LwU6yVkoUqwlJY6JmteCawRlaB8Q8NsgqAufgViRJVHyh9KmxVgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=QrWfddZX; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=t/FnXYSe; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4dGBgd2wjkz9tdV;
	Tue, 25 Nov 2025 19:54:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1764096861;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FcggBhfyoYwFuVXaFI/FvU/3VIn4AeMDtsUY+2IsOQU=;
	b=QrWfddZXaN534uyBkOUWflyaKIPhwhtAvIKRXfnUU7n/Z/TllzK4mRAHa8aKgZTg0pZDw7
	n70Di1goN1Qc3KeHrpKKuT2hSbGOBbzuaab52jLl0bVY0SdcCxKkmln2X6bkUyM2gBlGO8
	Dvj2RzgU/31OCKRTSaax1O8GaPpn1uZ8r5oOSSxZqhPjfZlSKjZMqX30X5ubfSEPM8QrmH
	5WJ1+qsymM9QoRAR4XUqQbd1ys7S4IZ60tqtUF9cMAJnvm13e0c7jAGlD3yQhksbJ7JEpO
	9rbEsZFrA12YONZvNthR70VVeFy/PhQSqBK2Ck9ctVVQlyDFpRuq1ffLb0yb9g==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b="t/FnXYSe";
	spf=pass (outgoing_mbo_mout: domain of marek.vasut@mailbox.org designates 2001:67c:2050:b231:465::202 as permitted sender) smtp.mailfrom=marek.vasut@mailbox.org
Message-ID: <eda256ac-a17c-447e-b452-f13578abbadb@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1764096859;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FcggBhfyoYwFuVXaFI/FvU/3VIn4AeMDtsUY+2IsOQU=;
	b=t/FnXYSeBEs4vd3Bxzc4dTruoew54DP5BJ4YPVTDHi5DdzLJRnmbPUnx+8LuJievWEFVtN
	xfH04YlR/rg9Gk3wS3vmaoSwXvZuI9V5npQLCQQAS7CkpoxLMbklWx94jwYud0xa+zjnB1
	YrulfoTNY/9jpOp/H2PRmKbYpNHfAs1JFG8+C3lmjGNQpshkRh0G07gtnqhaPFoP8jl7aw
	nXxmbPmWYEyC2bHvvlPyy4rDqGQNZ9MBCQKbWI6wMU0196ucZ0rLlrDug4827P6nFUlDJk
	bjs4BAAUb4IqpfrMteXS4cY4rXVhFyU4x3b6M6qhygu/gzks7mW2FkepvGU4qQ==
Date: Tue, 25 Nov 2025 19:54:13 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v4 0/3] drm/atomic-helpers: Fix MCDE/R-Car DU regressions
To: Linus Walleij <linusw@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Aradhya Bhatia <a-bhatia1@ti.com>,
 Dmitry Baryshkov <lumag@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>
References: <20251121-mcde-drm-regression-thirdfix-v4-0-d89bf8c17f85@linaro.org>
 <CAD++jL=_wTX6H1uKEHRf7Ud1EKUEhTxmTRqZtUKZzergx-8knw@mail.gmail.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <CAD++jL=_wTX6H1uKEHRf7Ud1EKUEhTxmTRqZtUKZzergx-8knw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 0bab379abbe31bf2e1f
X-MBO-RS-META: y95uumguexgbmmtmederedqsc389nhbg
X-Rspamd-Queue-Id: 4dGBgd2wjkz9tdV

On 11/25/25 5:13 PM, Linus Walleij wrote:

Hello everyone,

>> This fixes two regressions experienced in the MCDE and
>> R-Car DU DRM drivers after
>> commit c9b1150a68d9362a0827609fc0dc1664c0d8bfe1
>> "drm/atomic-helper: Re-order bridge chain pre-enable and post-disable"
>> caused a series of regressions in all panels that send
>> DSI commands in their .prepare() and .unprepare()
>> callbacks.
>>
>> This series make it possible to selectively bring back the
>> old behaviour with explicit semantics and implements
>> the old behaviour as modified commit tails in MCDE and
>> R-Car DU.
> 
> So what's the take on this patch series?
> 
> Maxime: is this what you had in mind? Acked-by?
> 
> Marek: do you think you have an opportunity to test this on the R-Car DU?

I'm sorry, I admittedly was happy that Tomi took over and I could focus 
on other topics. Now, I tested this series on R-Car V4H Retronix Sparrow 
Hawk board with RPi 7" Display 2 with ILI9881C controller, on current 
next-20251125 . For this series:

Tested-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Thank you for taking care of this and your hard work !

