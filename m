Return-Path: <linux-renesas-soc+bounces-33109-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UIw5Oj60FGpbPgcAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33109-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 May 2026 22:42:38 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D7D275CEB26
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 May 2026 22:42:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5F7483014258
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 May 2026 20:41:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D5BA3A4F4B;
	Mon, 25 May 2026 20:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QJTW7o39"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B968B380FE9;
	Mon, 25 May 2026 20:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779741685; cv=none; b=OSgmjUkQG4P6oD6pcNo5Oi6TFzAk0Jv2S8m1ibdNHz56valsSSrddNhUAr+rQ5PTVY86q9zXRLxwYCHD8BGrLxtCmrrQAbsvNwxFEvXbbrU8Q6pap38PyFZfjlyt0oqpNxFYsg35pGuP0d+AbjWUS9FK+FsT80Af0pYioMWyjCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779741685; c=relaxed/simple;
	bh=U5+ZuQ65d3tnD/MADat0Me3W1/1R+VsYenecOypJvw4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m2oewrfqrD3TpHvHf70TyXITMprNw/4PDO9epxm00ja69YUwhjDomWq5AszPuxMvgkxnTqT6XJ/c9peTbkYaSCG+PNTjldNh/37n73r7fzvwUJ6gIskQf0OXx0msfanxo4xx0+tMa3F3CUOle2ivi2KE97HNrc2nLRVAQY6sMkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QJTW7o39; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 153B41F00A3A;
	Mon, 25 May 2026 20:41:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779741683;
	bh=81DhbawtDqBc+BFbY7juQMfdTUE8jBfq49tDkSyVcXo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=QJTW7o39apLnP7yq3O9L8Sg7SPeWyHiDmXCSqXqU3iiqoUMngkHoGdkrDn+37NJ9Q
	 c0hcamU1GX4iNPieJbzhwJIo/GlLg4txieMm2kKVnhZjXzh2eHMwt+eAGiWeh7ui43
	 VgSYPc1a7R9a6Q3Uc9o5lWlGFE2NyMiMXxPP60rXd8+DV2Q3IsbL4V+JveVBhPl/cw
	 GiDTwdh/NgKpnRxysd4BLp7oje5OvL9TAb+Cjm7JRLw/s+LT88TbpyBr7ob2xc/RIV
	 gNFAacJwKTbfm8Fr3RwWGfz4APuUVdNfX+kSSG06q80+X7OhQRSNvXOuf12B99o9jI
	 /DMXaRPcL7jjw==
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
Subject: Re: [PATCH net-next v5 14/14] net: renesas: rswitch: add vlan aware switching
Date: Mon, 25 May 2026 13:41:22 -0700
Message-ID: <20260525204122.2471553-1-kuba@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260522-rswitch_add_vlans-v5-14-53589d944a9f@renesas.com>
References: <20260522-rswitch_add_vlans-v5-14-53589d944a9f@renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33109-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,renesas.com,lunn.ch,davemloft.net,google.com,redhat.com,ragnatech.se,pbarker.dev,gmail.com,vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuba@kernel.org,linux-renesas-soc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,netdev];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: D7D275CEB26
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This is an AI-generated review of your patch. The human sending this
email has considered the AI review valid, or at least plausible.
---
Subject: net: renesas: rswitch: add vlan aware switching

This patch adds VLAN support to the L2 HW bridge for the Renesas switch.
It implements the standard switchdev callbacks for configuring STP state,
aging time, and VLAN filtering. The implementation works around hardware
limitations by keeping all ports in a default VLAN.

> diff --git a/drivers/net/ethernet/renesas/rswitch_l2.c b/drivers/net/ethernet/renesas/rswitch_l2.c
> --- a/drivers/net/ethernet/renesas/rswitch_l2.c
> +++ b/drivers/net/ethernet/renesas/rswitch_l2.c
[ ... ]
> +static void rswitch_update_vlan_filtering(struct rswitch_private *priv,
> +					  bool vlan_filtering)
> +{
> +	if (vlan_filtering)
> +		rswitch_modify(priv->addr, FWPC0(AGENT_INDEX_GWCA),
> +			       0, FWPC0_VLANSA | FWPC0_VLANRU);
> +	else
> +		rswitch_modify(priv->addr, FWPC0(AGENT_INDEX_GWCA),
> +			       FWPC0_VLANSA | FWPC0_VLANRU, 0);
> +}

[Severity: Medium]
Does this properly synchronize the VLAN filtering state to the physical
switch ports? This seems to update the FWPC0 registers only for the CPU
port (AGENT_INDEX_GWCA) without iterating over the external physical
ports, which might leave the hardware in an inconsistent state.

[ ... ]
> +static int rswitch_handle_port_attr_set(struct net_device *ndev,
> +					struct notifier_block *nb,
> +					struct switchdev_notifier_port_attr_info *info)
> +{
[ ... ]
> +	switch (attr->id) {
> +	case SWITCHDEV_ATTR_ID_PORT_STP_STATE:
> +		err = rswitch_port_update_stp_state(ndev, attr->u.stp_state);
> +
> +		break;
[ ... ]
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +
> +	if (err < 0)
> +		return err;
> +
> +	info->handled = true;
> +
> +	return NOTIFY_DONE;
> +}

[Severity: High]
Could this block switchdev configurations for other network devices on the
system? 

The switchdev notifiers are broadcast globally, and without a check
verifying the target ndev belongs to this driver, the default case here
returns -EOPNOTSUPP for unrelated devices. When passed to
notifier_from_errno(), this stops the global notifier chain.

[ ... ]
> +static int rswitch_gwca_set_vlan_tag(struct rswitch_private *priv,
> +				     struct switchdev_obj_port_vlan *p_vlan,
> +				     bool delete)
> +{
> +	u32 vem_val;
> +	int err;
> +
> +	err = rswitch_gwca_change_mode(priv, GWMC_OPC_CONFIG);

[Severity: High]
This isn't a bug introduced by this patch, but there appears to be a self-
deadlock in rswitch_gwca_change_mode() when trying to enable the agent
clock:

drivers/net/ethernet/renesas/rswitch_main.c:rswitch_gwca_change_mode() {
        if (!rswitch_agent_clock_is_enabled(priv->addr, priv->gwca.index)) {
                spin_lock(&priv->agent_lock);
                rswitch_agent_clock_ctrl(priv->addr, priv->gwca.index, 1);
                spin_lock(&priv->agent_lock);
        }
...
}

Will the second spin_lock() cause a deadlock on the same CPU?

> +	if (err < 0)
> +		return err;

[ ... ]
> +static int rswitch_port_obj_do_add_gwca(struct net_device *ndev,
> +					struct rswitch_private *priv,
> +					struct switchdev_obj_port_vlan *p_vlan)
> +{
> +	int err;
> +
> +	if (!(p_vlan->flags & BRIDGE_VLAN_INFO_BRENTRY))
> +		return NOTIFY_DONE;
> +
> +	/* Set Rswitch VLAN mode */
> +	iowrite32(br_vlan_enabled(ndev) ? FIELD_PREP(FWGC_SVM, C_TAG) : 0, priv->addr + FWGC);

[Severity: High]
Is it safe to pass ndev directly to br_vlan_enabled() here? 

Because the notifier runs globally and routes non-rdev devices into this
function, ndev might be an unrelated physical port rather than a bridge
master. This seems like it could lead to out-of-bounds memory reads when
the function dereferences the foreign driver's private data.

[ ... ]
> +static int rswitch_port_obj_do_del(struct net_device *ndev,
> +				   struct switchdev_obj_port_vlan *p_vlan)
> +{
> +	struct rswitch_device *rdev = netdev_priv(ndev);
> +	struct rswitch_private *priv = rdev->priv;
> +	struct rswitch_etha *etha = rdev->etha;
> +	int err;
> +
> +	err = rswitch_port_set_vlan_tag(etha, p_vlan, true);
> +	if (err < 0)
> +		return err;
> +
> +	rswitch_modify(priv->addr, FWPC0(etha->index), FWPC0_VLANSA | FWPC0_VLANRU, 0);
> +	rswitch_modify(priv->addr, FWPC2(AGENT_INDEX_GWCA), 0,
> +		       FIELD_PREP(FWPC2_LTWFW, BIT(etha->index)));
> +	rswitch_modify(priv->addr, FWPC2(rdev->port),
> +		       0, FIELD_PREP(FWPC2_LTWFW, GENMASK(RSWITCH_NUM_AGENTS - 1, 0)));

[Severity: High]
Does this unconditionally break connectivity for all remaining active VLANs
on this port? 

When handling a VLAN deletion event, clearing these forwarding masks happens
regardless of whether the port is still a member of other VLANs.

> +
> +	return rswitch_erase_vlan_table(priv, p_vlan->vid, etha->index);
> +}

[ ... ]
>  static int rswitch_switchdev_blocking_event(struct notifier_block *nb,
> -					    unsigned long event, void *ptr)
> +					    unsigned long event,
> +					    void *ptr)
>  {
>  	struct net_device *ndev = switchdev_notifier_info_to_dev(ptr);
> -	int ret;
>  
>  	switch (event) {
>  	case SWITCHDEV_PORT_OBJ_ADD:
> -		return -EOPNOTSUPP;
> +		err = rswitch_handle_port_obj_add(ndev, nb, ptr);
> +
> +		return notifier_from_errno(err);
>  	case SWITCHDEV_PORT_OBJ_DEL:
> -		return -EOPNOTSUPP;
> +		err = rswitch_handle_port_obj_del(ndev, nb, ptr);
> +
> +		return notifier_from_errno(err);
>  	case SWITCHDEV_PORT_ATTR_SET:
> -		ret = switchdev_handle_port_attr_set(ndev, ptr,
> -						     is_rdev,
> -						     rswitch_port_attr_set);
> -		break;
> -	default:
> -		if (is_rdev(ndev))
> -			return -EOPNOTSUPP;
> -		return NOTIFY_DONE;
> +		err = rswitch_handle_port_attr_set(ndev, nb, ptr);
> +
> +		return notifier_from_errno(err);
>  	}

[Severity: High]
Could removing the is_rdev check from the attribute and object handler
paths cause the driver to wrongly modify its own MMIO registers based on
events meant for other hardware? 

Since switchdev_handle_port_attr_set previously guarded against unrelated
devices, removing it exposes the handlers to global broadcast events.

