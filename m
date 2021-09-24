Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 48AAE4170B2
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Sep 2021 13:12:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245046AbhIXLOH (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 24 Sep 2021 07:14:07 -0400
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:54568
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S244920AbhIXLOG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 24 Sep 2021 07:14:06 -0400
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com [209.85.221.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 1473A4019D
        for <linux-renesas-soc@vger.kernel.org>; Fri, 24 Sep 2021 11:12:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1632481953;
        bh=T9o6pyPTAwyXjaj9IKJIIkkYu0EcijNstrWhBloVkIM=;
        h=Subject:To:References:From:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=wYxZO3gEH0+FcFcbUwbd9X8NyUU2RGK1CYTzQ7K0Trl+gLUNasl0U5GBwg92QUgmt
         jP0CU7zCJQd+DYJZllg4Av/g6lEM8HwaMaWr5Pl8D5zoTZLgfbCcBOBI0ZA99w9s00
         BqZ3XmXVgsJzjrTFjBIRrsT6833iAm7i+3SLmNKRH4zVGpUP91Zr6BmZpyCgAfdyuu
         e7eA4ucr/FhaZDXg/KML4XlZmM5YiglcCfttXJPnXfZxiirBiLQYSORzPKd7Ro1qyq
         Z99v4/CSuRwqK8XEZ7jW/koJ4qFI0pYk3uiRLW1aloI8wamgdt4fPrnG6I0BJLKTnv
         rtY6Crrjf4Udg==
Received: by mail-wr1-f71.google.com with SMTP id s13-20020a5d69cd000000b00159d49442cbso7749315wrw.13
        for <linux-renesas-soc@vger.kernel.org>; Fri, 24 Sep 2021 04:12:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=T9o6pyPTAwyXjaj9IKJIIkkYu0EcijNstrWhBloVkIM=;
        b=Nay95og8U2ME8wJNeH9gmRPKmSztXzROq+P/V3Gg3GI2X4Y9Gku8ffMT7LeMIlbvzR
         SiLmKixzTL07F/be2fnqlt6cCgLFmQmkiayM/wU8zlIS2jGY3G255ga6O9qZi/Ef+EKp
         vd1uQWXFBgrodlWn4w0gjdeMcDtEpEFl9Y8BXfThtFbfTwyJqQRl69zRx9QSYYUOpngu
         wXtZvvtq3QVq+cV8WlKDBjauAW32gNCf/GFID8Y0xi9xnLulJHChp4lQrvpu7rvgDf30
         Ilj0TijIvm9w06f+Wtkj+o4jnOsoII62Bbwc580swFTSU2WS3MICUb+hXvKHXwJLacXD
         RbRA==
X-Gm-Message-State: AOAM5324bMr6h8ZOb/tAC/dSxitMJ8vugC1vfSQE0cFaTJwPRY8jAsZ1
        3ykLdjpSdYdVn6PkBOXyVOh2XYWSbp5AMZ7lwCWZpYGFl3otRpE8s+2r++Ku+rEMXauPuJLLM34
        LJZqbaiUmYFtDhv00DARw9C29+jf9Odqm2gZSFJcYiDbmQHnd
X-Received: by 2002:a1c:9851:: with SMTP id a78mr1432593wme.107.1632481952604;
        Fri, 24 Sep 2021 04:12:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwF9z6IBsr8Sd/ad2WwWktRj5c9dwwwnXwUG6I9Lqvm4jEvrorUlgQ3efPSEZjSlnhUXcId+g==
X-Received: by 2002:a1c:9851:: with SMTP id a78mr1432575wme.107.1632481952412;
        Fri, 24 Sep 2021 04:12:32 -0700 (PDT)
Received: from [192.168.0.134] (lk.84.20.244.219.dc.cable.static.lj-kabel.net. [84.20.244.219])
        by smtp.gmail.com with ESMTPSA id k4sm7939100wrv.24.2021.09.24.04.12.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Sep 2021 04:12:32 -0700 (PDT)
Subject: Re: [PATCH] memory: renesas-rpc-if: Avoid unaligned bus access for
 HyperFlash
To:     Andrew Gabbasov <andrew_gabbasov@mentor.com>,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sergei Shtylyov <sergei.shtylyov@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
References: <20210922184830.29147-1-andrew_gabbasov@mentor.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <c6de6ec0-fd06-14bc-c483-52a2d0a4590a@canonical.com>
Date:   Fri, 24 Sep 2021 13:12:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210922184830.29147-1-andrew_gabbasov@mentor.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 22/09/2021 20:48, Andrew Gabbasov wrote:
> HyperFlash devices in Renesas SoCs use 2-bytes addressing, according
> to HW manual paragraph 62.3.3 (which officially describes Serial Flash
> access, but seems to be applicable to HyperFlash too). And 1-byte bus
> read operations to 2-bytes unaligned addresses in external address space
> read mode work incorrectly (returns the other byte from the same word).
> 
> Function memcpy_fromio(), used by the driver to read data from the bus,
> in ARM64 architecture (to which Renesas cores belong) uses 8-bytes
> bus accesses for appropriate aligned addresses, and 1-bytes accesses
> for other addresses. This results in incorrect data read from HyperFlash
> in unaligned cases.
> 
> This issue can be reproduced using something like the following commands
> (where mtd1 is a parition on Hyperflash storage, defined properly
> in a device tree):
> 
> [Correct fragment, read from Hyperflash]
> 
>     root@rcar-gen3:~# dd if=/dev/mtd1 of=/tmp/zz bs=32 count=1
>     1+0 records in
>     1+0 records out
>     root@rcar-gen3:~# hexdump -C /tmp/zz
>     00000000  f4 03 00 aa f5 03 01 aa  f6 03 02 aa f7 03 03 aa  |................|
>     00000010  00 00 80 d2 40 20 18 d5  00 06 81 d2 a0 18 a6 f2  |....@ ..........|
>     00000020
> 
> [Incorrect read of the same fragment: see the difference at offsets 8-11]
> 
>     root@rcar-gen3:~# dd if=/dev/mtd1 of=/tmp/zz bs=12 count=1
>     1+0 records in
>     1+0 records out
>     root@rcar-gen3:~# hexdump -C /tmp/zz
>     00000000  f4 03 00 aa f5 03 01 aa  03 03 aa aa              |............|
>     0000000c
> 
> Fix this issue by creating a local replacement of the copying function,
> that performs only properly aligned bus accesses, and is used for reading
> from HyperFlash.
> 
> Fixes: ca7d8b980b67f ("memory: add Renesas RPC-IF driver")
> Signed-off-by: Andrew Gabbasov <andrew_gabbasov@mentor.com>
> ---
>  drivers/memory/renesas-rpc-if.c | 47 ++++++++++++++++++++++++++++++++-
>  1 file changed, 46 insertions(+), 1 deletion(-)
> 

Thanks for the patch.

Please rebase and test on a recent Linux kernel. This looks like work on
something slightly older or stable kernel, since you Cc not the address
from maintainers.

The patch came slightly after Wolfram's and I wonder whether you hit
similar issue:
https://lore.kernel.org/lkml/20210922091007.5516-1-wsa+renesas@sang-engineering.com/


Best regards,
Krzysztof
