Return-Path: <linux-renesas-soc+bounces-6287-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D26FC909866
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 15 Jun 2024 15:04:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6295F282357
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 15 Jun 2024 13:04:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA8304595B;
	Sat, 15 Jun 2024 13:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="oY42pflm";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="cLQmIWBf"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fout4-smtp.messagingengine.com (fout4-smtp.messagingengine.com [103.168.172.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00221182B3;
	Sat, 15 Jun 2024 13:04:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718456685; cv=none; b=d2beeDO6wX4Kd741/FZP5gaMx5bucRpgdfweQDjD0Qsv/q/JmnnWShaX2nuMwRYCJogjTWWZkDr14Ysky1i75yWx81dppu3k4BOgaoNzjQ+a2FydBSL+20LEMAqh0tHnotr2wKW5NmA5uwQcHbL3PgL6DybcHFu6v7nAu1xnOZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718456685; c=relaxed/simple;
	bh=R0yXDZVz8Hhosczpe3YGHQJlxNpiPLuGHLPOmhLIxIM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SBm9OMkjiIOQI949TTxC2PGUSvsIMXILkDC0LDjg9mEb/tmBBY85bJCVFHf/5R936J0VBerQ6MDNDlx6Mx7sjsfqDugbW+RbB/LVTDEwdVi3JI4hZRMcmtJXnMjQsy0jjlXhCqldfQDpxkHR5PiokY6hOcZwyH6Tr553JJJfUlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=oY42pflm; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=cLQmIWBf; arc=none smtp.client-ip=103.168.172.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfout.nyi.internal (Postfix) with ESMTP id D21D7138019D;
	Sat, 15 Jun 2024 09:04:41 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Sat, 15 Jun 2024 09:04:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1718456681;
	 x=1718543081; bh=fOBOshIYNS+PV6O/E8eNH2Ys3QmEaCSuRs0xX9h3tzg=; b=
	oY42pflmId2LLSxQuPnhPRFx6I6Z5ur9yXsR3sdtJii5EqkkxunAuaEIeztO7llW
	E2YVhF30CR6/3gx7dSXqGacs54dZRTIBJIdQBIg+TW5/ztbJn865zyf3J/LsudQY
	uAi79rTKpR9e7mgGRT5ekpcajQvc/K4iezpGxkVbghr+vMJwRdqFLhzwiperMP+3
	nUrp0fUm/NRaAt1zV/Fa9UgHOzgRSMld5h4f+reih9xYcsLohI46SJxP7y0/3Qa9
	qxgjtvuMgaCW7TaIWe59+zZN3K+7uObQpFMvy+yiKQeq4uX1woXekS8wCqyegZfU
	lswhmfMJ0hhWMcFpGp3N9g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1718456681; x=
	1718543081; bh=fOBOshIYNS+PV6O/E8eNH2Ys3QmEaCSuRs0xX9h3tzg=; b=c
	LQmIWBfud0r+um+RMVFGwHq2uHrb8RKeB+xWAzHA0qeaNW0BFMFs0qPPoitWDRdU
	ThsVG/4P6Pzmlt7AscS/YL0Keb3yyPlUpFo+V/enHX5gz++Y7w2nrtSI5fg3f0qM
	8VrfdbhvjlEWGEwBA3PlXYSQXSfVzILSRVPOc7Yr8V19cFsjxo59GrSfDZPi62oW
	p1mR9lEp/XttRD/TjSAQgKzfi/y8QVcQJRKaviDUDVfhjR/AyBxBYhyePcIZee8M
	XC1PlbS7FVMRld71tgLrvPIrGdR4redgzNrj7pso0cQq+H5oLB386897wmtQdDDq
	dYfRfboPLodaYkp8s4dQQ==
X-ME-Sender: <xms:aJFtZgo0UIG-C1VsYfcsQ94UijnuE4jjhQzj-7GUQHG_t_YZwvcaWw>
    <xme:aJFtZmpAFQv0M-L1YJ3dj5MqlKx629PPgC2a-Ijb3T-Use53qKGrIzQVU_TzG6CJR
    3xrAp93F4xdMLtJDHk>
X-ME-Received: <xmr:aJFtZlMBBBUWuwaFWRZv9nAqB-suDD_SIoZbSluIeTd8MBAqGQfeL05atqGltYJQVW1BQ62zWLT22o1H9V1agW_4RJBYhk0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfedvuddgieduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdejnecuhfhrohhmpefpihhk
    lhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnh
    gvshgrshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeefhfellefh
    ffejgfefudfggeejlefhveehieekhfeulefgtdefueehffdtvdelieenucevlhhushhtvg
    hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggv
    rhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgv
X-ME-Proxy: <xmx:aJFtZn6OTAMYEb8I0mOjby0LWOoJukP99sVcsm1lspW_2l7SUCYKVw>
    <xmx:aZFtZv6jCQztrsjwO7xrdXdszehRxkZxXg_Ro2lZcpW0vrwiPVPkuw>
    <xmx:aZFtZnijf7wdx5gZIR2lDk8oNUu107SoUoxaLxLpIe5segMs-oLF2g>
    <xmx:aZFtZp77cyQQRVDy2P1m6TIbDrrzA8PeorCP0HL-yeFdklSzI8PMQg>
    <xmx:aZFtZmJLHso00MNCwK-cN4SFA0ErpXwqhvbcuOqinEF-xdlG3Ujdn8DY>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 15 Jun 2024 09:04:40 -0400 (EDT)
Date: Sat, 15 Jun 2024 15:04:39 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Paul Barker <paul.barker.ct@bp.renesas.com>
Cc: Sergey Shtylyov <s.shtylyov@omp.ru>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Mitsuhiro Kimura <mitsuhiro.kimura.kc@renesas.com>,
	netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [net-next PATCH 2/2] net: ravb: Fix R-Car RX frame size limit
Message-ID: <20240615130439.GM382677@ragnatech.se>
References: <20240615103038.973-1-paul.barker.ct@bp.renesas.com>
 <20240615103038.973-3-paul.barker.ct@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240615103038.973-3-paul.barker.ct@bp.renesas.com>

Hi Paul,

Thanks for your work.

On 2024-06-15 11:30:38 +0100, Paul Barker wrote:
> The RX frame size limit should not be based on the current MTU setting.
> Instead it should be based on the hardware capabilities.
> 
> Fixes: c156633f1353 ("Renesas Ethernet AVB driver proper")

I agree with the change the RFLR.RFL setting should not be connected to 
the MTU setting. And this likely comes from the early days of the driver 
where neither Rx or Tx supported multiple descriptors for each packet.  
In those days the single descriptor used for each packet was tied to the 
MTU setting. So likely the fixes tag should point to a later commit?

This is a great find and shows a flaw in the driver. But limiting the 
size of each descriptor used for Tx is only half the solution right? As 
the driver now supports multiple descriptors for Tx (on GbEth) the 
driver allows setting an MTU larger then the maximum size for single 
descriptor on those devices. But the xmit function of the driver still 
hardcode the maximum of 2 descriptors for each Tx packet. And it only 
uses the two descriptors to align the data to hardware constrains.

Is it not incorrect for the driver to accept an MTU larger then the 
maximum size of a single descriptor with the current Tx implementation?  
The driver can only support larger MTU settings for Rx, but not Tx ATM.

I think the complete fix is to extend ravb_start_xmit() to fully support 
split descriptors for packets larger then the maximum single descriptor 
size. Not just to align the packet between a DT_FSTART and DT_FEND 
descriptor when needed.

> Signed-off-by: Paul Barker <paul.barker.ct@bp.renesas.com>
> ---
>  drivers/net/ethernet/renesas/ravb_main.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
> index 02cbf850bd85..481c854cb305 100644
> --- a/drivers/net/ethernet/renesas/ravb_main.c
> +++ b/drivers/net/ethernet/renesas/ravb_main.c
> @@ -555,8 +555,10 @@ static void ravb_emac_init_gbeth(struct net_device *ndev)
>  
>  static void ravb_emac_init_rcar(struct net_device *ndev)
>  {
> +	struct ravb_private *priv = netdev_priv(ndev);
> +
>  	/* Receive frame limit set register */
> -	ravb_write(ndev, ndev->mtu + ETH_HLEN + VLAN_HLEN + ETH_FCS_LEN, RFLR);
> +	ravb_write(ndev, priv->info->rx_max_frame_size + ETH_FCS_LEN, RFLR);
>  
>  	/* EMAC Mode: PAUSE prohibition; Duplex; RX Checksum; TX; RX */
>  	ravb_write(ndev, ECMR_ZPF | ECMR_DM |
> -- 
> 2.39.2
> 

-- 
Kind Regards,
Niklas Söderlund

