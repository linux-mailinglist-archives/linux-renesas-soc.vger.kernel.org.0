Return-Path: <linux-renesas-soc+bounces-32544-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YB9IC4HVA2ol/AEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32544-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 May 2026 03:36:01 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 153D852BF6A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 May 2026 03:36:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4CB9D3038886
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 May 2026 01:36:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B85D366560;
	Wed, 13 May 2026 01:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GVUvGdbm"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6601A37DE8C;
	Wed, 13 May 2026 01:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778636153; cv=none; b=lzG+lX8HUKzs+ikcdKdG4z60XomjdePHki+Nva2Gft8P4BbCTJSzjJjmVImPVz5KD2SOZ+WxDNdCfbLgrWICh6c3BXaMtw/6o4xoLQFnDauWgk+vAuxDhcbOz40i5X8zstQ2hAZmcs4kvTglXe16v5ES9S+29xi+iW5n1PyxgXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778636153; c=relaxed/simple;
	bh=YFLbJvZu2/v4mXDwgGPrp3YXjQljG5u9PjvtZ7amwSU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eBfqkugzairFokGgz9P8flKsQs4Jj4nQlZdhirchDqEFWGvoF4S42o1rTlVP8FyCtGY2STU2V5+mtcJye35ljLYnZepA3J4uiCyybz/EX0kcl7Aqmhhi7JHp+bKyfK9auMOwoAvenrDKgEhlBMG6k/xEN3H/vCFXjzzttxtUjfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GVUvGdbm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48FBBC2BCB0;
	Wed, 13 May 2026 01:35:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778636152;
	bh=YFLbJvZu2/v4mXDwgGPrp3YXjQljG5u9PjvtZ7amwSU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GVUvGdbmy3O8gHgP8i469WqsCDobdVYdR7mtGBa8izEYJQrxnet95IYH88EC2Mh3V
	 LuExxoEJwcUUWGto/i+Kh2zZi6jbbd2LFUyDcAuL95q4ZvolfCBC7gIV7sxvQtZrQ5
	 /eUn81uXPrBas+/LeYxjOVgaxXrKh9LdnEBr0r/vcJkZTb1YbtYKeI4wiX1+tStBB8
	 g7YbGG+7/8nUiI653YBh+MkmT1ecZQSn2k+DIvd9tchZ4mlQRhYy0bPDPV9nyN5PSt
	 RRXcpM+O1OKgc+AFCLICIpYAYJiPFMGlndstL1S2IH+yUgOCYOPFpAzWt7OjYXnVBg
	 W6KnvbcexwZHw==
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
	netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v4 05/13] net: renesas: rswitch: add exception path for packets with unknown dst MAC
Date: Tue, 12 May 2026 18:35:51 -0700
Message-ID: <20260513013551.1408389-1-kuba@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260511-rswitch_add_vlans-v4-5-a5a225f8faae@renesas.com>
References: <20260511-rswitch_add_vlans-v4-5-a5a225f8faae@renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 153D852BF6A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-32544-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuba@kernel.org,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,netdev];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Action: no action

This is an AI-generated review of your patch. The human sending this
email has considered the AI review valid, or at least plausible.
---
net: renesas: rswitch: add exception path for packets with unknown dst MAC

Creates a queue for the exception path to handle packets with unknown MAC
addresses. These packets are sent to the CPU for MAC learning and broadcast.

> diff --git a/drivers/net/ethernet/renesas/rswitch_main.c b/drivers/net/ethernet/renesas/rswitch_main.c
> index e05c42db5f4c8..bf26c1a3384aa 100644
> --- a/drivers/net/ethernet/renesas/rswitch_main.c
> +++ b/drivers/net/ethernet/renesas/rswitch_main.c
> @@ -682,6 +682,34 @@ static int rswitch_rxdmac_init(struct rswitch_private *priv, unsigned int index)
[ ... ]
> +static int rswitch_shared_rx_queue_alloc(struct rswitch_private *priv)
> +{
[ ... ]
> +	err = rswitch_gwca_queue_alloc(NULL, priv, gwca->l2_shared_rx_queue, false, RX_RING_SIZE);
> +	if (err < 0) {
> +		rswitch_gwca_put(priv, gwca->l2_shared_rx_queue);
> +		return err;
> +	}
> +
> +	return rswitch_gwca_queue_ext_ts_format(dev, priv, gwca->l2_shared_rx_queue);
> +}

If rswitch_gwca_queue_ext_ts_format() fails, does this leak the DMA resources
allocated by rswitch_gwca_queue_alloc() and the queue bitmask index acquired
via rswitch_gwca_get()?

[ ... ]
> @@ -954,15 +993,40 @@ static int rswitch_poll(struct napi_struct *napi, int budget)
[ ... ]
> -static void rswitch_queue_interrupt(struct net_device *ndev)
> +static void rswitch_queue_interrupt(struct rswitch_private *priv, struct rswitch_gwca_queue *gq)
>  {
> -	struct rswitch_device *rdev = netdev_priv(ndev);
> +	struct rswitch_ext_ts_desc *desc;
> +	struct rswitch_device *rdev;
> +	struct net_device *ndev;
> +	unsigned int rx_q_index;
> +	u32 spn;
> +
> +	rdev = netdev_priv(gq->ndev);

Since gq->ndev is initialized to NULL for the shared exception queue, does
this unconditionally dereference a NULL pointer?

> +	rx_q_index = rdev->rx_queue->index;

And compute an invalid memory address here?

> +
> +/* If we receive a shared queue through the exception path, it will be missing the ndev
> + * pointer. This needs to be added to be able to determine from which port the packet was
> + * received. Then we temporarily exchange the rx_queue pointer in rdev. This will be
> + * restored after the packet has been processed.
> + */
> +
> +	if (gq->index == priv->gwca.l2_shared_rx_queue->index) {
> +		desc = &gq->rx_ring[gq->cur];
> +		spn = FIELD_GET(SPN, desc->info1);

Because desc->info1 is a little-endian 64-bit field (__le64), will applying a
host-endian bitfield mask without converting it via le64_to_cpu() first yield
garbage values on big-endian architectures?

> +		ndev = priv->rdev[spn]->ndev;

Can a malformed or byte-swapped descriptor result in an out-of-bounds memory
read (spn >= RSWITCH_NUM_PORTS) here?

> +		rdev = netdev_priv(ndev);
> +		gq->ndev = ndev;
> +		/* store original rx_queue */
> +		rdev->rx_old_queue = rdev->rx_queue;
> +		rdev->rx_queue = gq;

Does this lockless swap of queue pointers in hardirq context create a data
race with rswitch_poll(), which reads and restores them in NAPI softirq
context?

Furthermore, if napi_schedule_prep() returns false because NAPI is already
running, the interrupt is not disabled. If a subsequent interrupt for the same
port executes this swap again, will it overwrite rdev->rx_old_queue with the
shared queue pointer (gq) and permanently lose the normal RX queue?

Also, l2_shared_rx_queue aggregates packets from all physical ports. Since
this reads the source port (spn) of only the first pending packet and
schedules NAPI for that specific network interface, won't the NAPI polling
loop consume subsequent packets in the batch and incorrectly attribute them
to the first packet's interface?

> +	}
>  
>  	if (napi_schedule_prep(&rdev->napi)) {
[ ... ]
> @@ -1646,6 +1721,7 @@ static int rswitch_stop(struct net_device *ndev)
[ ... ]
>  	spin_lock_irqsave(&rdev->priv->lock, flags);
>  	rswitch_enadis_data_irq(rdev->priv, rdev->tx_queue->index, false);
>  	rswitch_enadis_data_irq(rdev->priv, rdev->rx_queue->index, false);
> +	rswitch_enadis_data_irq(rdev->priv, rdev->priv->gwca.l2_shared_rx_queue->index, false);

Since l2_shared_rx_queue is a global resource used for MAC learning exception
packets across all ports, does stopping a single network interface break the
globally shared exception path for all other active interfaces?

