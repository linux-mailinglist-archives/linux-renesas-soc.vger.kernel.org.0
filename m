Return-Path: <linux-renesas-soc+bounces-14450-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 01181A64657
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Mar 2025 09:55:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F31D63A90AA
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Mar 2025 08:55:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3688421D3F2;
	Mon, 17 Mar 2025 08:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="F1srN8GY"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B27AF220680;
	Mon, 17 Mar 2025 08:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742201720; cv=none; b=RLmaG3xuLaCa2htlKzXhXitGiGv7LY1bcndGnLDRoj0hr/vsXe4OJRKnEv8O5PqlhMgyvSgCtbnZzK0e0WtDESmepvwZoQTTDYX1KVhNlfuJEpCPIl9OHXXU9Z0kfp4zAgiW10wfU8enciufzHc4sFofPX7Akt4cmQ9gIv1HsWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742201720; c=relaxed/simple;
	bh=vtb1sSBAcfXvY1uG5Q7s9tt2E94rmTRsRCzvhzT17jI=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=uhr5FHylr6CZrIf33CKfHDcmrhQB8yiFWDstrb0Kc/enZtqkKH3x2JlIwwYg1IFkvBmJYQuxn0uNlFR4WQeG3n/qJJWJ9nTQJsVd4R/79qPxM/r2f9xu+lJmOvJRuUaWwJXcZVwunqJR7gAM7J8aVjDSsTNU1cvi2fACpFEpWSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=F1srN8GY; arc=none smtp.client-ip=217.70.183.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5E42543216;
	Mon, 17 Mar 2025 08:55:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1742201715;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vtb1sSBAcfXvY1uG5Q7s9tt2E94rmTRsRCzvhzT17jI=;
	b=F1srN8GYEp+gYJXJpYy4OspDS2GleijS10oUVAdNFalNgsdIn+uCy1osakETgMKxo6qh7z
	zdJnuiL1DF2B0bi9hOOuX67taM+ye96g0BEGqwOKt+nGGJRreHp9Bsf8c4zhIxJtDOvyTh
	IdM3shVvD7ZwUsVehX/cSWpIrDpGFs/TkTxqSuBkgdTcoWcIkze999uk25j/eKojm3UfbM
	vJv8R3nHrvvrirv6JZ5HzbIFIzz/hU+RWQGtIycQUCQTyCSbZ2GdlyAa8SNBTgiUUWguNY
	tW/7LVSfm1D4Or9fX9BsFdZMxXt3JHphWVvAgLgb73QpPsPLi0dBLQ/Hbxr4qA==
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 17 Mar 2025 09:55:13 +0100
Message-Id: <D8IEYQ1JUKWF.2PH24V7F92OYT@bootlin.com>
Subject: Re: [PATCH v3] ARM: dts: r9a06g032: add r9a06g032-rzn1d400-eb board
 device-tree
From: "Thomas Bonnefille" <thomas.bonnefille@bootlin.com>
To: "Wolfram Sang" <wsa+renesas@sang-engineering.com>
Cc: "Geert Uytterhoeven" <geert+renesas@glider.be>, "Magnus Damm"
 <magnus.damm@gmail.com>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>,
 =?utf-8?q?Miqu=C3=A8l_Raynal?= <miquel.raynal@bootlin.com>,
 <linux-renesas-soc@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?=
 <clement.leger@bootlin.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250314-rzn1d400-eb-v3-1-45c4fd3f6e01@bootlin.com>
 <Z9R9IHyXK0TBcPZa@shikoro>
In-Reply-To: <Z9R9IHyXK0TBcPZa@shikoro>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddufeeltdelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpegggfgtfffkuffhvfevofhfjgesthhqredtredtjeenucfhrhhomhepfdfvhhhomhgrshcuuehonhhnvghfihhllhgvfdcuoehthhhomhgrshdrsghonhhnvghfihhllhgvsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeekvdehudejfeejlefhuddvgfejjeegleetieetheegfeevhfeikeduleejieffgfenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehthhhomhgrshdrsghonhhnvghfihhllhgvsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeduvddprhgtphhtthhopeifshgrodhrvghnvghsrghssehsrghnghdqvghnghhinhgvvghrihhnghdrtghomhdprhgtphhtthhopehgvggvrhhtodhrvghnvghsrghssehglhhiuggvrhdrsggvpdhrtghpthhtohepmhgrghhnuhhsrdgurghmmhesghhmrghilhdrtghomhdprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhriihko
 dgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheptghonhhorhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhm
X-GND-Sasl: thomas.bonnefille@bootlin.com

On Fri Mar 14, 2025 at 8:01 PM CET, Wolfram Sang wrote:
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
> Oh, cool! I will definitely test it next week. Thanks a lot!

Hello, thank you very much, I would be really interested to know if the
LEDS on the ethernet port work on the board, as I didn't have the EB but
a similar product with the same SoC.

