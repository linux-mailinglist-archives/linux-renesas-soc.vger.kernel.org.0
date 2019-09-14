Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 55EF6B2C43
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 14 Sep 2019 18:45:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727580AbfINQpM (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 14 Sep 2019 12:45:12 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:38383 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727496AbfINQpM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 14 Sep 2019 12:45:12 -0400
Received: by mail-wr1-f66.google.com with SMTP id l11so34831813wrx.5;
        Sat, 14 Sep 2019 09:45:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=MuXPCDpMkkALoKXcfqND9O4SRMpZ32Z7jEmYAbDy300=;
        b=aIOl1BJ2hoJzZmxqYVGbythZ3ySD5dJ8y+rJ4Gj0SIb3SQh5jEAVcy7b4IZoQ7ltql
         zspo4shSNQLRqeTqQEDcyFHXvGQCmhXapUCTxr6q5zivU6l5+eT/z2NtvS43Wel3k/Ol
         yoODyhIeuN2d6UqvNyT/XRDTWRkiY6KMzGWXYjdV4MF1gfjwj7RwxFyXYlyEt15tG2V+
         4qcYiHfMFRlm9MlX9wisdR0dYi5EpviSsyaM5klsGNMkQh8f6gShu+Mmljmgmxq+Dd8r
         fgjAZWlK3UfQhwsA/xUl49v4zT9W5gN8xw/FywS10nzskxSXsomOhksIQAfs0f+5mufL
         Zvpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=MuXPCDpMkkALoKXcfqND9O4SRMpZ32Z7jEmYAbDy300=;
        b=lxbdLC+OTgG65Z5SnxHwRVoCxY1rEm0+DzyP61nC7Hph8xs8gIchlXl4MPddLl5GV3
         JIrpPsY63k5Vo207su09/PqsPipgUbvVUsFGhpxru1flyQ2ck4TxJtQ8K4qB3/hy42ih
         UB2FC2Br6vK3wO/ujyrKG82cpYNX2vCDtiurudbpJEKCZluwtmWMKbMtQMTLuitCtjct
         Laqj7sMFR3U6S/+azaMzeOnPGHLRQYqb8xozwCAOBPmq2m3B0qWxi16GsjsAW8USWToa
         qKuHc6a8fiU3JLV5ndHfmUFln/O87HEMKxt2rVTfB6Dmsxzn/QK3lRp6y1cMXJjx8kvE
         lAZw==
X-Gm-Message-State: APjAAAWz9rGoR5SAm39kPrc8onf/2C9QAh8eGSPIIQP5btJUVbDJc7j/
        CRxvBitFiE2oqLWPHhrg1I6VGmYZ
X-Google-Smtp-Source: APXvYqzz2d+VSD5YuU4x2A+q2kqTyFJ0FVrWOwCKpTdt4UBHHJkT400O/LGCk3trq0q4dn7LXTrTUA==
X-Received: by 2002:adf:e704:: with SMTP id c4mr45710182wrm.283.1568479509643;
        Sat, 14 Sep 2019 09:45:09 -0700 (PDT)
Received: from [192.168.1.4] (ip-86-49-35-8.net.upcbroadband.cz. [86.49.35.8])
        by smtp.gmail.com with ESMTPSA id o188sm5072246wma.14.2019.09.14.09.45.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Sep 2019 09:45:09 -0700 (PDT)
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
 <f1b11b42-99ee-0484-550e-8758ec6fa559@gmail.com>
 <CAMuHMdWz05ALM745tpw=AT2Q30nXvQV39JXTATYTEoTmH1TSRQ@mail.gmail.com>
From:   Marek Vasut <marek.vasut@gmail.com>
Message-ID: <ad3f986d-90bb-a47b-aa24-c326fb369202@gmail.com>
Date:   Sat, 14 Sep 2019 18:45:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAMuHMdWz05ALM745tpw=AT2Q30nXvQV39JXTATYTEoTmH1TSRQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 9/14/19 6:33 PM, Geert Uytterhoeven wrote:
> Hi Marek,

Hi,

> On Sat, Sep 14, 2019 at 6:06 PM Marek Vasut wrote:
>> On 9/9/19 1:18 PM, Geert Uytterhoeven wrote:
>>> On Sat, Sep 7, 2019 at 6:16 PM Marek Vasut wrote:
>>>> Add dma-ranges property into /soc node to describe the DMA capabilities
>>>> of the bus. This is currently needed to translate PCI DMA ranges, which
>>>> are limited to 32bit addresses.
>>>
>>>> --- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
>>>> +++ b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
>>>> @@ -330,6 +330,7 @@
>>>>                 #address-cells = <2>;
>>>>                 #size-cells = <2>;
>>>>                 ranges;
>>>> +               dma-ranges = <0 0x40000000 0 0x40000000 0 0xc0000000>;
>>>
>>> Shouldn't the length be 0x80000000 (for all SoCs)?
>>
>> Or should that match the amount of DRAM below 32bit boundary ?
> 
> Which is 0x80000000, according to the memory area section for the
> various R-Car Gen3 SoCs.

What if you have a system with 1 GiB of DRAM ?

>>> Or should we allow DMA to internal System RAM, too?
>>
>> I think we should include SRAM, yes.
> 
> So that needs a separate range.

Let's see how the discussion pans out about the placement of the
dma-ranges in the first place.

-- 
Best regards,
Marek Vasut
