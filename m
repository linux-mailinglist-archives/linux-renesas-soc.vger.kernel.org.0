Return-Path: <linux-renesas-soc+bounces-26258-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C721CF05C1
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 03 Jan 2026 21:55:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9CBA1300B80F
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  3 Jan 2026 20:55:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F3BD275AE4;
	Sat,  3 Jan 2026 20:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr header.b="BwHAuSZx"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtpfb1-g21.free.fr (smtpfb1-g21.free.fr [212.27.42.9])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B5842192F2;
	Sat,  3 Jan 2026 20:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.27.42.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767473714; cv=none; b=cXq8KMjDoPXbT+FDTT1rQu+nmp/bsR6MXeEYqKTVrYCLch/lvyxWcffoWQKtkzpnrw5XRfXnnxp6I9QRWA2iOZG91yKmdRVxm19ATPHkASIrFQmDskumPgQPKDUoiA1GBV1AUVV2JGhymt8FuwmAq0+lSx0WvM/r2GS75dOVGA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767473714; c=relaxed/simple;
	bh=79OSn/nn6J9vtRRKoZXJfWBazAKPVTzO2TC7kHnwTp8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=bmV0bI9fPWMdBeHu70UhJxF+qSctyJAVQo1DMhP/c52BBwreBFvEyYKbE2GdJOguaCRQ7YpNDu9ITpybgHLGfToOXTnAw6R/0I1mLu9wqRQKciAjTK74Rsgmdm4KUg7zzi+HxnJiDEiRLf2/7AKA7comkGNieGfcF6OmCW5tejk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=free.fr; spf=pass smtp.mailfrom=free.fr; dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr header.b=BwHAuSZx; arc=none smtp.client-ip=212.27.42.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=free.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=free.fr
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
	by smtpfb1-g21.free.fr (Postfix) with ESMTP id B69D1DF8304;
	Sat,  3 Jan 2026 21:54:59 +0100 (CET)
Received: from belgarion.local (unknown [IPv6:2a01:e0a:a6a:5f90:db5:e0b7:ba17:f0e9])
	(Authenticated sender: robert.jarzmik@free.fr)
	by smtp6-g21.free.fr (Postfix) with ESMTPSA id 2EC3B780368;
	Sat,  3 Jan 2026 21:54:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
	s=smtp-20201208; t=1767473691;
	bh=79OSn/nn6J9vtRRKoZXJfWBazAKPVTzO2TC7kHnwTp8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=BwHAuSZxbYu3MAjHoUUsV5YWU3A9ekBsHmUJWlfoyTP3rX8FS/1E8s3fddoOug9E2
	 2E8Pod3tSK+15lxs5s1L1aaSXidkxY7dbMPyvijLUaEfYGXzxPDQGfpVYjpZusB+g2
	 eGYn7S+h7JpHfd5zLJQyyyF9lAbh2WxTQ4HlpLWN318aVM1yeaz1wl4bBsnvMob1Bf
	 Pebz829kFom1eko5Hs9Wc5YNHuwtyIdevHDClT622lXdjyMFVxxWtrMiIhlZXXN7qz
	 Wj2GeuHugnyTjJ8FR3gkDyydemLp/ttnye31yPGy3yegRUo2mH1KFrsoE2mxaVczcg
	 dF1n7J35JTw7g==
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: "Arnd Bergmann" <arnd@arndb.de>
Cc: "Rob Herring" <robh@kernel.org>,  "Geert Uytterhoeven"
 <geert+renesas@glider.be>,  "Magnus Damm" <magnus.damm@gmail.com>,
  "Krzysztof Kozlowski" <krzk+dt@kernel.org>,  "Conor Dooley"
 <conor+dt@kernel.org>,  "Daniel Mack" <daniel@zonque.org>,  "Haojian
 Zhuang" <haojian.zhuang@gmail.com>,  "Andrew Lunn" <andrew@lunn.ch>,
  "Gregory Clement" <gregory.clement@bootlin.com>,  "Sebastian Hesselbarth"
 <sebastian.hesselbarth@gmail.com>,  Linux-Renesas
 <linux-renesas-soc@vger.kernel.org>,  devicetree@vger.kernel.org,
  linux-kernel@vger.kernel.org,  linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] ARM: dts: intel: Drop pxa2xx
In-Reply-To: <4e5c631e-8c7f-4f38-a60e-2db829ff9f06@app.fastmail.com> (Arnd
	Bergmann's message of "Wed, 31 Dec 2025 01:02:55 +0100")
References: <20251212203226.458694-4-robh@kernel.org> <m2345fmkg7.fsf@free.fr>
	<35405ed3-1319-4d3a-84a5-ad67f4c823ad@app.fastmail.com>
	<m2wm26lv28.fsf@free.fr>
	<4e5c631e-8c7f-4f38-a60e-2db829ff9f06@app.fastmail.com>
User-Agent: mu4e 1.12.13; emacs 29.4
Date: Sat, 03 Jan 2026 21:54:35 +0100
Message-ID: <m2qzs6l8ms.fsf@free.fr>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed

"Arnd Bergmann" <arnd@arndb.de> writes:

> If you or anyone else is still using PXA27x, we can always
> bring it back later, but I'd then put the burden on them to
> submit the dts file for inclusion without introducing DT
> warnings.
Well not anymore, for RAM constraints as I said.
I can still fallback to an older kernel though if I feel like 
hacking.

>> +	docg3: flash@0 {
>> +		compatible = "m-systems,diskonchip-g3";
>> +		reg = <0x0 0x2000>;
>> +	};
>
> This currently has no upstream users I can see, so
> removing pxa27x would probably mean we should remove
> that as well.
Yep, this driver was only used on the Mitac MIO A701 (my main 
board,
pxa27x based).

>> +	panel {
>> +		compatible = "toshiba,ltm0305a776";
>> +		lcd-type = "color-tft";
>
> I don't see a driver that matches the compatible string,
> does this one actually work?
Yes it does. The compatible string doesn't really matter. What is
relevant in that part is the "timings" node, which is used by 
pxafb
driver to setup its registers to control the LCD panel.

More generally, each and every part of this DT was working 3 years 
ago.

Cheers.

--
Robert

