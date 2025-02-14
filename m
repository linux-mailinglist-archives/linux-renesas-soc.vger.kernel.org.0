Return-Path: <linux-renesas-soc+bounces-13159-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C56FA35B85
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Feb 2025 11:26:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C7490188E0C9
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Feb 2025 10:26:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBC50257AD7;
	Fri, 14 Feb 2025 10:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="HwRizPo+"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BE852222B1;
	Fri, 14 Feb 2025 10:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739528772; cv=none; b=PtPhMM2KpVK0pijh2bRNfbA/I2pbOlEq85/8Tv8IGYM+zGCg2zTfCVO05XtuAP+fk6dNcB9lT1YNwi/OgmhzJBB5eK5cH+vM6+JIDx8hta/qBcxfr+rII2XrIbpeTb5Du4n8OGCQhwHCXvLkM61JiYAOQlAYjfK4dQT09CZkHLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739528772; c=relaxed/simple;
	bh=wggkTQyth22iWtupwQh513Gb1CZuuR0smTyDMKBsfyA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Et6YF9YhKL1HBQq5fwRbKw8nvvoomkdXAL4V0EPpCyFiaDx1g9zpL99hmdqmrZHKfyfTV9tvJF7qgUqOB3DnTlknSgZN9FPqnvp9A2yN6lt9M6pNIKkqJYAnD2Cbol0ADryGffP/oQDqjAQbRSs6ksoJS3A1GtfKSkHcS8RGj18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=HwRizPo+; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7D14E4318F;
	Fri, 14 Feb 2025 10:26:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1739528768;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ot/U0rj7AjLXdTPURko3iQfzZWRcX9ROb8t1MMYesPo=;
	b=HwRizPo+AV2PGQ0di1k8IKzzHx6SI2EzhZ4S1S6EembbF0x2nqHiVinjIcLFV8bE1coHIR
	5zKkvH1DlOY9+asV6MojPz8jV/hiiPP60ICJcmxLnweTuZJUZbTXBa/FM0OWJk8es4Iehi
	a4EgWgMcYkO9hkFgTHGJUZ4W9wt2X5SnIgfyMdT8Yv6HuqEd7DFkWhegrnFBTfwvSgoTXW
	op5OSD1oYmP8ygpu1W+GPGF+KLFI9pZ+vbdFiD8ZVSEmpi6arMd2xG5MIMipk7YEe2f+vE
	sB6NkOpIm9qr+hxOr/672oEaiF72E9ryR8duv287Ao1nWbvGIVfT94pIbgZfEA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>,  Wolfram Sang
 <wsa+renesas@sang-engineering.com>,  linux-renesas-soc@vger.kernel.org,
  linux-arm-kernel@lists.infradead.org,  devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] ARM: dts: renesas: r9a06g032: Fix UART dma channel
 order
In-Reply-To: <bcb604ad6e567de4e0410756ba840c82a32ff7d3.1739525488.git.geert+renesas@glider.be>
	(Geert Uytterhoeven's message of "Fri, 14 Feb 2025 10:42:03 +0100")
References: <cover.1739525488.git.geert+renesas@glider.be>
	<bcb604ad6e567de4e0410756ba840c82a32ff7d3.1739525488.git.geert+renesas@glider.be>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Fri, 14 Feb 2025 11:26:06 +0100
Message-ID: <87o6z4q0u9.fsf@bootlin.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdegleegtdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefujghffgffkfggtgfgsehtqhertddtreejnecuhfhrohhmpefoihhquhgvlhcutfgrhihnrghluceomhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnheptdevhffgtdfhhefggeeftdeiffduiedtgffftddutdehteejhfevieelveegveetnecuffhomhgrihhnpeguvghvihgtvghtrhgvvgdrohhrghenucfkphepledvrddukeegrdelkedrudeijeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeelvddrudekgedrleekrdduieejpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeeipdhrtghpthhtohepghgvvghrthdorhgvnhgvshgrshesghhlihguvghrrdgsvgdprhgtphhtthhopehmrghgnhhushdruggrmhhmsehgmhgrihhlrdgtohhmpdhrtghpthhtohepfihsrgdorhgvnhgvshgrshesshgrnhhgqdgvnhhgihhnvggvrhhinhhgrdgtohhmpdhrtghpthhtoheplhhinhhugidqrhgvnhgvshgrshdqshhotgesvhhgv
 ghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopeguvghvihgtvghtrhgvvgesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-GND-Sasl: miquel.raynal@bootlin.com

On 14/02/2025 at 10:42:03 +01, Geert Uytterhoeven <geert+renesas@glider.be>=
 wrote:

> make dtbs_check:
>
>     arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-db.dtb: serial@50000000:=
 dma-names:0: 'tx' was expected
> 	    from schema $id: http://devicetree.org/schemas/serial/snps-dw-apb-ua=
rt.yaml#
>     arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-db.dtb: serial@50000000:=
 dma-names:1: 'rx' was expected
> 	    from schema $id: http://devicetree.org/schemas/serial/snps-dw-apb-ua=
rt.yaml#
>     ...
>
> The DT bindings specify a fixed order of the channels in the dmas and
> dma-names properties, while the Linux driver does not care.
> Get rid of the warnings by changing the order in the DTS to match the
> bindings.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Ouh, crap, indeed this needs fixing.

Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>

Thanks
Miqu=C3=A8l

