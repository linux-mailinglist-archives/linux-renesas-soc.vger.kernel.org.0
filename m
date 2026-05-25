Return-Path: <linux-renesas-soc+bounces-33108-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id jjHQNz20FGpbPgcAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33108-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 May 2026 22:42:37 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 629AE5CEB12
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 May 2026 22:42:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8133D300EEB6
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 May 2026 20:41:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE74939A06B;
	Mon, 25 May 2026 20:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZjIfMl8T"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AC793A9014;
	Mon, 25 May 2026 20:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779741684; cv=none; b=mJjTsnPWQa2IpowQiPIw0ns9REbTMVQwjjbdgXGsuBMX8G/KC9f3VNyOhc9JTBs2fZt+YDA4ai7bRP+FygX9FyEOuNYkvCQ4hVR69HSKSml4TiJAmoKecxL7zsM6RhGnPFifbQkCqD65xHg5IwGBHivxwPTlGMlepVc9yfHx5TQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779741684; c=relaxed/simple;
	bh=d7J5q8ZQgewmJhEBzRiS/tCt111j8f1KlXO+ElXxDBQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nQf4aI03fq/YvClcKl0P4D1SyvXAJ5LkKfVgNqnUsgfbIUqjPK5Njc+rmsz8KvGY68HMd2WOh42uLGPrJ8KNeOyiHPlBHgAieYy1CvjpLKz0KXDFANaf2IJwgNYwPzEvMGqnxtCkW7TAs2lP07wEJgzTuGVZpmHgZfgX3nF7IvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZjIfMl8T; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 895EF1F000E9;
	Mon, 25 May 2026 20:41:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779741682;
	bh=NsnZfiy0JWXUXQCk6vTQPEL70chZAK27lAlB5w8Z9Lc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ZjIfMl8TOnNMHo0VCWWmHfVtVYIoJCrBbEPedYJ/6Sr8/igzxl/qz/J6+pOzho53p
	 vYERfossgpPPz0yg7a1gUlB1iFAUSLuJQWHlSu6Q06rzmAFvoh/h3mz4wl8qLwwb6g
	 ILs7XuzghHoAkvAgO8wsqhflpq17z749H1s4jB0BhCSbSn2/PIeilo4cKDg4j2p0EF
	 KMl+wMa43YGnU26JnyqYI+2fe8V2evbFJpjXsp2oTfUPco41hWBs0LCVsI0JFXYviM
	 VlctW9XUXqWNUDxd+rIKRa5VNzzHGuowpyMWlsp48RZpmVos5Kfr9FTcv+zh2Oqeig
	 C7WzflqtuYtGw==
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
Subject: Re: [PATCH net-next v5 13/14] net: renesas: rswitch: add handler for FDB notification
Date: Mon, 25 May 2026 13:41:20 -0700
Message-ID: <20260525204120.2471521-1-kuba@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260522-rswitch_add_vlans-v5-13-53589d944a9f@renesas.com>
References: <20260522-rswitch_add_vlans-v5-13-53589d944a9f@renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33108-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,renesas.com,lunn.ch,davemloft.net,google.com,redhat.com,ragnatech.se,pbarker.dev,gmail.com,vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuba@kernel.org,linux-renesas-soc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,netdev];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 629AE5CEB12
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This is an AI-generated review of your patch. The human sending this
email has considered the AI review valid, or at least plausible.
---
net: renesas: rswitch: add handler for FDB notification

The SWITCHDEV_FDB_ADD_TO_DEVICE notification writes the bridge MAC address
to the GWCA and adds a static rule to the MAC table.
The SWITCHDEV_FDB_DEL_TO_DEVICE removes the static rule from the MAC table.

> diff --git a/drivers/net/ethernet/renesas/rswitch_l2.c b/drivers/net/ethernet/renesas/rswitch_l2.c
> index d2deb7cb76349..4d0646283f88f 100644
> --- a/drivers/net/ethernet/renesas/rswitch_l2.c
> +++ b/drivers/net/ethernet/renesas/rswitch_l2.c
[ ... ]
> @@ -82,8 +83,9 @@ static void rswitch_update_l2_hw_forwarding(struct rswitch_private *priv)
>  			 *
>  			 * Do not allow L2 forwarding to self for hw port.
>  			 */
> -			iowrite32(FIELD_PREP(FWPC2_LTWFW, fwd_mask | BIT(rdev->port)),
> -				  priv->addr + FWPC2(rdev->port));
> +			rswitch_modify(priv->addr, FWPC2(rdev->port),
> +				       FIELD_PREP(FWPC2_LTWFW, ~(fwd_mask | BIT(rdev->port))),
> +				       0);

[Severity: High]
Does this bitwise logic correctly disable hardware forwarding for inactive
ports?

Since fwd_mask contains 0s for active ports and 1s for inactive ports, the
inverted mask ~(fwd_mask | BIT(rdev->port)) yields 1s for active ports and
0s for inactive ports.

This means the clear argument to rswitch_modify() will be 0 for inactive
ports. Combined with a set argument of 0, does this mean once a port is
active, it can never be disabled, potentially breaking Spanning Tree Protocol
(STP) blocking states?

[ ... ]
> @@ -285,6 +269,176 @@ static int rswitch_switchdev_blocking_event(struct notifier_block *nb,
>  	return notifier_from_errno(ret);
>  }
>  
[ ... ]
> +static void rswitch_switchdev_bridge_fdb_event_work(struct work_struct *work)
> +{
> +	struct rswitch_switchdev_event_work *switchdev_work;
> +	const unsigned char addr[] = {0, 0, 0, 0, 0, 0};
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
> +	if (is_rdev(ndev) || !netif_is_bridge_master(ndev))
> +		goto out;
> +
> +	switch (switchdev_work->event) {
> +	case SWITCHDEV_FDB_ADD_TO_DEVICE:
> +		rswitch_gwca_write_mac_address(switchdev_work->priv, switchdev_work->fdb_info.addr);
> +		rswitch_add_addr_to_mactable(switchdev_work->priv, switchdev_work->fdb_info.addr);
> +		break;

[Severity: High]
Could this code process FDB events for unrelated software bridges on the
system?

While netif_is_bridge_master() checks if the device is a bridge, it doesn't
seem to verify if the bridge actually enslaves any of the switch's ports
(for example, checking if ndev == rdev->brdev).

Also, does writing the FDB address to the GWCA MAC address here via
rswitch_gwca_write_mac_address() unconditionally overwrite the switch's
Gateway MAC address with any static FDB entry?

[ ... ]
> +static int rswitch_switchdev_event(struct notifier_block *nb,
> +				   unsigned long event,
> +				   void *ptr)
> +{
[ ... ]
> +		switchdev_work->fdb_info.addr = kzalloc(ETH_ALEN, GFP_ATOMIC);
> +		if (!switchdev_work->fdb_info.addr)
> +			goto err_addr_alloc;
> +
> +		priv->switchdev_work = switchdev_work;

[Severity: High]
Can storing the dynamically allocated work item pointer in a single
priv->switchdev_work field lead to memory leaks or use-after-free
conditions?

If multiple events are queued rapidly, this pointer appears to be overwritten,
losing track of previous work items and leaking the memory for both the work
item and the fdb_info.addr reference.

> +
> +		ether_addr_copy((u8 *)switchdev_work->fdb_info.addr,
> +				fdb_info->addr);
> +		netdev_hold(ndev, &switchdev_work->dev_tracker, GFP_ATOMIC);
> +		queue_work(system_long_wq, &switchdev_work->work);
> +
> +		break;
> +	}

[Severity: Medium]
Is system_long_wq the right workqueue to use here?

Since system_long_wq allows concurrent execution across different CPUs, rapid
ADD and DEL events for the same MAC address could race to acquire rtnl_lock()
in the worker.

Could this lack of strict FIFO ordering allow a DEL event to execute before
an ADD event, leaving a stale, permanent entry in the MAC table? Would a
dedicated ordered workqueue be more appropriate to preserve switchdev event
ordering?

> diff --git a/drivers/net/ethernet/renesas/rswitch_main.c b/drivers/net/ethernet/renesas/rswitch_main.c
> index cfe7bfe6546b2..6fa37533feffd 100644
> --- a/drivers/net/ethernet/renesas/rswitch_main.c
> +++ b/drivers/net/ethernet/renesas/rswitch_main.c
[ ... ]
> @@ -2262,6 +2262,8 @@ static void rswitch_deinit(struct rswitch_private *priv)
>  	rswitch_gwca_ts_queue_free(priv);
>  	rswitch_gwca_linkfix_free(priv);
>  
> +	cancel_work_sync(&priv->switchdev_work->work);
> +
>  	rswitch_clock_disable(priv);
>  }

[Severity: High]
Can this cancel_work_sync() call cause a NULL pointer dereference or
use-after-free?

If no FDB events were processed, priv->switchdev_work will be NULL, causing
an immediate dereference when accessing ->work.

If an event did finish, the struct is freed by its own worker in
rswitch_switchdev_bridge_fdb_event_work(), meaning cancel_work_sync() would
operate on freed memory.

[Severity: Critical]
This is a pre-existing issue, but earlier in the same series, there appears
to be a double lock acquisition without an unlock.

Looking at rswitch_gwca_change_mode() in
drivers/net/ethernet/renesas/rswitch_main.c:

int rswitch_gwca_change_mode(...)
{
        ...
        if (!rswitch_agent_clock_is_enabled(priv->addr, priv->gwca.index)) {
                spin_lock(&priv->agent_lock);
                rswitch_agent_clock_ctrl(priv->addr, priv->gwca.index, 1);
                spin_lock(&priv->agent_lock);
        }
        ...

Could this second spin_lock() cause an immediate deadlock whenever the agent
clock is enabled?

