Return-Path: <linux-renesas-soc+bounces-17467-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 166A7AC3163
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 24 May 2025 22:51:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C826617CA01
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 24 May 2025 20:51:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8191419AD8B;
	Sat, 24 May 2025 20:51:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="BEhr6zcf"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC1291D47B4
	for <linux-renesas-soc@vger.kernel.org>; Sat, 24 May 2025 20:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748119887; cv=none; b=UM2k/DqTHX3Ne3k/Xwy8LzuZ2rC3tDIo80MXQHVSEBJefOcDAWw7teXO2N5yLOKS0IWrsTJXyHSqPfGnO22ofjssoB3CfekcymZJlTQMVI1HTeteIDOw5hHvqkNNCo75NlMQGEpKrRpYv58pdAFxpaGOOvdr9pXLpcYUkDPHwkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748119887; c=relaxed/simple;
	bh=spowSbFU+ih16yRzshppV04yBGBXT+EalMJBi4pH6ic=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qspqM2F+2sC+oDEVuaxBD14aYBJ+tdJQ1DYjk5dCBi/I47iriQe+ILDxLeTUF5/ZzX/qQye9evnRhr/kYnQV4ZxK3scHeblM7qJWW8laTjuglZKCm/zZR31JlOmoDCEELF0oUE9ZA6X876im+qNH9c1tinEMoOeEdm5kA25n1AA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=BEhr6zcf; arc=none smtp.client-ip=217.70.183.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id BD0FF44395;
	Sat, 24 May 2025 20:51:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1748119877;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Tev4I7axldqOJyE6k/x5JIQl8PwYpJDfk3A9gUlwqNE=;
	b=BEhr6zcf8zg81bLnGA3BfqnhbHMIREPiDUOqGrfcqHEpqzj3seQNk2CS3rJkTnAhiGLdEg
	MBRb4uA2oCPHS2UIIOW+MNkKaRIYUcnLntgsSlqWFRqHuIqhFDaPwfBU1eLc/hPnIJEklU
	nCuO3x7k2SiMOlMg6e6v8Jm9o3HNs7tur9h5BpSEYDf97RZMIpioQEZgiZ39yaGr4i1RTB
	IPgIh/jQaUiX2Bc3+cG2I6mtK4W8/5byquaKHudNTefRtSo5kMM++JIwdRrCioeoZf3CuF
	QQJIjSx5OBiBLICngfLgOzDK5jGCQBp0TXrpGR+8ls41owT17k9NcswvsSwQCQ==
Date: Sat, 24 May 2025 22:51:16 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: linux-renesas-soc@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Frank Li <Frank.Li@nxp.com>, linux-i3c@lists.infradead.org
Subject: Re: [PATCH] i3c: controllers do not need to depend on I3C
Message-ID: <174811981014.1255947.11041838527327968781.b4-ty@bootlin.com>
References: <20250506075247.1545-2-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250506075247.1545-2-wsa+renesas@sang-engineering.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdduvdejtdculddtuddrgeefvddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomheptehlvgigrghnughrvgcuuegvlhhlohhnihcuoegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeijeefhfffkeejueehveeuveejvdelveejteduffehuedtffdufeejudffuedvtdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemvgdtrgemvdgumeeifeejtdemjeekvgdtmegttdgvkeemvdektdeimeekrggtieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemvgdtrgemvdgumeeifeejtdemjeekvgdtmegttdgvkeemvdektdeimeekrggtiedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgedprhgtphhtthhopehlihhnuhigqdhrvghnvghsrghsqdhsohgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepfihsr
 gdorhgvnhgvshgrshesshgrnhhgqdgvnhhgihhnvggvrhhinhhgrdgtohhmpdhrtghpthhtohephfhrrghnkhdrnfhisehngihprdgtohhmpdhrtghpthhtoheplhhinhhugidqiheftgeslhhishhtshdrihhnfhhrrgguvggrugdrohhrgh
X-GND-Sasl: alexandre.belloni@bootlin.com

On Tue, 06 May 2025 09:52:11 +0200, Wolfram Sang wrote:
> The Kconfig file for controller drivers is only sourced if the I3C
> symbol is enabled. No need to check for that in individual drivers.
> 
> 

Applied, thanks!

[1/1] i3c: controllers do not need to depend on I3C
      https://git.kernel.org/abelloni/c/00286d7d643d

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

