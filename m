Return-Path: <linux-renesas-soc+bounces-30744-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qFjTJt5pzmmpngYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30744-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 02 Apr 2026 15:06:38 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EFA8389670
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 02 Apr 2026 15:06:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 160033119A36
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  2 Apr 2026 13:01:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB4C930BF4E;
	Thu,  2 Apr 2026 13:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UDjXL6P6"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 220473DBD52
	for <linux-renesas-soc@vger.kernel.org>; Thu,  2 Apr 2026 12:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775134805; cv=none; b=dYpPV2vfWGVSwgS4roJKfai/tZVv/OIp7+EY+oXrS1PV61nvZI468nAv7h7PiN4g1ssHyygurpBKctu58fZyzxbCAEOMz1m94Qdr07bLtLSTo3GoV9wXp4E4M2QI56XKNRGDyxQzgsGd6qkH2eEA8ka0UUzTvSRYexUtN6b1kxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775134805; c=relaxed/simple;
	bh=rJlVF6btIcaXXJBehkJBf5du3lWAMcSKQm5Fd90DhJ4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a7mbWs6v7pkCGuBnPopdxxkJHd44TA69wc76Wh9pL4WECxPFNDFZcjNYz1FQfEBJ9GDhvG9kpeXtjnfcUfu+1Punqy7SfzWi35ZsV0v+s+xX5be1Nr1RcUF77eYe2ZSIdYTC5rHvZfPAjIX/7lf0NWPGek7OeRZz8JkpLwdDuG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UDjXL6P6; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1775134792;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AAtmYjJ6HzRwUZEgzh4K3hz5UXpVLyq08wfrpo9YLvo=;
	b=UDjXL6P6gQzc7yH7xa0uOkGZPDhKX2BjgRjzClJYksPnuTsMFvrfekfKJ/aRXwXAYSlmLh
	skxzr6BfNiSETxedUoZSDAyeOyQDYE/Xn5Qt312Es/YgmuGbgh9klBNcNfa5i4m3sU0SFs
	xPLczETUATnv+g754WHluZG3Mn0e28Y=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-647-hBWsHWh6O2OX9A7GMcbQAQ-1; Thu,
 02 Apr 2026 08:59:47 -0400
X-MC-Unique: hBWsHWh6O2OX9A7GMcbQAQ-1
X-Mimecast-MFC-AGG-ID: hBWsHWh6O2OX9A7GMcbQAQ_1775134786
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id E4A3B18002CA;
	Thu,  2 Apr 2026 12:59:45 +0000 (UTC)
Received: from gerbillo.redhat.com (unknown [10.44.32.195])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 3D50630002D2;
	Thu,  2 Apr 2026 12:59:41 +0000 (UTC)
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
Subject: Re: [net-next,v3,12/13] net: renesas: rswitch: add handler for FDB notification
Date: Thu,  2 Apr 2026 14:59:39 +0200
Message-ID: <20260402125939.234488-1-pabeni@redhat.com>
In-Reply-To: <20260331-rswitch_add_vlans-v3-12-c37f41b1c556@renesas.com>
References: <20260331-rswitch_add_vlans-v3-12-c37f41b1c556@renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[redhat.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30744-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCPT_COUNT_TWELVE(0.00)[12];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pabeni@redhat.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	NEURAL_HAM(-0.00)[-0.999];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,netdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:url,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 0EFA8389670
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This is an AI-generated review of your patch. The human sending this
email has considered the AI review valid, or at least plausible.

For local reproduction steps see https://netdev-ai.bots.linux.dev/ai-local.html
---
net: renesas: rswitch: add handler for FDB notification

The SWITCHDEV_FDB_ADD_TO_DEVICE notification writes the bridge MAC
address to the GWCA and adds a static rule to the MAC table. The
SWITCHDEV_FDB_DEL_TO_DEVICE removes the static rule from the MAC table.

> diff --git a/drivers/net/ethernet/renesas/rswitch.h b/drivers/net/ethernet/renesas/rswitch.h
> index 6dfc53c6b985..443fc4e49602 100644
> --- a/drivers/net/ethernet/renesas/rswitch.h
> +++ b/drivers/net/ethernet/renesas/rswitch.h

[ ... ]

> diff --git a/drivers/net/ethernet/renesas/rswitch_l2.c b/drivers/net/ethernet/renesas/rswitch_l2.c
> index f1c5c96027ba..ea95a87ed234 100644
> --- a/drivers/net/ethernet/renesas/rswitch_l2.c
> +++ b/drivers/net/ethernet/renesas/rswitch_l2.c

[ ... ]

> @@ -285,6 +269,181 @@ static int rswitch_switchdev_blocking_event(struct notifier_block *nb,
>  	return notifier_from_errno(ret);
>  }
>
> +static int rswitch_gwca_write_mac_address(struct rswitch_private *priv, const u8 *mac)
> +{
> +	int err;
> +
> +	err = rswitch_gwca_change_mode(priv, GWMC_OPC_CONFIG);
> +	if (err < 0)
> +		return err;
> +
> +	iowrite32((mac[0] << 8) | mac[1], priv->addr + GWMAC0);
> +	iowrite32((mac[2] << 24) | (mac[3] << 16) | (mac[4] << 8) | mac[5],
> +		  priv->addr + GWMAC1);
> +
> +	return rswitch_gwca_change_mode(priv, GWMC_OPC_OPERATION);
> +}
> +
> +static int rswitch_add_addr_to_mactable(struct rswitch_private *priv, const u8 *mac)
> +{
> +	u32 index = priv->gwca.l2_shared_rx_queue->index;
> +	int err;
> +
> +	rswitch_modify(priv->addr, FWMACTL0, FWMACTL0_ED, 0);
> +	iowrite32((mac[0] << 8) | mac[1], priv->addr + FWMACTL1);
> +	iowrite32((mac[2] << 24) | (mac[3] << 16) | (mac[4] << 8) | mac[5],
> +		  priv->addr + FWMACTL2);
> +	iowrite32(FWMACTL3_DSLV | FWMACTL3_SSLV,
> +		  priv->addr + FWMACTL3);
> +	iowrite32(FIELD_PREP(FWMACTL4_CSDL, index),
> +		  priv->addr + FWMACTL4(GWCA_INDEX));
> +	iowrite32(FIELD_PREP(FWMACTL5_DV, BIT(AGENT_INDEX_GWCA)),
> +		  priv->addr + FWMACTL5);
> +
> +	err = rswitch_reg_wait(priv->addr, FWMACTLR, FWMACTLR_L, 0);
> +	if (err < 0)
> +		return err;
> +
> +	if (ioread32(priv->addr + FWMACTLR))
> +		return NOTIFY_BAD;
> +
> +	return NOTIFY_DONE;
> +}
> +
> +static int rswitch_del_addr_from_mactable(struct rswitch_private *priv, const u8 *mac)
> +{
> +	int err;
> +
> +	rswitch_modify(priv->addr, FWMACTL0, 0, FWMACTL0_ED);
> +	iowrite32((mac[0] << 8) | mac[1], priv->addr + FWMACTL1);
> +	iowrite32((mac[2] << 24) | (mac[3] << 16) | (mac[4] << 8) | mac[5],
> +		  priv->addr + FWMACTL2);
> +	iowrite32(FWMACTL3_DSLV | FWMACTL3_SSLV,
> +		  priv->addr + FWMACTL3);
> +	iowrite32(FIELD_PREP(FWMACTL4_CSDL, BIT(0)),
> +		  priv->addr + FWMACTL4(GWCA_INDEX));
> +	iowrite32(FIELD_PREP(FWMACTL5_DV, BIT(AGENT_INDEX_GWCA)),
> +		  priv->addr + FWMACTL5);
> +
> +	err = rswitch_reg_wait(priv->addr, FWMACTLR, FWMACTLR_L, 0);
> +	if (err < 0)
> +		return err;
> +
> +	err = ioread32(priv->addr + FWMACTLR);
> +	if (err)
> +		return NOTIFY_BAD;
> +
> +	return NOTIFY_DONE;
> +}
> +
> +static void rswitch_switchdev_bridge_fdb_event_work(struct work_struct *work)
> +{
> +	struct rswitch_switchdev_event_work *switchdev_work;
> +	struct rswitch_device *rdev;
> +	struct net_device *ndev;
> +
> +	switchdev_work = container_of(work, struct rswitch_switchdev_event_work, work);
> +	ndev = switchdev_work->ndev;
> +
> +	rtnl_lock();
> +
> +	/* Unfortunately all net_device members point to br0, there is no simple way to check
> +	 * if the event was triggered by a port device setting.
> +	 */
> +	rswitch_for_all_ports(switchdev_work->priv, rdev) {
> +		if (ether_addr_equal(rdev->ndev->dev_addr, switchdev_work->fdb_info.addr))
> +			goto out;
> +	}
> +
> +	/* Handle only bridge device */
> +	if (is_rdev(ndev))
> +		goto out;
> +
> +	switch (switchdev_work->event) {
> +	case SWITCHDEV_FDB_ADD_TO_DEVICE:
> +		rswitch_gwca_write_mac_address(switchdev_work->priv, switchdev_work->fdb_info.addr);
> +		rswitch_add_addr_to_mactable(switchdev_work->priv, switchdev_work->fdb_info.addr);
> +		break;
> +	case SWITCHDEV_FDB_DEL_TO_DEVICE:
> +		rswitch_del_addr_from_mactable(switchdev_work->priv, switchdev_work->fdb_info.addr);
> +		break;
> +	default:
> +		break;
> +	}
> +
> +out:
> +	rtnl_unlock();
> +
> +	kfree(switchdev_work->fdb_info.addr);
> +	kfree(switchdev_work);
> +	dev_put(ndev);
> +}
> +
> +/* called under rcu_read_lock() */
> +static int rswitch_switchdev_event(struct notifier_block *nb,
> +				   unsigned long event,
> +				   void *ptr)
> +{
> +	struct net_device *ndev = switchdev_notifier_info_to_dev(ptr);
> +	struct rswitch_switchdev_event_work *switchdev_work;
> +	struct switchdev_notifier_fdb_info *fdb_info;
> +	struct switchdev_notifier_info *info = ptr;
> +	struct rswitch_private *priv;
> +	int err;
> +
> +	priv = container_of(nb, struct rswitch_private, rswitch_switchdev_nb);
> +
> +	switch (event) {
> +	case SWITCHDEV_FDB_ADD_TO_DEVICE:
> +		fallthrough;
> +	case SWITCHDEV_FDB_DEL_TO_DEVICE:
> +		switchdev_work = kzalloc(sizeof(*switchdev_work), GFP_ATOMIC);
> +
> +		if (!switchdev_work)
> +			return NOTIFY_BAD;
> +
> +		switchdev_work->ndev = info->dev;
> +		switchdev_work->priv = priv;
> +		switchdev_work->event = event;
> +
> +		fdb_info = container_of(info,
> +					struct switchdev_notifier_fdb_info,
> +					info);
> +
> +		INIT_WORK(&switchdev_work->work, rswitch_switchdev_bridge_fdb_event_work);
> +
> +		memcpy(&switchdev_work->fdb_info, ptr, sizeof(switchdev_work->fdb_info));
> +
> +		switchdev_work->fdb_info.addr = kzalloc(ETH_ALEN, GFP_ATOMIC);
> +		if (!switchdev_work->fdb_info.addr)
> +			goto err_addr_alloc;
> +
> +		ether_addr_copy((u8 *)switchdev_work->fdb_info.addr,
> +				fdb_info->addr);
> +		dev_hold(ndev);
> +		queue_work(system_long_wq, &switchdev_work->work);
> +
> +		break;
> +	case SWITCHDEV_PORT_ATTR_SET:
> +		err = switchdev_handle_port_attr_set(ndev, ptr,
> +						     is_rdev,
> +						     rswitch_port_attr_set);
> +		return notifier_from_errno(err);
> +
> +		if (!is_rdev(ndev))
> +			return NOTIFY_DONE;
> +
> +		return notifier_from_errno(-EOPNOTSUPP);

Are these lines in the SWITCHDEV_PORT_ATTR_SET case reachable? The
return notifier_from_errno(err) above them looks like it returns
unconditionally.

Note: this dead code is removed in the next commit in the series
(ed3ab4a0a727 'net: renesas: rswitch: add vlan aware switching'),
which moves PORT_ATTR_SET handling to rswitch_switchdev_blocking_event
and removes this entire case from rswitch_switchdev_event.

> +	}
> +
> +	return NOTIFY_DONE;
> +
> +err_addr_alloc:
> +	kfree(switchdev_work);
> +
> +	return NOTIFY_BAD;
> +}
> +
>  int rswitch_register_notifiers(struct rswitch_private *priv)
>  {
>  	int err;


