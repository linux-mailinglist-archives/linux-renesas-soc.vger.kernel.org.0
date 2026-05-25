Return-Path: <linux-renesas-soc+bounces-33107-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WIVFNzi0FGpDPgcAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33107-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 May 2026 22:42:32 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id A850B5CEB07
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 May 2026 22:42:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0B7EE301385A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 May 2026 20:41:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B10E33947AE;
	Mon, 25 May 2026 20:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="defuQ6lm"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ABE13A1684;
	Mon, 25 May 2026 20:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779741684; cv=none; b=bBULAfLZu4ge9XRiHCTxdaTDrUmLJ788U99xXwzld4sJdq3XvY9vvI2gNR+vQDJz8nyyu41hkxR0nJF038v4NUgwHzjbL+MUnKDvhWq2+Ndw75chSxf+SiTfdS1CXr2GBg+TJyEuq55VHC5eO9s1zRIDv1GXqPz0Z9a/LQ3EuvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779741684; c=relaxed/simple;
	bh=7XfxqmiChVonmmP1ZeMnSiORX/B7QnxdGrbI7z1jHT4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VVv+X9JCdyaSyPzrq9ztxnZC4X+VVKzASLnV2rO8M8OP3hVXE2NMPJeh0Gg9tdb6ZjhyvnOCppbyqDnx2jiL5lOoLaSe6777YOIrGVdQi2Ja4+IadNWELHciETGp9GdmYX//7xA8vDuvLEoy1x74AqA/QIUx6v5PUcm42eHyJYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=defuQ6lm; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEF971F00A3C;
	Mon, 25 May 2026 20:41:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779741680;
	bh=84GnMYede7vzyj1zJoWjeVX2b3o0qBbfmGXxfW12LXU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=defuQ6lmCLMo0D42VZMDbksK4uLkETATW4Di/HCG6M02l1tTcQgcZDXenP/XpEXHw
	 2kKz7mJ7zgnp7aW9nmZI91J5SyQjDNfLlyVSfpeIL12b6tqOjvqPPB8CuG3Nk3ty2a
	 mPlqoegbeEVMDcVjk2DEzeSaq58XjRyE9/erkTZW46uUDEg4T5RI5RSXA0Vv/Jycht
	 knKY5J6bP2j+phlaO2zu+OuJrmnVJi2SI8BM+7zZBlGJ5quB0JvbegMENpevjW54Nf
	 0Tspbp+H9fH+9HsKlyFvYjE3xHDeqrvdy9NOnnHpbsOwsbUOTmLViDR0w288g733ks
	 j0gK17OSUBmzg==
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
Subject: Re: [PATCH net-next v5 12/14] net: renesas: rswitch: add passing of rswitch_private into notifiers
Date: Mon, 25 May 2026 13:41:19 -0700
Message-ID: <20260525204119.2471487-1-kuba@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260522-rswitch_add_vlans-v5-12-53589d944a9f@renesas.com>
References: <20260522-rswitch_add_vlans-v5-12-53589d944a9f@renesas.com>
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
	TAGGED_FROM(0.00)[bounces-33107-lists,linux-renesas-soc=lfdr.de];
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
X-Rspamd-Queue-Id: A850B5CEB07
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This is an AI-generated review of your patch. The human sending this
email has considered the AI review valid, or at least plausible.
---
net: renesas: rswitch: add passing of rswitch_private into notifiers

This commit provides the rswitch_private structure to the network notifiers.
This allows the notification handlers to access the hardware state and
device-specific data.

> diff --git a/drivers/net/ethernet/renesas/rswitch_l2.c b/drivers/net/ethernet/renesas/rswitch_l2.c
> index c76fc8121ef05..d2deb7cb76349 100644
> --- a/drivers/net/ethernet/renesas/rswitch_l2.c
> +++ b/drivers/net/ethernet/renesas/rswitch_l2.c

[ ... ]

> -int rswitch_register_notifiers(void)
> +int rswitch_register_notifiers(struct rswitch_private *priv)
>  {
> -	int ret;
> +	int err;
>  
> -	ret = register_netdevice_notifier(&rswitch_netdevice_nb);
> -	if (ret)
> +	priv->rswitch_netdevice_nb.notifier_call = rswitch_netdevice_event;
> +	err = register_netdevice_notifier(&priv->rswitch_netdevice_nb);

[Severity: High]
Does moving the notifier blocks into the per-device structure without
filtering by instance cause duplicate event processing?

Since callbacks like rswitch_netdevice_event only check if the device is an
rswitch netdevice, rather than verifying it belongs to this specific priv
instance, it seems every registered callback will process the same event if
multiple driver instances exist. Could this lead to events on one instance
inadvertently modifying the hardware registers of another?

> +	if (err)
>  		goto register_netdevice_notifier_failed;

[ ... ]

> diff --git a/drivers/net/ethernet/renesas/rswitch_main.c b/drivers/net/ethernet/renesas/rswitch_main.c
> index da400020a8f19..cfe7bfe6546b2 100644
> --- a/drivers/net/ethernet/renesas/rswitch_main.c
> +++ b/drivers/net/ethernet/renesas/rswitch_main.c
> @@ -2241,6 +2241,30 @@ static int rswitch_init(struct rswitch_private *priv)
>  	return err;
>  }
>  
> +static void rswitch_deinit(struct rswitch_private *priv)
> +{
> +	unsigned int i;
> +
> +	rswitch_gwca_hw_deinit(priv);
> +	rcar_gen4_ptp_unregister(priv->ptp_priv);
> +
> +	rswitch_for_each_enabled_port(priv, i) {
> +		struct rswitch_device *rdev = priv->rdev[i];
> +
> +		unregister_netdev(rdev->ndev);

[Severity: High]
This is a pre-existing issue, but does the ordering in this teardown path
cause a use-after-free?

The hardware is reset and DMA queues are freed via rswitch_gwca_hw_deinit()
before the loop that calls unregister_netdev(). If NAPI is actively polling
or user space transmits packets while the queues are being freed, could this
crash? Should unregister_netdev() be called to synchronously stop queues
before destroying the hardware state?

> +		rswitch_ether_port_deinit_one(rdev);
> +		phy_exit(priv->rdev[i]->serdes);
> +	}

[ ... ]

> @@ -2317,9 +2341,13 @@ static int renesas_eth_sw_probe(struct platform_device *pdev)
>  	if (list_empty(&priv->port_list))
>  		dev_warn(&pdev->dev, "could not initialize any ports\n");
>  
> -	ret = rswitch_register_notifiers();
> +	ret = rswitch_register_notifiers(priv);
>  	if (ret) {
> +		rswitch_deinit(priv);
> +		pm_runtime_put(&pdev->dev);
> +		pm_runtime_disable(&pdev->dev);

[Severity: Medium]
Can this asynchronous put leave the hardware in an active power state?

The call to pm_runtime_put() queues the idle work asynchronously, but
pm_runtime_disable() includes a barrier that might cancel the pending
suspend work before it executes. Should this use pm_runtime_put_sync()
instead to ensure the suspend completes before the device is disabled?

>  		dev_err(&pdev->dev, "could not register notifiers\n");
> +
>  		return ret;
>  	}

