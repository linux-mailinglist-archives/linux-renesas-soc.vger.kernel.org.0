Return-Path: <linux-renesas-soc+bounces-25735-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D1FDCBA677
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 13 Dec 2025 08:12:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D49363007D98
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 13 Dec 2025 07:12:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41533258CD9;
	Sat, 13 Dec 2025 07:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="WvlSHr20";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="mybbNFL8"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fout-b5-smtp.messagingengine.com (fout-b5-smtp.messagingengine.com [202.12.124.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9DF9212B0A;
	Sat, 13 Dec 2025 07:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765609933; cv=none; b=PrGgATQ7lp4+pn66ILqeYZRn6ZIpMAmh8mA8q+T/E2udREhflrnu9gfVEIlIReChjHjQdbzShHZkjpEFQwOh9valBdzSn5dqTTW10IV3DJuz2v8WXv7cvWdqPE0vF1wag0c/4BelxVzvVtx9cwALZTeF8Yj+jAqU2QNU69mwH10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765609933; c=relaxed/simple;
	bh=/TXINoF4AW+L9J+xO2aukHYD+v5idSSK6IWIEM2iaSU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aMIHgRnVjLAs6/ilLjiOx1qNG0e4cFk6NQUREkcI/541eQg1uEeilQJGuo9puTje4D1UgQcz4UsuS66eYwuFRLrF616eNjre0AT9LXTh8j21h7EjbDRoJYSZLbovDTC0ejcnwBtU1yxMLPfwGXqmht2Q1OybJMFfsseZOupeZ7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=WvlSHr20; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=mybbNFL8; arc=none smtp.client-ip=202.12.124.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfout.stl.internal (Postfix) with ESMTP id 7444E1D0007D;
	Sat, 13 Dec 2025 02:12:06 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Sat, 13 Dec 2025 02:12:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1765609926;
	 x=1765696326; bh=PLDqh7v+zMDgQnnqBZy8oMbIsFgwxCgKb1O9SPI0Dmo=; b=
	WvlSHr20cL85PzqKCXYRBwnXqrFCjLX3E7JbLkrJ74aFSWWp0c3ayFJWsJjllFTE
	2mnuxa7GqNnmuQdC1CvZkbq81M+MDYBBMwGQ/DOEV+liM3JgTWiXT11hyZtXCch5
	Uhw4pSyROdoM/8xCChqc4v3VdQVUnX0uXG0M+Zd+FVRn0iX94nuXpIYxGreVlWc2
	4iiUcMu+8k9ROuuPkNZTTJnrNbrRtGgc+O9fiIaSie9oyEm0Kaddg056EvN+9HyU
	If98hMllLheGNZK8wrYEoSgRM2Kn2Seecot2kR4lsjSjJ/PGQKEUTXYxmKiucsXD
	tivS6DiuB3i+Lyj8pcREQA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1765609926; x=
	1765696326; bh=PLDqh7v+zMDgQnnqBZy8oMbIsFgwxCgKb1O9SPI0Dmo=; b=m
	ybbNFL8Tgz2NB33exeVbr7gERNX+2oPr6GvLs2X8Ao2rVfp8UKGdf6jldEkCgFOJ
	6W/VAktqQc7G9M7VoHLcKOwll8EhJ5R95NrqRrLR3uaArT/d5rz6BRP0nrB3RBq3
	fNPXHAieUw7uNAVSLfevwX0ik3zROUKbavGRQB1p1bxz8F2dbwIJTx1hvedBAFLM
	S7qRuCJSU+va3bhOxHF6jNTai7FgAG1qzEF6TXRpXICjK4mox9S6uMYaw64t8Oth
	Gw8/Mssy6R/HCrOc8vIBbTJN6QoRm2C9xl1bWuF21e+eiFRKtPdDGtatXNZiUFaI
	rC5Sxe2/IdxfrFAkb6ufA==
X-ME-Sender: <xms:xRE9aS2EKMqs7Io5SKc-7kXXneDmfCZqiYnG7KOtSKM03EFFKOu_Cg>
    <xme:xRE9abEsfzIHxBINlDImPJokfJf2Dil0OKX5GswbQpYATrIn0cbbjJWEhDwto1rp5
    WqOC196fjDFFoILy5f2mMr0vLNmPpfUsRDo31XMATqZ_vGG52rWZsI>
X-ME-Received: <xmr:xRE9aVt2OQe4Dmj4puCuqXTNqvKEQwqwom0CBgV2Di_XhkN567HtI_KWUISRQCjGAhSIWU-iURzd7U9YQbbdBrJXCysc3MA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdeftdegvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtugfgjgesthekredttddtjeenucfhrhhomheppfhikhhlrghs
    ucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsohguvghrlhhunhgusehrrghgnhgrth
    gvtghhrdhsvgeqnecuggftrfgrthhtvghrnhepveetgedtvddvhfdtkeeghfeffeehteeh
    keekgeefjeduieduueelgedtheekkeetnecuvehluhhsthgvrhfuihiivgeptdenucfrrg
    hrrghmpehmrghilhhfrhhomhepnhhikhhlrghsrdhsohguvghrlhhunhgusehrrghgnhgr
    thgvtghhrdhsvgdpnhgspghrtghpthhtohepuddtpdhmohguvgepshhmthhpohhuthdprh
    gtphhtthhopehlrghurhgvnhhtrdhpihhntghhrghrthesihguvggrshhonhgsohgrrhgu
    rdgtohhmpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhope
    hgvggvrhhtodhrvghnvghsrghssehglhhiuggvrhdrsggvpdhrtghpthhtohepmhgrghhn
    uhhsrdgurghmmhesghhmrghilhdrtghomhdprhgtphhtthhopehkrhiikhdoughtsehkvg
    hrnhgvlhdrohhrghdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhg
    pdhrtghpthhtoheplhhinhhugidqrhgvnhgvshgrshdqshhotgesvhhgvghrrdhkvghrnh
    gvlhdrohhrghdprhgtphhtthhopeguvghvihgtvghtrhgvvgesvhhgvghrrdhkvghrnhgv
    lhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnh
    gvlhdrohhrgh
X-ME-Proxy: <xmx:xRE9aWo3I3y1ZiQDryhPNvA_e05sXekVRb4c0bxVX9KwGXi-Ud19Yw>
    <xmx:xRE9aUWW-glbmk9Vh58LuYVnepji1XJn6ip5RXqWD5SDDGO_Xvw9uw>
    <xmx:xRE9aW1_yCIUElO2Lvj7cBdTe4mtI6fTNdFasaCW_nmZqZHPSu1PlQ>
    <xmx:xRE9aRtzpOcQXi22TnDZMB5W6t2HSrNMsHxxBvkQ6oEbij9JN0gXxg>
    <xmx:xhE9aW78gbJiQrXRo89uficiqSBLhVaCwkhRgRBHvPPYYgw6T6Jezzl6>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 13 Dec 2025 02:12:05 -0500 (EST)
Date: Sat, 13 Dec 2025 08:12:03 +0100
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: "Rob Herring (Arm)" <robh@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: Re: [PATCH] arm/arm64: dts: renesas: Drop unused .dtsi
Message-ID: <20251213071203.GA681376@ragnatech.se>
References: <20251212203226.458694-1-robh@kernel.org>
 <20251213062037.GA30577@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251213062037.GA30577@pendragon.ideasonboard.com>

Hello,

On 2025-12-13 15:20:37 +0900, Laurent Pinchart wrote:
> Hi Rob,
> 
> CC'ing Jacopo.
> 
> On Fri, Dec 12, 2025 at 02:32:07PM -0600, Rob Herring (Arm) wrote:
> > These .dtsi files are not included anywhere in the tree and can't be
> > tested.
> > 
> > Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> > ---
> >  .../renesas/gr-peach-audiocamerashield.dtsi   |  75 ----
> 
> Jacopo, any opinion on this ? Should it be conevrted to an overlay, or
> dropped ?
> 
> >  .../dts/renesas/r8a77xx-aa121td01-panel.dtsi  |  39 --
> 
> I don't have access to this panel any more. I'm fine dropping this
> .dtsi, it can always be resurrected and converted to an overlay if
> someone needs it.
> 
> >  arch/arm64/boot/dts/renesas/gmsl-cameras.dtsi | 332 ------------------
> 
> This would be nice to turn into an overlay, but I'm not sure anyone
> still cares.

I started to write a reply saying I care about this one for V3M and that 
it should be converted to a .dtso. I then looked at the last time I used 
it, ~2 years ago, and the next ting I would need it for is to play with 
the GMSL framework being worked on by Cosmin and streams whenever that 
is merged. I also looked at the file itself and there is some work 
needed split it into more useful .dtso structure.

Inertia hit and I deleted the reply thinking I will do a new .dtso when 
I test the above as the verification of a new overlay alone will require 
the same setup and verification work.

tl;dr; I care about the function, I'm OK with removing the .dtsi; I will 
recreate the functionality as .dtso files in future.

> 
> >  arch/arm64/boot/dts/renesas/r8a779m0.dtsi     |  12 -
> >  arch/arm64/boot/dts/renesas/r8a779m2.dtsi     |  12 -
> >  arch/arm64/boot/dts/renesas/r8a779m4.dtsi     |  12 -
> >  arch/arm64/boot/dts/renesas/r8a779m6.dtsi     |  12 -
> >  arch/arm64/boot/dts/renesas/r8a779m7.dtsi     |  12 -
> >  arch/arm64/boot/dts/renesas/r8a779m8.dtsi     |  17 -
> >  arch/arm64/boot/dts/renesas/r8a779mb.dtsi     |  12 -
> >  arch/arm64/boot/dts/renesas/r9a07g044c1.dtsi  |  25 --
> >  arch/arm64/boot/dts/renesas/r9a07g044l1.dtsi  |  18 -
> >  arch/arm64/boot/dts/renesas/r9a07g054l1.dtsi  |  18 -
> >  arch/arm64/boot/dts/renesas/r9a09g047e37.dtsi |  18 -
> 
> I'll let Geert comment on this :-)
> 
> >  14 files changed, 614 deletions(-)
> >  delete mode 100644 arch/arm/boot/dts/renesas/gr-peach-audiocamerashield.dtsi
> >  delete mode 100644 arch/arm/boot/dts/renesas/r8a77xx-aa121td01-panel.dtsi
> >  delete mode 100644 arch/arm64/boot/dts/renesas/gmsl-cameras.dtsi
> >  delete mode 100644 arch/arm64/boot/dts/renesas/r8a779m0.dtsi
> >  delete mode 100644 arch/arm64/boot/dts/renesas/r8a779m2.dtsi
> >  delete mode 100644 arch/arm64/boot/dts/renesas/r8a779m4.dtsi
> >  delete mode 100644 arch/arm64/boot/dts/renesas/r8a779m6.dtsi
> >  delete mode 100644 arch/arm64/boot/dts/renesas/r8a779m7.dtsi
> >  delete mode 100644 arch/arm64/boot/dts/renesas/r8a779m8.dtsi
> >  delete mode 100644 arch/arm64/boot/dts/renesas/r8a779mb.dtsi
> >  delete mode 100644 arch/arm64/boot/dts/renesas/r9a07g044c1.dtsi
> >  delete mode 100644 arch/arm64/boot/dts/renesas/r9a07g044l1.dtsi
> >  delete mode 100644 arch/arm64/boot/dts/renesas/r9a07g054l1.dtsi
> >  delete mode 100644 arch/arm64/boot/dts/renesas/r9a09g047e37.dtsi
> 
> -- 
> Regards,
> 
> Laurent Pinchart
> 

-- 
Kind Regards,
Niklas Söderlund

