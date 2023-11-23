Return-Path: <linux-renesas-soc+bounces-190-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 451E47F64CF
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Nov 2023 18:05:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 686661C20BF3
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Nov 2023 17:05:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCE9A3FE23;
	Thu, 23 Nov 2023 17:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="fnX5unyR"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6B8FF9
	for <linux-renesas-soc@vger.kernel.org>; Thu, 23 Nov 2023 09:04:53 -0800 (PST)
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-a02d91ab195so150983466b.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 23 Nov 2023 09:04:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1700759092; x=1701363892; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eqejf/8g/1UymUmp63cNoo7ymRWx93MtQ8xvwVTsC8U=;
        b=fnX5unyRY7YnzrzEl+OKEQI0UWOal5e0FHRmIE7s6ikYhoaWDIvKJ6fu35672ggI8b
         D4iqTl6naeoXkSTpZwV11FJ3FauJt1VL0+a6uqDsZHbLLUqQnUIto7XFLrIWSvdH0jAf
         3+ErtI9+tgewsQDVHcD0qn68hyYAtr+rgFXnpMSElwxaqyss1I87ElyFp5lGxoHZltSW
         z67K7h1h/d5kdbgvmuIS9WEbH9M3C9gTDus1TO8QsI43hoV4s5ZcRK6MqoUtY9zKjPyg
         HVpVa0htLj2uruf4PsqplOLiNYLHJiyXsTAKdWqhuTfRfi4ODkeEzy190wM+ReeSmKo1
         uAWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700759092; x=1701363892;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eqejf/8g/1UymUmp63cNoo7ymRWx93MtQ8xvwVTsC8U=;
        b=Hn+2f5dKXJOHsf5R9pvvg+HBaHsa2HnxMafk+LG4dqGvEtWXzU/C+TuIsnwY4xsTwi
         uH6MEUv7IP5qjtuXDLo26sPpYotW5D70URXUbfT22shLqhsnOtAO8N5b+Z4tshNd47+K
         154j+CRSU8qdOVv7TvaKzMhnNL/fKtFl6KeFUVaSK4hNGQtHuDYzZHPVku0pd99WbyvE
         1q5WKn+N/+faawOWRmahe9S+pQej8fyufV3KTJUVj/7LtMU6H4UrgAJmYpCxOSJwUXtI
         W6JYjeSLwD6TBkhNwQXcBXB1q4ZHQvtLOPm4xBpkk2qElY5Qlr+YPEJkYjB+LYXEoXp5
         blsQ==
X-Gm-Message-State: AOJu0YwjKEffO0teK7laNJf+/zA28ZnnmGXrPxkDrb5bow+yL0TaiAoI
	gISoHd09HnYhMUsO0+IJ4TlNNg==
X-Google-Smtp-Source: AGHT+IHbKuSKARM67Dqrpv7ph887vYzBlKWN02OUDy++1mK8fYrfTLAh8DVzdAoWu4pNZT/7kQNOvA==
X-Received: by 2002:a17:906:bc57:b0:a03:1bf0:2b92 with SMTP id s23-20020a170906bc5700b00a031bf02b92mr4452576ejv.41.1700759092080;
        Thu, 23 Nov 2023 09:04:52 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.3])
        by smtp.gmail.com with ESMTPSA id rv4-20020a17090710c400b00a047ef6f2c6sm1005797ejb.135.2023.11.23.09.04.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Nov 2023 09:04:51 -0800 (PST)
Message-ID: <b3456a4d-336c-434d-9fd5-4c87582443cb@tuxon.dev>
Date: Thu, 23 Nov 2023 19:04:49 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/13] net: ravb: Add runtime PM support
Content-Language: en-US
To: Sergey Shtylyov <s.shtylyov@omp.ru>, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 p.zabel@pengutronix.de, yoshihiro.shimoda.uh@renesas.com,
 geert+renesas@glider.be, wsa+renesas@sang-engineering.com,
 biju.das.jz@bp.renesas.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
 sergei.shtylyov@cogentembedded.com, mitsuhiro.kimura.kc@renesas.com,
 masaru.nagai.vx@renesas.com
Cc: netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20231120084606.4083194-1-claudiu.beznea.uj@bp.renesas.com>
 <20231120084606.4083194-14-claudiu.beznea.uj@bp.renesas.com>
 <04cb07fe-cccc-774a-f14d-763ce7ae7b07@omp.ru>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <04cb07fe-cccc-774a-f14d-763ce7ae7b07@omp.ru>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 22.11.2023 18:25, Sergey Shtylyov wrote:
> On 11/20/23 11:46 AM, Claudiu wrote:
> 
>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> 
>> RZ/G3S supports enabling/disabling clocks for its modules (including
>> Ethernet module). For this commit adds runtime PM support which
>> relies on PM domain to enable/disable Ethernet clocks.
> 
>    That's not exactly something new in RZ/G3S. The ravb driver has unconditional
> RPM calls already in the probe() and remove() methods... 
> And the sh_eth driver
> has RPM support since 2009...
> 
>> At the end of probe ravb_pm_runtime_put() is called which will turn
> 
>    I'd suggest a shorter name, like ravb_rpm_put() but (looking at this function)
> it doesn't seem hardly needed...
> 
>> off the Ethernet clocks (if no other request arrives at the driver).
>> After that if the interface is brought up (though ravb_open()) then
>> the clocks remain enabled until interface is brought down (operation
>> done though ravb_close()).
>>
>> If any request arrives to the driver while the interface is down the
>> clocks are enabled to serve the request and then disabled.
>>
>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>> ---
>>  drivers/net/ethernet/renesas/ravb.h      |  1 +
>>  drivers/net/ethernet/renesas/ravb_main.c | 99 ++++++++++++++++++++++--
>>  2 files changed, 93 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/net/ethernet/renesas/ravb.h b/drivers/net/ethernet/renesas/ravb.h
>> index c2d8d890031f..50f358472aab 100644
>> --- a/drivers/net/ethernet/renesas/ravb.h
>> +++ b/drivers/net/ethernet/renesas/ravb.h
>> @@ -1044,6 +1044,7 @@ struct ravb_hw_info {
>>  	unsigned magic_pkt:1;		/* E-MAC supports magic packet detection */
>>  	unsigned half_duplex:1;		/* E-MAC supports half duplex mode */
>>  	unsigned refclk_in_pd:1;	/* Reference clock is part of a power domain. */
>> +	unsigned rpm:1;			/* Runtime PM available. */
> 
>    No, I don't think this flag makes any sense. We should support RPM
> unconditionally...

The reasons I've limited only to RZ/G3S are:
1/ I don't have all the platforms to test it
2/ on G1H this doesn't work. I tried to debugged it but I don't have a
   platform at hand, only remotely, and is hardly to debug once the
   ethernet fails to work: probe is working(), open is executed, PHY is
   initialized and then TX/RX is not working... don't know why ATM.

> 
> [...]
>> diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
>> index f4634ac0c972..d70ed7e5f7f6 100644
>> --- a/drivers/net/ethernet/renesas/ravb_main.c
>> +++ b/drivers/net/ethernet/renesas/ravb_main.c
>> @@ -145,12 +145,41 @@ static void ravb_read_mac_address(struct device_node *np,
> [...]
>> +static void ravb_pm_runtime_put(struct ravb_private *priv)
>> +{
>> +	const struct ravb_hw_info *info = priv->info;
>> +	struct device *dev = &priv->pdev->dev;
>> +
>> +	if (!info->rpm)
>> +		return;
>> +
>> +	pm_runtime_mark_last_busy(dev);
> 
>    Not very familiar with RPM... what's this for?

It timestamps the last time the device has been used and then after
autosuspend delay ms passes starting from this timestamp RPM core suspends
the device. It's useful if there are consecutive requests to driver to
avoid actually doing hardware changes for each RPM get/put.

> 
>> +	pm_runtime_put_autosuspend(dev);
> 
>    Why not the usual pm_runtime_put()?

For the same reason explained above.

> 
>> +}
>> +
>>  static void ravb_mdio_ctrl(struct mdiobb_ctrl *ctrl, u32 mask, int set)
>>  {
>>  	struct ravb_private *priv = container_of(ctrl, struct ravb_private,
>>  						 mdiobb);
>> +	int ret;
>> +
>> +	ret = ravb_pm_runtime_get(priv);
>> +	if (ret < 0)
>> +		return;
>>  
>>  	ravb_modify(priv->ndev, PIR, mask, set ? mask : 0);
>> +
>> +	ravb_pm_runtime_put(priv);
> 
>    Hmm, does this even work? :-/ Do the MDIO bits retain the values while
> the AVB core is not clocked or even powered down?

This actually is not needed. It's a leftover. I double checked with
mii-tools to access the device while the interface is down and the IOCTL is
blocked in this case by
https://elixir.bootlin.com/linux/latest/source/drivers/net/ethernet/renesas/ravb_main.c#L2266

>    Note that the sh_eth driver has RPM calls in the {read|write}_c{22?45}()
> methods which do the full register read/write while the core is powere up
> and clocked...
> 
> [...]
>> @@ -2064,6 +2107,11 @@ static struct net_device_stats *ravb_get_stats(struct net_device *ndev)
>>  	struct ravb_private *priv = netdev_priv(ndev);
>>  	const struct ravb_hw_info *info = priv->info;
>>  	struct net_device_stats *nstats, *stats0, *stats1;
>> +	int ret;
>> +
>> +	ret = ravb_pm_runtime_get(priv);
>> +	if (ret < 0)
>> +		return NULL;
> 
>    Hm, sh_eth.c doesn't have any RPM calls in this method. Again, do

In setups where systemd is enabled, user space calls this method in
different stages (e.g. at boot time or when running ifconfig ethX, even if
interface is down). W/o runtime resuming here the system will fail to boot.

The other approach I wanted to take was to:

if (!netif_running(dev))
	return &ndev->stats;

But I didn't choose this path as there are some counters updated to nstat
only in this function, e.g. nstats->tx_dropped += ravb_read(ndev, TROCR);
and wanted an opinion about it.


> the hardware counters remain valid across powering the MAC core down?

The power domain that the Ethernet clocks of RZ/G3S belong disables the
clock and switches the Ethernet module to standby. There is no information
in HW manual that the content of registers will be lost.

> 
> [...]
>> @@ -2115,11 +2165,18 @@ static void ravb_set_rx_mode(struct net_device *ndev)
>>  {
>>  	struct ravb_private *priv = netdev_priv(ndev);
>>  	unsigned long flags;
>> +	int ret;
>> +
>> +	ret = ravb_pm_runtime_get(priv);
>> +	if (ret < 0)
>> +		return;
> 
>    Hm, sh_eth.c doesn't have any RPM calls in this method either.
> Does changing the promiscous mode have sense for an offlined interface?

I've added it for scenarios when the interface is down and user tries to
configure it. I don't know to answer your question. W/o RPM resume here
user space blocks if tries to access it and interface is down. I can just
return if interface is down. Let me know if you prefer this way.

> 
> [...]
>> @@ -2187,6 +2244,11 @@ static int ravb_close(struct net_device *ndev)
>>  	if (info->nc_queues)
>>  		ravb_ring_free(ndev, RAVB_NC);
>>  
>> +	/* Note that if RPM is enabled on plaforms with ccc_gac=1 this needs to be
> 
>    It's "platforms". :-)
> 
>> skipped and
> 
>    Overly long line?

Not more than 100 chars. Do you want it to 80?

> 
>> +	 * added to suspend function after PTP is stopped.
> 
>    I guess we'll have to do that because RPM is actually not RZ/G3
> specific...

yes

> 
>> +	 */
>> +	ravb_pm_runtime_put(priv);
>> +
>>  	return 0;
>>  }
>>  
>> @@ -2636,6 +2699,12 @@ static int ravb_probe(struct platform_device *pdev)
>>  	if (error)
>>  		return error;
>>  
>> +	info = of_device_get_match_data(&pdev->dev);
>> +
>> +	if (info->rpm) {
>> +		pm_runtime_set_autosuspend_delay(&pdev->dev, 100);
> 
>    Why exactly 100 ms?

I noticed Ethernet drivers using this functionality are using this default
value. It can be anyway changed though sysfs.

> 
>> +		pm_runtime_use_autosuspend(&pdev->dev);
>> +	}
> 
>    Before calling pm_runtime_enable()?

Drivers that I know and checked sets autosuspend before enabling RPM. Code
seems written to allow both scenarios but I think it's better to have
everything setup before enabling RPM.

> 
>>  	pm_runtime_enable(&pdev->dev);
> [...]
>> @@ -2880,6 +2950,8 @@ static int ravb_probe(struct platform_device *pdev)
>>  	pm_runtime_put(&pdev->dev);
>>  pm_runtime_disable:
>>  	pm_runtime_disable(&pdev->dev);
>> +	if (info->rpm)
>> +		pm_runtime_dont_use_autosuspend(&pdev->dev);
> 
>    After calling pm_runtime_disable()?

Based on the above explanation and the fact that I would like to keep the
calls here in reverse order I prefer to have it in this way.

> 
> [...]
>> @@ -2908,6 +2985,8 @@ static void ravb_remove(struct platform_device *pdev)
>>  			  priv->desc_bat_dma);
>>  	pm_runtime_put_sync(&pdev->dev);
>>  	pm_runtime_disable(&pdev->dev);
>> +	if (info->rpm)
>> +		pm_runtime_dont_use_autosuspend(&pdev->dev);
> 
>    After calling pm_runtime_disable()?

Ditto.

> 
> [...]
> 
> MBR, Sergey

