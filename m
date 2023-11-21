Return-Path: <linux-renesas-soc+bounces-13-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EBA6E7F2598
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Nov 2023 07:02:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 993B7282A4A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Nov 2023 06:02:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54D651A5AE;
	Tue, 21 Nov 2023 06:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="mFmEZLGu"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0FB6A0
	for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Nov 2023 22:02:38 -0800 (PST)
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-a00a9c6f1e9so139931066b.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Nov 2023 22:02:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1700546557; x=1701151357; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wPi0ei9zIN7cw0UozDtXu7c9EU4Lneb2safJ+jL5Iak=;
        b=mFmEZLGu9ZUfRHeECBNo4Q4+nww7+hcNzdc1+fyqWVSQYBAJ6i5rez82D7kfNHs70G
         T9inqz5fJe1F1SnNWamQSDy9DBj7I/qxX3+xcZq6o71S/FmOQP0HUSJiQkiFpx6s8ypW
         gJcn0EqUIaU7EIQkmgvyW5I0hdlQowZwkzu1WP3Ujjk8bF1AQKnAiRHOjXlFKDefCMH5
         t1sb/dGdpGxcRj/QlRQv8OxGIps8MZr0qnd94bE8AdJfDIY+atVku1caubJaR7KPMxav
         +sqGpU+D03OphRaITFGbOu9NVGadXgsPNx/VBAu/wKuPXELWwyknClHbGXouehTqP+hp
         g6bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700546557; x=1701151357;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wPi0ei9zIN7cw0UozDtXu7c9EU4Lneb2safJ+jL5Iak=;
        b=gJZhgwMUMSQ/1tTS5qWswj5ZRKXoGtU7PXc/tByurOcesu6+WEN6llrd2eCRXHO1Ja
         p6Mpob73f+Zi4fD6szVgQG9QQrvPWNkp6vw8S5bfRDFzAlnOHDgsfD8+QA6vFATOjnti
         Pq8RIGObWYnLuBtQQZpYZNF2TtHG+IktEbf2MmzjzD2BECEVPxeWcjYZoU6GUStS+gp4
         nhtCQvL8FEla14XYwqFM4VgrZN9qE6l2Rj+/7tzHbBKnnvSeXUHzayIb7jfa1SyZ6yWt
         jzmH3pEQDihkAeEa+1Xey5e1q5Pl8gmfyVqS32hFv5ApUiFJ+hczWSe9RlC1mGpBGDJl
         QleA==
X-Gm-Message-State: AOJu0YxOZeobIUIhb1P3LUpuLEQkpx4d6GQeLf/qLpOYtHGL8hD4fFrk
	pLH8OMw1X/A/n/SYd28USURQAA==
X-Google-Smtp-Source: AGHT+IEcokN5bpe9MCOGFGvwjCApmFKGwVt6ycHk073VTF+yo+Ns0lKpuZSUnYha0vTCbGngINjNOQ==
X-Received: by 2002:a17:906:68c5:b0:9fc:3a70:4430 with SMTP id y5-20020a17090668c500b009fc3a704430mr6097006ejr.70.1700546557189;
        Mon, 20 Nov 2023 22:02:37 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.3])
        by smtp.gmail.com with ESMTPSA id h11-20020a170906530b00b009d23e00a90esm4805556ejo.24.2023.11.20.22.02.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Nov 2023 22:02:36 -0800 (PST)
Message-ID: <2545ffad-e970-499e-9192-ff89776e1946@tuxon.dev>
Date: Tue, 21 Nov 2023 08:02:35 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/13] net: ravb: Make write access to CXR35 first before
 accessing other EMAC registers
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
 <20231120084606.4083194-4-claudiu.beznea.uj@bp.renesas.com>
 <c27d5dd1-bcdc-a79e-bf0b-a7e93f5d9545@omp.ru>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <c27d5dd1-bcdc-a79e-bf0b-a7e93f5d9545@omp.ru>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 20.11.2023 21:44, Sergey Shtylyov wrote:
> On 11/20/23 11:45 AM, Claudiu wrote:
> 
>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> Hardware manual of RZ/G3S (and RZ/G2L) specifies the following on the
>> description of CXR35 register (chapter "PHY interface select register
>> (CXR35)"): "After release reset, make write-access to this register before
>> making write-access to other registers (except MDIOMOD). Even if not need
>> to change the value of this register, make write-access to this register
>> at least one time. Because RGMII/MII MODE is recognized by accessing this
>> register".
>>
>> The setup procedure for EMAC module (chapter "Setup procedure" of RZ/G3S,
>> RZ/G2L manuals) specifies the E-MAC.CXR35 register is the first EMAC
>> register that is to be configured.
>>
>> Note [A] from chapter "PHY interface select register (CXR35)" specifies
>> the following:
>> [A] The case which CXR35 SEL_XMII is used for the selection of RGMII/MII
>> in APB Clock 100 MHz.
>> (1) To use RGMII interface, Set ‘H’03E8_0000’ to this register.
>> (2) To use MII interface, Set ‘H’03E8_0002’ to this register.
>>
>> Take into account these indication.
>>
>> Fixes: 1089877ada8d ("ravb: Add RZ/G2L MII interface support")
> 
>    The bug fixes should be submitted separately and against the net.git repo...

OK, thanks for pointing it.

> 
>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> 
> Reviewed-by: Sergey Shtylyov <s.shtylyov@omp.ru>
> 
> [...]
> 
> MBR, Sergey

