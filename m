Return-Path: <linux-renesas-soc+bounces-1163-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DD1D815F8B
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 17 Dec 2023 15:02:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 33F671C21C58
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 17 Dec 2023 14:02:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 705F84439E;
	Sun, 17 Dec 2023 14:02:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="ncwth7ij"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB9974438A
	for <linux-renesas-soc@vger.kernel.org>; Sun, 17 Dec 2023 14:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-33662fdd133so468609f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Sun, 17 Dec 2023 06:02:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1702821733; x=1703426533; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UiEY1i9smy4B6PTxaNChazMQdojWBvHradNKGRULQg8=;
        b=ncwth7ij+8niY5Q3LCdP/Gc4swNcM2Dflq3GHAi/NhpsI60tCZfj0AT1cAPwGFvlJn
         JDtNNoywGMKk+WGc3eKm059lZxrzHmWPBLiIyVs+nREPBA4t0j5tWVxYTyNdUvLwxFCh
         D/SaxNu9j8i4M4ZKKoTOntwbfZXQI4+V8ZnKGC89d92UY8KkT3m4PvQJJAZmd216G+/R
         s3GNJc7TRhKJgE5VgfCqZdwMxOOMN2GUiSCinEgk7gbYZCeIab2l1BhKubBJZmRVDR7s
         6wkMD1SvX7ehgwK8DnTXcTEqswPb0iB0gjpCiDTMgADnuiCUa8FpwUOrCewGEiG4oLKG
         WWFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702821733; x=1703426533;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UiEY1i9smy4B6PTxaNChazMQdojWBvHradNKGRULQg8=;
        b=LVqcYow9BGJTna2+jp5zJwc5T4yyJxDCjB0MTYZ5nnXkvwmZWCKAort3EoT/21asVF
         16iO4rIEpEjuHCQAmak+XG2Nj3zpb9QcL6yMyrEB4tczIXSlaO1cS7gLghAFielO1Cbj
         fnK2L2tmR6xpkBAfyCnJh9dYxiJmdZpp7jos2HQZ11rWWJ27+KCaCugLl6MK0PDblCsV
         7Vsa0Y4hiLuEiKk4QT0eqiqXW9ea/7iZHERqgYUwwEsTHs9hABfhy7Wxm+c7RbwXPvJ+
         /fb0JF6pKAVKeQQtlffDMgAuMgl+TeiK5vXbROl0J4LsUxCJqOkWWsnjHVqvgdqHotOU
         g5dA==
X-Gm-Message-State: AOJu0Yx1r7/kat42Foi+0B9Y7EbrQ8CVHkyybdiRB1bGnAAq0iw3qBAB
	FNiBAI3ZiJUiFS64JksG6z2mKg==
X-Google-Smtp-Source: AGHT+IF1HC51Hg9u+J0pL/TDAO1i6huHAbjqLRA2HJt4hbu/M0toINioj8o1xavZm1Yv3+cYXyPCxg==
X-Received: by 2002:a5d:6acd:0:b0:336:41aa:7d8b with SMTP id u13-20020a5d6acd000000b0033641aa7d8bmr2618377wrw.109.1702821733063;
        Sun, 17 Dec 2023 06:02:13 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.103])
        by smtp.gmail.com with ESMTPSA id u10-20020a5d434a000000b0033342338a24sm24323215wrr.6.2023.12.17.06.02.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 17 Dec 2023 06:02:12 -0800 (PST)
Message-ID: <b7a3f560-d3ec-4f0b-9d34-02717f3e29ae@tuxon.dev>
Date: Sun, 17 Dec 2023 16:02:10 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 19/21] net: ravb: Do not set promiscuous mode
 if the interface is down
Content-Language: en-US
To: Sergey Shtylyov <s.shtylyov@omp.ru>, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 richardcochran@gmail.com, p.zabel@pengutronix.de,
 yoshihiro.shimoda.uh@renesas.com, wsa+renesas@sang-engineering.com,
 geert+renesas@glider.be
Cc: netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20231214114600.2451162-1-claudiu.beznea.uj@bp.renesas.com>
 <20231214114600.2451162-20-claudiu.beznea.uj@bp.renesas.com>
 <69a80458-b607-2cee-e8b1-38eb8d56eca3@omp.ru>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <69a80458-b607-2cee-e8b1-38eb8d56eca3@omp.ru>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 16.12.2023 22:16, Sergey Shtylyov wrote:
> On 12/14/23 2:45 PM, Claudiu wrote:
> 
>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> Do not allow setting promiscuous mode if the interface is down. In case
>> runtime PM is enabled, and while interface is down, the IP will be in reset
>> mode (as for some platforms disabling/enabling the clocks will switch the
>> IP to standby mode which will lead to losing registers' content).
> 
>    Register.
>    Have this issue actually occurred for you?
> 
>> Commit prepares for the addition of runtime PM.
>>
>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> [...]
> 
>> diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
>> index 1995cf7ff084..633346b6cd7c 100644
>> --- a/drivers/net/ethernet/renesas/ravb_main.c
>> +++ b/drivers/net/ethernet/renesas/ravb_main.c
>> @@ -2164,6 +2164,9 @@ static void ravb_set_rx_mode(struct net_device *ndev)
>>  	struct ravb_private *priv = netdev_priv(ndev);
>>  	unsigned long flags;
>>  
>> +	if (!netif_running(ndev))
> 
>    Seems racy as well...

It is also called with rtnl_mutex locked at least though __dev_change_flags().

> 
>> +		return;
> 
>    Hm, sh_eth.c doesn't have such check -- perhaps should be fixed
> as well...
> 
> [...]
> 
> MBR, Sergey

