Return-Path: <linux-renesas-soc+bounces-12353-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DB29FA1973C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Jan 2025 18:12:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 761587A298F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Jan 2025 17:12:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB63C215175;
	Wed, 22 Jan 2025 17:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="bCJOJ+z3";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="GshI7Hz7"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fhigh-b2-smtp.messagingengine.com (fhigh-b2-smtp.messagingengine.com [202.12.124.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 236C6215046;
	Wed, 22 Jan 2025 17:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737565964; cv=none; b=ZbGoBzj5kb9edUoU6veC47hFRytyb5+/Dou1E1w/YhXFPaRWov83gZN41YrOnICjkp7NFzHWhy0LqserD6ZQ3Jh1D2gPjmbYrkgaFdzjKG9vznx/QIScEbFmj3lQ5nM9BydbOSYhRC8GElSPuq+ON4TbNUKfrMvJFG3DAdtbX9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737565964; c=relaxed/simple;
	bh=6SgjZb4hRVUGBh3SnTlgmRCpC4S7SRttCDI4bqrR47U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q/Dei7bSToE6ntX2uEDqRSvDqkZYGoXRObq86ySBhZG+aC1Y4p19EJqoCMFGBYTpcNQPFv8qiF5K79HSWtzowyftoeQjrX2RyMTfVKi+rSWHG9txsTXC/7ExrbYxXble2FyYOGszYMc0qkNk/R9j0kI5NiR1OUmOulG1RwtipVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=bCJOJ+z3; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=GshI7Hz7; arc=none smtp.client-ip=202.12.124.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-08.internal (phl-compute-08.phl.internal [10.202.2.48])
	by mailfhigh.stl.internal (Postfix) with ESMTP id BDCDD2540110;
	Wed, 22 Jan 2025 12:12:41 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-08.internal (MEProxy); Wed, 22 Jan 2025 12:12:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1737565961;
	 x=1737652361; bh=dwXUm8YoFY119K2i5joSNw1cugyijj5TSH6LML8FXWc=; b=
	bCJOJ+z3duE37aP5s7oDarp/kSqypI2BYu9e7S8Qh/yNOAMqBxRDJiiyLHSprDLV
	KUVQlOotf/G3Yemcb0lzE2VLQhOpps7i3szvIROkUK2K8rmRfNwP1Iwrsl3zFsFk
	v+9P6S9T7d5blkn2bwYXBixev/DjMOzo/zVdu2bTPiHUrIOvWbp/QGJwQgSAW5km
	qiw+FoGvlAWMydCtQTyH8K8ddM3RJ4znU6eradxUV2C3Tl+oGv6v55vO6SLrKjE2
	7Fs5Hqu1MDox5Bx82Q/TrZq4DhYELpRLChaq+u01Y/dBTzwxCW0eXL2/idPlKAgy
	ZQzMFXMoMfZVjqo+yQZeww==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1737565961; x=
	1737652361; bh=dwXUm8YoFY119K2i5joSNw1cugyijj5TSH6LML8FXWc=; b=G
	shI7Hz7NEafgXnn9bEaeIZEmLNWdcofMAT4gUNVQb1etgPoHyVdl+e5tXyhu/lW9
	Vyysdi3uFlgzGaMxprSP+f8+K2evUmDArD6o3FesX+hf2ZKp1nLf2bSZF7vw1Gqz
	YleZj33hGw50ZqahLGyBVezsF8GlsUGm6Dir2Lmf4CwyH8F1i4hysJmVJKhAbPIZ
	QSmoKtNuU7TWytGm6WieS1HKuS+4hd4wVwKwta+FeTXqjvcOTkRkfJMZmTyiVqHm
	Inf8/t0SKej2YlvE2unE+BlikAL3q0APkRSlVRX5H6K1dZfA42xshcZHW2Gohysj
	MARn0iydAvdXX9cgBqG8A==
X-ME-Sender: <xms:CCeRZzTukk_fBTMpvFKINTZxZQEGRbFHOyyZkip8LJQhLnt3LJP6rg>
    <xme:CCeRZ0xAeNu1FU2JL1H8oUCItSxuVHOm64z-jQj1LdRnQxpI4QXxunAJ1J8A5opjT
    9_Sjpn3GgohLKHQhYk>
X-ME-Received: <xmr:CCeRZ40AaKF8V5yWRp0aNtFVoay-Ive10UJnn3b9cFHYrO0j2UreKFzLIGvFdTXoCDf90-OIjE36LPcnC5RbWLKYQ-6CM9w7HQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudejfedgvddvudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtugfgjgesthekredttddt
    jeenucfhrhhomheppfhikhhlrghsucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsoh
    guvghrlhhunhgusehrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgrthhtvghrnhepveet
    gedtvddvhfdtkeeghfeffeehteehkeekgeefjeduieduueelgedtheekkeetnecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepnhhikhhlrghsrdhs
    ohguvghrlhhunhgusehrrghgnhgrthgvtghhrdhsvgdpnhgspghrtghpthhtohepudegpd
    hmohguvgepshhmthhpohhuthdprhgtphhtthhopehkohhrhidrmhgrihhntggvnhhtsegs
    ohhothhlihhnrdgtohhmpdhrtghpthhtohepphgruhhlrdgsrghrkhgvrhdrtghtsegsph
    drrhgvnhgvshgrshdrtghomhdprhgtphhtthhopegrnhgurhgvfidonhgvthguvghvsehl
    uhhnnhdrtghhpdhrtghpthhtohepuggrvhgvmhesuggrvhgvmhhlohhfthdrnhgvthdprh
    gtphhtthhopegvughumhgriigvthesghhoohhglhgvrdgtohhmpdhrtghpthhtohepkhhu
    sggrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehprggsvghnihesrhgvughhrghtrd
    gtohhmpdhrtghpthhtohepmhhikhhhrghilhdruhhlhigrnhhovhestghoghgvnhhtvghm
    sggvugguvggurdgtohhmpdhrtghpthhtohepshgvrhhgvghirdhshhhthihlhihovhestg
    hoghgvnhhtvghmsggvugguvggurdgtohhm
X-ME-Proxy: <xmx:CCeRZzBWpjYX03w41G2EEs7210WJ7r-uYtUm-QJLCM6H0LtjSYBuiw>
    <xmx:CCeRZ8iWxQbUldT1DJaFBteo_i8tIIThYDg58TwGXjiHTshBBCtLTw>
    <xmx:CCeRZ3p_31ibqaCBXuXXoShraVbDrE5F4g0aaZeN0XIgVjAGwMtOEg>
    <xmx:CCeRZ3h0xmbSRSH5zv76A1_SnFTrNMOR1avYMbi0GHlylCp3rgxXng>
    <xmx:CSeRZ87pDXGjTpoz4EkjTeIjrGR0rma_ktN1ypZ7ecKagSnt2UQLgZoK>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 22 Jan 2025 12:12:39 -0500 (EST)
Date: Wed, 22 Jan 2025 18:12:37 +0100
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Kory Maincent <kory.maincent@bootlin.com>
Cc: Paul Barker <paul.barker.ct@bp.renesas.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Mikhail Ulyanov <mikhail.ulyanov@cogentembedded.com>,
	Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net 2/2] net: sh_eth: Fix missing rtnl lock in suspend
 path
Message-ID: <20250122171237.GF3436806@ragnatech.se>
References: <20250122-fix_missing_rtnl_lock_phy_disconnect-v1-0-8cb9f6f88fd1@bootlin.com>
 <20250122-fix_missing_rtnl_lock_phy_disconnect-v1-2-8cb9f6f88fd1@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250122-fix_missing_rtnl_lock_phy_disconnect-v1-2-8cb9f6f88fd1@bootlin.com>

Hi Kory,

Thanks for your work.

On 2025-01-22 17:19:29 +0100, Kory Maincent wrote:
> Fix the suspend path by ensuring the rtnl lock is held where required.
> Calls to sh_eth_close, sh_eth_open and wol operations must be performed
> under the rtnl lock to prevent conflicts with ongoing ndo operations.
> 
> Fixes: b71af04676e9 ("sh_eth: add more PM methods")
> Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>

Tested on R-Car M2,

Tested-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  drivers/net/ethernet/renesas/sh_eth.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/net/ethernet/renesas/sh_eth.c b/drivers/net/ethernet/renesas/sh_eth.c
> index 8887b8921009..5fc8027c92c7 100644
> --- a/drivers/net/ethernet/renesas/sh_eth.c
> +++ b/drivers/net/ethernet/renesas/sh_eth.c
> @@ -3494,10 +3494,12 @@ static int sh_eth_suspend(struct device *dev)
>  
>  	netif_device_detach(ndev);
>  
> +	rtnl_lock();
>  	if (mdp->wol_enabled)
>  		ret = sh_eth_wol_setup(ndev);
>  	else
>  		ret = sh_eth_close(ndev);
> +	rtnl_unlock();
>  
>  	return ret;
>  }
> @@ -3511,10 +3513,12 @@ static int sh_eth_resume(struct device *dev)
>  	if (!netif_running(ndev))
>  		return 0;
>  
> +	rtnl_lock();
>  	if (mdp->wol_enabled)
>  		ret = sh_eth_wol_restore(ndev);
>  	else
>  		ret = sh_eth_open(ndev);
> +	rtnl_unlock();
>  
>  	if (ret < 0)
>  		return ret;
> 
> -- 
> 2.34.1
> 

-- 
Kind Regards,
Niklas Söderlund

