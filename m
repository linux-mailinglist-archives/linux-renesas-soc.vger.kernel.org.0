Return-Path: <linux-renesas-soc+bounces-22464-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E0FF5BAA1A8
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Sep 2025 19:09:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9A64F3B1F04
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Sep 2025 17:09:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1E2421257F;
	Mon, 29 Sep 2025 17:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="bCrvVsO+"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-21.smtpout.orange.fr [80.12.242.21])
	(using TLSv1.2 with cipher AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E223D15CD7E;
	Mon, 29 Sep 2025 17:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759165778; cv=none; b=ePJX8j+HJy44FkQoY6A5xRBWPGz7sVeFYYrhwW3e8ycGa3yHz5bCKagN3ElS9JG1r9tPGNpUinLUgpNKyoOxeLm9Cs4olpiP9XzEBcJ2VejocUnmZi+V2MVsKx2iREirMlgc9tYBP/PHmIrGPh0/5czOFgUdRrkioChwuQUQ/A0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759165778; c=relaxed/simple;
	bh=3E/Tt+RrUvWdSDYw6QAa9QnW9QeE0ZJPgE6I865//AM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E4DXx+btFspafK99McmfmPYx9gkgwm9GYvSW6q8OJIHJUHxwLgT7yKah9mSEiM8uRHLcHhoQGrjrXIXUvxqvkfPjCaNJXVhaemUHeEYZ2hd1s6BquuerLyJgBZMddVOTIKTTfNfZbzUP7OoM35xe8t1b8RYvHkqZ7y1NxxFetIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=bCrvVsO+; arc=none smtp.client-ip=80.12.242.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from [IPV6:2a01:cb10:785:b00:8347:f260:7456:7662]
 ([IPv6:2a01:cb10:785:b00:8347:f260:7456:7662])
	by smtp.orange.fr with ESMTPA
	id 3HMKvJ9CpRDxU3HMLva9cN; Mon, 29 Sep 2025 19:08:24 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1759165704;
	bh=kJGRqpJZkIal+gGscJLEHAMjOouNW+OSpndYHgpFbIw=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=bCrvVsO+YOHYJsk0DR2jjG52KybN+edfpjfc04RagctsdXL7I6nIkW2p+5IWn+So1
	 uP9Rr/WAKQB2ASYI9zw5UrR7rQBzjvs2WK3mtQYA5nd4PS5ejVhziRcG40BAxgAiaA
	 95TaxalIpplBMWUtFvEfEzzvNuo+w/J28AbDwKfcyELZ7nkHbyk39nLGhASAZqfMIK
	 NqImlTY7uNHNOfnTUgtUgmQa79iaAL5Xi83ax7nCGr6SgojJg7t3N96j7MJXzvxZ93
	 bmNfD4qz4nm7oaQ85MxqyDrziJXEO5UtU2d8nApVzXT4Yv9bqlAFk09LhiRaxezDeQ
	 WzU3yLLkiyJwg==
X-ME-Helo: [IPV6:2a01:cb10:785:b00:8347:f260:7456:7662]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Mon, 29 Sep 2025 19:08:24 +0200
X-ME-IP: 2a01:cb10:785:b00:8347:f260:7456:7662
Message-ID: <a17f9051-9676-4ab0-a69f-75aa2575b933@wanadoo.fr>
Date: Mon, 29 Sep 2025 19:08:20 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v5 3/4] net: renesas: rswitch: add offloading for
 L2 switching
To: Michael Dege <michael.dege@renesas.com>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 Paul Barker <paul@pbarker.dev>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Nikita Yushchenko <nikita.yoush@cogentembedded.com>
References: <20250901-add_l2_switching-v5-0-5f13e46860d5@renesas.com>
 <20250901-add_l2_switching-v5-3-5f13e46860d5@renesas.com>
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Content-Language: en-US, fr-FR
In-Reply-To: <20250901-add_l2_switching-v5-3-5f13e46860d5@renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 01/09/2025 à 06:58, Michael Dege a écrit :
> Add hardware offloading for L2 switching on R-Car S4.
> 
> On S4 brdev is limited to one per-device (not per port). Reasoning
> is that hw L2 forwarding support lacks any sort of source port based
> filtering, which makes it unusable to offload more than one bridge
> device. Either you allow hardware to forward destination MAC to a
> port, or you have to send it to CPU. You can't make it forward only
> if src and dst ports are in the same brdev.
> 
> Signed-off-by: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
> Signed-off-by: Michael Dege <michael.dege@renesas.com>

...

> @@ -2153,6 +2210,8 @@ static int renesas_eth_sw_probe(struct platform_device *pdev)
>   	if (!priv->gwca.queues)
>   		return -ENOMEM;
>   
> +	INIT_LIST_HEAD(&priv->port_list);
> +
>   	pm_runtime_enable(&pdev->dev);
>   	pm_runtime_get_sync(&pdev->dev);
>   
> @@ -2163,6 +2222,15 @@ static int renesas_eth_sw_probe(struct platform_device *pdev)
>   		return ret;
>   	}
>   
> +	if (list_empty(&priv->port_list))
> +		dev_warn(&pdev->dev, "could not initialize any ports\n");
> +
> +	ret = rswitch_register_notifiers();
> +	if (ret) {
> +		dev_err(&pdev->dev, "could not register notifiers\n");
> +		return ret;
> +	}

The error handling of the probe should be updated, as done in the remove 
function.

net-next is closed, so I'm just posting here

CJ

> +
>   	device_set_wakeup_capable(&pdev->dev, 1);
>   
>   	return ret;
> @@ -2196,6 +2264,7 @@ static void renesas_eth_sw_remove(struct platform_device *pdev)
>   {
>   	struct rswitch_private *priv = platform_get_drvdata(pdev);
>   
> +	rswitch_unregister_notifiers();
>   	rswitch_deinit(priv);
>   
>   	pm_runtime_put(&pdev->dev);
> 


The proposed fix would be:

diff --git a/drivers/net/ethernet/renesas/rswitch_main.c 
b/drivers/net/ethernet/renesas/rswitch_main.c
index 8d8acc2124b8..0f17c2e12cea 100644
--- a/drivers/net/ethernet/renesas/rswitch_main.c
+++ b/drivers/net/ethernet/renesas/rswitch_main.c
@@ -2213,11 +2213,8 @@ static int renesas_eth_sw_probe(struct 
platform_device *pdev)
         pm_runtime_get_sync(&pdev->dev);

         ret = rswitch_init(priv);
-       if (ret < 0) {
-               pm_runtime_put(&pdev->dev);
-               pm_runtime_disable(&pdev->dev);
-               return ret;
-       }
+       if (ret < 0)
+               goto err_disable_pm_runtime;

         if (list_empty(&priv->port_list))
                 dev_warn(&pdev->dev, "could not initialize any ports\n");
@@ -2225,11 +2222,19 @@ static int renesas_eth_sw_probe(struct 
platform_device *pdev)
         ret = rswitch_register_notifiers();
         if (ret) {
                 dev_err(&pdev->dev, "could not register notifiers\n");
-               return ret;
+               goto err_deinit_rswitch;
         }

         device_set_wakeup_capable(&pdev->dev, 1);

+       return 0;
+
+err_deinit_rswitch:
+       rswitch_deinit(priv);
+err_disable_pm_runtime:
+       pm_runtime_put(&pdev->dev);
+       pm_runtime_disable(&pdev->dev);
+
         return ret;
  }





