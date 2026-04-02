Return-Path: <linux-renesas-soc+bounces-30740-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UM17B9BozmmpngYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30740-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 02 Apr 2026 15:02:08 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8763E389583
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 02 Apr 2026 15:02:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DDFE7308BC1B
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  2 Apr 2026 12:59:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDC973C4569;
	Thu,  2 Apr 2026 12:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="U+fMGmXf"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E16338C2C7
	for <linux-renesas-soc@vger.kernel.org>; Thu,  2 Apr 2026 12:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775134776; cv=none; b=tVHaVfKjoYvmb+p88wCrXTNvRG3CdfKirFI1FAxWavNQV1zftuHmUQqfdJ8livgDJkjcDSL++0IiW14UdQsTSAmDpHRRMMb8ZPBWv1fUNwC0TRlVUTNiVqA5iBj7cmkHmpdQFL1bFaV+we8BoC4/qxfWmhQDYjcLXDwpUKXaTOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775134776; c=relaxed/simple;
	bh=JeAwOslyRoazVMCoQf4HfMImDtopo6ldkZCe++vxnFA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WYiOKjeSBA9FKwN5TPZDR35AL/VZFlh1LGm+IV6iI2Dy7l1N/Eujo6m/q2rT7HdSPPKVoH4CGq0+UssGW4zirUa+ehlOwW2eEHKFsOGXGIOAm9GA1WITowgys5nSt3dKSfV3X1ARcb93PvHXVrAz2+m//Xa83D8WqyNMtc3cuq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=U+fMGmXf; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1775134766;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vldI4wk7pqregV0SbJoGkh53C8cySKyV4SyxvHpsdeI=;
	b=U+fMGmXfgPQwroMbnlou31ZpSZ51VGzb3LAabV8TS4AF9LE2Hb7CSJpFvYg00JYsZPlemw
	1+uMcxoMQZEU1/2Adi8i5hghypKr5jp8Fd0X5X8+WrJfAjbzYZUVV6Wncjz1b6nIFtzSm7
	thobkyVbwSBqxjzGja+s4G5inwbsnik=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-542-RgxLgiSoMhqPY-l-MrnQ6A-1; Thu,
 02 Apr 2026 08:59:21 -0400
X-MC-Unique: RgxLgiSoMhqPY-l-MrnQ6A-1
X-Mimecast-MFC-AGG-ID: RgxLgiSoMhqPY-l-MrnQ6A_1775134759
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 50552195609F;
	Thu,  2 Apr 2026 12:59:19 +0000 (UTC)
Received: from gerbillo.redhat.com (unknown [10.44.32.195])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 49B8819560A6;
	Thu,  2 Apr 2026 12:59:15 +0000 (UTC)
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
Subject: Re: [net-next,v3,01/13] net: renesas: rswitch: improve port change mode functions
Date: Thu,  2 Apr 2026 14:59:12 +0200
Message-ID: <20260402125912.234434-1-pabeni@redhat.com>
In-Reply-To: <20260331-rswitch_add_vlans-v3-1-c37f41b1c556@renesas.com>
References: <20260331-rswitch_add_vlans-v3-1-c37f41b1c556@renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[redhat.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30740-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCPT_COUNT_TWELVE(0.00)[12];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pabeni@redhat.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	NEURAL_HAM(-0.00)[-0.999];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,netdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linux.dev:url]
X-Rspamd-Queue-Id: 8763E389583
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This is an AI-generated review of your patch. The human sending this
email has considered the AI review valid, or at least plausible.

For local reproduction steps see https://netdev-ai.bots.linux.dev/ai-local.html
---
net: renesas: rswitch: improve port change mode functions

For ETHA and GWCA ports every mode change from operational to
configuration and vice-versa requires to change the mode to "disable"
first. This was done by calling the function twice. Let the change_mode
function take care of this required step in a single call.

> diff --git a/drivers/net/ethernet/renesas/rswitch_main.c b/drivers/net/ethernet/renesas/rswitch_main.c
> index 6fe964816322..f6d1e610e7fa 100644
> --- a/drivers/net/ethernet/renesas/rswitch_main.c
> +++ b/drivers/net/ethernet/renesas/rswitch_main.c
> @@ -176,14 +176,19 @@ static int rswitch_gwca_change_mode(struct rswitch_private *priv,
>  	if (!rswitch_agent_clock_is_enabled(priv->addr, priv->gwca.index))
>  		rswitch_agent_clock_ctrl(priv->addr, priv->gwca.index, 1);
>
> -	iowrite32(mode, priv->addr + GWMC);
> +	iowrite32(GWMC_OPC_DISABLE, priv->addr + GWMC);
>
> -	ret = rswitch_reg_wait(priv->addr, GWMS, GWMS_OPS_MASK, mode);
> +	ret = rswitch_reg_wait(priv->addr, GWMS, GWMS_OPS_MASK, GWMC_OPC_DISABLE);
>
> -	if (mode == GWMC_OPC_DISABLE)
> +	if (mode == GWMC_OPC_DISABLE) {
>  		rswitch_agent_clock_ctrl(priv->addr, priv->gwca.index, 0);
>
> -	return ret;
> +		return ret;
> +	}
> +
> +	iowrite32(mode, priv->addr + GWMC);
> +
> +	return rswitch_reg_wait(priv->addr, GWMS, GWMS_OPS_MASK, mode);

Should the error from the initial DISABLE transition be checked before
proceeding? When mode != GWMC_OPC_DISABLE, this code stores the result of
rswitch_reg_wait() for the DISABLE transition in 'ret' but never checks it.
If the hardware fails to reach DISABLE state, the function silently proceeds
to write the target mode.

Before this patch, callers explicitly checked the error after calling
rswitch_gwca_change_mode(priv, GWMC_OPC_DISABLE):

rswitch_gwca_hw_init() and rswitch_gwca_hw_deinit():
    err = rswitch_gwca_change_mode(priv, GWMC_OPC_DISABLE);
    if (err < 0)
        return err;

This patch removes those caller-side checks but doesn't replicate the error
checking inside rswitch_gwca_change_mode(). If the first rswitch_reg_wait()
returns -ETIMEDOUT, should the function return that error before attempting
to write the target mode?

>  }
>
>  static int rswitch_gwca_mcast_table_reset(struct rswitch_private *priv)
> @@ -682,9 +687,6 @@ static int rswitch_gwca_hw_init(struct rswitch_private *priv)
>  	unsigned int i;
>  	int err;
>
> -	err = rswitch_gwca_change_mode(priv, GWMC_OPC_DISABLE);
> -	if (err < 0)
> -		return err;
>  	err = rswitch_gwca_change_mode(priv, GWMC_OPC_CONFIG);
>  	if (err < 0)
>  		return err;

[ ... ]

> @@ -717,9 +719,6 @@ static int rswitch_gwca_hw_init(struct rswitch_private *priv)
>  			return err;
>  	}
>
> -	err = rswitch_gwca_change_mode(priv, GWMC_OPC_DISABLE);
> -	if (err < 0)
> -		return err;
>  	return rswitch_gwca_change_mode(priv, GWMC_OPC_OPERATION);
>  }
>
> @@ -727,9 +726,6 @@ static int rswitch_gwca_hw_deinit(struct rswitch_private *priv)
>  {
>  	int err;
>
> -	err = rswitch_gwca_change_mode(priv, GWMC_OPC_DISABLE);
> -	if (err < 0)
> -		return err;
>  	err = rswitch_gwca_change_mode(priv, GWMC_OPC_RESET);
>  	if (err < 0)
>  		return err;

[ ... ]

> @@ -1116,14 +1112,18 @@ static int rswitch_etha_change_mode(struct rswitch_etha *etha,
>  	if (!rswitch_agent_clock_is_enabled(etha->coma_addr, etha->index))
>  		rswitch_agent_clock_ctrl(etha->coma_addr, etha->index, 1);
>
> -	iowrite32(mode, etha->addr + EAMC);
> -
> -	ret = rswitch_reg_wait(etha->addr, EAMS, EAMS_OPS_MASK, mode);
> +	iowrite32(EAMC_OPC_DISABLE, etha->addr + EAMC);
> +	ret = rswitch_reg_wait(etha->addr, EAMS, EAMS_OPS_MASK, EAMC_OPC_DISABLE);
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

Same pattern here in rswitch_etha_change_mode(). When mode !=
EAMC_OPC_DISABLE, the return value from rswitch_reg_wait() for the
intermediate DISABLE transition is stored in 'ret' but never checked.

Before this patch, rswitch_etha_hw_init() explicitly called
rswitch_etha_change_mode(etha, EAMC_OPC_DISABLE) with error checking before
calling it with EAMC_OPC_CONFIG. This patch removes that caller-side check
but doesn't replicate it inside the function. Should there be a check like
'if (ret < 0) return ret;' after the first rswitch_reg_wait()?

>  }
>
>  static void rswitch_etha_read_mac_address(struct rswitch_etha *etha)

[ ... ]


