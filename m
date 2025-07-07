Return-Path: <linux-renesas-soc+bounces-19355-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 41818AFBD8C
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Jul 2025 23:33:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D1533166FD1
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Jul 2025 21:33:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0C30202997;
	Mon,  7 Jul 2025 21:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="hPJqPQwY"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37102287261
	for <linux-renesas-soc@vger.kernel.org>; Mon,  7 Jul 2025 21:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751923985; cv=none; b=QkdeVSI4uOmKUn1KtQlRIm33tIbZ7L2DiZIreT2dUIV8Rf0Tx3Qu6WBqB8WFVYpez7sLa9X9HhhRFZj6kIs6s5Ky42CC31g+yNp3RJr3RGEaK+6YVweCgNiZKQe7R0WOEJBgN8GW285uCflxoAxVI74jn9hyuqiOAMit8NfpwiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751923985; c=relaxed/simple;
	bh=wSompjqmbSEVeAPoQJOD5cAU5q5FQF/ScfMnLgPoXcU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r3gK8G/XWLbtnIwnZEHAp3890QNNvjaSzMztuKEyBqtk+S0KVGRyL2H3Fp7e5923ZacJMia6keCH/cmmkVCyj2IWAqwnKDFtJrQeCSzuXKkZKfVaJl7Jjzq3oTN7+iJ+S9cjUcK3WBariOGj/nFwv8zhO4Vk01g4fZv/fAPhtjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=hPJqPQwY; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id EC08A44509;
	Mon,  7 Jul 2025 21:33:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1751923981;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eBweJfa20t+uTrC0Tbt2Zt8JsHqgLKvN87CrpIsBHwo=;
	b=hPJqPQwYTrlyIjfRu11e+URVh3HjuvfevQZ3QnX3ZjzAKE0g2BN4uSn0TNG6XcL/PyM/48
	FIQ0YqO6PxdRHrS/07ZkYJVCl3WQlzc47/tDBhCkcHHqdeBjxC9LtVtYQJ61/vkW/5OqAB
	H6XwyY5mgFHHHLFn9hC/p5tF1rg0q+3MDSaQatWiekLhvFzUo5vfjCUaheFQpjVC6934Bz
	3Oudi6cfV/uFGxS4QfjlLhdCuUTJW90ZuomkVAZyyCHyBDPARrUC+kFm9y8vYvplEcoEWW
	O+EjFylu+pkFNx9RYcmDZY8vE7GluH+zhTJKIc9Tw6Sf1FGBEpoFe4SGJeVDVA==
Date: Mon, 7 Jul 2025 23:33:00 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: linux-renesas-soc@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Frank Li <Frank.Li@nxp.com>, linux-i3c@lists.infradead.org
Subject: Re: [PATCH v2] i3c: don't fail if GETHDRCAP is unsupported
Message-ID: <175192395158.1512350.481879161267562741.b4-ty@bootlin.com>
References: <20250704204524.6124-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250704204524.6124-1-wsa+renesas@sang-engineering.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdefvdeklecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomheptehlvgigrghnughrvgcuuegvlhhlohhnihcuoegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeijeefhfffkeejueehveeuveejvdelveejteduffehuedtffdufeejudffuedvtdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemvgdtrgemvdgumeeifeejtdemjeekvgdtmegttdgvkeemvdektdeimeekrggtieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemvgdtrgemvdgumeeifeejtdemjeekvgdtmegttdgvkeemvdektdeimeekrggtiedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgedprhgtphhtthhopehlihhnuhigqdhrvghnvghsrghsqdhsohgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepfihsrgdorhgvnhgvshgrshesshgrn
 hhgqdgvnhhgihhnvggvrhhinhhgrdgtohhmpdhrtghpthhtohephfhrrghnkhdrnfhisehngihprdgtohhmpdhrtghpthhtoheplhhinhhugidqiheftgeslhhishhtshdrihhnfhhrrgguvggrugdrohhrgh
X-GND-Sasl: alexandre.belloni@bootlin.com

On Fri, 04 Jul 2025 22:44:32 +0200, Wolfram Sang wrote:
> 'I3C_BCR_HDR_CAP' is still spec v1.0 and has been renamed to 'advanced
> capabilities' in v1.1 onwards. The ST pressure sensor LPS22DF does not
> have HDR, but has the 'advanced cap' bit set. The core still wants to
> get additional information using the CCC 'GETHDRCAP' (or GETCAPS in v1.1
> onwards). Not all controllers support this CCC and will notify the upper
> layers about it. For instantiating the device, we can ignore this
> unsupported CCC as standard communication will work. Without this patch,
> the device will not be instantiated at all.
> 
> [...]

Applied, thanks!

[1/1] i3c: don't fail if GETHDRCAP is unsupported
      https://git.kernel.org/abelloni/c/447270cdb41b

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

