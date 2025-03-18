Return-Path: <linux-renesas-soc+bounces-14560-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 75B9AA66E7F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Mar 2025 09:39:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6854F3B4E44
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Mar 2025 08:38:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 200881FF7CD;
	Tue, 18 Mar 2025 08:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="ljti+raa"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BC0A1993B2;
	Tue, 18 Mar 2025 08:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742287094; cv=none; b=YshanWM+6mJwbcd9ADaZXZmJGAugetQcydBE69MHPeE3UohLrbj1oOjEc3FcWiBnlr0Fg7Kk7xHlfIwmwsG05z9TZCdY/+ebGMHo9XedaIQ8SJLKYo9s8CO18UvF30h3eRvEH/OyCFpklzZt0B4or5je5qN5nJdWTUZ4Q55HKGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742287094; c=relaxed/simple;
	bh=GtWNyQsWaempNqttFpp8AzPaBMJoSwKhswBcUlRoctc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Kuw30mCf7JckiVZOyeJb36bg8CXT/SKyb6HORAo3/AQkJ+3NkLXrjxoOcHYrF35ItWsx9SQN/huhUXkRdrY80auUnt5jTHr+YO3HkF8qgVgdHbrb0Ios99FyyTXMEnjJs9nSvztm3NZgCY6eRo+CNS0ZwWjsHAzFHuid7yZsSMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=ljti+raa; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id A52444455F;
	Tue, 18 Mar 2025 08:38:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1742287090;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GtWNyQsWaempNqttFpp8AzPaBMJoSwKhswBcUlRoctc=;
	b=ljti+raaFnHDAV+96UbL/7JkfOfiFzWILfajEVmKUc6BCpy8ikUc15a299iazQDS5/tVET
	PA/DvnHUARU5Cqfo3d/fNJSc3JDpnjqQsTWbHWkQ45GHfDHbMt7Uq41vCnjPInVEIWiv61
	Ec/wMAkDqjtNVA5HLO8rEm2VbGh1aYyz5ZsNi4Lf65dAF5yWIsLKjmXkEOooXE9mfjDVz5
	4Lkh81VpTth5fRzTGzyXjJWGd+L8xM5YB6zgSBS5op9rL10XE8+pFRdcxG1/gEHsQ2FI2x
	Xo2dJYnLXXeFX1U11Hc8eoXMkCLITcRjUBMKfdMyqXbGozCTwpvFPvgvOne32Q==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,  Magnus Damm
 <magnus.damm@gmail.com>,  Rob Herring <robh@kernel.org>,  Krzysztof
 Kozlowski <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,
  Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
  linux-renesas-soc@vger.kernel.org,  devicetree@vger.kernel.org,
  linux-kernel@vger.kernel.org,  =?utf-8?Q?Cl=C3=A9ment_L=C3=A9ger?=
 <clement.leger@bootlin.com>
Subject: Re: [PATCH v3] ARM: dts: r9a06g032: add r9a06g032-rzn1d400-eb board
 device-tree
In-Reply-To: <20250314-rzn1d400-eb-v3-1-45c4fd3f6e01@bootlin.com> (Thomas
	Bonnefille's message of "Fri, 14 Mar 2025 19:56:29 +0100")
References: <20250314-rzn1d400-eb-v3-1-45c4fd3f6e01@bootlin.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Tue, 18 Mar 2025 09:38:08 +0100
Message-ID: <87r02ud98v.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddugeduleejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufgjfhgffffkgggtgfesthhqredttderjeenucfhrhhomhepofhiqhhuvghlucftrgihnhgrlhcuoehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeffgefhjedtfeeigeduudekudejkedtiefhleelueeiueevheekvdeludehiedvfeenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeduuddprhgtphhtthhopehthhhomhgrshdrsghonhhnvghfihhllhgvsegsohhothhlihhnrdgtohhmpdhrtghpthhtohepghgvvghrthdorhgvnhgvshgrshesghhlihguvghrrdgsvgdprhgtphhtthhopehmrghgnhhushdruggrmhhmsehgmhgrihhlrdgtohhmpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtp
 hhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtoheplhhinhhugidqrhgvnhgvshgrshdqshhotgesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-GND-Sasl: miquel.raynal@bootlin.com

On 14/03/2025 at 19:56:29 +01, Thomas Bonnefille <thomas.bonnefille@bootlin=
.com> wrote:

> From: Cl=C3=A9ment L=C3=A9ger <clement.leger@bootlin.com>
>
> The EB board (Expansion board) supports both RZ/N1D and RZ-N1S. Since this
> configuration targets only the RZ/N1D, it is named r9a06g032-rzn1d400-eb.
> It adds support for the 2 additional switch ports (port C and D) that are
> available on that board.
>
> Signed-off-by: Cl=C3=A9ment L=C3=A9ger <clement.leger@bootlin.com>
>
> [Thomas moved the dts to the renesas directory and declared the leds in
> each phy]

While you do a new iteration, I'd suggest rewording this to:

Signed-off-by: Cl=C3=A9ment L=C3=A9ger <clement.leger@bootlin.com>
[Thomas: move the DTS to the Renesas directory, declare the PHY LEDs]
Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>

Cheers,
Miqu=C3=A8l

