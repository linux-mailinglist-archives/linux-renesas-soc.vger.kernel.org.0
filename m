Return-Path: <linux-renesas-soc+bounces-318-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A80D37FB56B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Nov 2023 10:17:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4848CB213BD
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Nov 2023 09:17:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 617AD3DBA6;
	Tue, 28 Nov 2023 09:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QStgAznL"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 746F5E1;
	Tue, 28 Nov 2023 01:17:00 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-50bb83d9e17so791846e87.0;
        Tue, 28 Nov 2023 01:17:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701163018; x=1701767818; darn=vger.kernel.org;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KuVLms5BWA9Q8drtT5YNvH/NrAcRxGd6vrSVCMoHoQs=;
        b=QStgAznLt/p24+n/D4ikPTJDLagV1HgLRBwZjw8nGaWQI/kP2Np0QpTxXhDGX/HeoY
         A/x2QwHjbEmtuvl0RRbRA7cXWKacdW03ncoDQCWfWBWRBhv9g7QKiRDA9WXm5qF3bVAr
         rbK45omBODJM4b8gfHVBiHrGn8sTw00zMIRIRtfJ101mCrLgv2ZDbOZymlH2QprnFrzb
         o6MOj1GWuoBrvgj9nA7/IAYH3wTcmAva50XdFKAl6fkhESkB7Y+zabp23gncB8uCEIjx
         TBoq1x6FAWpKRHdb3vPetD6FX+3dbQHZyhtQ4PUEKuQq36WfvuhYAgwrfqw2A7Czkzt5
         VyfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701163018; x=1701767818;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KuVLms5BWA9Q8drtT5YNvH/NrAcRxGd6vrSVCMoHoQs=;
        b=Oe3Yc0mEsgpF8FEiCzJw1XApJvicKdX+Fp41nrKhLc7OTzv13i4V6Z+i2QuoWanNlI
         5aDhZ2xNYlbX5q+hlRnTO2ZKFTMGe+bs+kG88I752OhUGTEf1HHuDGByfYWGUWotEd7n
         bk/oVPdnpnzBCLSSUkLIMt46j8Qq/KAVqdpPb5wusqVlTnAvfmYHgDiAtbPu2tBGbXzR
         p5HCYzuGjCbonEtgNtNbpP0CTej1koqkncCBhtqtAXbw4rpezexXi2lZ+5Ovg8Zwyce8
         31C2kzcs6ODIKiqAEeDpA7R/IPelfnSuEAooj2vxZ/LqwH7nLG/FMo7A7HabZmSukdmb
         UuNQ==
X-Gm-Message-State: AOJu0Yzm8znlKiOGclyJUFqYsyyswqUtQCED1eW9RdZjBcQA60FBG7It
	8y/c63Gel3si5h9SydvSuqF4ZAedAG0=
X-Google-Smtp-Source: AGHT+IGVzoTN/BfYeY1Syu5a6jrpj7Wy0oziLOX4g1frZ2SZAw3OlWZZ/Fa3cqu/7/rNs6Cmh5Tvgw==
X-Received: by 2002:a2e:2245:0:b0:2c9:9fbf:52b1 with SMTP id i66-20020a2e2245000000b002c99fbf52b1mr4771502lji.13.1701163018251;
        Tue, 28 Nov 2023 01:16:58 -0800 (PST)
Received: from [192.168.1.103] ([178.176.72.137])
        by smtp.gmail.com with ESMTPSA id b1-20020a05651c032100b002bfff335ca1sm1654829ljp.79.2023.11.28.01.16.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Nov 2023 01:16:57 -0800 (PST)
Subject: Re: [PATCH net-next 8/9] net: rswitch: Add jumbo frames handling for
 TX
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, s.shtylyov@omp.ru,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com
Cc: netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20231127115334.3670790-1-yoshihiro.shimoda.uh@renesas.com>
 <20231127115334.3670790-9-yoshihiro.shimoda.uh@renesas.com>
From: Sergei Shtylyov <sergei.shtylyov@gmail.com>
Message-ID: <3bd98e56-825a-79fa-06f5-3f90c86809d7@gmail.com>
Date: Tue, 28 Nov 2023 12:16:56 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20231127115334.3670790-9-yoshihiro.shimoda.uh@renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 11/27/23 2:53 PM, Yoshihiro Shimoda wrote:

> If the driver would like to transmit a jumbo frame like 2KiB or more,
> it should be split into multiple queues. In near the future, to support

   In the near future, you mean (again)?

> this, add handling specific descriptor types F{START,MID,END}. However,
> such jumbo frames will not happen yet because the maximum MTU size is
> still default for now.
> 
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
[...]

MBR, Sergey

