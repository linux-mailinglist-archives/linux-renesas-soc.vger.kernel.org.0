Return-Path: <linux-renesas-soc+bounces-19796-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DD68B16956
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 31 Jul 2025 01:41:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BE5E21AA3FA7
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 30 Jul 2025 23:41:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 188ED2367A3;
	Wed, 30 Jul 2025 23:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Ow5qj7gp"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8E97239E62;
	Wed, 30 Jul 2025 23:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753918856; cv=none; b=Dt3Ee8Vil6Ov64EkGeMPDmy6uZOrC38CbEQCmDjaSB+R+b3S/Hw7CD4vrf1iAGdvlPxffH4zCB20qmOSY1oTWIsePHvgZQQIdh8MiQ+g4I8HFherOIVs3o3PJqIDm49D0xJT3lyBInQKcfTAMY1JkA3IiHRRDKRlUgkiJbvTawU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753918856; c=relaxed/simple;
	bh=33rNXXW9vYqYkokubantGjlKR/SIZGVYC+vRTBBOvng=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hK7lx/p3SINza+pgOYroaIruyNLqNdxbKvrZztabo+PSXss/++gLeaDl6Iu3W5pzeN+EAz1dpk7rt9fWMptCFV/kDe5niZ9OBG4DSitlvV+eThwBmDD0UeRMrhxXgixjYptlMUadEeCPm2mwwSCyFS1S27phw8ZHigyvCZ/yWPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Ow5qj7gp; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1410F43287;
	Wed, 30 Jul 2025 23:40:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1753918852;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QqnwsuSVW+Zc6odCI1ubD6YTo4yiAv9G49pZqEdYqro=;
	b=Ow5qj7gpCXgfzWi+zE2mEyfAc8GzysbWeACMEqdMthjF77PiQp55qhScEROQwA/Setn8qJ
	nPK5QTCuQQCQzSdpfHmxz4lTI/sjrOrYYNI/w0Ysdhc93ZW/ZHgN+o0eIWO21R/PD3PxUY
	NSzaDWrQ4K4Odx2HFaX1Damz07U6tNmDTatstkoY4S2Jzd/w0lefcJehhKbXyFazCHRWa9
	6akoRD9+16kt/YPOefIOFAlSQ7y3JXAQ9jJkU1zwjivBjUGJFkUgbSCdDcoj4sHgGY035Q
	reYYfMGDs0DZSZaTcrIraAJYartPIlmjSX0BUnoIfdmbXdpqmctnN9sfnq5TBg==
Date: Thu, 31 Jul 2025 01:40:50 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: linux-renesas-soc@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Frank Li <Frank.Li@nxp.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-hardening@vger.kernel.org, linux-i3c@lists.infradead.org,
	Magnus Damm <magnus.damm@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Subject: Re: [PATCH v5 0/4] i3c: add support for the Renesas controller
Message-ID: <175391871299.1768453.15692596004990762400.b4-ty@bootlin.com>
References: <20250724094146.6443-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250724094146.6443-1-wsa+renesas@sang-engineering.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdelledvkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomheptehlvgigrghnughrvgcuuegvlhhlohhnihcuoegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeijeefhfffkeejueehveeuveejvdelveejteduffehuedtffdufeejudffuedvtdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemvgdtrgemvdgumeeifeejtdemudgvfeefmehfledvleemhegvsgekmeduudegfeenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepihhnvghtpedvrgdtudemvgdtrgemvdgumeeifeejtdemudgvfeefmehfledvleemhegvsgekmeduudegfedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudehpdhrtghpthhtoheplhhinhhugidqrhgvnhgvshgrshdqshhotgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopeifshgrodhrvghnvghsrghssehsr
 ghnghdqvghnghhinhgvvghrihhnghdrtghomhdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepuggvvhhitggvthhrvggvsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohephfhrrghnkhdrnfhisehngihprdgtohhmpdhrtghpthhtohepghgvvghrthdorhgvnhgvshgrshesghhlihguvghrrdgsvgdprhgtphhtthhopehguhhsthgrvhhorghrsheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhgvvghssehkvghrnhgvlhdrohhrgh
X-GND-Sasl: alexandre.belloni@bootlin.com

On Thu, 24 Jul 2025 11:41:39 +0200, Wolfram Sang wrote:
> Detailed changes since v4 are described in the individual patches. A
> branch with enablement patches for RZ/G3S+G3E can be found here:
> 
> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/g3s/i3c
> 
> Old coverletter:
> 
> [...]

Applied, thanks!

[1/4] i3c: Standardize defines for specification parameters
      https://git.kernel.org/abelloni/c/9c0609d685b2
[2/4] i3c: Add more parameters for controllers to the header
      https://git.kernel.org/abelloni/c/8acf1f3bae1e
[3/4] dt-bindings: i3c: Add Renesas I3C controller
      https://git.kernel.org/abelloni/c/94e611b5b9ef
[4/4] i3c: master: Add basic driver for the Renesas I3C controller
      https://git.kernel.org/abelloni/c/d028219a9f14

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

