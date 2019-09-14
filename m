Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4218CB2C20
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 14 Sep 2019 18:06:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727089AbfINQGR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 14 Sep 2019 12:06:17 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:33967 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726655AbfINQGR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 14 Sep 2019 12:06:17 -0400
Received: by mail-wr1-f67.google.com with SMTP id a11so25047902wrx.1;
        Sat, 14 Sep 2019 09:06:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:subject:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Fa2EFV1hZz9a/AiipPZCCuOSItuJO4FZtqKzsCDWwAQ=;
        b=jzH8HqJ/E4+gxm6fgz02cZicx/lDPDDUQ4eU27BU5edJUPPXBvmGDzfJjRBuSwpSX/
         +Jx7Zop2orm+OQPpEfQqU5bPAXYx2c/cGBxkaEg/DQHwu8FpTWDVgHRT9A6271B7rHRW
         sGtOxC13zJ2AEijregN5J4r5mkSjp6LU0k0cIeUP03XadT4pYfhhwxqwF++y3w6th3F+
         qpeOGx4qYK/6901DaevjcYnYDuptm/ZThb+F+s7WWJt9j5zjOeky3ITbWYQJgAeQmScK
         dyLdPO/1Dx7UuLwSXjjm1xOHoaxQH6IKl7gfNFIQm76PXeieqICg78XdgzlkgknIacdT
         tZ6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Fa2EFV1hZz9a/AiipPZCCuOSItuJO4FZtqKzsCDWwAQ=;
        b=eyK+8Zd09Z6nUE3ja9Epx0dRuOunpsRtVBIUeCCaCWwDjbnXesCkQ+gcjE1Z7ObWOu
         73tke7hTVC3bbFRbRD3byzu4TYreh2NhLS2wPbr7prqy1s7N90i6JOhVgH6KVHXBudXT
         FMH2GQHQt5vP88umYy6dAJmHp8mnarhQNnu1Rt/avmrrbmYeqFyJd0t1qb/llPkhvgiS
         4WeHOWqvpHZNrYyRsR8bqUASa9MzFnOaHepMcb6Ibobtcr5qppE5gFyzgYG6V9iQluvX
         RvZytoLFfrVPshXk6EhJ5YaRFh3vum/5tl/sA/q+M7ISyYaDXNJjsjvL091JK7N2NUvH
         NVGQ==
X-Gm-Message-State: APjAAAXQ9rn5t79d1xfV4+EEb/m9hu0SOnAcCzLe/J4Pes/kYa7i9h/x
        2lzobMUrODe3aUBKJ3AWTaqc5eyM
X-Google-Smtp-Source: APXvYqyBvBIGv1pNOvSl/9WZIHPgLOXza16KuEBUZcTuNkK0+04fhWHxpEC7UaptojvnTjXS278EmQ==
X-Received: by 2002:adf:dfc5:: with SMTP id q5mr45876970wrn.142.1568477174298;
        Sat, 14 Sep 2019 09:06:14 -0700 (PDT)
Received: from [192.168.1.4] (ip-86-49-35-8.net.upcbroadband.cz. [86.49.35.8])
        by smtp.gmail.com with ESMTPSA id x5sm46294679wrg.69.2019.09.14.09.06.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Sep 2019 09:06:13 -0700 (PDT)
From:   Marek Vasut <marek.vasut@gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: Add /soc dma-ranges
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Wolfram Sang <wsa@the-dreams.de>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
References: <20190907161634.27378-1-marek.vasut@gmail.com>
 <CAMuHMdXVhtE5Jmpu8QYv+P8pGtegr4MGhNGRwy4Y1wRQYmL2_Q@mail.gmail.com>
Message-ID: <f1b11b42-99ee-0484-550e-8758ec6fa559@gmail.com>
Date:   Sat, 14 Sep 2019 17:53:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAMuHMdXVhtE5Jmpu8QYv+P8pGtegr4MGhNGRwy4Y1wRQYmL2_Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 9/9/19 1:18 PM, Geert Uytterhoeven wrote:
> Hi Marek,

Hi,

> On Sat, Sep 7, 2019 at 6:16 PM Marek Vasut wrote:
>>
>> Add dma-ranges property into /soc node to describe the DMA capabilities
>> of the bus. This is currently needed to translate PCI DMA ranges, which
>> are limited to 32bit addresses.
> 
>> --- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
>> +++ b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
>> @@ -330,6 +330,7 @@
>>                 #address-cells = <2>;
>>                 #size-cells = <2>;
>>                 ranges;
>> +               dma-ranges = <0 0x40000000 0 0x40000000 0 0xc0000000>;
> 
> Shouldn't the length be 0x80000000 (for all SoCs)?

Or should that match the amount of DRAM below 32bit boundary ?

> Or should we allow DMA to internal System RAM, too?

I think we should include SRAM, yes.

-- 
Best regards,
Marek Vasut
