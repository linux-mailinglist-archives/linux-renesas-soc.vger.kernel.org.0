Return-Path: <linux-renesas-soc+bounces-30743-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sNZJII9pzmmpngYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30743-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 02 Apr 2026 15:05:19 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E3609389644
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 02 Apr 2026 15:05:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0CF8730F60AB
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  2 Apr 2026 13:00:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26F003E5EF2;
	Thu,  2 Apr 2026 12:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LTwV+e9A"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44DA23E2746
	for <linux-renesas-soc@vger.kernel.org>; Thu,  2 Apr 2026 12:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775134797; cv=none; b=UkYQpDkABtMGSetIkDiglwFoEsd1qVL6pAtvisToBLTdukoSPw/c9Edlox7w+oDKzw5p3sksg9jFNWulsSgSEiSty+RxInQYDZEV6vNIHgnNNkWqz8njVjEM22SnAnUQFLp2Xre2qHh3G9ZDXQ6fFi0AGpz5FM8b1tAha9s6A4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775134797; c=relaxed/simple;
	bh=KukBV6WGKRPi1Kds2J/Oz3l26tHgaeKoWXdQFvqvEvA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i8nxnMkHxqlsxZRmmTRut7M+ycP2D7NHJHc+CpNZUxTJVHf+TM+GHv3kx52BnYYdbRWev8N48WKVvZ0OZAYT57blsm2dRYBBmZFFCjOk0LzqKlCc8Z4+Wjkys74V/M39xlucfrR66bZlftngtewmYkfybWaD9cBbNVz/0W7eacc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LTwV+e9A; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1775134786;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aakrSKhK37sQCyaPYMW6k7c3cbgfBIms5977wT19pQ0=;
	b=LTwV+e9AQ45XFX848t0peD2jh637GdhjiECqjrj1VGgrn/9aziY4leTLwzEy9dAoavaEzd
	haV2jDopnT1/2o37qTL37se8aTOHprC07ocoeSHkaGVA7jUtn4nzYhF79X4JfEIPZUeOco
	iT84+4AGEWR0aqQlCLZ4cZ33Exf/9mk=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-152-ShtkL7SBMCucRdN--DM6Kw-1; Thu,
 02 Apr 2026 08:59:40 -0400
X-MC-Unique: ShtkL7SBMCucRdN--DM6Kw-1
X-Mimecast-MFC-AGG-ID: ShtkL7SBMCucRdN--DM6Kw_1775134779
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 2C3801956089;
	Thu,  2 Apr 2026 12:59:39 +0000 (UTC)
Received: from gerbillo.redhat.com (unknown [10.44.32.195])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 1A98F180076C;
	Thu,  2 Apr 2026 12:59:34 +0000 (UTC)
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
Subject: Re: [net-next,v3,06/13] net: renesas: rswitch: add forwarding rules for gwca
Date: Thu,  2 Apr 2026 14:59:32 +0200
Message-ID: <20260402125933.234477-1-pabeni@redhat.com>
In-Reply-To: <20260331-rswitch_add_vlans-v3-6-c37f41b1c556@renesas.com>
References: <20260331-rswitch_add_vlans-v3-6-c37f41b1c556@renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
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
	TAGGED_FROM(0.00)[bounces-30743-lists,linux-renesas-soc=lfdr.de];
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
X-Rspamd-Queue-Id: E3609389644
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This is an AI-generated review of your patch. The human sending this
email has considered the AI review valid, or at least plausible.

For local reproduction steps see https://netdev-ai.bots.linux.dev/ai-local.html
---
net: renesas: rswitch: add forwarding rules for gwca

Add rules to forward packets from the Ethernet ports to the CPU port (GWCA)
using L2 forwarding instead of port forwarding.

> diff --git a/drivers/net/ethernet/renesas/rswitch_l2.c b/drivers/net/ethernet/renesas/rswitch_l2.c
> index 709524c8a5c4..cabf1f92ad0c 100644
> --- a/drivers/net/ethernet/renesas/rswitch_l2.c
> +++ b/drivers/net/ethernet/renesas/rswitch_l2.c
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
> +			      : (fwpc0_set = 0, fwpc2_set = 0);
>                                             ^^^^^^^^^^^

Does the false branch have a copy-paste error? Looking at the ternary
operator:

The TRUE branch (when offload_brdev is set) assigns:
    fwpc0_clr = 0
    fwpc2_set = 0

The FALSE branch (when offload_brdev is NULL) assigns:
    fwpc0_set = 0
    fwpc2_set = 0   <- assigns to fwpc2_set

Both branches assign to fwpc2_set, leaving fwpc2_clr unchanged with the
initialized value FIELD_PREP(FWPC2_LTWFW, BIT(AGENT_INDEX_GWCA)).

This appears to break the logic for non-offloaded mode. The FALSE branch
passes fwpc2_clr with the GWCA bit set to rswitch_modify(), which clears
the GWCA bit from the FWPC2 registers. Is this the intended behavior when
bridge offload is disabled?

The symmetric pattern in the TRUE branch suggests the FALSE branch should
be (fwpc0_set = 0, fwpc2_clr = 0) instead.

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
>  }

[ ... ]


