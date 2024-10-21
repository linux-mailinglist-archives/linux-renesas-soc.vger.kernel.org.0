Return-Path: <linux-renesas-soc+bounces-9946-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C62F79A6D99
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Oct 2024 17:05:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E47961C21D40
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Oct 2024 15:05:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D86AA1FAC21;
	Mon, 21 Oct 2024 15:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="n/xWsOaU";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="gfwwMOiL"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fout-b2-smtp.messagingengine.com (fout-b2-smtp.messagingengine.com [202.12.124.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 386121F471B;
	Mon, 21 Oct 2024 15:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729523096; cv=none; b=mDTMezP+7nyQp9Tf18pDRbT+52GJaLmlbz/JIdI6hA6JNeQV5bkE1lfUhGY3+Nx5PwsMoZ74ZzH4TQV2hZ/NBhxUjdT2BQEItCCekkRinlud8STmS4MbglpFE2TIR19F4CzLZ71jj/EekKH78HjdNVPjkwOMTSEn46kLBkZrUKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729523096; c=relaxed/simple;
	bh=iQfDtg2p5AMivEvH8CrFMlmxSZNZUVXwuwIjk3mYFyM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FF4JDYfUDkfWvwd3faxWZeXvHjkFpx1c6wEEZyADO9GXMWBnGb+MGoxYFZCSH6w9m69wvpvuQw+cZsF4Hhst9s7AqHsz0UcUjfp/JZXvIPpICENJY5Bi9PZGT+QakWGgujMK6v4uDhu81jafsM1WzGdWIVqTVFu9nX/qC/eQr10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=n/xWsOaU; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=gfwwMOiL; arc=none smtp.client-ip=202.12.124.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-02.internal (phl-compute-02.phl.internal [10.202.2.42])
	by mailfout.stl.internal (Postfix) with ESMTP id 0642C11400D2;
	Mon, 21 Oct 2024 11:04:51 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Mon, 21 Oct 2024 11:04:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1729523091;
	 x=1729609491; bh=8CAPBjyRnLmuZKLSE6H2/t3gLJQuCsE4bcXXKOoW3qE=; b=
	n/xWsOaUVOqBxSxURFQx7JkbX8dUdqe0xnvYLW3/GHTnpTWdWWTOORq9kiYywIXi
	vaoqG4N8/UqhYJUOjihYFopjt+rigx37hpwemQyNMvWVpen+pmnLzzkVFkPkFhIu
	WyqVeDJfFWmuU/RQbJROjavNBLjH2kd9oGi4nvcS5H23vRzvWfajfv0aJVichOEi
	+X2v6R0FQw1UEqA3qfwgnQABUOoJaiXb6iMm1ugdXGoBJT0APMjKYIEa3KtaDoSm
	fpAJXPqwSrF6NMQO8Cek6HY7WEGuDyYsx4mn8paQe7cdGdtQhrztkmhaZ637jeiD
	9wiEz00B/hxVSoBUe18TjA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1729523091; x=
	1729609491; bh=8CAPBjyRnLmuZKLSE6H2/t3gLJQuCsE4bcXXKOoW3qE=; b=g
	fwwMOiLj/7PIHm15oVum/qkM/Y69+4iF5sJX0iiuNRTLSOrZura7ZlhKU8i6HlMP
	rmPUZouZ0eoWmqWU0uaaTRqIut39gpibGFPqU2O4aIXXFbUFxfILGuIicO5IMH9U
	sBwcqFSRffSclS0pgDYTH15Vgctk+QSv/hLjCrvPnmwmQroKc672SnzU8ieHQC4N
	EKzNGNS351hwn3K2ZmvCs0MG/XfGOXD0ZHDOX/YO93XrIrhGA1BOljP1GojJhLm5
	RqQjnlyCjPNFKqTOZM2H2uj8lcH4c8+Xq0QxZM5Yvx/mgJXpM1F25ide6YSjKt0q
	Gno7Mym4QwFY1VYYtboCQ==
X-ME-Sender: <xms:km0WZ2pV9M6Eh51WhzfCGsMTrpEHlrNiLA4NftGolXZ4sBblyqf_GA>
    <xme:km0WZ0q2c5Q-O_rqE-gIDlN2ltFnDjgBK_bspTIKoNOD7SbnfALlzZzUr9zQcrv7r
    ROWCym-G2gqHxtDxD8>
X-ME-Received: <xmr:km0WZ7Nxo1q4MbklRdvzqB65GbI4ubctIp0f8E4kvSeAGdoFj5Ryz1F6fLoeTcN9fKbL_r0JzSExZyMVrEkcdZVwqVb5vOqztg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdehledgkeegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdej
    necuhfhrohhmpefpihhklhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhoug
    gvrhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrght
    thgvrhhnpeefhfellefhffejgfefudfggeejlefhveehieekhfeulefgtdefueehffdtvd
    elieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehn
    ihhklhgrshdrshhouggvrhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrsh
    gvpdhnsggprhgtphhtthhopedutddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohep
    ghgvvghrthdorhgvnhgvshgrshesghhlihguvghrrdgsvgdprhgtphhtthhopehgrhgvgh
    hkhheslhhinhhugihfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopegtlhgruhgu
    ihhurdgsvgiinhgvrgdruhhjsegsphdrrhgvnhgvshgrshdrtghomhdprhgtphhtthhope
    hprghulhdrsggrrhhkvghrrdgtthessghprdhrvghnvghsrghsrdgtohhmpdhrtghpthht
    ohephihoshhhihhhihhrohdrshhhihhmohgurgdruhhhsehrvghnvghsrghsrdgtohhmpd
    hrtghpthhtoheplhhinhhugidqrhgvnhgvshgrshdqshhotgesvhhgvghrrdhkvghrnhgv
    lhdrohhrghdprhgtphhtthhopehnvghtuggvvhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
    dprhgtphhtthhopehlihhnuhigqdhiuggvsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhr
    tghpthhtoheplhhinhhugidqshhhsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:km0WZ16npb8c9tj51zfs0I7ofSlxi1gSQdM6qWCzw7VGnUsG6Tt35w>
    <xmx:km0WZ1570njkw9o0y2U4gz1HBSKL-ytFPPnhcwvB4dVU5ESBVWYRVA>
    <xmx:km0WZ1iXA0yUFwWjMBm7teeehH91sW25vTO6sEcRQHiw2rAwXgV7fw>
    <xmx:km0WZ_4RPt_2jKnZ2InZ0ZITOY8cZEvm49Q_P4bncc7-Uiw3Rtawiw>
    <xmx:k20WZyyhZgkX8E3aoPGS4nBFSJE-PwMa79KfupL-sGe1sQiyZO5-u7V_>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 21 Oct 2024 11:04:50 -0400 (EDT)
Date: Mon, 21 Oct 2024 17:04:47 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Paul Barker <paul.barker.ct@bp.renesas.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	linux-renesas-soc@vger.kernel.org, netdev@vger.kernel.org,
	linux-ide@vger.kernel.org, linux-sh@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH/RFC] MAINTAINERS: Re-add cancelled Renesas driver sections
Message-ID: <20241021150447.GC4176464@ragnatech.se>
References: <0a189e2c4090a1b308e18005d2552e335bac354f.1729511337.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0a189e2c4090a1b308e18005d2552e335bac354f.1729511337.git.geert+renesas@glider.be>

Hello Geert,

On 2024-10-21 13:56:51 +0200, Geert Uytterhoeven wrote:
> Removing full driver sections also removed mailing list entries, causing
> submitters of future patches to forget CCing these mailing lists.
> 
> Fixes: 6e90b675cf942e50 ("MAINTAINERS: Remove some entries due to various compliance requirements.")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Anyone who wants to take over maintenance for these drivers?

In case Sergei is not interested to keep looking after the RAVB and/or 
SUPERH Ethernet drivers I would be happy to do so.

In either case should not the maintainer entry in the bindings documents
also be updated?

> Thanks in advance!
> ---
>  MAINTAINERS | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index f04cba42a59301fa..97a23cea2729942e 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -19521,6 +19521,14 @@ S:	Supported
>  F:	Documentation/devicetree/bindings/i2c/renesas,iic-emev2.yaml
>  F:	drivers/i2c/busses/i2c-emev2.c
>  
> +RENESAS ETHERNET AVB DRIVER
> +L:	netdev@vger.kernel.org
> +L:	linux-renesas-soc@vger.kernel.org
> +F:	Documentation/devicetree/bindings/net/renesas,etheravb.yaml
> +F:	drivers/net/ethernet/renesas/Kconfig
> +F:	drivers/net/ethernet/renesas/Makefile
> +F:	drivers/net/ethernet/renesas/ravb*
> +
>  RENESAS ETHERNET SWITCH DRIVER
>  R:	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
>  L:	netdev@vger.kernel.org
> @@ -19570,6 +19578,13 @@ F:	Documentation/devicetree/bindings/i2c/renesas,rmobile-iic.yaml
>  F:	drivers/i2c/busses/i2c-rcar.c
>  F:	drivers/i2c/busses/i2c-sh_mobile.c
>  
> +RENESAS R-CAR SATA DRIVER
> +L:	linux-ide@vger.kernel.org
> +L:	linux-renesas-soc@vger.kernel.org
> +S:	Supported
> +F:	Documentation/devicetree/bindings/ata/renesas,rcar-sata.yaml
> +F:	drivers/ata/sata_rcar.c
> +
>  RENESAS R-CAR THERMAL DRIVERS
>  M:	Niklas Söderlund <niklas.soderlund@ragnatech.se>
>  L:	linux-renesas-soc@vger.kernel.org
> @@ -19645,6 +19660,15 @@ S:	Supported
>  F:	Documentation/devicetree/bindings/i2c/renesas,rzv2m.yaml
>  F:	drivers/i2c/busses/i2c-rzv2m.c
>  
> +RENESAS SUPERH ETHERNET DRIVER
> +L:	netdev@vger.kernel.org
> +L:	linux-renesas-soc@vger.kernel.org
> +F:	Documentation/devicetree/bindings/net/renesas,ether.yaml
> +F:	drivers/net/ethernet/renesas/Kconfig
> +F:	drivers/net/ethernet/renesas/Makefile
> +F:	drivers/net/ethernet/renesas/sh_eth*
> +F:	include/linux/sh_eth.h
> +
>  RENESAS USB PHY DRIVER
>  M:	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
>  L:	linux-renesas-soc@vger.kernel.org
> -- 
> 2.34.1
> 

-- 
Kind Regards,
Niklas Söderlund

