Return-Path: <linux-renesas-soc+bounces-30742-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6BtyFiZszmmpngYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30742-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 02 Apr 2026 15:16:22 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A7649389832
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 02 Apr 2026 15:16:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1CB6C313C82A
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  2 Apr 2026 13:00:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28DC63E3D8E;
	Thu,  2 Apr 2026 12:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EFrXDnCT"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5298A3DA5AF
	for <linux-renesas-soc@vger.kernel.org>; Thu,  2 Apr 2026 12:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775134790; cv=none; b=dEwQIEpbGd9749NTlPiLqp5Do43n2WFG3jbA+DxO68nmQRXGXkZPKXptp3dVxezHHixKLV/wckVImetm43FSicRBVuD2bG7OLiBvniool/qyCoAj6MD5sdf6GwNK8qx6VxI1/L/tXwx6Nw7VD06nVpygo1Wzz7MAB/1EP+iDo58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775134790; c=relaxed/simple;
	bh=wUK81R3Lw3+UQIduTBexBZ0k4Zv+emLkxnTmCRRqHGc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XhwVCPWj4heA9WiTjd4zV+1F7uWPAS13FilaqQSO9iFL1z63LolDNdIPHS1bKH44obpk8aWhaZ8BltqNl4R521dUmLpZCsJDIOaMVTNsDDxxD7IgLD08SXglQDIeTsFMjDP9K0sYkMDVoyiTDAL8QUXtvPRwY4Q94YB0o1SOgus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EFrXDnCT; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1775134777;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bc9JA7+rgTomoNKT/U6hN8epiFvvJERC8i+DSwb8q3k=;
	b=EFrXDnCTr4yxU35x+caNjYgDPqBXoNIxmwsoNIG2hmYEVcie61lwJZoo2AzpFns04WFWBl
	TiWEdMhIqAK5C/Y06AiY4ToWxLYXx2ZtxCGcQRH+/WzAmk+4EMH/4BZzpmfrgAQScFROGC
	DD4hpswD5ohiLHnD1oOaEMM0/L2IyS8=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-515-nQfRU5XjPjqq76pma7SRlQ-1; Thu,
 02 Apr 2026 08:59:34 -0400
X-MC-Unique: nQfRU5XjPjqq76pma7SRlQ-1
X-Mimecast-MFC-AGG-ID: nQfRU5XjPjqq76pma7SRlQ_1775134772
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 7E79E180061D;
	Thu,  2 Apr 2026 12:59:32 +0000 (UTC)
Received: from gerbillo.redhat.com (unknown [10.44.32.195])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id A8DCD1955D6B;
	Thu,  2 Apr 2026 12:59:28 +0000 (UTC)
From: Paolo Abeni <pabeni@redhat.com>
To: michael.dege@renesas.com
Cc: paul@pbarker.dev,
	niklas.soderlund@ragnatech.se,
	kuba@kernel.org,
	yoshihiro.shimoda.uh@renesas.com,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	edumazet@google.com,
	pabeni@redhat.com,
	linux-renesas-soc@vger.kernel.org,
	andrew+netdev@lunn.ch,
	davem@davemloft.net
Subject: Re: [net-next,v3,05/13] net: renesas: rswitch: add exception path for packets with unknown dst MAC
Date: Thu,  2 Apr 2026 14:59:26 +0200
Message-ID: <20260402125926.234465-1-pabeni@redhat.com>
In-Reply-To: <20260331-rswitch_add_vlans-v3-5-c37f41b1c556@renesas.com>
References: <20260331-rswitch_add_vlans-v3-5-c37f41b1c556@renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[redhat.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30742-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_TWELVE(0.00)[12];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pabeni@redhat.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	NEURAL_HAM(-0.00)[-0.999];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,netdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A7649389832
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This is an AI-generated review of your patch. The human sending this
email has considered the AI review valid, or at least plausible.

For local reproduction steps see https://netdev-ai.bots.linux.dev/ai-local.html
---
net: renesas: rswitch: add exception path for packets with unknown dst MAC

This commit creates a shared RX queue for the exception path to handle
packets with unknown MAC addresses that cannot be processed by HW
forwarding. The queue receives packets with unknown src/dst addresses
and forwards them to the CPU for MAC learning.

> diff --git a/drivers/net/ethernet/renesas/rswitch.h b/drivers/net/ethernet/renesas/rswitch.h
> index 15d3fa48b0e3..bf123b564ed1 100644
> --- a/drivers/net/ethernet/renesas/rswitch.h
> +++ b/drivers/net/ethernet/renesas/rswitch.h
> @@ -1148,6 +1148,7 @@ struct rswitch_gwca {
>  	struct rswitch_gwca_queue *queues;
>  	int num_queues;
>  	struct rswitch_gwca_queue ts_queue;
> +	struct rswitch_gwca_queue *l2_shared_rx_queue;
>  	DECLARE_BITMAP(used, RSWITCH_MAX_NUM_QUEUES);
>  	u32 tx_irq_bits[RSWITCH_NUM_IRQ_REGS];
>  	u32 rx_irq_bits[RSWITCH_NUM_IRQ_REGS];
> diff --git a/drivers/net/ethernet/renesas/rswitch_main.c b/drivers/net/ethernet/renesas/rswitch_main.c
> index d404bc41bd1e..3c142fa3c810 100644
> --- a/drivers/net/ethernet/renesas/rswitch_main.c
> +++ b/drivers/net/ethernet/renesas/rswitch_main.c
> @@ -680,6 +680,34 @@ static int rswitch_rxdmac_init(struct rswitch_private *priv, unsigned int index)
>  	return rswitch_gwca_queue_ext_ts_format(ndev->dev.parent, priv, rdev->rx_queue);
>  }
>
> +static int rswitch_shared_rx_queue_alloc(struct rswitch_private *priv)
> +{
> +	struct rswitch_gwca *gwca = &priv->gwca;
> +	struct device *dev = &priv->pdev->dev;
> +
> +	int err;
> +
> +	gwca->l2_shared_rx_queue = rswitch_gwca_get(priv);
> +	if (!gwca->l2_shared_rx_queue)
> +		return -EBUSY;
> +
> +	err = rswitch_gwca_queue_alloc(NULL, priv, gwca->l2_shared_rx_queue, false, RX_RING_SIZE);
> +	if (err < 0) {
> +		rswitch_gwca_put(priv, gwca->l2_shared_rx_queue);
> +		return err;
> +	}
> +
> +	return rswitch_gwca_queue_ext_ts_format(dev, priv, gwca->l2_shared_rx_queue);
> +}
> +
> +static void rswitch_shared_rx_queue_free(struct rswitch_private *priv)
> +{
> +	struct rswitch_gwca *gwca = &priv->gwca;
> +
> +	rswitch_gwca_queue_free(&priv->pdev->dev, gwca->l2_shared_rx_queue);
> +	rswitch_gwca_put(priv, gwca->l2_shared_rx_queue);
> +}
> +
>  static int rswitch_gwca_hw_init(struct rswitch_private *priv)
>  {
>  	unsigned int i;
> @@ -717,6 +745,12 @@ static int rswitch_gwca_hw_init(struct rswitch_private *priv)
>  			return err;
>  	}
>
> +	err = rswitch_shared_rx_queue_alloc(priv);
> +	if (err < 0) {
> +		rswitch_shared_rx_queue_free(priv);
> +		return err;
> +	}

Does this cause a NULL pointer dereference if rswitch_shared_rx_queue_alloc()
fails? When rswitch_gwca_queue_alloc() fails internally (e.g., under memory
pressure during netdev_alloc_frag()), the 'out:' label inside
rswitch_gwca_queue_alloc() already calls rswitch_gwca_queue_free(), which sets
gq->rx_bufs = NULL and gq->rx_ring = NULL.

Then rswitch_shared_rx_queue_alloc() calls rswitch_gwca_put() and returns
error. The caller rswitch_gwca_hw_init() then calls
rswitch_shared_rx_queue_free(), which calls rswitch_gwca_queue_free() a second
time.

In this second call, gq->rx_bufs is NULL but gq->ring_size is still
RX_RING_SIZE, so the loop in rswitch_gwca_queue_free():

    for (i = 0; i < gq->ring_size; i++)
        skb_free_frag(gq->rx_bufs[i])

dereferences NULL (gq->rx_bufs[i] = NULL[i]). This causes a kernel NULL
pointer dereference crash during device probe under memory pressure.

Should the cleanup not call rswitch_shared_rx_queue_free() when
rswitch_shared_rx_queue_alloc() fails, since the alloc function already
performs partial cleanup internally?

> +
>  	return rswitch_gwca_change_mode(priv, GWMC_OPC_OPERATION);
>  }

[ ... ]

> @@ -1513,6 +1564,14 @@ static int rswitch_serdes_set_params(struct rswitch_device *rdev)
>  	return phy_set_speed(rdev->serdes, rdev->etha->speed);
>  }
>
> +static void rswitch_etha_set_exception_path(struct rswitch_private *priv)
> +{
> +	iowrite32(FDMACUFEF, priv->addr + FWCEPRC2);
> +	iowrite32(FIELD_PREP(EPCS, GWCA_INDEX) |
> +		  FIELD_PREP(EPCSD, priv->gwca.l2_shared_rx_queue->index),
> +		  priv->addr + FWCEPTC);
> +}
> +

[ ... ]

Looking at rswitch_init() in the existing code:

    err = rswitch_gwca_hw_init(priv);
    if (err)
        goto err_gwca_hw_init;

    err = rswitch_ether_port_init_all(priv);
    if (err)
        goto err_ether_port_init_all;

    err_ether_port_init_all:
        rswitch_gwca_hw_deinit(priv);

    err_gwca_hw_init:

When rswitch_gwca_hw_init() succeeds (allocating the shared RX queue via
rswitch_shared_rx_queue_alloc()), but a subsequent initialization step fails
(e.g., rswitch_ether_port_init_all() or register_netdev()), does the error
path leak the shared RX queue?

The error path at 'err_ether_port_init_all:' only calls
rswitch_gwca_hw_deinit(), which merely changes the GWCA hardware mode. It does
NOT call rswitch_shared_rx_queue_free() to release the DMA memory
(dma_alloc_coherent), rx_bufs (kzalloc), and page fragments allocated by
rswitch_shared_rx_queue_alloc(). These are not device-managed allocations.

Should the cleanup call rswitch_shared_rx_queue_free() before or after
rswitch_gwca_hw_deinit()?

[ ... ]

> @@ -952,15 +987,31 @@ static int rswitch_poll(struct napi_struct *napi, int budget)
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
> +	u32 spn;
> +
> +	if (gq->index == priv->gwca.l2_shared_rx_queue->index) {
> +		desc = &gq->rx_ring[gq->cur];
> +		spn = FIELD_GET(SPN, desc->info1);
> +		ndev = priv->rdev[spn]->ndev;
> +		rdev = netdev_priv(ndev);
> +		gq->ndev = ndev;
> +		rdev->rx_queue = gq;

Can this permanently break per-port RX processing? When a shared RX queue
interrupt fires for a port, rswitch_queue_interrupt() overwrites
rdev->rx_queue to point to the shared queue (gq) instead of the port's
per-port RX queue. This assignment is never reversed. After this point:

(1) rswitch_poll() -> rswitch_rx() processes from rdev->rx_queue which now
points to the shared queue, so the per-port RX queue is never drained.

(2) When NAPI completes in rswitch_poll(), it re-enables rdev->rx_queue->index
(the shared queue index) instead of the original per-port RX queue index.

(3) The per-port RX queue IRQ is never re-enabled by NAPI completion
(rswitch_enadis_data_irq only re-enables rdev->rx_queue->index and
l2_shared_rx_queue->index, which are now the same):

rswitch_poll():
    if (napi_complete_done(napi, budget - quota)) {
        spin_lock_irqsave(&priv->lock, flags);
        rswitch_enadis_data_irq(priv, rdev->tx_queue->index, true);
        rswitch_enadis_data_irq(priv, rdev->rx_queue->index, true);
        rswitch_enadis_data_irq(priv, priv->gwca.l2_shared_rx_queue->index, true);
        ...
    }

This means the per-port RX queue becomes permanently orphaned after the first
shared-queue packet for that port, causing packet loss for all regular
(non-exception-path) traffic on that port.

Should the code save and restore the original rdev->rx_queue, or use a
separate mechanism to process shared queue packets without overwriting the
per-port queue pointer?

> +	} else {
> +		rdev = netdev_priv(gq->ndev);
> +	}
> +
> +
> +	if (napi_schedule_prep(&rdev->napi)) {
> +		spin_lock(&priv->lock);
> +		rswitch_enadis_data_irq(priv, rdev->tx_queue->index, false);
> +		rswitch_enadis_data_irq(priv, rdev->rx_queue->index, false);
> +		rswitch_enadis_data_irq(priv, priv->gwca.l2_shared_rx_queue->index, false);
> +		spin_unlock(&priv->lock);
>  		__napi_schedule(&rdev->napi);
>  	}
>  }

[ ... ]


