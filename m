Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 42686BFA6B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Sep 2019 22:09:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727872AbfIZUJI (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 26 Sep 2019 16:09:08 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:40637 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727826AbfIZUJI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 26 Sep 2019 16:09:08 -0400
Received: by mail-wm1-f66.google.com with SMTP id b24so3851842wmj.5;
        Thu, 26 Sep 2019 13:09:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=YTzDAcw9gbPn+mRJBI6qSPJU/C8hb0B7P6TDypbBA4E=;
        b=CyEMak8EtCE86FpsbhlopviQJNKrauDIJ5jwwsZaxSFuZV38/imJ6QNKg2a3NZg2TO
         dzYBCRQq2HsYSi2sFChJZ481fe133jhT5w39Yp+rz9C44bxS9UxXgJX3Sy6IdUBRkpJ6
         1ucQ3Ga3ht+dFuMpuMXaDHvhervmdpJTga1F69+HD6t0YP2ZwX8klVS1pf41jIvGBy/l
         VFy7uHQA6cQJW0RCqhMdvGqqhf1ElrbC+qQJG1byyIAcOwwt5qAgJXQ9kn4TLQrwwh/9
         E55PeSTiiqPOq3a/po4rZhqH2vjgmnT5c2li1aL/SZ+zqTXsWX0qXybtmzopMv1TxXHK
         M8NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=YTzDAcw9gbPn+mRJBI6qSPJU/C8hb0B7P6TDypbBA4E=;
        b=M+/Qwl2RaZ18mpiqkQLku4FwdAxdnutsT6UzPfwZDzCPQWo4q7UmsutM8JOvxZioqW
         RiOpOckQE4FxoIf3j6HHskaHCWqGS+7i52NPCfTaHu/gwTpRxP7jLz5JLV8two59PzpP
         Oq+j+aaAjntosdI04/3kZjCleSaYC+txnyJ6juU3svjW0VQec63vuCm1Kpqv0fQhBBGe
         IMmWMxJhLmCSrS1LR0+DDPH7rMdRDL3eLDJn6NDmc73X4ktyZP3fK0xlTaJsY+kcKdmO
         /meIK6w9kt9dzrZLDmzSqM1SCrKBqX5s38DYkb3ueXEmleAZb/ATOTwsE7Mz4rSebVpz
         AjHg==
X-Gm-Message-State: APjAAAUQoEMVjZ/hmWbbC7eTvDNaCEMY7vFFqZp9JW16achuNFi5sBiE
        m9AcaMiqGvB7kLpbsiYFYJJeeyxe
X-Google-Smtp-Source: APXvYqxapfwxt9WSMkRC1OxiuZDvCN91dpJLvyhRXECYrNlDR2mH607VSDm8HUYeWzuzng1MvTazIA==
X-Received: by 2002:a1c:7f54:: with SMTP id a81mr4671490wmd.100.1569528545830;
        Thu, 26 Sep 2019 13:09:05 -0700 (PDT)
Received: from [192.168.42.85] (cst-prg-31-94.cust.vodafone.cz. [46.135.31.94])
        by smtp.gmail.com with ESMTPSA id a192sm3650781wma.1.2019.09.26.13.09.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Sep 2019 13:09:04 -0700 (PDT)
Subject: Re: [PATCH] arm64: dts: renesas: Add /soc dma-ranges
To:     Rob Herring <robh@kernel.org>
Cc:     "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Wolfram Sang <wsa@the-dreams.de>, devicetree@vger.kernel.org,
        "open list:MEDIA DRIVERS FOR RENESAS - FCP" 
        <linux-renesas-soc@vger.kernel.org>
References: <20190907161634.27378-1-marek.vasut@gmail.com>
 <CAL_JsqL47dQT-P78j4Ph61fsgA45Ha0AJjDajiMk52yFj++s+g@mail.gmail.com>
 <CAL_JsqK+SwX8Lu+-4UgpLVxL05yTcs8Af9mPVHqzbf6+HF9v3A@mail.gmail.com>
From:   Marek Vasut <marek.vasut@gmail.com>
Message-ID: <92e78919-741c-f709-c9b6-c5fb833f68b1@gmail.com>
Date:   Thu, 26 Sep 2019 22:02:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAL_JsqK+SwX8Lu+-4UgpLVxL05yTcs8Af9mPVHqzbf6+HF9v3A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 9/24/19 12:33 AM, Rob Herring wrote:
> On Fri, Sep 13, 2019 at 10:14 AM Rob Herring <robh@kernel.org> wrote:
>>
>> On Sat, Sep 7, 2019 at 5:16 PM <marek.vasut@gmail.com> wrote:
>>>
>>> From: Marek Vasut <marek.vasut+renesas@gmail.com>
>>>
>>> Add dma-ranges property into /soc node to describe the DMA capabilities
>>> of the bus. This is currently needed to translate PCI DMA ranges, which
>>> are limited to 32bit addresses.
>>
>> FYI, I've started working on this problem and issues around
>> dma-ranges/dma_mask. Hopefully I'll get some patches out next week.
> 
> I've pushed out a branch here:
> 
> git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git dma-masks
> 
> Can you test it on Renesas. I don't have a real platform having the issue.

Due to ER/KR, I can only test it Monday-ish. I hope that's OK ?

-- 
Best regards,
Marek Vasut
