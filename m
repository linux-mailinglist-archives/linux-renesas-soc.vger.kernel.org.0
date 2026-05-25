Return-Path: <linux-renesas-soc+bounces-33100-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QAzaM4G0FGpbPgcAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33100-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 May 2026 22:43:45 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 36B7A5CEB5B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 May 2026 22:43:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AC7283038A7E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 May 2026 20:41:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1936397332;
	Mon, 25 May 2026 20:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UkmQ5NBc"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86C9F37F72A;
	Mon, 25 May 2026 20:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779741671; cv=none; b=dkZ8FO7wLQncAoZm8AuuFeBE6KEHL/ZGGX902qcqwgedTZwIiHD5KMotvT02YkLKM+1Pd+gaHcbHu/p3GkNEtC88HDd9NWb9YNZu4+oUNcLIsfLwIeb9fKSI8I2Cdg9yuAeF75NB5RhGUdTjPJj6NUIxy4MC6m+2j4G9RjnMEMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779741671; c=relaxed/simple;
	bh=NCPcIMJPmdXJOd/frxIjWNnR+aQVRRXBhnYCMV8CmtU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sZTCuow6Q0SDTVdvZ51GQyxtYPPez7YnjM2+B8iUzKQKjCHl1zXctrFe8dp1MnOSU+rFjyNHp1tZQ15qhUkHFCNFcGWMxhUylKqVlpqkjltlQyLpw8IL8o9Snj5+RjaC8RZBSAUuaVOyinzWLvigG0LFeP+8NAg89O+stnCWZ4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UkmQ5NBc; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C43C81F00A3A;
	Mon, 25 May 2026 20:41:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779741670;
	bh=/Gm6wpaKFFhWisFLTdLNUG+mSbSkmeJyBt+bFQc4/sw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=UkmQ5NBcfM1PKJzqPsG1dKlj//PmkRYf6rWNRps9WwpaSpwxlLlmLH5cevlkdCmBA
	 cpCBk1WoWsvrjuOD16bAJ7K+3+JUUGTpmdDx43/yQxELQv6J5/6XCkCiV6Pl1I/oEq
	 FACUzraER4I1UG6OcokvVHgvLQyo2sj63nu0W8tTWX48bXTg8f3pkQS4neNhcJ04dL
	 tB1zyAMtXj3MsyLFWMtr/FBhhKWtx1FvrNo88t/hmtL6Ft6uN6S/SIZI9UeL7FbD0Y
	 xc+D/w09JYnjW8wuryJPtLgSzRH3XIp2t54AkbvnRN40Kgx/08KqlHf41NxqAASrUw
	 j44wClgehNs4Q==
From: Jakub Kicinski <kuba@kernel.org>
To: michael.dege@renesas.com
Cc: Jakub Kicinski <kuba@kernel.org>,
	yoshihiro.shimoda.uh@renesas.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	pabeni@redhat.com,
	niklas.soderlund@ragnatech.se,
	paul@pbarker.dev,
	richardcochran@gmail.com,
	netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v5 02/14] net: renesas: rswitch: use device instead of net_device
Date: Mon, 25 May 2026 13:41:09 -0700
Message-ID: <20260525204109.2471260-1-kuba@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260522-rswitch_add_vlans-v5-2-53589d944a9f@renesas.com>
References: <20260522-rswitch_add_vlans-v5-2-53589d944a9f@renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33100-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,renesas.com,lunn.ch,davemloft.net,google.com,redhat.com,ragnatech.se,pbarker.dev,gmail.com,vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuba@kernel.org,linux-renesas-soc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,netdev];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 36B7A5CEB5B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This is an AI-generated review of your patch. The human sending this
email has considered the AI review valid, or at least plausible.
---
net: renesas: rswitch: use device instead of net_device
    
In upcomming changes for adding vlan support struct net_device
will not be available in all cases, therefore use struct device
instead.

> diff --git a/drivers/net/ethernet/renesas/rswitch_main.c b/drivers/net/ethernet/renesas/rswitch_main.c
> index 9b739594cc028..74d441ae19769 100644
> --- a/drivers/net/ethernet/renesas/rswitch_main.c
> +++ b/drivers/net/ethernet/renesas/rswitch_main.c
[ ... ]
> @@ -304,26 +304,30 @@ static int rswitch_gwca_queue_alloc_rx_buf(struct rswitch_gwca_queue *gq,
>  	return -ENOMEM;
>  }
>  
> -static void rswitch_gwca_queue_free(struct net_device *ndev,
> +static void rswitch_gwca_queue_free(struct device *dev,
>  				    struct rswitch_gwca_queue *gq)
>  {
>  	unsigned int i;
>  
>  	if (!gq->dir_tx) {
> -		dma_free_coherent(ndev->dev.parent,
> -				  sizeof(struct rswitch_ext_ts_desc) *
> -				  (gq->ring_size + 1), gq->rx_ring, gq->ring_dma);
> -		gq->rx_ring = NULL;
> -
> +		if (gq->rx_ring) {
> +			dma_free_coherent(dev,
> +					  sizeof(struct rswitch_ext_ts_desc) *
> +					  (gq->ring_size + 1), gq->rx_ring, gq->ring_dma);
> +			gq->rx_ring = NULL;
> +		}
>  		for (i = 0; i < gq->ring_size; i++)
> -			skb_free_frag(gq->rx_bufs[i]);
> +			if (gq->rx_bufs[i])
> +				skb_free_frag(gq->rx_bufs[i]);

[Severity: High]
This is a pre-existing issue, but does this cleanup path leak RX DMA
mappings?

It looks like we call skb_free_frag() for the RX buffers but we never call
dma_unmap_single(). Furthermore, because the rx_ring is freed before the
loop, any DMA addresses stored in the descriptors are lost, making it
impossible to unmap them.

>  		kfree(gq->rx_bufs);
>  		gq->rx_bufs = NULL;
>  	} else {
> -		dma_free_coherent(ndev->dev.parent,
> -				  sizeof(struct rswitch_ext_desc) *
> -				  (gq->ring_size + 1), gq->tx_ring, gq->ring_dma);
> -		gq->tx_ring = NULL;
> +		if (gq->tx_ring) {
> +			dma_free_coherent(dev,
> +					  sizeof(struct rswitch_ext_desc) *
> +					  (gq->ring_size + 1), gq->tx_ring, gq->ring_dma);
> +			gq->tx_ring = NULL;
> +		}
>  		kfree(gq->skbs);
>  		gq->skbs = NULL;
>  		kfree(gq->unmap_addrs);

[Severity: High]
This isn't a bug introduced by this patch, but does the TX teardown also
leak resources?

It appears it does not iterate over pending gq->skbs to unmap and free
them before freeing the array itself.

[ ... ]
> @@ -483,18 +486,17 @@ static int rswitch_gwca_queue_ext_ts_fill(struct net_device *ndev,
>  		index = (i + start_index) % gq->ring_size;
>  		desc = &gq->rx_ring[index];
>  		if (!gq->dir_tx) {
> -			dma_addr = dma_map_single(ndev->dev.parent,
> +			dma_addr = dma_map_single(dev,
>  						  gq->rx_bufs[index] + RSWITCH_HEADROOM,
>  						  RSWITCH_MAP_BUF_SIZE,
>  						  DMA_FROM_DEVICE);
> -			if (dma_mapping_error(ndev->dev.parent, dma_addr))
> +			if (dma_mapping_error(dev, dma_addr))
>  				goto err;
>  
>  			desc->desc.info_ds = cpu_to_le16(RSWITCH_DESC_BUF_SIZE);
>  			rswitch_desc_set_dptr(&desc->desc, dma_addr);
>  			dma_wmb();
>  			desc->desc.die_dt = DT_FEMPTY | DIE;
> -			desc->info1 = cpu_to_le64(INFO1_SPN(rdev->etha->index));
>  		} else {
>  			desc->desc.die_dt = DT_EEMPTY | DIE;
>  		}
> @@ -507,8 +509,10 @@ static int rswitch_gwca_queue_ext_ts_fill(struct net_device *ndev,
>  		for (; i-- > 0; ) {
>  			index = (i + start_index) % gq->ring_size;
>  			desc = &gq->rx_ring[index];
> +			desc->desc.die_dt = 0x00;
> +			dma_wmb();
>  			dma_addr = rswitch_desc_get_dptr(&desc->desc);
> -			dma_unmap_single(ndev->dev.parent, dma_addr,
> +			dma_unmap_single(dev, dma_addr,
>  					 RSWITCH_MAP_BUF_SIZE, DMA_FROM_DEVICE);
>  		}
>  	}

[Severity: High]
This is a pre-existing issue, but is there a hardware race condition in
this error path?

Earlier in the loop, buffers are mapped and immediately exposed to the
running hardware by setting desc->desc.die_dt = DT_FEMPTY | DIE. If a
subsequent allocation in the batch fails, we jump to this error path to
revoke previously armed descriptors by clearing die_dt and calling
dma_unmap_single().

If the active hardware has already fetched the descriptor and started a
DMA write before we revoke it, will unmapping it lead to IOMMU faults or
memory corruption?

Should the descriptors only be armed after all allocations and mappings in
the batch have succeeded?

