Return-Path: <linux-renesas-soc+bounces-8528-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EB569658FE
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 Aug 2024 09:46:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3B4221F26822
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 Aug 2024 07:46:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4926F15C12D;
	Fri, 30 Aug 2024 07:46:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="KkNtioU+"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D5FF7F6;
	Fri, 30 Aug 2024 07:46:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725003964; cv=none; b=r0KoKgs7L4nEWZg6DpqOMpVU4A02E1zVvFBs4NN1MVVu9ZFL6VrqiX7J+d8Gesz2+aWHR46a6EzYQevM6ib6wWMV9O+Xo346r/9dmAUYHDWsfIwSPgFGWT9szFIIwy1KwWfbT1Xw+AqsZXaywyCDv0ACx6ZpIQ1lFc7iHFgkhS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725003964; c=relaxed/simple;
	bh=MBG3deIbw+rMvYu6ZqyReRJigYRReHsdhyGiXcxZ4Cg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TITfu9h3Y9apnE0ozrVy4Sf6vOGRMYS+I/slICLpj1bk79b7tkh2UTzG2gDt6oyQKdfP7GP3qSGnG/sPKQoCFvGrBtUob+YIYpKZWpEm8342q24drAi0h4SgCsgua8Pun/pwx74lP6qplW5Znki4MMpwjc+BPZ2N76sWTKOw3Xo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=KkNtioU+; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 36B771BF209;
	Fri, 30 Aug 2024 07:45:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1725003953;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VpebzrTQoNRUKh5ynrlO5Iu8naFvX7FtDOTwf/qOm4A=;
	b=KkNtioU+WkZU8XZauR1n22NpmH71HFly2u9LmqlUqpZSjxsw4D3GNaQ5b8RXOdRP1vIblG
	1BuAc/S3FaJlaTnMaxMPR0UE6gbAg476eLE/QamnjS9z+uIOF2mwRoIfCgwHv835j1RtvW
	m0zsNyod3wMcqq8cnPB1jN2H1P6rmLDO9HHI5S1UQ/laGZiXm+EjSjV2R6wuv2noboi4nH
	3Pq8Msc6rC+4ul0Zncwyhvt9s65q90WrR6JI+3/LBW8ChufwLbugaEO9c6DU+S+OwMiqoi
	p4PFJKlUzZmlxJsYYFb4y8Su6oy3DiguDX/0m3yFr7XoBLtTPvwInK9gm+PLaw==
Date: Fri, 30 Aug 2024 09:45:49 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, <michal.simek@amd.com>,
 <richard@nod.at>, <vigneshr@ti.com>, <liang.yang@amlogic.com>,
 <neil.armstrong@linaro.org>, <khilman@baylibre.com>,
 <jbrunet@baylibre.com>, <martin.blumenstingl@googlemail.com>,
 <matthias.bgg@gmail.com>, <angelogioacchino.delregno@collabora.com>,
 <heiko@sntech.de>, <mcoquelin.stm32@gmail.com>,
 <alexandre.torgue@foss.st.com>, <wens@csie.org>,
 <jernej.skrabec@gmail.com>, <samuel@sholland.org>, <kees@kernel.org>,
 <gustavoars@kernel.org>, <linux@treblig.org>, <robh@kernel.org>,
 <u.kleine-koenig@pengutronix.de>, <erick.archer@gmx.com>,
 <christophe.jaillet@wanadoo.fr>, <val@packett.cool>,
 <christophe.kerello@foss.st.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-amlogic@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
 <linux-renesas-soc@vger.kernel.org>, <linux-rockchip@lists.infradead.org>,
 <linux-stm32@st-md-mailman.stormreply.com>, <jic23@kernel.org>
Subject: Re: [PATCH -next RESEND 00/10] mtd: Use
 for_each_child_of_node_scoped()
Message-ID: <20240830094549.1c513ba2@xps-13>
In-Reply-To: <c29263ae-89f1-edd7-003a-bd03cdddc821@huawei.com>
References: <20240826094328.2991664-1-ruanjinjie@huawei.com>
	<20240826115213.389acaef@xps-13>
	<f7430f87-88d2-4c08-bc1e-6bb3da4e332c@kernel.org>
	<20240826144917.2c4e202d@xps-13>
	<c29263ae-89f1-edd7-003a-bd03cdddc821@huawei.com>
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

Jinjie,

ruanjinjie@huawei.com wrote on Fri, 30 Aug 2024 14:34:38 +0800:

> On 2024/8/26 20:49, Miquel Raynal wrote:
> > Hi Krzysztof,
> >=20
> > krzk@kernel.org wrote on Mon, 26 Aug 2024 12:19:07 +0200:
> >  =20
> >> On 26/08/2024 11:52, Miquel Raynal wrote: =20
> >>> Hi Jinjie,
> >>>
> >>> ruanjinjie@huawei.com wrote on Mon, 26 Aug 2024 17:43:18 +0800:
> >>>    =20
> >>>> Use scoped for_each_available_child_of_node_scoped() when iterating =
over
> >>>> device nodes to make code a bit simpler.   =20
> >>>
> >>> Why is this a resend ? Did I miss a previous iteration?   =20
> >>
> >> You were not cc-ed on previous iteration. I asked for proper split
> >> between subsystems and sending to maintainers, thus this resend. =20
> >=20
> > Ok. Makes sense, and the patchset looks fine. =20
>=20
> Hi, Miquel,
>=20
> Could this series be merged, thank you!

You've sent this series on Monday, we are Friday. I answered a first
time within 5h and reviewed it within 8h. So that means I will take the
patchset:
- when I have the time to do so
- after several days to give a chance to other to review it as well
- unless someone speaks up against it in a "reasonable time frame"
- unless a robot that parses the patches on the mailing lists complains
  about it (usually within few days, up to a week).

In general, a good rule of thumb is to refrain yourself from pinging
within 2 weeks for non-urgent matters like this series.

Thanks,
Miqu=C3=A8l

