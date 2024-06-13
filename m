Return-Path: <linux-renesas-soc+bounces-6155-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 982689072AF
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Jun 2024 14:50:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 02CE71F218F1
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Jun 2024 12:50:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28313143C79;
	Thu, 13 Jun 2024 12:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="aRRrGoY6";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="PYSSHLcu"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fout6-smtp.messagingengine.com (fout6-smtp.messagingengine.com [103.168.172.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C87F84A0F;
	Thu, 13 Jun 2024 12:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718282971; cv=none; b=JEPachGujQavJqljUcX1knZTuegqBAKYs4qcRUb2qcZZX9BXoXXLJICX2oWRQQiIMP1fyW8lxPXVvn0rkpl5ipYML5ZgheZFfeBl2l9Tg3gaOsr1CzqSjRU9++bGR1v8FiBUpg63YMv5LqKud7U8Y0NXfZU8yPCWKaF0dIKcOzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718282971; c=relaxed/simple;
	bh=NKpJ6Iiw4UYoj+zNEhFPlwvU3HGLwHMcbTc/mWPEcuU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EgjgznLBFABgMtSaGEkj1qefBDV+rmPpFp4XAozOmOlENMboNxOSwLQdtjk88D4OCGJ3ZSHVRa88p94jGd4gZwZEyO5EvdJnqrRk2ktax/PqY6z+K9Ny7BCGLHcD2z3gZNoTG8dTnC6dmylXEH8lMvLsi6yJ0cjkNHoFQ77QocM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=aRRrGoY6; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=PYSSHLcu; arc=none smtp.client-ip=103.168.172.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from compute7.internal (compute7.nyi.internal [10.202.2.48])
	by mailfout.nyi.internal (Postfix) with ESMTP id B8D3D138067D;
	Thu, 13 Jun 2024 08:49:26 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute7.internal (MEProxy); Thu, 13 Jun 2024 08:49:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1718282966;
	 x=1718369366; bh=L6kxJTdBVIwMJxow1m9CrvR/9Wv1u80x1hLwjEViFlM=; b=
	aRRrGoY6ZzutzkpiHrIdMTRx0lmmlPU3iEcpXUJXFwir00t1HwgQClAD2EK4WYlB
	S5cL+fqkjPxeSjWAUe7ggPVbLVTqchp8lTe4QAh9mj8NF6jVjsrkyvu0Md35hbjV
	GE9jI/Wk3BsOb9/IEUvy9pBk08L5U19/7VJtWpRutRUWyF6ZwW7xHDQEYrTnpuUr
	w/xXTWe1Y9zwhrHppgPfFGQP7fhvOlEC+bCGozRt/dwsUzCH3UwfCrdcAyVLg4ca
	ffC9U75TPRwcn9q6yALB5CqMHUnGkWyHTkkCtxkOGORqJsIirYEmFadZ7Osa/+Nu
	OzgHYcW9A65aMNe0HQvFvw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1718282966; x=
	1718369366; bh=L6kxJTdBVIwMJxow1m9CrvR/9Wv1u80x1hLwjEViFlM=; b=P
	YSSHLcu5lhhNcMroHOIV8eQP4ikyzN8wSFrn3TB4iSm0VYh7hA1sonVfpQhT1fC+
	FhgkNg/JQGyzEWLz2eFJW38t2DAgwtt4aOJKffd1vAI4tbw9Q+g+Kfh2Z4pnX//A
	TjbPkWER3erCmVwIgvw9e2+BA4xvwnZ5G9424TI15UEcCchR13b3ZL+vRXFMGbDt
	FKwJ3Kd91W77/T3MsWK5ZBtrfkE8MtRoRwbwGjSAaWvzSh4bz/fv4snFu1YxYUwE
	mUHoAljTXjLkvsECcULMb4mMKr2kZ+bC69roEH8aBSfOuVdBkSrrc5uLK8vSgB2g
	YjDIajE8EmAT9d6hsdodQ==
X-ME-Sender: <xms:1epqZsUj4rNNNPqtzX1BHC1gBPPlpeWTCvvWJjc0LBAvdcTYWalWUw>
    <xme:1epqZglV_trNyBB818l6mDgYsDn6Jw7UtATuyIlEb00Tcf1Gciytt8mtm_nys4NIZ
    fZFB0fymEoxg1dg5NU>
X-ME-Received: <xmr:1epqZgajXOjmnoVKY_6oxqwdz2oqp5ovZnuIX3eYPFdS-CA_mwBtPgwV2xjcfVdD9q3KjKb6S4BmmESp-k3aX8FksURHfJk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfedujedgheegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdejnecuhfhrohhmpefpihhk
    lhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnh
    gvshgrshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeefhfellefh
    ffejgfefudfggeejlefhveehieekhfeulefgtdefueehffdtvdelieenucevlhhushhtvg
    hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggv
    rhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgv
X-ME-Proxy: <xmx:1epqZrU5VOzTWgW1f5eHC_Mbtd-7_t3l82xX1AliaWYVl_zPHvl0Ag>
    <xmx:1epqZmn01LCgtouo-4mY3eUK1YS5zowsqSINDGmXut_Rs5juZYDsXA>
    <xmx:1epqZgcD9X1UoFvYQ_ejDRw-f3TUn_fj3BCJi1C9i0V2IgozOIef8A>
    <xmx:1epqZoElHBH6pVLmMIquPP_f4PSxSF9hWoxYC9YWcbvWUEPsE0s2Fg>
    <xmx:1upqZrgx78z4_e2i7htWNYY4HHJTlm0AIeW0_g_vZNZmlfbtt5QUs37I>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 13 Jun 2024 08:49:25 -0400 (EDT)
Date: Thu, 13 Jun 2024 14:49:21 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Paul Barker <paul.barker.ct@bp.renesas.com>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Andrew Lunn <andrew@lunn.ch>, netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [net-next,v8] net: ethernet: rtsn: Add support for Renesas
 Ethernet-TSN
Message-ID: <20240613124921.GG382677@ragnatech.se>
References: <20240613104119.2820792-1-niklas.soderlund+renesas@ragnatech.se>
 <306484c7-4a8c-45ba-b0c6-74514a522f05@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <306484c7-4a8c-45ba-b0c6-74514a522f05@bp.renesas.com>

Hi Paul,

Thanks for your feedback.

On 2024-06-13 13:29:30 +0100, Paul Barker wrote:
> On 13/06/2024 11:41, Niklas Söderlund wrote:
> > Add initial support for Renesas Ethernet-TSN End-station device of R-Car
> > V4H. The Ethernet End-station can connect to an Ethernet network using a
> > 10 Mbps, 100 Mbps, or 1 Gbps full-duplex link via MII/GMII/RMII/RGMII.
> > Depending on the connected PHY.
> > 
> > The driver supports Rx checksum and offload and hardware timestamps.
> > 
> > While full power management and suspend/resume is not yet supported the
> > driver enables runtime PM in order to enable the module clock. While
> > explicit clock management using clk_enable() would suffice for the
> > supported SoC, the module could be reused on SoCs where the module is
> > part of a power domain.
> > 
> > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > ---
> > * Changes since v7
> > - Properly handle Rx when netpoll is called with 0 budget. Previously
> >    one Rx packet would be processed in this case.
> > - Use napi_alloc_skb() instead of netdev_alloc_skb() in Rx.
> > - Use device implemented 64 bit stats instead of using stats member in
> >    struct net_device.
> > - Implement ndo_hwtstamp_{g,s}et instead of acting on SIOC{G,S}HWTSTAMP
> >    in do_ioctl().
> > - Fix incorrect error sign when using PTR_ERR().
> > - Add missing cosmetic space when creating struct of_device_id.
> > - Rename label error_alloc to error_free.
> > 
> > * Changes since v6
> > - Fix warning added when removing delays depending on phy-mode logic.
> > 
> > * Changes since v5
> > - Removed delays depending on phy-mode logic. This is only needed on
> >    some SoCs (V4H multiple boards), and currently we can't test on them.
> >    As this have been a hot topic in review drop it for now so we can
> >    support V4H single boards which we can test and lets work on the delay
> >    on-top when we can test it.
> > 
> > * Changes since v4
> > - Enable GPOUT_RDM and GPOUT_TDM delays depending on phy-mode.
> > 
> > * Changes since v3
> > - Add description to commit message why PM operations are used instead
> >    of explicit management of the clock.
> > 
> > * Changes since v2
> > - Drop extra call to ether_setup(), already called by
> >    alloc_etherdev_mqs().
> > - Remove dependency on MII.
> > - Improve error paths when requestion IRQs.
> > - Correct the interpretation of which  phy-mode to apply delays for, and
> >    mask the phy-mode passed to the PHY if MAC adds delays.
> > 
> > * Changes since v1
> > - Remove C45 read/write functions, the phy-core can do that for us.
> > - Rework the driver to register the MDIO bus at probe time instead of at
> >    ndo_open().
> > - Rework rtsn_rx() to take advantages of the improved design proposed
> >    and upstreamed for R-Car RAVB driver Rx code-path.
> > - Use napi_complete_done() instead of napi_complete().
> > - Update commit message to list that the driver supports Rx CSUM
> >    offload.
> > - Drop unneeded __iowmb() left from development as well as a stray ;.
> > - Consider all RGMII modes.
> > - Move the phy_stop() call to mirror where phy_start() is called.
> > - Forward IOCTLS from rtsn_do_ioctl() to PHY using ndo_eth_ioctl()
> > - Align variable names to match core for IOCTLS functions.
> > - Make sure DMA mask and PTP is registered before registering the ndev.
> > - Document why the RTSN driver needs to be able to apply delays
> > - Add checks for which phy-modes the MAC driver can apply delays
> > - Use snprintf() instead of sprintf()
> > 
> > * Changes since RFC
> > - Fix issues in MDIO communication.
> > - Use a dedicated OF node for the MDIO bus.
> > ---
> >   MAINTAINERS                           |    8 +
> >   drivers/net/ethernet/renesas/Kconfig  |   10 +
> >   drivers/net/ethernet/renesas/Makefile |    2 +
> >   drivers/net/ethernet/renesas/rtsn.c   | 1381 +++++++++++++++++++++++++
> >   drivers/net/ethernet/renesas/rtsn.h   |  464 +++++++++
> >   5 files changed, 1865 insertions(+)
> >   create mode 100644 drivers/net/ethernet/renesas/rtsn.c
> >   create mode 100644 drivers/net/ethernet/renesas/rtsn.h
> 
> [snip]
> 
> > +static int rtsn_rx(struct net_device *ndev, int budget)
> > +{
> > +	struct rtsn_private *priv = netdev_priv(ndev);
> > +	unsigned int ndescriptors;
> > +	unsigned int rx_packets;
> > +	unsigned int i;
> > +	bool get_ts;
> > +
> > +	get_ts = priv->ptp_priv->tstamp_rx_ctrl &
> > +		RCAR_GEN4_RXTSTAMP_TYPE_V2_L2_EVENT;
> > +
> > +	ndescriptors = priv->dirty_rx + priv->num_rx_ring - priv->cur_rx;
> > +	rx_packets = 0;
> > +	for (i = 0; i < ndescriptors; i++) {
> > +		const unsigned int entry = priv->cur_rx % priv->num_rx_ring;
> > +		struct rtsn_ext_ts_desc *desc = &priv->rx_ring[entry];
> > +		struct sk_buff *skb;
> > +		dma_addr_t dma_addr;
> > +		u16 pkt_len;
> > +
> > +		/* Stop processing descriptors if budget is consumed. */
> > +		if (rx_packets >= budget)
> > +			break;
> > +
> > +		/* Stop processing descriptors on first empty. */
> > +		if ((desc->die_dt & DT_MASK) == DT_FEMPTY)
> > +			break;
> > +
> > +		dma_rmb();
> > +		pkt_len = le16_to_cpu(desc->info_ds) & RX_DS;
> > +
> > +		skb = priv->rx_skb[entry];
> > +		priv->rx_skb[entry] = NULL;
> > +		dma_addr = le32_to_cpu(desc->dptr);
> > +		dma_unmap_single(ndev->dev.parent, dma_addr, PKT_BUF_SZ,
> > +				 DMA_FROM_DEVICE);
> > +
> > +		/* Get timestamp if enabled. */
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
> > +
> > +		/* Update statistics. */
> > +		priv->stats.rx_packets++;
> 
> I think it's better to do `priv->stats.rx_packets += rx_packets` once at
> the end of this function instead of repeatedly incrementing another
> variable on the hot path.

We could do that, but I opted for this as it makes more sens to update 
rx_packets and rx_bytes in the same location IMHO.

> 
> > +		priv->stats.rx_bytes += pkt_len;
> > +
> > +		/* Update counters. */
> > +		priv->cur_rx++;
> > +		rx_packets++;
> > +	}
> > +
> > +	/* Refill the RX ring buffers */
> > +	for (; priv->cur_rx - priv->dirty_rx > 0; priv->dirty_rx++) {
> > +		const unsigned int entry = priv->dirty_rx % priv->num_rx_ring;
> > +		struct rtsn_ext_ts_desc *desc = &priv->rx_ring[entry];
> > +		struct sk_buff *skb;
> > +		dma_addr_t dma_addr;
> > +
> > +		desc->info_ds = cpu_to_le16(PKT_BUF_SZ);
> > +
> > +		if (!priv->rx_skb[entry]) {
> > +			skb = napi_alloc_skb(&priv->napi,
> > +					     PKT_BUF_SZ + RTSN_ALIGN - 1);
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
> > +
> > +		dma_wmb();
> > +		desc->die_dt = DT_FEMPTY | D_DIE;
> > +	}
> > +
> > +	priv->rx_ring[priv->num_rx_ring].die_dt = DT_LINK;
> > +
> > +	return rx_packets;
> > +}
> 
> [snip]
> 
> > +static netdev_tx_t rtsn_start_xmit(struct sk_buff *skb, struct net_device *ndev)
> > +{
> > +	struct rtsn_private *priv = netdev_priv(ndev);
> > +	struct rtsn_ext_desc *desc;
> > +	int ret = NETDEV_TX_OK;
> > +	unsigned long flags;
> > +	dma_addr_t dma_addr;
> > +	int entry;
> > +
> > +	spin_lock_irqsave(&priv->lock, flags);
> > +
> > +	if (priv->cur_tx - priv->dirty_tx > priv->num_tx_ring) {
> > +		netif_stop_subqueue(ndev, 0);
> > +		ret = NETDEV_TX_BUSY;
> > +		goto out;
> > +	}
> > +
> > +	if (skb_put_padto(skb, ETH_ZLEN))
> > +		goto out;
> > +
> > +	dma_addr = dma_map_single(ndev->dev.parent, skb->data, skb->len,
> > +				  DMA_TO_DEVICE);
> > +	if (dma_mapping_error(ndev->dev.parent, dma_addr)) {
> > +		dev_kfree_skb_any(skb);
> > +		goto out;
> > +	}
> > +
> > +	entry = priv->cur_tx % priv->num_tx_ring;
> > +	priv->tx_skb[entry] = skb;
> > +	desc = &priv->tx_ring[entry];
> > +	desc->dptr = cpu_to_le32(dma_addr);
> > +	desc->info_ds = cpu_to_le16(skb->len);
> 
> Should we check against the maximum TX frame size supported by the
> hardware here?
> 
> Whatever we do here, we should also do in the ravb driver as that makes
> a similar cpu_to_le16() call to fill the DS field with no check that the
> HW actually supports transmitting a frame of the given size.

Compared to RAVB the RTSN driver do not support splitting a packet over 
multiple descriptors, so the max frame size adhering to the MTU will 
always fit using a single descriptor.

> 
> > +	desc->info1 = cpu_to_le64(skb->len);
> > +
> > +	if (skb_shinfo(skb)->tx_flags & SKBTX_HW_TSTAMP) {
> > +		skb_shinfo(skb)->tx_flags |= SKBTX_IN_PROGRESS;
> > +		priv->ts_tag++;
> > +		desc->info_ds |= cpu_to_le16(TXC);
> > +		desc->info = priv->ts_tag;
> > +	}
> > +
> > +	skb_tx_timestamp(skb);
> > +	dma_wmb();
> > +
> > +	desc->die_dt = DT_FSINGLE | D_DIE;
> > +	priv->cur_tx++;
> > +
> > +	/* Start xmit */
> > +	rtsn_write(priv, TRCR0, BIT(TX_CHAIN_IDX));
> > +out:
> > +	spin_unlock_irqrestore(&priv->lock, flags);
> > +	return ret;
> > +}
> 
> Thanks,
> 
> -- 
> Paul Barker






-- 
Kind Regards,
Niklas Söderlund

