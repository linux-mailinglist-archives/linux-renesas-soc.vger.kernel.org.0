Return-Path: <linux-renesas-soc+bounces-33099-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yF5XE5+0FGpbPgcAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33099-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 May 2026 22:44:15 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EB0E5CEB6B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 May 2026 22:44:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6BCD8300A657
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 May 2026 20:41:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76D1137D13E;
	Mon, 25 May 2026 20:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N+qn6R02"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 347A9175A86;
	Mon, 25 May 2026 20:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779741670; cv=none; b=O4MlG6ueK5Z+LsIzBDDLx3oZ3QR+YSLt4h1I+uwol21E52Vf+oyqLNlfrS2xOHt5+Z+Au+KuI3PlmNJN3K6SfiJqMpzqI8QM2dZTVIztAPO1zP3zNne2zWzN1r/sSuq06nFPpsLTWUMZWkTQhtykAPnWWgXxNozFi2/j6tFpBX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779741670; c=relaxed/simple;
	bh=FwTX5Kd+RQtQRZGq99p4SY2K4IInTRxViZtBEUOp+3Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=A9Qc7Povnyb3yvcy0rXWnQS7gq/ywGnMcOS6KUB8afq8nTYVOvtT/DPYi/QpJl4xF7WV/AmIU4b5sg1ZhHiZ4h2UgSie6+4VIY4nixO7rcKgLby4tX2NCeQQXu2tEF5/F6gaRJegdOW+HSAVrb0vxSSqBQ0DjL0hkS2RR5/Dku4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N+qn6R02; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49E5C1F000E9;
	Mon, 25 May 2026 20:41:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779741668;
	bh=eeVLttWUbqCSOBn4ncdfJckoZfdJ7PzVb6h49z9CihI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=N+qn6R023Nf11dM/3tx4xFQAE9xSwON42yIKg19wH8b8p+8HPlg99XrwcyzORe3KY
	 Z5u3jHaAp3z5yUJL10DDqLvoIp92ljTWPZxdZWeAkSMYqxXc3MoceRIuzN6RMgJmyf
	 dppQByrLvITZpuSZP+OmZ93OSR9ti01zzwYh+8a0c3BJ2/juEck0h7bQSez5DFW68w
	 /fUwWm+mTUnJhInn6g672vlGY+0JG3lo7Yt4Gd/TQw75eHBT/d60PluY2FijiUzmv2
	 mX0q4fJSZYGvtvzWR+Ie0dEikXzRG7aFZwBYtGS7wfxdGkMUcTfoydZOIdZSiUG0uO
	 yBFi5gVR6u+2A==
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
Subject: Re: [PATCH net-next v5 01/14] net: renesas: rswitch: improve port change mode functions
Date: Mon, 25 May 2026 13:41:07 -0700
Message-ID: <20260525204107.2471226-1-kuba@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260522-rswitch_add_vlans-v5-1-53589d944a9f@renesas.com>
References: <20260522-rswitch_add_vlans-v5-1-53589d944a9f@renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33099-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,renesas.com,lunn.ch,davemloft.net,google.com,redhat.com,ragnatech.se,pbarker.dev,gmail.com,vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuba@kernel.org,linux-renesas-soc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,netdev];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 4EB0E5CEB6B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This is an AI-generated review of your patch. The human sending this
email has considered the AI review valid, or at least plausible.
---
net: renesas: rswitch: improve port change mode functions

This commit consolidates the mode change logic for ETHA and GWCA ports
in the Renesas switch driver. It ensures the required transition to
the "disable" mode is handled automatically within a single call to
the mode change functions, removing redundant manual calls.

> diff --git a/drivers/net/ethernet/renesas/rswitch_main.c b/drivers/net/ethernet/renesas/rswitch_main.c
> index 6fe964816322a..9b739594cc028 100644
> --- a/drivers/net/ethernet/renesas/rswitch_main.c
> +++ b/drivers/net/ethernet/renesas/rswitch_main.c
> @@ -176,14 +176,21 @@ static int rswitch_gwca_change_mode(struct rswitch_private *priv,
>  	if (!rswitch_agent_clock_is_enabled(priv->addr, priv->gwca.index))
>  		rswitch_agent_clock_ctrl(priv->addr, priv->gwca.index, 1);
>  
> -	iowrite32(mode, priv->addr + GWMC);
> +	iowrite32(GWMC_OPC_DISABLE, priv->addr + GWMC);
>  
> -	ret = rswitch_reg_wait(priv->addr, GWMS, GWMS_OPS_MASK, mode);
> +	ret = rswitch_reg_wait(priv->addr, GWMS, GWMS_OPS_MASK, GWMC_OPC_DISABLE);
> +	if (ret < 0)
> +		return ret;

[Severity: Medium]
Does this error path leak the agent clock resource?

In the pre-patch code, the clock was disabled unconditionally if the target
mode was DISABLE, even if rswitch_reg_wait() timed out. By returning early
here when ret < 0, it appears the rswitch_agent_clock_ctrl(..., 0) cleanup
is skipped if the hardware times out during the transition.

>  
> -	if (mode == GWMC_OPC_DISABLE)
> +	if (mode == GWMC_OPC_DISABLE) {
>  		rswitch_agent_clock_ctrl(priv->addr, priv->gwca.index, 0);
>  
> -	return ret;
> +		return ret;
> +	}

[ ... ]

> @@ -727,9 +728,6 @@ static int rswitch_gwca_hw_deinit(struct rswitch_private *priv)
>  {
>  	int err;
>  

[Severity: High]
This isn't a bug introduced by this patch, but does the hardware teardown
sequence leave transmitted SKBs queued indefinitely?

When shutting down the driver, rswitch_deinit() invokes this function
to disable the hardware data paths before the unregister_netdev() loop
executes. While the netdevs are still registered and up, the network stack
can continue to invoke ndo_start_xmit.

Because the hardware is disabled early, are these transmitted SKBs and their
DMA mappings queued without ever completing, causing them to be leaked later
when rswitch_txdmac_free() frees the rings? Should unregister_netdev() be
called before shutting down the hardware?

> -	err = rswitch_gwca_change_mode(priv, GWMC_OPC_DISABLE);
> -	if (err < 0)
> -		return err;
>  	err = rswitch_gwca_change_mode(priv, GWMC_OPC_RESET);
>  	if (err < 0)
>  		return err;

[ ... ]

> @@ -1116,14 +1114,20 @@ static int rswitch_etha_change_mode(struct rswitch_etha *etha,
>  	if (!rswitch_agent_clock_is_enabled(etha->coma_addr, etha->index))
>  		rswitch_agent_clock_ctrl(etha->coma_addr, etha->index, 1);
>  
> -	iowrite32(mode, etha->addr + EAMC);
> -
> -	ret = rswitch_reg_wait(etha->addr, EAMS, EAMS_OPS_MASK, mode);
> +	iowrite32(EAMC_OPC_DISABLE, etha->addr + EAMC);
> +	ret = rswitch_reg_wait(etha->addr, EAMS, EAMS_OPS_MASK, EAMC_OPC_DISABLE);
> +	if (ret < 0)
> +		return ret;

[Severity: Medium]
Will this return cause a similar clock resource leak if the hardware wait times
out, skipping the clock cleanup for EAMC_OPC_DISABLE?

>  
> -	if (mode == EAMC_OPC_DISABLE)
> +	if (mode == EAMC_OPC_DISABLE) {
>  		rswitch_agent_clock_ctrl(etha->coma_addr, etha->index, 0);
>  
> -	return ret;
> +		return ret;
> +	}
> +
> +	iowrite32(mode, etha->addr + EAMC);
> +
> +	return rswitch_reg_wait(etha->addr, EAMS, EAMS_OPS_MASK, mode);
>  }

[ ... ]

> @@ -1203,9 +1207,6 @@ static int rswitch_etha_hw_init(struct rswitch_etha *etha, const u8 *mac)
>  {
>  	int err;
>  
> -	err = rswitch_etha_change_mode(etha, EAMC_OPC_DISABLE);
> -	if (err < 0)
> -		return err;

[Severity: Low]
Is this explicit DISABLE mode transition still necessary?

Looking at the end of this function after the patch is applied, there is
another transition to DISABLE before switching to OPERATION:

    err = rswitch_etha_change_mode(etha, EAMC_OPC_DISABLE);
    if (err < 0)
        return err;

    return rswitch_etha_change_mode(etha, EAMC_OPC_OPERATION);

Since rswitch_etha_change_mode() now handles the DISABLE transition
internally, does leaving this explicit call result in redundant transitions
and unnecessary clock toggling?

>  	err = rswitch_etha_change_mode(etha, EAMC_OPC_CONFIG);
>  	if (err < 0)
>  		return err;

