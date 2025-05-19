Return-Path: <linux-renesas-soc+bounces-17219-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B6023ABC478
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 May 2025 18:28:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 57263171227
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 May 2025 16:28:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 276E1286D77;
	Mon, 19 May 2025 16:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="QCzgwoSz"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 762AB1DE2A8;
	Mon, 19 May 2025 16:28:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747672094; cv=none; b=UfSibXPO93tLVVb0xDC7+E8VoDOCyc82ZzL+29Mk1RL5gSxAsobvaRauWNSf3iDfqdf5LerblTKLyaKPxnf+u/+/vm/LvSrvlGkWXSpefSsqW1/fYTEuhUk8XqW1N7cOJ8Ywi7ohbESsQeVYQyYedv4HpFtAl8rwl6TrmunijvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747672094; c=relaxed/simple;
	bh=DZ2lBbr/5MJXipV1uIEvkgdTmipyCV0YFj9m8j9Z2e4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=np2NzjwYhvVpNZjEfNFcwS7nVh+9Q1N/dIMYzNX5AYQdrD/YL0Y6QH9KIDdAEImS34bcebkTLQxV73FfbUhffmOng/JWqMeZYKECXGsbhDwpmsgT1LYe0iIobVG7a0+PakgNsOX8oVHYrnTVz8oZMLNgBISW1uWFQ5m/9FPL/ME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=QCzgwoSz; arc=none smtp.client-ip=217.70.183.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7339843959;
	Mon, 19 May 2025 16:28:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1747672084;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6URoQYvkyARkq+de1O/CjFhagN+Qpuz7SPoxi6whFsw=;
	b=QCzgwoSzlGB5vwrvQ1ZVP9ydVTuDYM1OFRB48DoP8doFxQvmyt1ArlNphGXSwLVlmTGkcq
	cRMLQtlcxoLyAkoHP1YycLBl3qb1V8IBZCznf8/L+rhArjrJFFB7d0BdK8F/ZOg4Kiqrur
	fyj2PLk38D5/kiIxX81cSGAPHrdPaK4gnshejSAMrmCkzi1Cn+WD8nhmrqYkEKhcFx1Hyu
	a6ble7i9bBUUhToQe8FeYz0j0gRMwlG/B+mVs980YRqIEbxvN6R2Laj2Ak2zbeMv24cIfa
	Hf1iAMYHvpWzDjjhm/hzaXZOSYr8jwqI0WGWclrbf5Q2AMdB7FO68ttgUNVg7Q==
Date: Mon, 19 May 2025 18:28:01 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 linux-renesas-soc@vger.kernel.org, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Alim
 Akhtar <alim.akhtar@samsung.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH 1/7] arm64: dts: exynos: use proper node names for GPIO
 based I2C busses
Message-ID: <20250519182801.09263bd3@bootlin.com>
In-Reply-To: <e5a3ce2b-4ebe-44c9-9bf5-9f460d5e7fe8@kernel.org>
References: <20250519121512.5657-1-wsa+renesas@sang-engineering.com>
	<20250519121512.5657-2-wsa+renesas@sang-engineering.com>
	<006ee7d6-1289-4f4a-819d-9a5e5120db99@kernel.org>
	<aCtD7BH5N_uPGkq7@shikoro>
	<3f6e1b74-5d19-4194-b98b-91ab6f10446c@kernel.org>
	<aCtK1-Yn6u8-n8mU@shikoro>
	<e5a3ce2b-4ebe-44c9-9bf5-9f460d5e7fe8@kernel.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefvddukeeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtkeertdertdejnecuhfhrohhmpefjvghrvhgvucevohguihhnrgcuoehhvghrvhgvrdgtohguihhnrgessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepveeiffefgeeitdelleeigefhjeelueeuveekveetgeffheeltdekgeduiefggfdvnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhephhgvrhhvvgdrtghoughinhgrsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedutddprhgtphhtthhopehkrhiikheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepfihsrgdorhgvnhgvshgrshesshgrnhhgqdgvnhhgihhnvggvrhhinhhgrdgtohhmpdhrtghpthhtoheplhhinhhugidqrhgvnhgvshgrshdqshhotgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhor
 hhgpdhrtghpthhtoheptghonhhorhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrlhhimhdrrghkhhhtrghrsehsrghmshhunhhgrdgtohhmpdhrtghpthhtohepuggvvhhitggvthhrvggvsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: herve.codina@bootlin.com

On Mon, 19 May 2025 18:11:29 +0200
Krzysztof Kozlowski <krzk@kernel.org> wrote:

> On 19/05/2025 17:14, Wolfram Sang wrote:
> >   
> >> ... so clearly the suffix is "-foo" or "-0", as we usually prefer. This
> >> should be replaced into i2c-X, by dropping "gpio", instead of using less
> >> favored suffixing (one without -).  
> > 
> > Hmm, I can't automate this because it will then need to be aligned with
> > the bus numbering of other existing non-GPIO-busses. Which is highly
> > individual per board. That means we need to drop this series?  
> 
> I think either we use i2c-X or commit 57138f5b8c92 ("schemas: i2c: Avoid
> extra characters in i2c nodename pattern") from Herve was not correct
> and needs to be fixed.
> 

I don't know if relevant for this case but Rob did the fix
  647181a ("schemas: i2c: Allow for 'i2c-.*' node names")
on top of my commit.

Best regards,
Hervé

