Return-Path: <linux-renesas-soc+bounces-19356-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BCAB2AFBD8D
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Jul 2025 23:33:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9AEBB7ABA59
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Jul 2025 21:31:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D831226B76C;
	Mon,  7 Jul 2025 21:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="eF1H789L"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92BAD1946A0
	for <linux-renesas-soc@vger.kernel.org>; Mon,  7 Jul 2025 21:33:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751923998; cv=none; b=EKemt1Ngme9YObPVRZiVZn8jenYJ1ggbs4IWWq01YmHc9qhPIHNnuRgbXL5eGJdB6hB3r0a0Z4NEbYcPIj78kQKQpYWNGIQRSvpScQx7soz16wD+x5AlN2tp8OqvmpVZausFc1UloewVQT/xvGLo0z5qDVM57c5tBbTj3au6pGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751923998; c=relaxed/simple;
	bh=PGbnedGZWVOQgiRRZ3J85cW93NtsDiSwAYffmiH3lcE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kPJeMpuWHIiXYxIwtile1YsizvUiSDV7qAT7czknW6yAbG4P+JWm5n4CQvfErxy9X5r3G1W5L4MZXMqV9TtYrAO8Gly8xIHdNZy0+IkCvIidviU1XfHpZGej8mTsg6tYQYiGkx17HJm3Q9nUVifueDdtNkHUr1FUE7F55yqY2dk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=eF1H789L; arc=none smtp.client-ip=217.70.183.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0AAF9443A6;
	Mon,  7 Jul 2025 21:33:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1751923988;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wF9T5KF4a/pfoXzVVeDt5eIL0fx4LrdhEcNot282U3Y=;
	b=eF1H789LWdKyEC+U+X7xJH7w2yel2GEAmOnEuf8a4nzwwxmI0pSQtW8j1kitjfKMTa+dWG
	wqs9NS3AXLcMLEy1qc35jR4atw7u1+AXlMDvUM2aNZG8KNI4iTFfRHa53HD6An3lVLDYDW
	bSqu5Dk4/toAlrl7Z9lg2GXPYdxB7BKLORupUUleb1VfiC01vX24i3zJ+DGJnxVgRYktfl
	f85iD5WHdfYdvSvbVhoGlSwQ+93JLOig7Yd55spUMq8ePoMIFWxJY+XoRRcVLskR3KcKZC
	z5DhJMkVFlDM91F9aaDg+Lq/8AHuV0xvXCYZZnUHXDqG3lfe9hQYoxY4rBKjcg==
Date: Mon, 7 Jul 2025 23:33:07 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: linux-renesas-soc@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Frank Li <Frank.Li@nxp.com>, linux-i3c@lists.infradead.org,
	=?utf-8?Q?Przemys=C5=82aw?= Gaj <pgaj@cadence.com>
Subject: Re: [PATCH v3 0/3] i3c: replace ENOTSUPP with SUSV4-compliant
 EOPNOTSUPP
Message-ID: <175192395159.1512350.10952477252278524810.b4-ty@bootlin.com>
References: <20250628192027.3932-5-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250628192027.3932-5-wsa+renesas@sang-engineering.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdefvdekkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomheptehlvgigrghnughrvgcuuegvlhhlohhnihcuoegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeijeefhfffkeejueehveeuveejvdelveejteduffehuedtffdufeejudffuedvtdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemvgdtrgemvdgumeeifeejtdemjeekvgdtmegttdgvkeemvdektdeimeekrggtieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemvgdtrgemvdgumeeifeejtdemjeekvgdtmegttdgvkeemvdektdeimeekrggtiedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohephedprhgtphhtthhopehlihhnuhigqdhrvghnvghsrghsqdhsohgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepfihsrgdorhgvnhgvshgrshesshgrn
 hhgqdgvnhhgihhnvggvrhhinhhgrdgtohhmpdhrtghpthhtohephfhrrghnkhdrnfhisehngihprdgtohhmpdhrtghpthhtoheplhhinhhugidqiheftgeslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehpghgrjhestggruggvnhgtvgdrtghomh
X-GND-Sasl: alexandre.belloni@bootlin.com

On Sat, 28 Jun 2025 21:20:27 +0200, Wolfram Sang wrote:
> Changes since v2:
> 
> * updated commit message again
> 
> This checkpatch warning makes sense here: "ENOTSUPP is not a SUSV4 error
> code, prefer EOPNOTSUPP" We don't have a userspace interface yet, but we
> probably will get one. So, let's convert these error codes now, before
> it will be forgotten in the future, and they could slip through to
> applications.
> 
> [...]

Applied, thanks!

[1/3] i3c: master: replace ENOTSUPP with SUSV4-compliant EOPNOTSUPP
      https://git.kernel.org/abelloni/c/d10a4c323883
[2/3] i3c: dw: replace ENOTSUPP with SUSV4-compliant EOPNOTSUPP
      https://git.kernel.org/abelloni/c/566aebedee37
[3/3] i3c: master: cdns: replace ENOTSUPP with SUSV4-compliant EOPNOTSUPP
      https://git.kernel.org/abelloni/c/8d53c0d645e3

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

