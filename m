Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1D67C1A5DC5
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 12 Apr 2020 11:30:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726876AbgDLJaX (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 12 Apr 2020 05:30:23 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:37828 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726043AbgDLJaW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 12 Apr 2020 05:30:22 -0400
Received: by mail-lf1-f68.google.com with SMTP id t11so4393693lfe.4
        for <linux-renesas-soc@vger.kernel.org>; Sun, 12 Apr 2020 02:30:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=wvZjieRj4qaMs+6TZihVR3SxRNAcxfJpdpQbrdTQclA=;
        b=sCoCfMu0RCkeRdSj17DdbWeFKZD3rHgAuAb8cNCMqPqeUuaWB8wGLbnhQr1BYWTXoi
         upzKaP2DiqcCZOw7Yimp3sz52v7DeyzftOwUBxRkfd2qok0nXYnqVZjH0b47y+kRLZ8C
         xAIHMfCHjom4BynzVP1HKozH8iBRDWBFIPs/KK+dGDWQ6fNYNI++9uF4CoCi6/FYx7za
         DifRQVk5Gsuj8f/M+4L6sAQKwiKR1rGWqx3KLO7Yb6/HrShMNEjgLgL9gnO48L2IioUN
         ijdYlnim6ISiftXFTlzkJWTFmng/tJdrqujwye1v5YnXFFar2lk7nPJu3p/ULW2r+zps
         fdNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=wvZjieRj4qaMs+6TZihVR3SxRNAcxfJpdpQbrdTQclA=;
        b=HL7I3FbFbVu0Q2UIHDqHkkuTymFwMcgnTwnw/rST80mAxfZ++a7FFMcvSWSRNnZlGu
         aZbiIA/v22droR8xzXYrX+2o7v0pfZbLiVQmFDXgWp94jvjXxByLuLCcRTYdEuzDTJk+
         NjkQ2t5FQOUCbyqXJLiYoRWctlUDG7hj7psx4NUHr7e91pvYAR0mpC4w82pshs3BS2RC
         j/bDtd1r4Twi3qmW1wQWM5tbw6H4XAvc9Bjgo88fdV6hl0zNXeMomkZgmzK5yLItbvGM
         xgOcsQlsutelFrvUAOwqHj6m2fT4oVv2AYuiWRicHoAImd/nM+jBJbTUxkS76k7eNtrG
         JhpA==
X-Gm-Message-State: AGi0PuZFUQExMZalCTrEU0qtU4R0dg2NskZmm6ilXpGz5EBsCsUOK0Rp
        b/u8CN2V3MTp8ZuvxoEjNUfN5aKhDoWXVw==
X-Google-Smtp-Source: APiQypIiCKyDOWmQveSF/1l/II8M/C9LZdjb3kLvTVumC4zxn5XVOZ2W4iOLnw80Mn52Yek+rtsWuA==
X-Received: by 2002:a19:d3:: with SMTP id 202mr7255970lfa.24.1586683820655;
        Sun, 12 Apr 2020 02:30:20 -0700 (PDT)
Received: from ?IPv6:2a00:1fa0:4648:ec80:e5e4:a4d:fae6:7d12? ([2a00:1fa0:4648:ec80:e5e4:a4d:fae6:7d12])
        by smtp.gmail.com with ESMTPSA id b2sm1131469lfi.14.2020.04.12.02.30.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Apr 2020 02:30:20 -0700 (PDT)
Subject: Re: [PATCH AUTOSEL 5.6 056/149] sh_eth: check
 sh_eth_cpu_data::no_xdfar when dumping registers
To:     Sasha Levin <sashal@kernel.org>, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
Cc:     Chris Brandt <chris.brandt@renesas.com>,
        "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
References: <20200411230347.22371-1-sashal@kernel.org>
 <20200411230347.22371-56-sashal@kernel.org>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <6416ffc7-84a0-0383-aeda-93b4cb80c800@cogentembedded.com>
Date:   Sun, 12 Apr 2020 12:30:17 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200411230347.22371-56-sashal@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello!

On 12.04.2020 2:02, Sasha Levin wrote:

> From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> 
> [ Upstream commit 7bf47f609f7eaac4f7e9c407a85ad78997288a38 ]
> 
> When adding the sh_eth_cpu_data::no_xdfar flag I forgot to add the flag
> check to  __sh_eth_get_regs(), causing the non-existing RDFAR/TDFAR to be
> considered for dumping on the R-Car gen1/2 SoCs (the register offset check
> has the final say here)...
> 
> Fixes: 4c1d45850d5 ("sh_eth: add sh_eth_cpu_data::cexcr flag")

    Oops, wrong commit here, should've been:

Fixes: 6e80e55bd37a ("sh_eth: add sh_eth_cpu_data::no_xdfar flag")

Luckily, both commits appeared in the same version, 4.17. :-)

> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> Tested-by: Chris Brandt <chris.brandt@renesas.com>
> Signed-off-by: David S. Miller <davem@davemloft.net>
> Signed-off-by: Sasha Levin <sashal@kernel.org>
[...]

MBR, Sergei
