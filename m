Return-Path: <linux-renesas-soc+bounces-20144-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 20FF9B1E70D
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  8 Aug 2025 13:19:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7865E3AAD1A
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  8 Aug 2025 11:19:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2341725CC66;
	Fri,  8 Aug 2025 11:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="LNYvvmMB";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="AfRLLUeP"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fhigh-a6-smtp.messagingengine.com (fhigh-a6-smtp.messagingengine.com [103.168.172.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 486D94430;
	Fri,  8 Aug 2025 11:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754651963; cv=none; b=QMqHADRGtjQaBzP6L4U4je1zrGm4MOYgjLcUUEJCQ6yE74HKlAWZGofTb1puwocOK/Q+AIBgCP872u39lvyVh/GPEpiCksSSNTVVpKkFoHE/GyLf8Wy2DU3g5DpPh2t/WEDlioWKkGdbXPwcb24WltS1VFruQbxnTAddaOsAe4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754651963; c=relaxed/simple;
	bh=MDBPQc8k1HLpzLIRsReq/HTSulDYSclhSiyijZTD3bA=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=pzt6N4YciONuXqzxvzdRBAnrf+UWk1T7wpntMGwoT2sK03f9WZuXgcvtFeLo43a+VlLbp4PDBnPWhQ+JA2XKsrES0s4bWT/pUI/XgGqzlv1l4N+yGX905i4ptye1DZOxf/2MaimH/jYg6dpCtUjxiKfRBxvs3KIEYScaPHg3BAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=LNYvvmMB; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=AfRLLUeP; arc=none smtp.client-ip=103.168.172.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 4509214000B9;
	Fri,  8 Aug 2025 07:19:17 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Fri, 08 Aug 2025 07:19:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1754651957;
	 x=1754738357; bh=kXnaAaU+jsKKyacddE7SAVJoi6NjE3zSqJlFeFvTb4k=; b=
	LNYvvmMBTbBeWybL2Kw3FSzKsPy4pv7dV+0OPrALMLQ5L6iMSA3+lRgwslnixhax
	g5eKgbkpqRrXO+Zj14F7Mlp8Q/oHT1a74HIQO6LUuowcyoNKYb6KjCj3r/NDO7qT
	e7lZKYFPFzVoengOrfm2pba3TmMQtu62iJTN/e3i+iA5L5fwK+SafzQPKrV1OacK
	z0w8NSN7F2x1V1GtVc/nKvslXjbFneYrItx9oH39GrBoE3hfB5fOZb9z4uE30q/4
	zyFgzoEzkA4pyBRONSkSocWarJeAcd7xAL1WunzeiJuMYGALSq4TpFPtIWBshVED
	Mv0kXNuSusgbGPxPJGdRoA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1754651957; x=
	1754738357; bh=kXnaAaU+jsKKyacddE7SAVJoi6NjE3zSqJlFeFvTb4k=; b=A
	fRLLUePzBr/jPMssVbEwp0dBTQYQ1tculYdxIbN6YKZ36tPwK09We8z+SB9zrKLU
	wTRJHVKNG3iH9ZNR0fm2Dk7h+qrd+0eYpPffK6JczCxpXDGu9q2g2xkqG1TrW0/n
	kw5/P5E5QCp5RpNRuoRsFBB/n/fSa0xpTO+cphBiwMow3oZ35vZ48mszXkiFsC4b
	2Zxnml0aVz8oA58gcrEbfShtV67vntn7bFkpl6Jv12k7COGJI0nDtjj32TMGWaMF
	GWVOlSjN4zdCR8jT+pedsZfNL+jv85LCv3b+uvNkVaUtqJsePruRpedtuEESIuX/
	KJEZG3c8u458aY0Lp6wOA==
X-ME-Sender: <xms:NN2VaAkTOPtl1Duy_rFCVmo8eWnDDMUMAJEHjslptaCxo0AjRvgptQ>
    <xme:NN2VaP1MPPpfhGosr1JQYolixELj161s6ssdj41Ld3uM-0ThcYPXaSupNBGZFQfHA
    bJBXc_9MGuBsDyeDTI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduvdefieejucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrnhgu
    uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
    hrnhephfdthfdvtdefhedukeetgefggffhjeeggeetfefggfevudegudevledvkefhvdei
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnh
    gusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepuddtpdhmohguvgepshhmthhpohhu
    thdprhgtphhtthhopehjohhrghgvrdhmrghrqhhuvghssegrnhgrlhhoghdrtghomhdprh
    gtphhtthhopegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhm
    pdhrtghpthhtoheplhhkphesihhnthgvlhdrtghomhdprhgtphhtthhopehgvggvrhhtse
    hlihhnuhigqdhmieekkhdrohhrghdprhgtphhtthhopehlihhnuhigqdhifegtsehlihhs
    thhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepfhhrrghnkhdrlhhisehngi
    hprdgtohhmpdhrtghpthhtohepfihsrgdorhgvnhgvshgrshesshgrnhhgqdgvnhhgihhn
    vggvrhhinhhgrdgtohhmpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrh
    drkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrhgvnhgvshgrshdqshho
    tgesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:NN2VaPfKzLey5jIWnTY5EzywwVvpYHHqb1F_6ar5MG7mOcrkgHoVCw>
    <xmx:NN2VaN2YjoUMs2-cilwrnn7HNjvsBmddt6wl30xOzVchbWImC9DGkg>
    <xmx:NN2VaP92roOkzkNrIDCWAj-jtFgv8XnBeuKYthWiHezMZr1uSRem5g>
    <xmx:NN2VaK7fEHW_m1sP-CL54WPfy6aS3HhRVzEG4ki90w88LkHXPN-9vw>
    <xmx:Nd2VaOjkbVEo_yK3_kGPZZVhO_tpqTL1y8bh4a51LdkjOzE6SpJmbaef>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 6D27E700065; Fri,  8 Aug 2025 07:19:16 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: T0d336f21a661302d
Date: Fri, 08 Aug 2025 13:18:46 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Geert Uytterhoeven" <geert@linux-m68k.org>,
 "Alexandre Belloni" <alexandre.belloni@bootlin.com>
Cc: "Wolfram Sang" <wsa+renesas@sang-engineering.com>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 linux-kernel@vger.kernel.org, "kernel test robot" <lkp@intel.com>,
 "Frank Li" <Frank.Li@nxp.com>, "Jorge Marques" <jorge.marques@analog.com>,
 "linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>,
 sparclinux <sparclinux@vger.kernel.org>
Message-Id: <b7cf1db6-317a-453b-a605-adec7e126fc6@app.fastmail.com>
In-Reply-To: 
 <CAMuHMdUwC=TNvvwf0_sgSSYTBGeq8UX5kRFN5kg3mFJ7wVA3kw@mail.gmail.com>
References: <20250807043456.1624-2-wsa+renesas@sang-engineering.com>
 <2025080720214218750df5@mail.local>
 <CAMuHMdUwC=TNvvwf0_sgSSYTBGeq8UX5kRFN5kg3mFJ7wVA3kw@mail.gmail.com>
Subject: Re: [PATCH] i3c: remove 'const' from FIFO helpers
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, Aug 8, 2025, at 11:43, Geert Uytterhoeven wrote:
> On Fri, 8 Aug 2025 at 01:09, Alexandre Belloni <alexandre.belloni@bootlin.com> wrote:
>> On 07/08/2025 06:31:24+0200, Wolfram Sang wrote:
>> >
>> > I still wonder why SPARC discards the const but since nobody seems to be
>> > commenting on that, I guess the fastest way to get the build error out
>> > of Linus' tree is to adapt the usage in I3C.
>>
>> My plan was to let sparc people handle their mess, there is no reason
>> const should be discarded.
>
> Fully agreed.
>
> Note that it is not just the const keyword that is missing from the
> SPARC implementation, but also the volatile keyword.

The last time this came up, I actually tried doing a patch to
remove the 'volatile' keywords from all asm/io.h on all
architectures, and from all drivers that currently pass it,
as I don't think it has any effect other than avoid build
warnings for some prehistoric drivers.

On a related note, I'm fairly sure the i3c_readl_fifo() function
is not portable and breaks on most big-endian platforms: The 
readsl() implementation on big-endian targets usually skips the
implied byteswap from readl() since it is writing a bytestream,
but then the final readl() is defined as reading a four-byte
little-endian word, which tends to require an explicit swap
on big-endian targets. (there are some exceptions where the
PCI host bridge adds an extra byteswap, or where the CPU swaps
everything on 32-bit boundaries, rather than the unit of the
access).

I think using 

    readsl(addr, &tmp, 1);

instead of the final readl() should be portable here.
Same for the writel() of course.

     Arnd

