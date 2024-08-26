Return-Path: <linux-renesas-soc+bounces-8282-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 014B195F20A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Aug 2024 14:53:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 340BC1C22BB8
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Aug 2024 12:53:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E215E17BEB0;
	Mon, 26 Aug 2024 12:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="TuaABYt9"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3114176AD7;
	Mon, 26 Aug 2024 12:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724676569; cv=none; b=i2bUVKHfgZaH0qPsx1ju6URhFArImsFtIxB6FhY7ZqDxWTH1Y7X0LH+MY+rqG4hAA2ArBpZ/KY9AeNdSSzyisBSSA4Q37aIPzoMrpp840ugZUZpepXF4UxpxBJpvSrcbTfREMUaQT+tcUkoeZw0FSKyyQwr5On6vrHxw85bn49g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724676569; c=relaxed/simple;
	bh=N41m2J3amIIqE2RrINHZjVH5sMEj09W6hXbE6TIeZGI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=X33kN/Dlevn80PGcfBt70Gkh9mZclo81W6cH78MxifOl4F81K3EFdPRt8tJgdVO3qT95YBM3Ox7BChhoXPys/wSTsF5phE3fYXtDwKG5H8bVVPHTWQpEbS4Rdd0aXhsxB5Wt9yRb2q5hzHi+xFYSJmIaz3kc1vHXmXCLMeamfTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=TuaABYt9; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5285CE000B;
	Mon, 26 Aug 2024 12:49:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1724676565;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ObBjnqqW6wtbIZlueHVko8oEAEz7Tf+NNKHshQIvXFY=;
	b=TuaABYt9EaUhaVwvZITINhU5UiQfZ2Z9oVYPSxs7XRMU/+5Qf8lbMHGiCyxipeHJTx4nbz
	iP3xsCyCt+cFj94Nyhfnotj5mf2CM636QOs6kuy+Z9Hzwf6QaxRh6yjl9CejQhCH791++q
	TOrCicK0NHVf5/WiXth2qSIEKbJg86sK0R9wrTeu1jLIBxNhbX90++nbT/yvQZezJ+74b2
	MiM9oyZqJED6HqZ9tpvrVSNgTn/vSfMNYyNDATv3xq7OxZe39QpNawJO9+emxRJICcwL6M
	di90LueqY4p4LbFpYuo+aKl/PoZBGqtQrr3yvMruosHTsamtEY0jrJNIcK2MfQ==
Date: Mon, 26 Aug 2024 14:49:17 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Jinjie Ruan <ruanjinjie@huawei.com>, michal.simek@amd.com,
 richard@nod.at, vigneshr@ti.com, liang.yang@amlogic.com,
 neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, heiko@sntech.de,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, wens@csie.org,
 jernej.skrabec@gmail.com, samuel@sholland.org, kees@kernel.org,
 gustavoars@kernel.org, linux@treblig.org, robh@kernel.org,
 u.kleine-koenig@pengutronix.de, erick.archer@gmx.com,
 christophe.jaillet@wanadoo.fr, val@packett.cool,
 christophe.kerello@foss.st.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, jic23@kernel.org
Subject: Re: [PATCH -next RESEND 00/10] mtd: Use
 for_each_child_of_node_scoped()
Message-ID: <20240826144917.2c4e202d@xps-13>
In-Reply-To: <f7430f87-88d2-4c08-bc1e-6bb3da4e332c@kernel.org>
References: <20240826094328.2991664-1-ruanjinjie@huawei.com>
	<20240826115213.389acaef@xps-13>
	<f7430f87-88d2-4c08-bc1e-6bb3da4e332c@kernel.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: miquel.raynal@bootlin.com

Hi Krzysztof,

krzk@kernel.org wrote on Mon, 26 Aug 2024 12:19:07 +0200:

> On 26/08/2024 11:52, Miquel Raynal wrote:
> > Hi Jinjie,
> >=20
> > ruanjinjie@huawei.com wrote on Mon, 26 Aug 2024 17:43:18 +0800:
> >  =20
> >> Use scoped for_each_available_child_of_node_scoped() when iterating ov=
er
> >> device nodes to make code a bit simpler. =20
> >=20
> > Why is this a resend ? Did I miss a previous iteration? =20
>=20
> You were not cc-ed on previous iteration. I asked for proper split
> between subsystems and sending to maintainers, thus this resend.

Ok. Makes sense, and the patchset looks fine.

Jinjie, please always include a changelog when you send new versions,
and explanations for a RESEND.

Thanks,
Miqu=C3=A8l

