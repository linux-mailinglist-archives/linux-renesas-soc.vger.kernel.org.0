Return-Path: <linux-renesas-soc+bounces-26924-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 41964D3328A
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 16 Jan 2026 16:24:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 460E930524FD
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 16 Jan 2026 15:19:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 424943370ED;
	Fri, 16 Jan 2026 15:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="2nurkf+F"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACEBA158535;
	Fri, 16 Jan 2026 15:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768576760; cv=none; b=eFV/JZhmVkvvKPpX/rNouf1alQ1m5SnMyOi6W3hd1FYZ0sqUwypC98CjNvZgZ1kdHH/TPCWT2CPnnCANJSHjN+s5SLEs4EMIsdRTuTF16hnF11mbLbwvmKfgQcHPOmR0CuP89uIP4zqhGvYuCLgWs8eQqDDckbHgjL3Q/DwlqsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768576760; c=relaxed/simple;
	bh=OuMwrhqIE5QFFqwcuKtCCRfIyFu7UACpTymHXZqTO2o=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=hU0d5oCFAXWAXDxhH1X59k4X78jUaXRDXUCDq1Jh3HPnl0iJo4QujQjnnOgFwVmGKB2dbSM7cUQFnidlcvY+o2PkWHja7XKtfTPykacvBG7eEQs8hchzEicMWjUsM+peAu6l7c7SiCGGrVBB6DkY3+uFZuUxBVJFIiNOAJ7Ap3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=2nurkf+F; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 4405F1A28BF;
	Fri, 16 Jan 2026 15:19:17 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 173BB60732;
	Fri, 16 Jan 2026 15:19:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B402510B68805;
	Fri, 16 Jan 2026 16:19:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768576756; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=6Qb6R1j3XkkCPFzEwCW5EjhwUD1TxNu62GrWWx9blII=;
	b=2nurkf+F65xbpXcsEvl+w3o4NK3nIHRVG0yJgO9cNpRLw4CZ3q++Ia8RKyH11g1glP7RrR
	G67xXg2RJ84TqaV+RExISDdLNHLO/4CCRpca14SZIZuBNXu7VxjtlPLJEGNe3Xdh65qT33
	F6N8KEXgBvSp4vdbOMTzO5zapn91UMmtmL2xQPsRCPbr4XNSAn9nyNTzuaBvWQ8CdFtTgj
	Kt4MELzlN/0uZ0nJ5CpoAgLiY/cIJgLfX10ml+rJDa4l0cWq5XzIjieoS1qx1WuJ/Zh8pZ
	sQkdyP/sRKuSy4tRNNhmOXN670e4Akbw9eDlS+3T9rdfCOXw0dmx2bqoF5c04w==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Mark Brown <broonie@kernel.org>,  Rob Herring <robh@kernel.org>,
  Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor Dooley
 <conor+dt@kernel.org>,  Geert Uytterhoeven <geert+renesas@glider.be>,
  Magnus Damm <magnus.damm@gmail.com>,  Vaishnav Achath
 <vaishnav.a@ti.com>,  Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
  =?utf-8?Q?Herv=C3=A9?= Codina <herve.codina@bootlin.com>,  Wolfram Sang
 <wsa+renesas@sang-engineering.com>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Santhosh Kumar K <s-k6@ti.com>,  Pratyush Yadav
 <pratyush@kernel.org>,  Pascal Eberhard <pascal.eberhard@se.com>,
  linux-spi@vger.kernel.org,  devicetree@vger.kernel.org,
  linux-kernel@vger.kernel.org,  linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 13/13] ARM: dts: r9a06g032: Describe the QSPI controller
In-Reply-To: <CAMuHMdUqWUriQHR8UY631HZfVNsejgXE64jrChi=k2=5E6Hi-Q@mail.gmail.com>
	(Geert Uytterhoeven's message of "Fri, 16 Jan 2026 11:07:03 +0100")
References: <20260115-schneider-6-19-rc1-qspi-v2-0-7e6a06e1e17b@bootlin.com>
	<20260115-schneider-6-19-rc1-qspi-v2-13-7e6a06e1e17b@bootlin.com>
	<CAMuHMdUHwqBrNMQTO-g7yUA_owWXxT6bPi34Oxjt-J7N0Q2CXQ@mail.gmail.com>
	<87ldhxubt5.fsf@bootlin.com>
	<CAMuHMdUqWUriQHR8UY631HZfVNsejgXE64jrChi=k2=5E6Hi-Q@mail.gmail.com>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Fri, 16 Jan 2026 16:19:12 +0100
Message-ID: <87a4ydtwjz.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

On 16/01/2026 at 11:07:03 +01, Geert Uytterhoeven <geert@linux-m68k.org> wr=
ote:

> Hi Miquel,
>
> On Fri, 16 Jan 2026 at 10:49, Miquel Raynal <miquel.raynal@bootlin.com> w=
rote:
>> >> +               qspi0: spi@40005000 {
>> >> +                       compatible =3D "renesas,r9a06g032-qspi", "ren=
esas,rzn1-qspi", "cdns,qspi-nor";
>> >> +                       reg =3D <0x40005000 0x1000>, <0x10000000 0x10=
000000>;
>> >> +                       interrupts =3D <GIC_SPI 64 IRQ_TYPE_LEVEL_HIG=
H>;
>> >> +                       clocks =3D <&sysctrl R9A06G032_CLK_QSPI0>, <&=
sysctrl R9A06G032_HCLK_QSPI0>,
>> >> +                                <&sysctrl R9A06G032_HCLK_QSPI0>;
>> >> +                       clock-names =3D "ref", "ahb", "apb";
>> >> +                       #address-cells =3D <1>;
>> >> +                       #size-cells =3D <0>;
>> >> +                       cdns,fifo-width =3D <4>;
>> >
>> > <4> is the default, right?
>>
>> It is the default in the bindings indeed, however the driver does not
>> imply that default and errors out if the property is missing. The
>> property is also marked required in the bindings, which is kind of
>> incorrect I guess. Also, all DTS explicitly set this value to 4.
>
> OK.
>
>>
>> However looking into the RM I found "Transmit and receive FIFOs are 16
>> bytes". I haven't tested that, I will.
>
> Oh, that bullet is not present in the docs on the CD I looked at.
> It is indeed documented in newer versions.
>
> There's also cdns,fifo-depth, which thus should be 4?

Ah, that's right. You mean fifo-width =3D 4 and fifo-depth =3D 4, right?
It is marked as being discoverable by reading CQSPI_REG_SRAMPARTITION,
but on my board this register returns 0. So I guess yes, I will go for
fifo-depth =3D 4 and we should be fine.

...

>> > The rest LGTM, ignoring my comments on the bindings:
>> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>>
>> Thanks for the review, but I guess if I end up changing the DTS snippet
>> I might drop it. Or would you like me to keep it anyway?
>
> Please keep it as long as you don't change the (SoC integration)
> things I typically focus on (address, interrupts, clocks), and don't make
> too wild changes ;-)

Thanks,
Miqu=C3=A8l

