Return-Path: <linux-renesas-soc+bounces-33103-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cJApHC61FGpbPgcAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33103-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 May 2026 22:46:38 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E73B5CEBC4
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 May 2026 22:46:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 656FC3050915
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 May 2026 20:41:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C30539C63E;
	Mon, 25 May 2026 20:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XAin5l6Y"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 807FE39524D;
	Mon, 25 May 2026 20:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779741677; cv=none; b=KmMKVNvqmuJZX9IdtZLa+DIj/KYaDIcPwancOKj0mUkzt+s9VEnqjC61RG4pTkRXtN48eU/JTjiwpYQD9ciCg1ykZqMJuCWdGJ/jZk6f9P6EbUZKDFHqWLAIYWi1QvGRWRdnfti+R+tEL6QaR+NYe6NswqQfKyg0XiDOnkyhMBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779741677; c=relaxed/simple;
	bh=MUTEyZiguj9bITyqphJmLAsx8bdF0lBNR6dVrDXqSB4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bwDv3gOKwk6b9p35Ir5N/qPwc85MWlX94W1Z5/Djuwpvl4VRjisfSfLdB+IlgQXuyoaAWGs1M59ALnWfj/mJQa79qWwOgyVPC7lOeCrJ4XhfZ+7k7xTzcXCmg5v4dzn9mjoSmqGLEQ1+SAanC919SFQhAf/VjmzSftUg02M+w8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XAin5l6Y; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5D1F1F00A3A;
	Mon, 25 May 2026 20:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779741673;
	bh=95I0gVrOgkr8IVdplZMB90UtDCjWZ6ZBw4t3+zYSyaE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=XAin5l6Yy+oc+jqfkEavRKmdBfJzvurqdIioRl22+h5sIJdut7fJkEwtq8f8j0QV7
	 h1P1KfBLQFz4xBTIbD6Zpnucfkv2aAqfd0BLILmcdUEbU4grpXIC6WsZrS7JRKxxcW
	 GGpyFMZ1OyiyRh3kgx4x/w0HttxFdDt2V1QvMkqNYh+LBrshyeOzzyWCjbwy8lkDO6
	 pFGHZWBDDW58XJOJ+BRlG9f0LVNfOAIwBbYJR+TSFdhgbVUKZylikFZtJkJZBfii8e
	 EhwMsoO2P3HoIFB3uGerrV1ruMcI9vlwyGCbagG/reaCbQIGwjKsnvfNY4N+UGbQVa
	 lm1UGtK67YsdQ==
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
Subject: Re: [PATCH net-next v5 06/14] net: renesas: rswitch: add forwarding rules for gwca
Date: Mon, 25 May 2026 13:41:12 -0700
Message-ID: <20260525204112.2471322-1-kuba@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260522-rswitch_add_vlans-v5-6-53589d944a9f@renesas.com>
References: <20260522-rswitch_add_vlans-v5-6-53589d944a9f@renesas.com>
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
	TAGGED_FROM(0.00)[bounces-33103-lists,linux-renesas-soc=lfdr.de];
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
X-Rspamd-Queue-Id: 0E73B5CEBC4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This is an AI-generated review of your patch. The human sending this
email has considered the AI review valid, or at least plausible.
---
Subject: net: renesas: rswitch: add forwarding rules for gwca
    
This commit adds rules to forward packets from the Ethernet ports to the
CPU port (GWCA) using L2 forwarding. It introduces a new function to
configure GWCA forwarding rules and integrates it into the L2 offload
updates.

> Add rules to forward packets from the Ethernet ports to the CPU port (GWCA)
> using L2 forwarding instead of port forwarding.

[Severity: Medium]
The commit message mentions using L2 forwarding instead of port forwarding,
but is the existing port forwarding code actually removed or disabled?

If rswitch_fwd_init() still configures FWPBFC to unconditionally forward all
packets to the GWCA port, does having both L2 forwarding and port-based
forwarding active simultaneously lead to duplicated packets and unnecessary
CPU overhead?

> diff --git a/drivers/net/ethernet/renesas/rswitch_l2.c b/drivers/net/ethernet/renesas/rswitch_l2.c
> index 709524c8a5c4d..3cc0ce8762f3c 100644
> --- a/drivers/net/ethernet/renesas/rswitch_l2.c
> +++ b/drivers/net/ethernet/renesas/rswitch_l2.c

[ ... ]

> @@ -93,10 +93,32 @@ static void rswitch_update_l2_hw_forwarding(struct rswitch_private *priv)
>  	}
>  }
>  
> +static void rswitch_update_l2_hw_forwarding_gwca(struct rswitch_private *priv)
> +{
> +	struct rswitch_device *rdev;
> +	u32 fwpc0_set, fwpc0_clr, fwpc2_set, fwpc2_clr;
> +
> +	fwpc0_clr = FWPC0_MACSSA | FWPC0_MACDSA | FWPC0_MACRUDA;
> +	fwpc0_set = fwpc0_clr;
> +	fwpc2_clr = FIELD_PREP(FWPC2_LTWFW, BIT(AGENT_INDEX_GWCA));
> +	fwpc2_set = fwpc2_clr;
> +
> +	(priv->offload_brdev) ? (fwpc0_clr = 0, fwpc2_set = 0)
> +			      : (fwpc0_set = 0, fwpc2_clr = 0);
> +
> +	rswitch_modify(priv->addr, FWPC0(AGENT_INDEX_GWCA), fwpc0_clr, fwpc0_set);
> +
> +	rswitch_for_all_ports(priv, rdev) {
> +		rswitch_modify(priv->addr, FWPC2(rdev->etha->index),
> +			       fwpc2_clr, fwpc2_set);
> +	}
> +}
> +
>  void rswitch_update_l2_offload(struct rswitch_private *priv)
>  {
>  	rswitch_update_l2_hw_learning(priv);
>  	rswitch_update_l2_hw_forwarding(priv);
> +	rswitch_update_l2_hw_forwarding_gwca(priv);

[Severity: Medium]
Do non-atomic updates to FWPC2 momentarily disable forwarding to the CPU port?

In rswitch_update_l2_hw_forwarding(), iowrite32() is used to overwrite
FWPC2, which unconditionally sets the GWCA bit to 1, disabling hardware L2
forwarding to the CPU port.

Immediately after, rswitch_update_l2_hw_forwarding_gwca() uses
rswitch_modify() to clear the GWCA bit back to 0.

Does this consecutive write sequence create a microsecond window where L2
forwarding to the CPU is incorrectly denied, risking packet drops for
hardware packets destined for the CPU?

>  }

[Severity: High]
This is a pre-existing issue, but I noticed a potential kernel panic in
rswitch_update_offload_brdev() when logging is enabled:

drivers/net/ethernet/renesas/rswitch_l2.c:rswitch_update_offload_brdev() {
    ...
    if (offload_brdev == priv->offload_brdev)
        dev_dbg(&priv->pdev->dev,
            "changing l2 offload from %s to %s\n",
            netdev_name(priv->offload_brdev),
            netdev_name(offload_brdev));
    ...
}

If a single port is added to a bridge, the loop searching for a shared
bridge exits early, leaving offload_brdev as NULL.

If priv->offload_brdev is also NULL (the initial state), the condition
offload_brdev == priv->offload_brdev evaluates to true.

Will this cause a kernel panic when dynamic debugging is active, since
netdev_name(NULL) unconditionally dereferences its argument?

[Severity: High]
This is a pre-existing issue, but do concurrent transmissions cause lost
writes to the shared GWTRC register?

In rswitch_start_xmit(), transmission is triggered by modifying the GWTRC
register:

drivers/net/ethernet/renesas/rswitch_main.c:rswitch_start_xmit() {
    ...
    rswitch_modify(priv->addr, GWTRC, ...);
    ...
}

Because rswitch_modify() performs a lockless read-modify-write:

drivers/net/ethernet/renesas/rswitch_main.c:rswitch_modify() {
    iowrite32((ioread32(addr + reg) & ~clear) | set, addr + reg);
}

Will concurrent ndo_start_xmit calls from different CPUs on different
ports race and overwrite each other's modifications, resulting in lost
transmit triggers and stalled TX queues?

[Severity: High]
This is a pre-existing issue, but does the driver fail to set
skb->offload_fwd_mark for hardware-forwarded L2 packets?

The driver supports hardware L2 forwarding but does not appear to set
skb->offload_fwd_mark = 1 before passing received packets to the network
stack.

Without this flag, the software bridge is unaware that the hardware has
already flooded the packet to other ports.

Will this cause the bridge to re-flood broadcast and multicast packets,
leading to packet duplication and potential network storms?

