Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C44F4170AA
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Sep 2021 13:09:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244499AbhIXLLa (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 24 Sep 2021 07:11:30 -0400
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:54470
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S245726AbhIXLL2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 24 Sep 2021 07:11:28 -0400
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com [209.85.221.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 2750640827
        for <linux-renesas-soc@vger.kernel.org>; Fri, 24 Sep 2021 11:09:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1632481795;
        bh=dYSZ/Mc6JsUAkvA/NUn4+dUkHgFKndSqh5nGDhv9ymw=;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=Gnmn874BqvMiKu2P8p0k/ouIWPFZm9WeT+Vo5YuJyG9zDA8TV+Lcxc/1DnVUgIjP9
         TOuuaqvddW6yK3BkYP2ZT3Ui8WUFLJ41tN/5AwkZtDXXnnP5/8RRLsL+n+X0/MaL7+
         HNEYR4R25mmgzRc7SZQN0YMCQW6waKvAsJ/bqTFn3/hS4lFAOlnkgNjv88BOomgja0
         Z7fhDrW02YGJ1KceLZuBwMkiCGNwAWCG7s/vmdx/xRQMgrjU5oX9EJ1tKXb4ZaJSbL
         PBl62jVOez0S4KiPmEnhQOBJmz6R0bh4BLvbxvL4XlpejK3iSOzTb6Mj+Dqz6TqmJh
         u0tHHXpiE/Vkw==
Received: by mail-wr1-f70.google.com with SMTP id r5-20020adfb1c5000000b0015cddb7216fso7768109wra.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 24 Sep 2021 04:09:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=dYSZ/Mc6JsUAkvA/NUn4+dUkHgFKndSqh5nGDhv9ymw=;
        b=c27K55VPR7h4t7Rhkdv4OOScnq/vC6DasVsYnAnmM6HPywXYBCNVG7O0F9qnkT/cHK
         DyQqVmmJc7+cmoITcMgJnFUtnsfR6rsw/pkOLHTeO3MZQbQTZq8VeTbExkWIR9xJYBE6
         Ubx4SxN4UiKRFQNvy4j9/uIje4WznbP7qYwRF8OP6FFkwSWELNVP0h1S2EROXOdEA1GU
         LBljwujk1NTME2eDYEc1wc2dcq2QcfFHzUeHZIV6gAI/aEfMZnz2hO1Fu0MSNxlQkf5+
         tifAoJRiY8fFM3fVthk7/A83u/EsWOa4xjE+pO3CRZCpjI0zuSjNmubJvuTLHosT7B/W
         fhPg==
X-Gm-Message-State: AOAM530TiEJXb9SdkQIp1yxG+olksjfOeXSWnAw6McZBoL4I8XTt/DSI
        ZNMFjEKCXEeyplAzZDqxLQeR0xwm6abRH9q3zfeIUJtLqbMvjiprhkQ2RIfJdCtxWHW6TfDcpiw
        oqyTXEWCzJixpuWZAxttAMHVHGdiGs3ajTPE9q7XGxYDbw+gh
X-Received: by 2002:a05:6000:1379:: with SMTP id q25mr11017829wrz.429.1632481794825;
        Fri, 24 Sep 2021 04:09:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxtYqCpyghjXrGKwJE8YBUcU+u19xLlZicvnkMF15QUFlmjgr4OTvw42lVtXntG4qGYLi11vQ==
X-Received: by 2002:a05:6000:1379:: with SMTP id q25mr11017805wrz.429.1632481794530;
        Fri, 24 Sep 2021 04:09:54 -0700 (PDT)
Received: from [192.168.0.134] (lk.84.20.244.219.dc.cable.static.lj-kabel.net. [84.20.244.219])
        by smtp.gmail.com with ESMTPSA id c77sm8061949wme.46.2021.09.24.04.09.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Sep 2021 04:09:54 -0700 (PDT)
Subject: Re: [RFC PATCH] memory: renesas-rpc-if: Correct QSPI data transfer in
 Manual mode
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-kernel@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Duc Nguyen <duc.nguyen.ub@renesas.com>,
        Andrew Gabbasov <andrew_gabbasov@mentor.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20210922091007.5516-1-wsa+renesas@sang-engineering.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <11355367-8d20-5a17-70da-618d87301407@canonical.com>
Date:   Fri, 24 Sep 2021 13:09:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210922091007.5516-1-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 22/09/2021 11:10, Wolfram Sang wrote:
> This patch fixes 2 problems:
> [1] The output warning logs and data loss when performing
> mount/umount then remount the device with jffs2 format.
> [2] The access width of SMWDR[0:1]/SMRDR[0:1] register is wrong.
> 
> This is the sample warning logs when performing mount/umount then
> remount the device with jffs2 format:
> jffs2: jffs2_scan_inode_node(): CRC failed on node at 0x031c51d4:
> Read 0x00034e00, calculated 0xadb272a7
> 
> The reason for issue [1] is that the writing data seems to
> get messed up.
> Data is only completed when the number of bytes is divisible by 4.
> If you only have 3 bytes of data left to write, 1 garbage byte
> is inserted after the end of the write stream.
> If you only have 2 bytes of data left to write, 2 bytes of '00'
> are added into the write stream.
> If you only have 1 byte of data left to write, 2 bytes of '00'
> are added into the write stream. 1 garbage byte is inserted after
> the end of the write stream.
> 
> To solve problem [1], data must be written continuously in serial
> and the write stream ends when data is out.
> 
> Following HW manual 62.2.15, access to SMWDR0 register should be
> in the same size as the transfer size specified in the SPIDE[3:0]
> bits in the manual mode enable setting register (SMENR).
> Be sure to access from address 0.
> 
> So, in 16-bit transfer (SPIDE[3:0]=b'1100), SMWDR0 should be
> accessed by 16-bit width.
> Similar to SMWDR1, SMDDR0/1 registers.
> In current code, SMWDR0 register is accessed by regmap_write()
> that only set up to do 32-bit width.

Is this part something worth splitting to its own patch?

> 
> To solve problem [2], data must be written 16-bit or 8-bit when
> transferring 1-byte or 2-byte.
> 
> Signed-off-by: Duc Nguyen <duc.nguyen.ub@renesas.com>
> [wsa: refactored to use regmap only via reg_read/reg_write]
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
> 
> Hi,
> 
> I could reproduce the issue by a simple:
> 
>   $ echo "Hello" > /dev/mtd10
> 
> The original BSP patch fixed the issue but mixed regmap-acces with
> ioread/iowrite accesses. So, I refactored it to use custom regmap
> accessors. This keeps the code more readable IMO. With this patch, my
> custom test cases work as well as the JFFS2 remount mentioned in the
> commit message. Tested on a Renesas Condor board (R-Car V3M) and a
> Falcon board (R-Car V3U). I send this as RFC because this is my first
> patch for the RPC code and hope for feedback. The BSP team has been
> contacted as well for comments and testing. Nonetheless, this addresses
> a serious issue which has caused broken boards because of writing to
> unintended locations. So, I'd like to see this discussed and applied
> soon if possible.
> 
> Thanks everyone,
> 
>    Wolfram
> 
> 
>  drivers/memory/renesas-rpc-if.c | 113 ++++++++++++++++++++++----------
>  include/memory/renesas-rpc-if.h |   1 +
>  2 files changed, 79 insertions(+), 35 deletions(-)

You sent the patch just slightly after this one:
https://lore.kernel.org/lkml/20210922184830.29147-1-andrew_gabbasov@mentor.com/

Are you solving similar problem?


Best regards,
Krzysztof
