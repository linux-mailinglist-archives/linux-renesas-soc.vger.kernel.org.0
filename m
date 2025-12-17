Return-Path: <linux-renesas-soc+bounces-25872-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C028CC8A6A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Dec 2025 17:04:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id DB8613006453
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Dec 2025 16:04:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5973036403C;
	Wed, 17 Dec 2025 16:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="Ts/GXl0K";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="p7NtHNQv"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fout-b6-smtp.messagingengine.com (fout-b6-smtp.messagingengine.com [202.12.124.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2377363C6E;
	Wed, 17 Dec 2025 16:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765987470; cv=none; b=B3J4ELnh/HYeg/UUSX96axMSb2w6+iJohkFTmKG+JrJK8ISxR42O+6XQ2zVs112YPhq6XBzGQZYXeCyBJJnD+P4nG+2PDt6V+xUaVeaWkG3nUQoon8GrEUIQ7kvZdUyD1NHKrDj8o/2Li5DtyH0+W5QRbHl9Zi2ITz0KpxV5XtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765987470; c=relaxed/simple;
	bh=KlO+a0NpFnpuOBjnO4rZ3Husgmd207wZNAdZTNyfo2U=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=Zn6Ewq5yuGfjO/3N33tDrhtHN4RjbPa3peZNvc4ICDO8IkBRuXFyIcAGpiP6uSXjvvfvtwZ7s40o27a5iFXMsB+fge7+IlXZwZ9LOHttckyTMghh3UpLso/qb7+bbReuayHdEng+Z+dtyQ4UdOtaFx8KJLFzvOEH6wyDCl62A8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=Ts/GXl0K; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=p7NtHNQv; arc=none smtp.client-ip=202.12.124.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id CB0381D0012D;
	Wed, 17 Dec 2025 11:04:26 -0500 (EST)
Received: from phl-imap-17 ([10.202.2.105])
  by phl-compute-04.internal (MEProxy); Wed, 17 Dec 2025 11:04:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1765987466;
	 x=1766073866; bh=ygVvmQCwoW+bq9xU8k+4m3IDod5LVEM/rzQsvomDzl0=; b=
	Ts/GXl0KtvsDupfb6dX3RMDr2P8txjNqGc6MipR0QbXSFqCe9lDXuY6rBWw5/mJG
	3XFnyG5J36KmW3EjyGf/9HlBenBRsGgBhYcrXKgavkLEMzk++bsNEjSaj7h5hRKf
	rVTt+9Lq6pCh6xAYgL6eyEcg+I3RhjEvjt7LMFLTTFhI1kduUV92jxrO1tFTd7WC
	A+zX9RBTAV+rtrVKXAmbPoUcX2dWWfGpH672+lAhTDJSc3XuY4++OjN1jkkoBV2c
	zLiLK9xcKd0AjdXSNwW3NCCPwW7wQ8HUSiBUaSZYoUkcWRH5HMrb2Rjyn27/yHns
	UJWd0VWG3V1+hIg9BklG3Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1765987466; x=
	1766073866; bh=ygVvmQCwoW+bq9xU8k+4m3IDod5LVEM/rzQsvomDzl0=; b=p
	7NtHNQvl37GD1xiT+x1bUn1Q41zdU2ia/UO2hmQo8cTguVZBg7cEqaRsNxJcnC1l
	aSjhAftOQe54SSzBu0awknfZY/h4stYSgkJ7wYQjqvoFMbndtgivnDo15VoXLP7x
	aG3iqVXFyodmVNPTbr1Cqqjk8ru+YRsMOcbxGoF8+QiwdB3u4IK/+2vRtdZRxyGh
	DA/isDfdL7untEGvjYqltJK8XTT8GI1fT0np9xDWc5Msqn6rp/zDGfjb9KFKGoOE
	qLgUco5MtpoTUQuL91SUr6olGxohtVvtnpWvByZpK0ZpijRkXyqW5KLNrya0/uYO
	R0NwAEIZ6d5tqOZpFG7lg==
X-ME-Sender: <xms:itRCaRn0C6BhSz77dtVqAX0erOmL3RcXvwQQN9rZISQOtii91NM0JA>
    <xme:itRCaXo4AHOvlzGrSH9zQ71UL57iE6FgrRA4r50XzAADSmaKN0wI2xEuhcD1NVUpN
    qa4ThCkgU3osCdkMpmawy3Tek1PjElUhq57BVcj1PjqQhduqDg_hXZ_>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdegvdellecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
    hnpefhtdfhvddtfeehudekteeggffghfejgeegteefgffgvedugeduveelvdekhfdvieen
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnug
    esrghrnhgusgdruggvpdhnsggprhgtphhtthhopeduhedpmhhouggvpehsmhhtphhouhht
    pdhrtghpthhtohepghhrvghgohhrhidrtghlvghmvghnthessghoohhtlhhinhdrtghomh
    dprhgtphhtthhopehrohgsvghrthdrjhgrrhiimhhikhesfhhrvggvrdhfrhdprhgtphht
    thhopehgvggvrhhtodhrvghnvghsrghssehglhhiuggvrhdrsggvpdhrtghpthhtohephh
    grohhjihgrnhdriihhuhgrnhhgsehgmhgrihhlrdgtohhmpdhrtghpthhtohepmhgrghhn
    uhhsrdgurghmmhesghhmrghilhdrtghomhdprhgtphhtthhopehsvggsrghsthhirghnrd
    hhvghsshgvlhgsrghrthhhsehgmhgrihhlrdgtohhmpdhrtghpthhtoheptghonhhorhdo
    ughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlh
    drohhrghdprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:itRCaWf1Yyrm1HtXtcgIsDH2I6V6sgnAyJlab6eD3Ym5uEsFmamVZQ>
    <xmx:itRCaXzWj75fr4DDHg0NMOfc_CITydfsMlXllPehDoM0YE1x9rajGw>
    <xmx:itRCaXLF7LpR_uInOIhCBM9Aptr9c4Zrpzq2n9lJL0KJVihdcdhW-w>
    <xmx:itRCaQvd_-R8Mx63miwGtEMxIlpzL78nf73lofA6ZQ5WNZ5kZD0Y_w>
    <xmx:itRCaYI4XZ0VZKqracHiuy3P3n06L5sIexKJOi-IE7jBJwytH3M7O101>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 05A20C4006B; Wed, 17 Dec 2025 11:04:26 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AXfFZUabNlQ-
Date: Wed, 17 Dec 2025 17:04:05 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Robert Jarzmik" <robert.jarzmik@free.fr>, "Rob Herring" <robh@kernel.org>
Cc: "Geert Uytterhoeven" <geert+renesas@glider.be>,
 "Magnus Damm" <magnus.damm@gmail.com>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Daniel Mack" <daniel@zonque.org>,
 "Haojian Zhuang" <haojian.zhuang@gmail.com>, "Andrew Lunn" <andrew@lunn.ch>,
 "Gregory Clement" <gregory.clement@bootlin.com>,
 "Sebastian Hesselbarth" <sebastian.hesselbarth@gmail.com>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Message-Id: <35405ed3-1319-4d3a-84a5-ad67f4c823ad@app.fastmail.com>
In-Reply-To: <m2345fmkg7.fsf@free.fr>
References: <20251212203226.458694-4-robh@kernel.org> <m2345fmkg7.fsf@free.fr>
Subject: Re: [PATCH] ARM: dts: intel: Drop pxa2xx
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, Dec 12, 2025, at 22:58, Robert Jarzmik wrote:
> "Rob Herring (Arm)" <robh@kernel.org> writes:
>
>> These .dtsi files are not included anywhere in the tree and 
>> can't be tested. They have not been touched since 2018 other than 
>> clean-ups.
>>
> And yet, there are used by people using pxa2xx board with an DT 
> support (like the mioa701 for which a board file was never merged).
>
> If you remove pxa25x.dtsi and pxa27x.dtsi, you might as well 
> remove all support for this architecture from the kernel, as
> these are the building blocks needed to make it work.
>
> That might be what should be done, I'll let Arnd and Daniel 
> comment on the future of PXA in the kernel.

I agree with Rob that at the very minimum, any dtsi files in the
kernel should be build-tested along with the rest, so either
we add some dts files using them soon, or we can remove pxa2xx
(and maybe pxa3xx) completely.

I already plan to remove the remaining board files for both
sa1100 and pxa soon, as nobody has picked up the task to do
any further DT conversion after we removed the majority of
the files back in 2022 and left only the ones that someone
said they'd be interested in keeping.

Robert, let me know if you or someone else is able to spend
some time on sending (warning-free) dts files for pxa2xx
machines soon. If not, I'd plan to remove whatever is there
along with the board files and drivers.

I also checked the pxa3xx Raumfeld devicetree support that
Daniel added in linux-3.7. The manufacturer's firmware
download page contains kernel images based on this work,
using a 4.19 kernel but built in 2022. If we remove pxa2xx
DT support, it would be good to find out if anyone still
plans to use something newer on that hardware, which may
happen because of CRA requirements.

    Arnd

