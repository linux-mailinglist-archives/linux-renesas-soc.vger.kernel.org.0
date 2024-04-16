Return-Path: <linux-renesas-soc+bounces-4633-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F0C878A6644
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Apr 2024 10:36:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A72E428191F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Apr 2024 08:36:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 268AB82860;
	Tue, 16 Apr 2024 08:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="bBBN3r8X";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="FlYO4H5H"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from flow8-smtp.messagingengine.com (flow8-smtp.messagingengine.com [103.168.172.143])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5744184D0A;
	Tue, 16 Apr 2024 08:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.143
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713256590; cv=none; b=Aeu7tJEiy8SYccNbpqLY0Ga9FhvBt0KIlh5UvOeQYCgME8Gq2pgY9sjFeJ7ynHaH/+8zV4tD5PFkM/d+oG3afKpQLatlKRLa9eHiCBWdZzFkFWf8R0/0v7697rbHE+dvabjy8xr34lQ0kYSuJ8JUuqdZ5q7yPs/VeWNI94Whef4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713256590; c=relaxed/simple;
	bh=ixYue9KwOmSErPSyvpSBYoSpxPmCTDR7AwjJ2DHe93A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Nr7Qg6hKCyWoVCbJKMI2RkoLUVVzPM4tfy7+RFtC5jqopEcehDwJBWFuXdigbLGhA3HtonWlQ/jjQGxxYrW6NOiI2nEQ0I9mb9C9l0SixM6hpB7cRHhABiI9oRADT2XC/nlojzWlqJF2pDz1MwyXk+LFBzlUh+gLZujPcRpV090=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=bBBN3r8X; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=FlYO4H5H; arc=none smtp.client-ip=103.168.172.143
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailflow.nyi.internal (Postfix) with ESMTP id F03D52002FC;
	Tue, 16 Apr 2024 04:36:24 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Tue, 16 Apr 2024 04:36:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1713256584;
	 x=1713260184; bh=KgnLMpzO9JVVaPVLKim6fGcmIiXVhEZWusvVAMrpG1U=; b=
	bBBN3r8Xx0UTtqriiuNWJLDW6R1ko+STP42fVjSjx1ry4p/b6Rp4Eynmv6sCyKZf
	2OCdI6BHd/NIfUhVCknI8UWbnDWBBp6hCKu0Z5M3t0+KE8fTf/9qjP1kd1X6BRhJ
	9HhrZEhzuNjfw58I4UBeFlFKZettWX0JVM3TzSntYuiBLNAwsDFW/EwXrjI0gNmo
	y3ZrMZeOMOcsXdG5zlvMSCv8JnBsEp1qiLYWV2XEO7SVCCJHiVGv3Sg0E36tJtWB
	L2fVGBfevg9sTSXoG9WfI/2vUkzqImx0H998NPos2hSx4oMdKOGsoxUTwDOtt9LF
	pwizBcDxPzg0pmLjQ4YWQw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1713256584; x=
	1713260184; bh=KgnLMpzO9JVVaPVLKim6fGcmIiXVhEZWusvVAMrpG1U=; b=F
	lYO4H5H6LNjKBnNDpAOwgVWSNiu4epZsIMEGuyyylTkPASQWQ61JwNlOaKPW3bhJ
	b7Cqzs56CVgsEzaSNEMO1jXisk6Xx1wMib3p15iIU1o7C/rhpITal7e7CiaR5MFB
	uPjLAnfl1zIHp9P+kOlfAHKfHzy1MSB2GibHfjPsGakQO1MDjuZCM7azk2RmeyDt
	1blSH6lWuH6URnu4s47++uKLBF7Hvg0prXOTb1jv8lnIGNbhdPuuyYAgbNKQzeRB
	dBOECnEMM3cvNQcZNAhrWbFEMoG+rhVmCH5aJ+mEqNKfilOR807OcTVOZWLCB8zy
	yqbCFQH4DlM+wk6HkmqVw==
X-ME-Sender: <xms:hzgeZmGZbSK1H7m3HGm1KOmsK_AAeMFPVYMixay1Eru8sd7yHDgpiA>
    <xme:hzgeZnWQ2esUMSfU_0D24my2fG0qY2cJNnUNtNtcD2C6rKaFRHtwdHSUnXAnMGhcz
    R7nbiQUhkG6xFzmgC8>
X-ME-Received: <xmr:hzgeZgL4p3xOWEG3oS3ChSupA_xQWuNCojRtuOzIcyFSQu-ogt0Gw_1gfdW37WOalXYL69ozk8ZBIXmnEDxWD79GVtae60Y>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrudejgedgtdehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdejnecuhfhrohhmpefpihhk
    lhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnh
    gvshgrshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeefhfellefh
    ffejgfefudfggeejlefhveehieekhfeulefgtdefueehffdtvdelieenucevlhhushhtvg
    hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggv
    rhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgv
X-ME-Proxy: <xmx:hzgeZgHREZ80XBy4jnNvrmtiApv1GlE_Q_QuRqqabRUqMsKrFa8xPg>
    <xmx:hzgeZsWnjIPgAsnbfsNy03qbsTda4gAblXQaINkW8NlWUFo9aar9Ew>
    <xmx:hzgeZjMJIWID2nyNKYsRLfVyX2YY_GpSPm8rIJ0BHR8kfP99Udj6RA>
    <xmx:hzgeZj1O9p1zEX7cuBBUZUfAUDDT81PY8u7bacEbsmPpkHVcgsddDQ>
    <xmx:iDgeZmdCCdbUfYNPDhx_cScbLSnZQodEv26xWXQqtXgMUP8dPj00ARDN>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 16 Apr 2024 04:36:23 -0400 (EDT)
Date: Tue, 16 Apr 2024 10:36:21 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Paul Barker <paul.barker.ct@bp.renesas.com>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [net-next] net: ethernet: rtsn: Add support for Renesas
 Ethernet-TSN
Message-ID: <20240416083621.GD3460978@ragnatech.se>
References: <20240414135937.1139611-1-niklas.soderlund+renesas@ragnatech.se>
 <98ae4f14-397b-49b7-a0a9-cb316f2594f6@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <98ae4f14-397b-49b7-a0a9-cb316f2594f6@bp.renesas.com>

Hi Paul,

Thanks for your review!

On 2024-04-15 08:34:09 +0100, Paul Barker wrote:
> On 14/04/2024 14:59, Niklas Söderlund wrote:
> > Add initial support for Renesas Ethernet-TSN End-station device of R-Car
> > V4H. The Ethernet End-station can connect to an Ethernet network using a
> > 10 Mbps, 100 Mbps, or 1 Gbps full-duplex link via MII/GMII/RMII/RGMII.
> > Depending on the connected PHY.
> > 
> > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > ---
> > * Changes since RFC
> > - Fix issues in MDIO communication.
> > - Use a dedicated OF node for the MDIO bus.
> > ---
> >  MAINTAINERS                           |    8 +
> >  drivers/net/ethernet/renesas/Kconfig  |   11 +
> >  drivers/net/ethernet/renesas/Makefile |    2 +
> >  drivers/net/ethernet/renesas/rtsn.c   | 1421 +++++++++++++++++++++++++
> >  drivers/net/ethernet/renesas/rtsn.h   |  464 ++++++++
> >  5 files changed, 1906 insertions(+)
> >  create mode 100644 drivers/net/ethernet/renesas/rtsn.c
> >  create mode 100644 drivers/net/ethernet/renesas/rtsn.h
> 
> <snip>
> 
> > diff --git a/drivers/net/ethernet/renesas/rtsn.c b/drivers/net/ethernet/renesas/rtsn.c
> > new file mode 100644
> > index 000000000000..291ab421d68f
> > --- /dev/null
> > +++ b/drivers/net/ethernet/renesas/rtsn.c
> 
> <snip>
> 
> > +static bool rtsn_rx(struct net_device *ndev, int *quota)
> > +{
> > +	struct rtsn_ext_ts_desc *desc;
> > +	struct rtsn_private *priv;
> > +	struct sk_buff *skb;
> > +	dma_addr_t dma_addr;
> > +	int boguscnt;
> 
> I find the variable name `boguscnt` very unclear, I'm not sure if it
> means the count is bogus, or it is counting bogus items?
> 
> I don't think you need to match what I've done in ravb_main.c exactly,
> but I'd prefer to see a better variable name here.

I like the changes you did in this area for RAVB, I will reuse some of 
it in v2 of this.

> 
> > +	u16 pkt_len;
> > +	u32 get_ts;
> > +	int entry;
> > +	int limit;
> > +
> > +	priv = netdev_priv(ndev);
> > +
> > +	entry = priv->cur_rx % priv->num_rx_ring;
> > +	desc = &priv->rx_ring[entry];
> > +
> > +	boguscnt = priv->dirty_rx + priv->num_rx_ring - priv->cur_rx;
> > +	boguscnt = min(boguscnt, *quota);
> > +	limit = boguscnt;
> > +
> > +	while ((desc->die_dt & DT_MASK) != DT_FEMPTY) {
> > +		dma_rmb();
> > +		pkt_len = le16_to_cpu(desc->info_ds) & RX_DS;
> > +		if (--boguscnt < 0)
> > +			break;
> > +
> > +		skb = priv->rx_skb[entry];
> > +		priv->rx_skb[entry] = NULL;
> > +		dma_addr = le32_to_cpu(desc->dptr);
> > +		dma_unmap_single(ndev->dev.parent, dma_addr, PKT_BUF_SZ,
> > +				 DMA_FROM_DEVICE);
> > +
> > +		get_ts = priv->ptp_priv->tstamp_rx_ctrl &
> > +			RCAR_GEN4_RXTSTAMP_TYPE_V2_L2_EVENT;
> > +		if (get_ts) {
> > +			struct skb_shared_hwtstamps *shhwtstamps;
> > +			struct timespec64 ts;
> > +
> > +			shhwtstamps = skb_hwtstamps(skb);
> > +			memset(shhwtstamps, 0, sizeof(*shhwtstamps));
> > +
> > +			ts.tv_sec = (u64)le32_to_cpu(desc->ts_sec);
> > +			ts.tv_nsec = le32_to_cpu(desc->ts_nsec & cpu_to_le32(0x3fffffff));
> > +
> > +			shhwtstamps->hwtstamp = timespec64_to_ktime(ts);
> > +		}
> > +
> > +		skb_put(skb, pkt_len);
> > +		skb->protocol = eth_type_trans(skb, ndev);
> > +		netif_receive_skb(skb);
> > +		ndev->stats.rx_packets++;
> > +		ndev->stats.rx_bytes += pkt_len;
> > +
> > +		entry = (++priv->cur_rx) % priv->num_rx_ring;
> > +		desc = &priv->rx_ring[entry];
> > +	}
> > +
> > +	/* Refill the RX ring buffers */
> > +	for (; priv->cur_rx - priv->dirty_rx > 0; priv->dirty_rx++) {
> > +		entry = priv->dirty_rx % priv->num_rx_ring;
> > +		desc = &priv->rx_ring[entry];
> > +		desc->info_ds = cpu_to_le16(PKT_BUF_SZ);
> > +
> > +		if (!priv->rx_skb[entry]) {
> > +			skb = netdev_alloc_skb(ndev,
> > +					       PKT_BUF_SZ + RTSN_ALIGN - 1);
> 
> I'll send my work using a page pool today as an RFC so you can see if it
> would be beneficial to use that here as well. I was going to hold off
> until the bugfix patches have merged so that I don't need to go through
> another RFC round, but it will be good to get some more review on the
> series anyway.

I like the page pool idea, but there is no real benefit for it in this 
driver at the moment. I would like to play and learn a bit more with it 
in RAVB. And once I know more I can convert this driver too if it fits.

> 
> > +			if (!skb)
> > +				break;
> > +			skb_reserve(skb, NET_IP_ALIGN);
> > +			dma_addr = dma_map_single(ndev->dev.parent, skb->data,
> > +						  le16_to_cpu(desc->info_ds),
> > +						  DMA_FROM_DEVICE);
> > +			if (dma_mapping_error(ndev->dev.parent, dma_addr))
> > +				desc->info_ds = cpu_to_le16(0);
> > +			desc->dptr = cpu_to_le32(dma_addr);
> > +			skb_checksum_none_assert(skb);
> > +			priv->rx_skb[entry] = skb;
> > +		}
> > +		dma_wmb();
> > +		desc->die_dt = DT_FEMPTY | D_DIE;
> > +	}
> > +
> > +	desc = &priv->rx_ring[priv->num_rx_ring];
> > +	desc->die_dt = DT_LINK;
> > +
> > +	*quota -= limit - (++boguscnt);
> > +
> > +	return boguscnt <= 0;
> > +}
> > +
> > +static int rtsn_poll(struct napi_struct *napi, int budget)
> > +{
> > +	struct rtsn_private *priv;
> > +	struct net_device *ndev;
> > +	unsigned long flags;
> > +	int quota = budget;
> > +
> > +	ndev = napi->dev;
> > +	priv = netdev_priv(ndev);
> > +
> > +	/* Processing RX Descriptor Ring */
> > +	if (rtsn_rx(ndev, &quota))
> > +		goto out;
> > +
> > +	/* Processing TX Descriptor Ring */
> > +	spin_lock_irqsave(&priv->lock, flags);
> > +	rtsn_tx_free(ndev, true);
> > +	netif_wake_subqueue(ndev, 0);
> > +	spin_unlock_irqrestore(&priv->lock, flags);
> > +
> > +	napi_complete(napi);
> 
> We should use napi_complete_done() here as described in
> Documentation/networking/napi.rst. That will require rtsn_rx() to return
> the number of packets received so that it can be passed as the work_done
> argument to napi_complete_done().

Good point will update in v2.

> 
> > +
> > +	/* Re-enable TX/RX interrupts */
> > +	spin_lock_irqsave(&priv->lock, flags);
> > +	rtsn_ctrl_data_irq(priv, true);
> > +	__iowmb();
> > +	spin_unlock_irqrestore(&priv->lock, flags);
> > +out:
> > +	return budget - quota;
> > +}
> 
> <snip>
> 
> > +static int rtsn_probe(struct platform_device *pdev)
> > +{
> > +	struct rtsn_private *priv;
> > +	struct net_device *ndev;
> > +	struct resource *res;
> > +	int ret;
> > +
> > +	ndev = alloc_etherdev_mqs(sizeof(struct rtsn_private), TX_NUM_CHAINS,
> > +				  RX_NUM_CHAINS);
> > +	if (!ndev)
> > +		return -ENOMEM;
> > +
> > +	priv = netdev_priv(ndev);
> > +	priv->pdev = pdev;
> > +	priv->ndev = ndev;
> > +	priv->ptp_priv = rcar_gen4_ptp_alloc(pdev);
> > +
> > +	spin_lock_init(&priv->lock);
> > +	platform_set_drvdata(pdev, priv);
> > +
> > +	priv->clk = devm_clk_get(&pdev->dev, NULL);
> > +	if (IS_ERR(priv->clk)) {
> > +		ret = -PTR_ERR(priv->clk);
> > +		goto error_alloc;
> > +	}
> > +
> > +	priv->reset = devm_reset_control_get(&pdev->dev, NULL);
> > +	if (IS_ERR(priv->reset)) {
> > +		ret = -PTR_ERR(priv->reset);
> > +		goto error_alloc;
> > +	}
> > +
> > +	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "tsnes");
> > +	if (!res) {
> > +		dev_err(&pdev->dev, "Can't find tsnes resource\n");
> > +		ret = -EINVAL;
> > +		goto error_alloc;
> > +	}
> > +
> > +	priv->base = devm_ioremap_resource(&pdev->dev, res);
> > +	if (IS_ERR(priv->base)) {
> > +		ret = PTR_ERR(priv->base);
> > +		goto error_alloc;
> > +	}
> > +
> > +	SET_NETDEV_DEV(ndev, &pdev->dev);
> > +	ether_setup(ndev);
> > +
> > +	ndev->features = NETIF_F_RXCSUM;
> > +	ndev->hw_features = NETIF_F_RXCSUM;
> 
> A quick skim of the datasheet suggests that TX checksum calculation is
> also supported. It's probably worth listing which hardware features this
> driver supports/does not support in the commit message.
> 
> Thanks,
> 
> -- 
> Paul Barker






-- 
Kind Regards,
Niklas Söderlund

