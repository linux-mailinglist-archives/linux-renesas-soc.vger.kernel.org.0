Return-Path: <linux-renesas-soc+bounces-21917-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BA513B595E9
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Sep 2025 14:20:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5998C3AD8FA
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Sep 2025 12:20:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 983052C1591;
	Tue, 16 Sep 2025 12:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="HR0f2jik";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="G84Imd35"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fhigh-b6-smtp.messagingengine.com (fhigh-b6-smtp.messagingengine.com [202.12.124.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC736256D;
	Tue, 16 Sep 2025 12:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758025237; cv=none; b=iejzE8NzDLsMsNCALpWsmIowwP2AajOBa2YUjKHITze3GNK9oL02gSKEiQMoe3QNQ7948aXud2sClNY07mYBWPvGrsclT9qa0thCCB/nxytKybNwUVOT1qbzjpaww09yaJgyZwhYESKTpebbEr/iBfgR9Z1t8PQiZCcRR25FlqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758025237; c=relaxed/simple;
	bh=ohM3qeqIdtQ9b/vfVH/lPbFE9ScNSgSBQ+xoI2nV8cc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jyGuZRZAGQ1rz1EVPr/zOKuJeCFbU7mGKHkXv5l7mXz/x4Hypy6QSn3UhI/vAg7Tmq9MKQrELYr1ieixKL8p4AzmIRirpvqNO/eDt+tCHh8vVA+EJa7ZeorqJDpiRvo5sZK83YSDSmCjM9564FcLlQl3RPdABk4bUYQmOpZyasI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=HR0f2jik; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=G84Imd35; arc=none smtp.client-ip=202.12.124.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 2D5017A0295;
	Tue, 16 Sep 2025 08:20:33 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Tue, 16 Sep 2025 08:20:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1758025233;
	 x=1758111633; bh=P9ErBKpOPiGkq5qufoOjZLyFPL/vF0xAfJHQgAZIL3s=; b=
	HR0f2jikvN9Qe6j5eQH7s/GrC2s86MUX+4VEgyVPyp0BCOJR/Re631oEW4EOcaEI
	uVGFtnphRCJb8khdUFfXSCBeZ9lAKOgDiok128GiLx8syl+lqRDbkMca3vHwf5u6
	IiCfu3CbFbWr2YVrCMEy/HJs/7kCW3EC40l3nGOQNKYMA63scSesScMR652UZ7WU
	y0yWAa2nRVAzneY1kbkx1jHctGWqQjGqGY6a5aCWgL8ipsG6tYefPasvWmOqt143
	bvGYW14OJkBg34AUkJDgUbwgHdLlxylpjeR/EwtHoWZdqMAOhFcuXN4RWSkZ2EuD
	lIc5Jgewjn6jFWzIEcRpJA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1758025233; x=
	1758111633; bh=P9ErBKpOPiGkq5qufoOjZLyFPL/vF0xAfJHQgAZIL3s=; b=G
	84Imd35BqhTnQ06rhMIyosxZZYueWTeDze5u90+qeAz1C7v6LhMEsL6srxETktr9
	kYPTeLYCRVEWnjMzB2IoPFmhg4p+c5Cmva1idLqx1eb0eOb9/NEQ0tZ0fzgF/GJz
	tZBA0YdsYckeqkLH3lCYAcgDC+cR108JGEXWtD6BP/0PsCrVEzW1ps2JVeIcNiAh
	PKAKfVndi4gWZf52UxrHxa5Ua4/X1BSNb+N/AucFForRMlDTqyexin9XBQPY0W7y
	aB2HdxO9O0Olwo6UH2kSVOiBGb86ssJGzjASdnJD049ZdgHEVObb74BgMgvimBBF
	v+CMvaIeHeoUoel6rt+dg==
X-ME-Sender: <xms:EFbJaE-F_OSP1b2RxEsylyCqY5DsVyPb6hygvdaFqzsWkPk5XDqUgw>
    <xme:EFbJaGzHB19HNj-zfNCfxheBCF6T8zTc9QEe1MqWmt4-Xjid1kat3rmx2GppaLEvY
    HBO4x9WBZBfdEJLDP4>
X-ME-Received: <xmr:EFbJaO88tQCq6Qpbmxau9wWXce23c-wDwfC1oG7IyGv7CobriapqzuKIJsJhilSpiwg9-K2nzY4lrT_jyCvuMPZAafxSUhlSYw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdegtdehhecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtugfgjgesthekredttddtjeenucfhrhhomheppfhikhhlrghs
    ucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsohguvghrlhhunhguodhrvghnvghsrg
    hssehrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgrthhtvghrnhepfefhleelhfffjefg
    fedugfegjeelhfevheeikefhueelgfdtfeeuhefftddvleeinecuvehluhhsthgvrhfuih
    iivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepnhhikhhlrghsrdhsohguvghrlhhu
    nhguodhrvghnvghsrghssehrrghgnhgrthgvtghhrdhsvgdpnhgspghrtghpthhtohepud
    efpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegrnhgurhgvfieslhhunhhnrdgt
    hhdprhgtphhtthhopehprghulhesphgsrghrkhgvrhdruggvvhdprhgtphhtthhopegrnh
    gurhgvfidonhgvthguvghvsehluhhnnhdrtghhpdhrtghpthhtohepuggrvhgvmhesuggr
    vhgvmhhlohhfthdrnhgvthdprhgtphhtthhopegvughumhgriigvthesghhoohhglhgvrd
    gtohhmpdhrtghpthhtohepkhhusggrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehp
    rggsvghnihesrhgvughhrghtrdgtohhmpdhrtghpthhtohephihoshhhihhhihhrohdrsh
    hhihhmohgurgdruhhhsehrvghnvghsrghsrdgtohhmpdhrtghpthhtohepghgvvghrthdo
    rhgvnhgvshgrshesghhlihguvghrrdgsvg
X-ME-Proxy: <xmx:EFbJaMOOKwqejEm3fM4KDPuT-n5dheT58Hu9NiRFmJ4WNTuRIhkPTQ>
    <xmx:EFbJaGruWMqSfZHzjjVfjp5cU3fkI56RRKaJaCY39tP2hXFzbkksrA>
    <xmx:EFbJaL4MQIuvpmWlM0vJWqEyq1NvHcvMNFKQKEMIP7ofK6NELzJiVA>
    <xmx:EFbJaGFoYIk_0RboC1esB9S6c3CHt01X6rlfrRyKL7hEKqKGjJzuUA>
    <xmx:EVbJaD83jMsiDYR6WHF4fYV-Nm8TM8RmfADth2wDvS09kPpU175Phw8z>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 16 Sep 2025 08:20:31 -0400 (EDT)
Date: Tue, 16 Sep 2025 14:20:29 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Paul Barker <paul@pbarker.dev>, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>, netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [net-next 1/6] net: rswitch: Move definition of S4 gPTP offset
Message-ID: <20250916122029.GC1045278@ragnatech.se>
References: <20250916101055.740518-1-niklas.soderlund+renesas@ragnatech.se>
 <20250916101055.740518-2-niklas.soderlund+renesas@ragnatech.se>
 <bff98e48-ae2c-489e-b422-3cae28bd0e16@lunn.ch>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bff98e48-ae2c-489e-b422-3cae28bd0e16@lunn.ch>

On 2025-09-16 14:16:09 +0200, Andrew Lunn wrote:
> On Tue, Sep 16, 2025 at 12:10:50PM +0200, Niklas Söderlund wrote:
> > The files rcar_gen4_ptp.{c,h} implements an abstraction of the gPTP
> > support implemented together with different other IP blocks. The first
> > device added which supported this was RSWITCH on R-Car S4.
> > 
> > While doing so the RSWITCH R-Car S4 specific offset was added to the
> > generic Gen4 gPTP header file. Move it to the RSWITCH driver to make it
> > clear it only applies to this driver.
> 
> This is a nice simple patch to understand, which is good. But i do
> wounder about naming schemes. Since this is a RSWITCH define, should
> it use the RSWITCH_ prefix? 

It could, I opted for the least disruptive path and just moved it as is.  
Would you prefers I rename?

> 
> Are there other implementations which have an equivalent of
> RCAR_GEN4_GPTP_OFFSET_S4? How are they named?

There are none, at least not so far as the RSWITCH IP are only available 
on the R-Car S4 SoC.

> 
> 	Andrew

-- 
Kind Regards,
Niklas Söderlund

