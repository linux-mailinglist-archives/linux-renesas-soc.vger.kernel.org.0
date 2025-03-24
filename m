Return-Path: <linux-renesas-soc+bounces-14772-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DECFA6DD67
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Mar 2025 15:50:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 91D697A7716
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Mar 2025 14:47:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02EB925FA33;
	Mon, 24 Mar 2025 14:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="JKOReL1p"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7293B25E80E;
	Mon, 24 Mar 2025 14:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742827718; cv=none; b=FksDLSUCmSOUAPOKcct5DRqGCtrQ+8V/D1pXwt95fbegBhOkGqH3MLW9a1ahWuGnm+T0zQzI+P6aw7XRFB4s3Xrs4nNVwqROMpfUr0BakUp1lEireM9ecikbi/ybf9tBhgik8+fW/OK1L91uPQfo+leLqSxcuRQ7QY5knqJ03TM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742827718; c=relaxed/simple;
	bh=0grSs5x08IQdUKrzHs7sLbn3Avk0xAcLIWtlrjhBTRU=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=nI8caIt/GKSmPWViuOKseoPRtF1sLgZsiOsZbldO4iQah2hzEvqpIa0mi8E3zQJ8VHlkFL/xUNiK6E5MkssC9gEPA8B2TsYVk5egXa69BpQlRzx4dYYmL9Upd9EPKHX/x0s8ihNy97iYygrAwdQv/UnVLiPNi2JUEiecv/wj3to=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=JKOReL1p; arc=none smtp.client-ip=217.70.183.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 06333443A3;
	Mon, 24 Mar 2025 14:48:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1742827714;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0grSs5x08IQdUKrzHs7sLbn3Avk0xAcLIWtlrjhBTRU=;
	b=JKOReL1pn3fzeFO9886Jc1tGCH4uKD5Z1RtFPBrBz09xB/0/mR3Bd1mRh5+0HNZyPtvqB4
	JzP1KRd5+hGHBVXjtMI7dtvgesXtqjdCdU0ELlQIKgyoV2DTOAMUIsQ3fwhmM9YQHYNiHL
	CprpH2ZaaSwgnh4B0tNdDKEDBg6FVwYliS/xPptpOCyuTCwxwQyXEEGwCpwr3vwwz0K3ic
	1v+eIo/kjZNszyEjkw0BhqdthEgVeFlDQe9x3FZKHu2XV8uwweJTEogKpPPJjO6049U/XU
	HMj1eC1cUqqxiYFQppAVtB85KZ2mn+WyixbhcOahokv1eWFusY4EGTm5rfWIig==
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 24 Mar 2025 15:48:33 +0100
Message-Id: <D8OKV2D4PRVB.1NR12AZOP5ZX0@bootlin.com>
Cc: "Geert Uytterhoeven" <geert+renesas@glider.be>, "Magnus Damm"
 <magnus.damm@gmail.com>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>,
 =?utf-8?q?Miqu=C3=A8l_Raynal?= <miquel.raynal@bootlin.com>,
 <linux-renesas-soc@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?=
 <clement.leger@bootlin.com>
Subject: Re: [PATCH v3] ARM: dts: r9a06g032: add r9a06g032-rzn1d400-eb board
 device-tree
From: "Thomas Bonnefille" <thomas.bonnefille@bootlin.com>
To: "Wolfram Sang" <wsa+renesas@sang-engineering.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250314-rzn1d400-eb-v3-1-45c4fd3f6e01@bootlin.com>
 <Z-FrzyEY-bgvyKvs@shikoro>
In-Reply-To: <Z-FrzyEY-bgvyKvs@shikoro>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduiedttdehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpegggfgtfffkvefuhffvofhfjgesthhqredtredtjeenucfhrhhomhepfdfvhhhomhgrshcuuehonhhnvghfihhllhgvfdcuoehthhhomhgrshdrsghonhhnvghfihhllhgvsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpedvkeelfefftdelleeuvefgleelieeftdfhveduledvhfffveejkefftdegffduheenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehthhhomhgrshdrsghonhhnvghfihhllhgvsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeduvddprhgtphhtthhopeifshgrodhrvghnvghsrghssehsrghnghdqvghnghhinhgvvghrihhnghdrtghomhdprhgtphhtthhopehgvggvrhhtodhrvghnvghsrghssehglhhiuggvrhdrsggvpdhrtghpthhtohepmhgrghhnuhhsrdgurghmmhesghhmrghilhdrtghomhdprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhriihko
 dgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheptghonhhorhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhm
X-GND-Sasl: thomas.bonnefille@bootlin.com

On Mon Mar 24, 2025 at 3:27 PM CET, Wolfram Sang wrote:
> On Fri, Mar 14, 2025 at 07:56:29PM +0100, Thomas Bonnefille wrote:
>> From: Cl=C3=A9ment L=C3=A9ger <clement.leger@bootlin.com>
>>=20
>> The EB board (Expansion board) supports both RZ/N1D and RZ-N1S. Since th=
is
>> configuration targets only the RZ/N1D, it is named r9a06g032-rzn1d400-eb=
.
>> It adds support for the 2 additional switch ports (port C and D) that ar=
e
>> available on that board.
>>=20
>> Signed-off-by: Cl=C3=A9ment L=C3=A9ger <clement.leger@bootlin.com>
>>=20
>> [Thomas moved the dts to the renesas directory and declared the leds in
>> each phy]
>>=20
>> Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
>
> Niklas and I made it and could run all 4 ports of the switch. Leds work,
> too. So, with the whitespace issue fixed.
>
> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Reviewed-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.se=
>
> Tested-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.se>
>
> Thank you for picking up this patch again!

Thank you very much for testing it !

