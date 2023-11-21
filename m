Return-Path: <linux-renesas-soc+bounces-12-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FFD87F2594
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Nov 2023 07:00:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 71FAA1C218B0
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Nov 2023 06:00:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D2711A5A7;
	Tue, 21 Nov 2023 06:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="YQ5BbQEy"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FDF7E7
	for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Nov 2023 21:59:57 -0800 (PST)
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-a0039ea30e0so168625166b.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Nov 2023 21:59:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1700546395; x=1701151195; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0nTCzjxHp//sooNwCtarftLG+pat2FAqXZlC2XWtJQA=;
        b=YQ5BbQEygTDEAAqt8gqHhaP0XOc5VuN+JX47Bu0g6V7T+3ueAL27xBmNQ1mA9QIt8W
         XrdsfnxnS5ggukDm3RBgdhlHezBGcItLGOBg6/zD6513Y5byhP7aPhUOcH0dhb/Usx0G
         EvHwkjkXrPiwfIGf5fCkqMyxIMsX8WzCuJ/Myx/17vLPuS5B2S0lbNFNS/QJlvTjOU9+
         AHgy2yp6XT2csVkQYob/FL0D0j+utO8wkwbonrxYTvnbqmxo6ECIYd9vQSuvOGU8Labk
         YEaqlZiFhEd/U2lb/Qwzeq3MsP0Zl1yMJT06TIRhqO40N9Sk9Byje2AnsRv5sZ1hkbLH
         Rh+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700546395; x=1701151195;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0nTCzjxHp//sooNwCtarftLG+pat2FAqXZlC2XWtJQA=;
        b=c+dtV3RBHeHXwLSbgP1+dMSKs+3prwIyZgyfNkAAa8I1/02FNA4yRjlusFxvt1rsQ+
         HxPmmIml///nIKInDnY6yYCyAqzFmWx6g26B7X5EKTZjUelODtmxn5JY79VQomxeadAR
         LE3krBGsH7tgVnejNEhsa1zPWVKa5npYgD+EVtS3lguKW00VlinTKFzZXNx9qAwRx4C8
         digh5Th62PIZzni2MgCNbW7S33MbTfPReDk2sSZ5PN9VvQamBPYad3CJwcC5UNXooB6E
         u9oemFvOkDEhVQjh0TLURDhR3KdskfX0iqn9MUTpna0182wXo2/1jN0/1fh9BAZo1SsL
         GkiQ==
X-Gm-Message-State: AOJu0YzNFJyQotYZcx3QkM/l4qAjuopQ+HkiQS3ywM4QJ09qBk0IwoiP
	l5oA8i3XpPdfjADIMQZ+5VT75g==
X-Google-Smtp-Source: AGHT+IFAEyQW7kPsn7TNdi+eaMRv89fKiODQ+1UVosx0dNnfCjK0Q8BtCqOnvE/mYe8ir0feNDQtgA==
X-Received: by 2002:a17:907:a18d:b0:9e2:8206:2ea9 with SMTP id om13-20020a170907a18d00b009e282062ea9mr5951111ejc.60.1700546395392;
        Mon, 20 Nov 2023 21:59:55 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.3])
        by smtp.gmail.com with ESMTPSA id g24-20020a170906c19800b009a1b857e3a5sm4800689ejz.54.2023.11.20.21.59.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Nov 2023 21:59:55 -0800 (PST)
Message-ID: <12e63ae7-bc25-4790-883a-ee0eaa28317d@tuxon.dev>
Date: Tue, 21 Nov 2023 07:59:52 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/13] net: ravb: Check return value of
 reset_control_deassert()
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
 <20231120084606.4083194-2-claudiu.beznea.uj@bp.renesas.com>
 <2ac71d8d-84d8-2092-70b4-9ed21e78541f@omp.ru>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <2ac71d8d-84d8-2092-70b4-9ed21e78541f@omp.ru>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 20.11.2023 21:03, Sergey Shtylyov wrote:
> On 11/20/23 11:45 AM, Claudiu wrote:
> 
>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> reset_control_deassert() could return an error. Some devices cannot work
>> if reset signal de-assert operation fails. To avoid this check the return
>> code of reset_control_deassert() in ravb_probe() and take proper action.
>>
>> Fixes: 0d13a1a464a0 ("ravb: Add reset support")
>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>> ---
>>  drivers/net/ethernet/renesas/ravb_main.c | 7 ++++++-
>>  1 file changed, 6 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
>> index c70cff80cc99..342978bdbd7e 100644
>> --- a/drivers/net/ethernet/renesas/ravb_main.c
>> +++ b/drivers/net/ethernet/renesas/ravb_main.c
>> @@ -2645,7 +2645,12 @@ static int ravb_probe(struct platform_device *pdev)
>>  	ndev->features = info->net_features;
>>  	ndev->hw_features = info->net_hw_features;
>>  
>> -	reset_control_deassert(rstc);
>> +	error = reset_control_deassert(rstc);
>> +	if (error) {
>> +		free_netdev(ndev);
>> +		return error;
> 
>   No, please use *goto* here. And please fix up the order of statements under
> the out_release label before doing that.

This will lead to a bit more complicated patch, AFAICT. I tried to keep it
simple for a fix. Same thing for patch 2.

> 
> [...]
> 
> MBR, Sergey

