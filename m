Return-Path: <linux-renesas-soc+bounces-33104-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wFRLE/mzFGoHPgcAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33104-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 May 2026 22:41:29 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 113065CEAAD
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 May 2026 22:41:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C83203003D0F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 May 2026 20:41:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6D4339E19A;
	Mon, 25 May 2026 20:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LuLvWqk8"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 595B939733E;
	Mon, 25 May 2026 20:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779741677; cv=none; b=TF/lpV6S8U7lKczDpQxYgl62p9/ITOHGMMzKooCX07B4dXO91BM6VUkK+bElGwf75nFRMDxIRN4sB75NeYe6ZtpL6EfzsotM7PLUma8pzkJeLq7HsiXlP9LQC9X1pqMMMHhDRDpxl3kDlSvAA8mAkz/Ibw3HrTJ94ejHDdmwna8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779741677; c=relaxed/simple;
	bh=TUH+0GxD0OHHbvdq0McgIUXc9iNiF92C5mJ1b9fFPzw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ah0gfsTU0zaqgf7TrFobonxMcXfxZaHT+/QIkJ8rTQNafiliPZtyr9ctf7JcrsIxp6hed66FUrqYhMFq2wBee0rRVYFmMgveCmYq18rAvbeyntKqJvR5kHSBAp2r9mOluOqwFGY2HAYrpbfaQXPGZRYpwZoKrToE2rjdLOzkK0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LuLvWqk8; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72FD31F00A3C;
	Mon, 25 May 2026 20:41:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779741675;
	bh=NOJPgcxnrBYyK1zcL1bbmgF54U1ASRtU4QXZ0gZ887k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=LuLvWqk81tDh+oHsJD+2NxQWcG/Yb5rmP/FoRJQbPFy5rgf2dnvCLpw1chmzDWF/1
	 EyirMPfDtKYcvfu1CRur9a78dy1jRcmm2YJ9oGO3V3smPrrnujfDZj5jY7TPGkT7LS
	 oO0pPxXWJjSJs5IYjoTOtrE0qYoeosYZCB/ft63GBaghvR+WsMo//0gztw6+z691kE
	 ArIaG+802Sx8j8fLrwwE0Uwg6Nd/Y5k8IGJU4ykmggAxNuNEU2JVZ8gjC0bO8eKiBn
	 fmZN5GZD2pp793jTBj19o+jd71PToK70ylhfS+PCNkmk3X2QAVcmqdpun+pZeinXhQ
	 YgGmlRvtjT7qQ==
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
Subject: Re: [PATCH net-next v5 08/14] net: renesas: rswitch: add locking for agent clock control
Date: Mon, 25 May 2026 13:41:14 -0700
Message-ID: <20260525204114.2471390-1-kuba@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260522-rswitch_add_vlans-v5-8-53589d944a9f@renesas.com>
References: <20260522-rswitch_add_vlans-v5-8-53589d944a9f@renesas.com>
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
	TAGGED_FROM(0.00)[bounces-33104-lists,linux-renesas-soc=lfdr.de];
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
X-Rspamd-Queue-Id: 113065CEAAD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This is an AI-generated review of your patch. The human sending this
email has considered the AI review valid, or at least plausible.
---
net: renesas: rswitch: add locking for agent clock control

This commit introduces an agent_lock to serialize access to the shared RCEC
and RCDC agent clock registers. This aims to prevent potential race
conditions between ETHA and GWCA ports when enabling or disabling clocks.

> diff --git a/drivers/net/ethernet/renesas/rswitch.h b/drivers/net/ethernet/renesas/rswitch.h
> --- a/drivers/net/ethernet/renesas/rswitch.h
> +++ b/drivers/net/ethernet/renesas/rswitch.h
[ ... ]
> @@ -1207,6 +1208,8 @@ struct rswitch_private {
>  	struct list_head port_list;
>  
>  	spinlock_t lock;	/* lock interrupt registers' control */
> +	spinlock_t agent_lock;	/* rswitch agent clock control */
> +

[Severity: High]
Is this lock initialized anywhere before it is used? 

It looks like agent_lock is added to the structure, but spin_lock_init() is
missing from the driver probe path. Depending on kzalloc for
zero-initialization is not valid for spinlocks and can cause issues on
architectures or kernel configurations that require explicit initialization.

> diff --git a/drivers/net/ethernet/renesas/rswitch_main.c b/drivers/net/ethernet/renesas/rswitch_main.c
> --- a/drivers/net/ethernet/renesas/rswitch_main.c
> +++ b/drivers/net/ethernet/renesas/rswitch_main.c
> @@ -173,8 +173,12 @@ int rswitch_gwca_change_mode(struct rswitch_private *priv,
>  {
>  	int ret;
>  
> -	if (!rswitch_agent_clock_is_enabled(priv->addr, priv->gwca.index))
> +	if (!rswitch_agent_clock_is_enabled(priv->addr, priv->gwca.index)) {
> +		spin_lock(&priv->agent_lock);
>  		rswitch_agent_clock_ctrl(priv->addr, priv->gwca.index, 1);
> +		spin_lock(&priv->agent_lock);
> +	}

[Severity: High]
Does this code cause an immediate deadlock? 

Because spin_lock() is called twice consecutively without a spin_unlock(), it
appears the CPU will spin indefinitely waiting for the lock it already holds.

