Return-Path: <linux-renesas-soc+bounces-33101-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QGj6OcW0FGpbPgcAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33101-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 May 2026 22:44:53 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 91E345CEB79
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 May 2026 22:44:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 459A8303FAFB
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 May 2026 20:41:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4085396D2E;
	Mon, 25 May 2026 20:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G+TPO8/Q"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17E9A30C629;
	Mon, 25 May 2026 20:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779741673; cv=none; b=DB/Ad760SoSLh535/vUa7bT4BdvmMlwuKeA0jJGbydkxoR2gbXer6HPd6gqXgLwcyqBYvYmqWq3eDvmm8gwRZkSLkAagd8zWtyRA9z9v97aI1WrkBK4PUg/9YMPFCv0eL71fdpNYIqn5mIpB1Ov2y03KexqqsbN2PUo+yulPuOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779741673; c=relaxed/simple;
	bh=6LLszY32X7wyYWvxT/mzgOLnBifaKJ7us2rThevsW+s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XnASvXC5IclJcxNtRgBCSvuu9dveiUsC1MxPTBY4vLoeB2l5S2RA1rTIsc9Lc2m0CXJFzZ/dliICokggtZMW0R9yHRj15QemezHkJ7dYR77EtL5kKtRi4Vjh84Rfndy/p4sobxPg12vtUipGYmw1IyP6qzmzveIWg4cIPQgp9jY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G+TPO8/Q; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 482C61F000E9;
	Mon, 25 May 2026 20:41:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779741671;
	bh=wzZk2w6LpMZqcjWtr+xhVmdSEW/XaL+Ll9ZDIHsLnvw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=G+TPO8/Q8/OBoOW6GoEk8DW36LCN/tI7tF4A3zGo9KvJ8rDPJqWEz0qIccUrYyAfB
	 I9sBqe6gbz3wbQoNgNB7cxrxUBiThBrDQ+ENF1rdIBJviKwWuwaw24TuKZ4Ab+VcDb
	 jND5nN3UHjdG2uTEXXxMcsG6jzc7OUNspZq9h0+J5SS2fYqw+rBuzzV34SLEaS01Wn
	 IKpjQw0bjC57sdQ+emX/MQrxx6F1NO+LsvbCVO3ZHdZIToK9bOEBL25Rpftx4T5i1G
	 wAs+d5qA90Pe+bG/9NtJeqOmN+RhumyznqVo1vFUr03DTWMD5CE2ZEyK/VwUq020GV
	 WlP0AiO2rx9Dw==
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
Subject: Re: [PATCH net-next v5 05/14] net: renesas: rswitch: add exception path for packets with unknown dst MAC
Date: Mon, 25 May 2026 13:41:10 -0700
Message-ID: <20260525204110.2471291-1-kuba@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260522-rswitch_add_vlans-v5-5-53589d944a9f@renesas.com>
References: <20260522-rswitch_add_vlans-v5-5-53589d944a9f@renesas.com>
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
	TAGGED_FROM(0.00)[bounces-33101-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,renesas.com,lunn.ch,davemloft.net,google.com,redhat.com,ragnatech.se,pbarker.dev,gmail.com,vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuba@kernel.org,linux-renesas-soc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,netdev];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 91E345CEB79
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This is an AI-generated review of your patch. The human sending this
email has considered the AI review valid, or at least plausible.
---
net: renesas: rswitch: add exception path for packets with unknown dst MAC

Packets with unknown MAC address cannot be handled by the HW forwarding.
Creates an exception path with a shared queue to forward these packets to
the network driver for MAC learning.

> diff --git a/drivers/net/ethernet/renesas/rswitch_main.c b/drivers/net/ethernet/renesas/rswitch_main.c
> index 9510bcdf9e830..1f4ec65f6f9bd 100644
> --- a/drivers/net/ethernet/renesas/rswitch_main.c
> +++ b/drivers/net/ethernet/renesas/rswitch_main.c
[ ... ]
> @@ -736,6 +772,8 @@ static int rswitch_gwca_hw_deinit(struct rswitch_private *priv)
>  	if (err < 0)
>  		return err;
>  

[Severity: Medium]
Will this leak the shared RX queue memory if rswitch_gwca_change_mode() fails
during teardown and returns early?

> +	rswitch_shared_rx_queue_free(priv);
> +
>  	return rswitch_gwca_change_mode(priv, GWMC_OPC_DISABLE);
>  }
[ ... ]
> @@ -944,10 +982,15 @@ static int rswitch_poll(struct napi_struct *napi, int budget)
>  
>  	if (napi_complete_done(napi, budget - quota)) {
>  		spin_lock_irqsave(&priv->lock, flags);
> +		if (rdev->rx_old_queue) {
> +			rdev->rx_queue = rdev->rx_old_queue;
> +			rdev->rx_old_queue = NULL;
> +		}
>  		if (test_bit(rdev->port, priv->opened_ports)) {
>  			rswitch_enadis_data_irq(priv, rdev->tx_queue->index, true);
>  			rswitch_enadis_data_irq(priv, rdev->rx_queue->index, true);
>  		}
> +		rswitch_enadis_data_irq(priv, priv->gwca.l2_shared_rx_queue->index, true);

[Severity: Critical]
Does unmasking the shared RX queue globally here create a race condition?

If Port A completes NAPI while Port B's NAPI is still actively polling the
shared queue, couldn't another interrupt fire, scheduling another NAPI and
resulting in multiple NAPIs running concurrently on the same shared queue?

This might cause lockless concurrent modifications to gq->cur and gq->dirty,
leading to list corruption.

>  		spin_unlock_irqrestore(&priv->lock, flags);
>  	}
>  
[ ... ]
> @@ -960,15 +1003,41 @@ static int rswitch_poll(struct napi_struct *napi, int budget)
>  	return 0;
>  }
>  
> -static void rswitch_queue_interrupt(struct net_device *ndev)
> +static void rswitch_queue_interrupt(struct rswitch_private *priv, struct rswitch_gwca_queue *gq)
>  {
> -	struct rswitch_device *rdev = netdev_priv(ndev);
> +	struct rswitch_ext_ts_desc *desc;
> +	struct rswitch_device *rdev;
> +	struct net_device *ndev;
> +	unsigned long flags;
> +	u32 spn;
> +
> +	/* If we receive a shared queue through the exception path, it will be missing the ndev
> +	 * pointer. This needs to be added to be able to determine from which port the packet was
> +	 * received. Then we temporarily exchange the rx_queue pointer in rdev. This will be
> +	 * restored after the packet has been processed.
> +	 */
> +
> +	if (gq->index == priv->gwca.l2_shared_rx_queue->index) {
> +		desc = &gq->rx_ring[gq->cur];
> +		spn = FIELD_GET(SPN, le64_to_cpu(desc->info1));

[Severity: Medium]
Could this read stale or garbage data from the descriptor?

It appears to read the DMA descriptor without verifying that the hardware
has handed ownership back to the CPU (e.g., checking DT_FEMPTY) and without
a dma_rmb() barrier before the read.

[Severity: High]
Is it possible for the hardware to provide an out-of-bounds SPN value here?

Since spn is used to index priv->rdev[] on the next line, an unexpected or
corrupted value might cause an out-of-bounds memory access.

> +		ndev = priv->rdev[spn]->ndev;
> +		rdev = netdev_priv(ndev);
> +		gq->ndev = ndev;

[Severity: High]
Since the shared queue collects exception packets from all ports, will this
assign the entire queue to the NAPI of the first packet's port?

When NAPI polls and drains the queue, it seems subsequent packets might be
injected into the network stack under the first packet's ndev, even if they
originated from different physical ports.

> +		/* store original rx_queue */
> +		spin_lock_irqsave(&priv->lock, flags);
> +		rdev->rx_old_queue = rdev->rx_queue;
> +		rdev->rx_queue = gq;

[Severity: High]
Can rdev->rx_old_queue be permanently overwritten with the shared queue
pointer here?

If a second shared queue interrupt fires before NAPI completes and restores
the pointer, the handler will execute this path again and overwrite the
saved normal queue pointer with gq, leaking the normal RX queue.

> +		spin_unlock_irqrestore(&priv->lock, flags);
> +	} else {
> +		rdev = netdev_priv(gq->ndev);
> +	}
>  
>  	if (napi_schedule_prep(&rdev->napi)) {
> -		spin_lock(&rdev->priv->lock);
> -		rswitch_enadis_data_irq(rdev->priv, rdev->tx_queue->index, false);
> -		rswitch_enadis_data_irq(rdev->priv, rdev->rx_queue->index, false);
> -		spin_unlock(&rdev->priv->lock);
> +		spin_lock(&priv->lock);
> +		rswitch_enadis_data_irq(priv, rdev->tx_queue->index, false);
> +		rswitch_enadis_data_irq(priv, rdev->rx_queue->index, false);
> +		rswitch_enadis_data_irq(priv, priv->gwca.l2_shared_rx_queue->index, false);

[Severity: Critical]
If napi_schedule_prep() returns false (because the target NAPI is already
running), hardware interrupts are not disabled. Could this lead to an
immediate interrupt storm for the shared RX queue?

> +		spin_unlock(&priv->lock);
>  		__napi_schedule(&rdev->napi);
>  	}
>  }
[ ... ]
> @@ -1653,6 +1733,11 @@ static int rswitch_stop(struct net_device *ndev)
>  	rswitch_enadis_data_irq(rdev->priv, rdev->tx_queue->index, false);
>  	rswitch_enadis_data_irq(rdev->priv, rdev->rx_queue->index, false);
>  	bitmap_clear(rdev->priv->opened_ports, rdev->port, 1);
> +	if (bitmap_empty(rdev->priv->opened_ports, 1))

[Severity: High]
Does this check use the wrong size argument?

The second argument to bitmap_empty() is nbits. By passing 1, it seems it
only checks if bit 0 is empty. If port 0 is closed while other ports are
open, this would evaluate to true and prematurely disable the shared RX
queue interrupt for the remaining active ports.

> +		rswitch_enadis_data_irq(rdev->priv,
> +					rdev->priv->gwca.l2_shared_rx_queue->index,
> +					false);
> +
>  	spin_unlock_irqrestore(&rdev->priv->lock, flags);
>  
>  	napi_disable(&rdev->napi);

