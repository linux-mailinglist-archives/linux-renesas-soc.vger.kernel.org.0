Return-Path: <linux-renesas-soc+bounces-33102-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qKIgJv+0FGpbPgcAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33102-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 May 2026 22:45:51 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F42355CEBA7
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 May 2026 22:45:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1D12F30488D7
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 May 2026 20:41:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FBB0396D2E;
	Mon, 25 May 2026 20:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jqFc3TUG"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF42438F232;
	Mon, 25 May 2026 20:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779741676; cv=none; b=KagDMA5sBGjjluRCsHpxktho9WJTCaVmYztxFPucF3LQJo9rpd4/eiCaDHfBYW7rm9hiTJro+mSpnzQXXtqEWxRZNSlwM2zTIEMoXJbzcuWJXB2b+I72l9AfILuZ8rpQ0CDafFa7Z4NgBFzkn826GDZyJPVS4RSc6PvPg3d3Qi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779741676; c=relaxed/simple;
	bh=Ct9meLMinjOSLvyv0wmvRIMf2Wnu/qzpEIZvQLZLKjk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nMPnkHiG2JOOguzLC6XXAi49HKu8SRIep/kAsgcPcLdQSFctDfXAzY6JDxIwEqNWzDeAJWFEFs7L7jHUSoy+V+Hym4I54aNSr92ugf/gx7AcjYksFUC4CuLxOX6esmyXQy038MtFpkjo+mBmFL4VOYBXxDfWkWdKlTZOZRUd7X4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jqFc3TUG; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 270E41F000E9;
	Mon, 25 May 2026 20:41:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779741674;
	bh=sJHfpkXeegXyMnh/03SPZhkWR/ywCKHVOhWL2u+jXUI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=jqFc3TUGfTj32MLggbilwoviAUj/ylhPS5cApCKC8bvxAlRfG6IB7iGmxCHJ/cVcq
	 J5cbv6kGaIGCGmKuE44bmCPB3ibfpiMpomwAUICfHIwgh8GUcSp9fIIhi0R5OspclM
	 obxXMW8h3CIyf/wEXOJi0yOqNTSbFAEjVAt/+IDXEWCDnHLtKD2V8dWEb24XdsWGdW
	 1/DIGKXI5ePtCskvpHsQTLFTjYl9/wS4I5eHOtQhlqwekKTaJQrr7A87hWeR2cEeqJ
	 oOuEwRYMFx+Xfsx7E65jZvchVEtByI1n/A3PYKgsiFNsolbMXCADqPdYE26gw26nhW
	 bnrapw9n4c4ow==
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
Subject: Re: [PATCH net-next v5 07/14] net: renesas: rswitch: make helper functions available to whole driver
Date: Mon, 25 May 2026 13:41:13 -0700
Message-ID: <20260525204113.2471355-1-kuba@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260522-rswitch_add_vlans-v5-7-53589d944a9f@renesas.com>
References: <20260522-rswitch_add_vlans-v5-7-53589d944a9f@renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33102-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,renesas.com,lunn.ch,davemloft.net,google.com,redhat.com,ragnatech.se,pbarker.dev,gmail.com,vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuba@kernel.org,linux-renesas-soc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,netdev];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: F42355CEBA7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This is an AI-generated review of your patch. The human sending this
email has considered the AI review valid, or at least plausible.
---
net: renesas: rswitch: make helper functions available to whole driver

These functions will be needed in L2 and vlan handling. Remove static
declaration and add function prototype to rswitch.h.

> diff --git a/drivers/net/ethernet/renesas/rswitch_main.c b/drivers/net/ethernet/renesas/rswitch_main.c
> index 1f4ec65f6f9bd..20ac8f3b9357f 100644
> --- a/drivers/net/ethernet/renesas/rswitch_main.c
> +++ b/drivers/net/ethernet/renesas/rswitch_main.c
[ ... ]
> @@ -168,14 +168,13 @@ static int rswitch_fwd_init(struct rswitch_private *priv)
>  }
>  
>  /* Gateway CPU agent block (GWCA) */
> -static int rswitch_gwca_change_mode(struct rswitch_private *priv,
> -				    enum rswitch_gwca_mode mode)
> +int rswitch_gwca_change_mode(struct rswitch_private *priv,
> +			     enum rswitch_gwca_mode mode)
>  {
>  	int ret;
>  
>  	if (!rswitch_agent_clock_is_enabled(priv->addr, priv->gwca.index))
>  		rswitch_agent_clock_ctrl(priv->addr, priv->gwca.index, 1);

[Severity: High]
This isn't a bug introduced by this patch, but does making these mode change
functions globally available expose an unsynchronized read-modify-write data
race?

Looking at rswitch_agent_clock_ctrl() being called here, it performs an
unprotected read-modify-write on the shared RCEC and RCDC hardware registers:

static void rswitch_agent_clock_ctrl(...)
{
	...
	if (enable) {
		val = ioread32(coma_addr + RCEC);
		iowrite32(val | RCEC_RCE | BIT(port), coma_addr + RCEC);
	}
	...
}

Could concurrent calls from L2 or VLAN paths cause lost clock enable/disable
commands, leading to silent initialization failures for network ports?

I noticed a subsequent commit in this series ("net: renesas: rswitch: add
locking for agent clock control") attempts to fix this using agent_lock.
However, doesn't that fix introduce a hard deadlock by calling
spin_lock(&priv->agent_lock) twice consecutively in
rswitch_gwca_change_mode(), while also failing to initialize the spinlock?

Would it be better to address the missing synchronization correctly before
exporting these functions for broader concurrent use?

> -
>  	iowrite32(GWMC_OPC_DISABLE, priv->addr + GWMC);
>  
>  	ret = rswitch_reg_wait(priv->addr, GWMS, GWMS_OPS_MASK, GWMC_OPC_DISABLE);

