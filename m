Return-Path: <linux-renesas-soc+bounces-32549-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4KLrIi/WA2ol/AEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32549-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 May 2026 03:38:55 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 00CE952C010
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 May 2026 03:38:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F22D03084A76
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 May 2026 01:36:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3519F35F167;
	Wed, 13 May 2026 01:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FPBzFeSa"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2A863876CD;
	Wed, 13 May 2026 01:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778636161; cv=none; b=tECHGBdIaH0eeXG4RtmK8XIQlg95tczsQ2RlBkGTD+jXmFUI5kUpcg0mfxYE3BefObbDrfOoat9ZX01h2Dhafevop54KGk36bsZ3319E9BpaftIlzudT93rsNDXuiEPReWFo1EA4Jks0jRRCWiq//j+n0b5tgCknTafFsNLKa1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778636161; c=relaxed/simple;
	bh=6u7jn4lS/wPPhb4f5JN83m4eAkYT10lAeTCzpPa+7l4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E9yGMueahr03ZB8G8fmv1Rx2mHF5+ytYIzsjw3pgwHNH61ZXa+6rmaKsB52+TYRxThWPETzLTin+h0pjaVm4VN+0Ud8z6kitXuqsfBwqIsLTdCO7u4IEA3eWON5Sw+nLBUhBXueaj6R7o/8PviEYd8JqZ6j2ZJRARKIvkLj9nmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FPBzFeSa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B57DC2BCB8;
	Wed, 13 May 2026 01:36:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778636161;
	bh=6u7jn4lS/wPPhb4f5JN83m4eAkYT10lAeTCzpPa+7l4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FPBzFeSaUqLsbhbcgIGHM3wDXrxvIjUqX3kwnXE/qNM2WFabNI7qjz1MfSRRyRywE
	 siT0QNUmhcBuwyGcXwxzgeofeAZnYdrrKQTdN2s8x9pyjETjDlMjkTe1fQRvayI2sX
	 NxK0Wy86tjtaIPGXf07ah7bJ/ONwAnmWz0lW+bvMwTcCU6BBHcZP8WRALhk0URYV0A
	 qWv/glbwyW69X5Fn0hAxOYUVfM7TwN3uejAkkoz7kruUJbPKr3+thEFclIMPN5NW39
	 BV279M4oF8weH0xmqunKVb0YgPKx+ornJB2n+HDoyySzNgQJ8WzlvmObh725OcAux7
	 MjKFHeAVXXFlA==
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
Subject: Re: [PATCH net-next v4 12/13] net: renesas: rswitch: add handler for FDB notification
Date: Tue, 12 May 2026 18:35:59 -0700
Message-ID: <20260513013559.1408506-1-kuba@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260511-rswitch_add_vlans-v4-12-a5a225f8faae@renesas.com>
References: <20260511-rswitch_add_vlans-v4-12-a5a225f8faae@renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 00CE952C010
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-32549-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

This is an AI-generated review of your patch. The human sending this
email has considered the AI review valid, or at least plausible.
---
net: renesas: rswitch: add handler for FDB notification

The SWITCHDEV_FDB_ADD_TO_DEVICE notification writes the bridge MAC address
to the GWCA and adds a static rule to the MAC table.
The SWITCHDEV_FDB_DEL_TO_DEVICE removes the static rule from the MAC table.

> diff --git a/drivers/net/ethernet/renesas/rswitch.h b/drivers/net/ethernet/renesas/rswitch.h
> --- a/drivers/net/ethernet/renesas/rswitch.h
> +++ b/drivers/net/ethernet/renesas/rswitch.h
> @@ -1213,11 +1213,20 @@ struct rswitch_private {
>  	bool etha_no_runtime_change;
>  	bool gwca_halt;
>  	struct net_device *offload_brdev;
> +	netdevice_tracker dev_tracker;

Is it safe to use a single shared dev_tracker for dynamically allocated
asynchronous work items? 

Because system_long_wq queues works asynchronously, multiple FDB events might
overwrite this single tracker state before they execute, leaking the previous
ref_tracker allocations and potentially causing a double-free on netdev_put().

[ ... ]
> diff --git a/drivers/net/ethernet/renesas/rswitch_l2.c b/drivers/net/ethernet/renesas/rswitch_l2.c
> --- a/drivers/net/ethernet/renesas/rswitch_l2.c
> +++ b/drivers/net/ethernet/renesas/rswitch_l2.c
> @@ -82,8 +83,9 @@ static void rswitch_update_l2_hw_forwarding(struct rswitch_private *priv)
>  			 *
>  			 * Do not allow L2 forwarding to self for hw port.
>  			 */
> -			iowrite32(FIELD_PREP(FWPC2_LTWFW, fwd_mask | BIT(rdev->port)),
> -				  priv->addr + FWPC2(rdev->port));
> +			rswitch_modify(priv->addr, FWPC2(rdev->port),
> +				       FIELD_PREP(FWPC2_LTWFW, ~(fwd_mask | BIT(rdev->port))),
> +				       0);

Since rswitch_modify() performs (val & ~clear) | set, and set is passed as
0, this operation can only clear bits. Can it ever set bits back to 1 to
block a port again?

[ ... ]
> +static int rswitch_gwca_write_mac_address(struct rswitch_private *priv, const u8 *mac)
> +{
> +	int err;
> +
> +	err = rswitch_gwca_change_mode(priv, GWMC_OPC_CONFIG);

Since rswitch_gwca_change_mode() transitions to GWMC_OPC_DISABLE
asynchronously from a workqueue without stopping transmit queues or NAPI,
can this race with the active datapath and corrupt the DMA descriptor rings?

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
> +	if (is_rdev(ndev))
> +		goto out;

If the event originates from a completely unrelated device in the system
(for example, a different ethernet or wifi interface), will is_rdev()
evaluate to false and cause this unrelated MAC to be erroneously programmed
into the rswitch hardware?

> +
> +	switch (switchdev_work->event) {
> +	case SWITCHDEV_FDB_ADD_TO_DEVICE:
> +		rswitch_gwca_write_mac_address(switchdev_work->priv, switchdev_work->fdb_info.addr);
> +		rswitch_add_addr_to_mactable(switchdev_work->priv, switchdev_work->fdb_info.addr);
> +		break;
> +	case SWITCHDEV_FDB_DEL_TO_DEVICE:
> +		rswitch_del_addr_from_mactable(switchdev_work->priv, switchdev_work->fdb_info.addr);
> +		rswitch_gwca_write_mac_address(switchdev_work->priv, addr);

Does deleting any single FDB entry on the bridge wipe out the switch's
CPU MAC address since rswitch_gwca_write_mac_address() is called with a
zeroed MAC?

[ ... ]
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
> +		netdev_hold(ndev, &priv->dev_tracker, GFP_ATOMIC);
> +		queue_work(system_long_wq, &switchdev_work->work);

Is there a mechanism to flush or cancel these untracked work items on module
unload? If the driver unloads while work is pending on system_long_wq, could
it cause a use-after-free when the worker eventually executes and accesses
switchdev_work->priv?

