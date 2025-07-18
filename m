Return-Path: <linux-renesas-soc+bounces-19587-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E43F8B09FD1
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Jul 2025 11:34:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EA0F21C81472
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Jul 2025 09:33:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAF2E2989AC;
	Fri, 18 Jul 2025 09:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="UZ3nC2gt";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="SB+v88Nt"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fhigh-a4-smtp.messagingengine.com (fhigh-a4-smtp.messagingengine.com [103.168.172.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED3A4292B29;
	Fri, 18 Jul 2025 09:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752831025; cv=none; b=YxDXnjSCkKSSzKp6Ao4hA6RjUaLbhiWJG5D2OmCcqfE/BkbV/It8yP4cMEYzJEC0cYFv4QiF+N4tsoZEvPaWYbZ3H5d9Kggr14Fnn1RpW5Gztv7vksk6L5QcB7dwm9Eh5ym7McDrh6PLc07Qowp70+G8ANRKkB94RX2oo+bnkuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752831025; c=relaxed/simple;
	bh=KSXrkEKjt5iLVrNTOfzY36lg0p9REtfBD+2vqIObqrI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n1PnF/P5OFWqgcWwyy6PRFea6/18RPr10wwr6avJ34FznuSc7yomss01oobzpk1bQLc99yK3MTYQqaA1LHXJh1r1SjMqec/Zl7GFS0xe73CuA2kWVWzffACnCPVPZ8fxQVNQqVVmffmw866jyfqh86mXokXGRpK6q/grvzvNDAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=UZ3nC2gt; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=SB+v88Nt; arc=none smtp.client-ip=103.168.172.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-09.internal (phl-compute-09.phl.internal [10.202.2.49])
	by mailfhigh.phl.internal (Postfix) with ESMTP id DAA3F14000AE;
	Fri, 18 Jul 2025 05:30:21 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-09.internal (MEProxy); Fri, 18 Jul 2025 05:30:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1752831021;
	 x=1752917421; bh=ucPbtkspVFp9UOhD53+XxPDTmiR9Jp+kO3BY38ZJvRE=; b=
	UZ3nC2gtJeCzF7h41X6Q94ACI//sUEO/MbXzSf88i/t5l6iTB+UYYnfa8tJzJuaH
	XggZyFQy78yijyMjA0/cPmAtjDrIb5fFUbSRgYDZDnjayZ72Fc2K6e8r3O65ntIX
	BeOosTacIA34WPL80FhmL23maahGGvcDMnJ/FD8cI8Vs0wNAWYQr6sk7OYWXgx2r
	fALkqT/NbLVxq4zIGT2fg29jDsFilwhcqqYlGUAVKmRfT5JdwlhLurcATMWadqkJ
	weiniKBXAnZCeSoqcUaWSubbmd43YXD7ss/wQz+APzzWHhHmB7Oovj9xDd/ZiccB
	eYsCjYDCWsHm3x5n1V3QWw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1752831021; x=
	1752917421; bh=ucPbtkspVFp9UOhD53+XxPDTmiR9Jp+kO3BY38ZJvRE=; b=S
	B+v88NtyUUhYHzjv/bPqzstWngWKYlAxFj7OylInMjuXnCViCk6l/J32BLW5doIy
	uxCphJkNUDP/eVIqXbXa/b3njsh8A7a47zepL6y+1jEOZXMROhMHzeXNNwbFSdYO
	hv3ciSDPp+CNsv4zxmbq1vDQ/pKNE1TB36y3AOgKbCbi5XP1++ollxUY2MA2h1UB
	DsbUvkQLVY8cz05sBLBL746i9YsIdRA70tN+8sIeuQ/eGHydArZmuigD/ttiHrFb
	XSEajODBju/qvMR0+eY28C+lQXtEyjviQDuE6Zz5xq8jCQBILCYvHMh8ERwhgjlY
	lLnx1+FFVPgWRIYL2/0PA==
X-ME-Sender: <xms:LRR6aOqpLvPpNaWsYG4dI3j7H2DEa1_xdcz8yOrRFw5CQDyE_s4Lpw>
    <xme:LRR6aKNwgvKLM-P9HmwVQ1EaZzOmDffNQ9PYe42mNa4lWupcKcMvrWLJCFpmZJDQR
    iRHKWpV8-RiF--4WWM>
X-ME-Received: <xmr:LRR6aJrVrzGXJsdA8K5p_iqppsljAveDBaWBXLEHdWnpfNxuupf-tzs2s73EYoY5Fx1zxnz3IkA7T-jyH0cIqiRY1QzNN8Xumw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdeifedutdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtugfgjgesthekredttddtjeenucfhrhhomheppfhikhhlrghs
    ucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsohguvghrlhhunhguodhrvghnvghsrg
    hssehrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgrthhtvghrnhepfefhleelhfffjefg
    fedugfegjeelhfevheeikefhueelgfdtfeeuhefftddvleeinecuvehluhhsthgvrhfuih
    iivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepnhhikhhlrghsrdhsohguvghrlhhu
    nhguodhrvghnvghsrghssehrrghgnhgrthgvtghhrdhsvgdpnhgspghrtghpthhtohepie
    dpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepuggrvhhiugesghhisghsohhnrdgu
    rhhophgsvggrrhdrihgurdgruhdprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorh
    hgpdhrtghpthhtohepshgrrhgrvhgrnhgrkhesghhoohhglhgvrdgtohhmpdhrtghpthht
    ohepghgvvghrthdorhgvnhgvshgrshesghhlihguvghrrdgsvgdprhgtphhtthhopeguvg
    hvihgtvghtrhgvvgdqtghomhhpihhlvghrsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhr
    tghpthhtoheplhhinhhugidqrhgvnhgvshgrshdqshhotgesvhhgvghrrdhkvghrnhgvlh
    drohhrgh
X-ME-Proxy: <xmx:LRR6aPcic991Qlq8XP5ZhdAu6cMldKyW4n2ss1ZQJEaLGqDwVQPAwQ>
    <xmx:LRR6aPQscVWhozfUwPe8gXteHaMej165KoJypgWSLLTxwFnlPeGGbQ>
    <xmx:LRR6aIa3XYzmfcI3lnL49lbBaN1VY2it2hIMxQZ4dwiftaiYL82fsA>
    <xmx:LRR6aCeDuugkW_897eG5AAIoZifdPgOTAFZPI7_D25TpLc_tGVSuWw>
    <xmx:LRR6aDIbqprUgVJyDpvfPiEiZxOq9I2D7L3QBdnxVpOgj6yFxb0-HCue>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 18 Jul 2025 05:30:20 -0400 (EDT)
Date: Fri, 18 Jul 2025 11:30:17 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: David Gibson <david@gibson.dropbear.id.au>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	devicetree-compiler@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] checks: Document possible false warning for graph child
 addresses
Message-ID: <20250718093017.GA770989@ragnatech.se>
References: <20250706122638.1040347-1-niklas.soderlund+renesas@ragnatech.se>
 <aGyLYBoJ0c0UcN-8@zatzit>
 <20250708075155.GA1430987@ragnatech.se>
 <aHnrTCiDdQ9wq_lA@zatzit>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aHnrTCiDdQ9wq_lA@zatzit>

Hi David,

Thanks for your feedback.

On 2025-07-18 16:35:56 +1000, David Gibson wrote:
> Right, that's more useful from the point of view of someone building
> the kernel.  But the underlying fact here is that the check is Just
> Plain Wrong - it's giving a warning on a perfectly valid situation.
> It should go.

As Rob came to the same conclusion I posted a patch for that to dtc [1].  
When two people more involved then me suggest the same thing, it's 
likely the better way forward ;-)

1. 20250708161547.149599-1-niklas.soderlund+renesas@ragnatech.se

-- 
Kind Regards,
Niklas Söderlund

