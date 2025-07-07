Return-Path: <linux-renesas-soc+bounces-19357-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D918BAFBDD1
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Jul 2025 23:45:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 874614217DC
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Jul 2025 21:44:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F19A628D8C3;
	Mon,  7 Jul 2025 21:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="eSsjsyDF"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mslow3.mail.gandi.net (mslow3.mail.gandi.net [217.70.178.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFC92288525
	for <linux-renesas-soc@vger.kernel.org>; Mon,  7 Jul 2025 21:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.178.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751924703; cv=none; b=rJUFRYqBARLjtpF2DatOPz9BRtCDig2wCGEuuEn2iOc8UQ61fjERLLJ8YozpdtCVqoAqOTX1BIhEoUaLX6lFNi9kistEzmhX1jBN9jXKyR9/4kZn47hRJW5FNXMbH6mylzfInQuya4BX0Coxb3NrIP2PvPxa2Z5T0i25qLzTudk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751924703; c=relaxed/simple;
	bh=bbVpsaHbOW7H44IEUHyBK2PBmXU/jQa4y8SbKOXuATk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l2MwLYaUOpCZ454xrNKy/9L3hWfobc0eF9Is2XOlSSHb0dHohl/aroPLvR8X4/9Myx+xRX/2b9ZzcmbS+heTmwJ+OpGvjTNWR4pF4CQSs6qlTKxEOwQ8jL1kkGcv74kH3txYgpqgGJ0EGMPk82arvNYoRu5jWyJ4LgKhLFQsQXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=eSsjsyDF; arc=none smtp.client-ip=217.70.178.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::226])
	by mslow3.mail.gandi.net (Postfix) with ESMTP id 88D8058055C
	for <linux-renesas-soc@vger.kernel.org>; Mon,  7 Jul 2025 21:33:03 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DF62544264;
	Mon,  7 Jul 2025 21:32:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1751923975;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9ljSPiguxoKwfPYui8PklE/v9l10zHor4jOjap/p6Yc=;
	b=eSsjsyDFSgYeGgTSOiZy6S8577TyRPkfl7+PAunbIjdgnbBgJFlNQJ2eEaqn/ojtTQFXNy
	TEhwEEcijSP8ax88j16AwartQ5M4pYwm61TqqZKiWEnkSnQimTMq2L/bDsoT2zy8dttmkY
	MiDdphO447Lbbj0SrLO+cr5hqTgSga0aj9Ojg3w+okDhS/5jo+UyTHHJ9dMaftN9FmTSdl
	g+fS6+zQfwS3qleMh6uBzmmBD//Mq6uTmt2Td4aooyjRZ2JaywZwJVC4pndB8r954c4GE4
	umRYNCC1wl661ZqDdsYp5YEHCrxzOs8JjNIV7F4lKZuEX9D8Hg7BjSGlrR2VHA==
Date: Mon, 7 Jul 2025 23:32:54 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: linux-renesas-soc@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Frank Li <Frank.Li@nxp.com>, linux-i3c@lists.infradead.org
Subject: Re: [PATCH] i3c: prefix hexadecimal entries in sysfs
Message-ID: <175192395159.1512350.1764310029044120995.b4-ty@bootlin.com>
References: <20250707115409.73545-2-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250707115409.73545-2-wsa+renesas@sang-engineering.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdefvdekkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomheptehlvgigrghnughrvgcuuegvlhhlohhnihcuoegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeijeefhfffkeejueehveeuveejvdelveejteduffehuedtffdufeejudffuedvtdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemvgdtrgemvdgumeeifeejtdemjeekvgdtmegttdgvkeemvdektdeimeekrggtieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemvgdtrgemvdgumeeifeejtdemjeekvgdtmegttdgvkeemvdektdeimeekrggtiedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgedprhgtphhtthhopehlihhnuhigqdhrvghnvghsrghsqdhsohgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepfihsrgdorhgvnhgvshgrshesshgrn
 hhgqdgvnhhgihhnvggvrhhinhhgrdgtohhmpdhrtghpthhtohephfhrrghnkhdrnfhisehngihprdgtohhmpdhrtghpthhtoheplhhinhhugidqiheftgeslhhishhtshdrihhnfhhrrgguvggrugdrohhrgh
X-GND-Sasl: alexandre.belloni@bootlin.com

On Mon, 07 Jul 2025 13:54:08 +0200, Wolfram Sang wrote:
> Hexadecimal values in sysfs should be prefixed with '0x' like e.g. PCI
> and SCSI already do it. Also ensure the two digit length since BCR and
> DCR are a byte in size.
> 
> 

Applied, thanks!

[1/1] i3c: prefix hexadecimal entries in sysfs
      https://git.kernel.org/abelloni/c/12aa3e0cb0c6

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

