Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 807684DC02E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 17 Mar 2022 08:32:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229447AbiCQHd1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 17 Mar 2022 03:33:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230297AbiCQHd0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 17 Mar 2022 03:33:26 -0400
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE32D1C16F0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 17 Mar 2022 00:32:09 -0700 (PDT)
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com [209.85.128.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 57DA13F20A
        for <linux-renesas-soc@vger.kernel.org>; Thu, 17 Mar 2022 07:32:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1647502327;
        bh=oHoQI919lPScI8pcxdUo8Tf+IYeq3uFQUu2n8LB+qnw=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=W/FisBWkY8UpeScry/RTKb4idjAMOxiuPrAoEFAPxCM+gwuGtfL2i1geGlHMb8Ga1
         eT0Abz7mhbM1GG6/2McwMERb0ajLh4sZPf9snOJMa181jQMf5ecCD9Yc8dB6E8NE+X
         hc4FnfhMMJZNGSselI1Tq2fqNRDUYUkIC6kV9JNAkgyXZD25iE4u4jwIBF5q6jcC9W
         thKTbFjmzPDrhMw2cLD7KjQYKv7n9DzIsJ5MEDWEEL/8IgG+V/oAUFP5quVdMxshPv
         z3HbZD8r2cZfXtdVvWyLXMTbk+Ev3hSslAjMXH9Fp+oxTQZ7qBE3+GFhMb9ciyPUqS
         4+3Rg7xYsfKoA==
Received: by mail-wm1-f70.google.com with SMTP id 26-20020a05600c22da00b00388307f3503so1821215wmg.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 17 Mar 2022 00:32:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=oHoQI919lPScI8pcxdUo8Tf+IYeq3uFQUu2n8LB+qnw=;
        b=8JdeVXFPBfwC4d7K0RXenSM6pvK4INwi6S1HLiCOpfK4YSDjqYt7q1w28tGMsXxfDV
         5FAKAVPjJYqCHR0/nBClU9BASLxq9Jc2tptUjYp+igziPNufjcK+m4oRvwOm99Ns+cND
         62ioJrXBSdjgK/3mNZqHSmZvUfUq2P4ei+92gE+Wk7eLPh+gt+U1BzsrO+QI8cMPGGRx
         BDKLZUo0X8HRSJK5fMXWqmmpg6KoqkHjSSZL7rGbfq8m/fCmClWBI6AbyQZJoPEUC2rk
         prvtDPGvbW+uXAb4OSYhlsGQ10JOuYZwkyVsN0/gT9zkIKsMMlV0pRoobxl1pa0BuR4X
         YXXw==
X-Gm-Message-State: AOAM530I4TyGhXXgllkOMz96sFU6GEGjusX5w5TCQJOuKE9Vpb+kjati
        B92fBuv1RG1hhz9Bohhae9OeHDtO6dXUo8T1iYfsJvWevzAp/Uv/bC9urulw2hyLPZ1L1mxrnse
        K2VTsRUhZjslccyFOGmf2sQHNMOzcN4ESZHxwVv43zr2QI/BR
X-Received: by 2002:a5d:6104:0:b0:203:df06:5d6a with SMTP id v4-20020a5d6104000000b00203df065d6amr2698683wrt.241.1647502326130;
        Thu, 17 Mar 2022 00:32:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxMuVm41PcpwFF45N9YDh1EjaVU+KsZhQtSOmBQnnse4kLWp3Z6Ru+4Fe/v0TLdCHADPX8NUw==
X-Received: by 2002:a5d:6104:0:b0:203:df06:5d6a with SMTP id v4-20020a5d6104000000b00203df065d6amr2698667wrt.241.1647502325875;
        Thu, 17 Mar 2022 00:32:05 -0700 (PDT)
Received: from [192.168.0.17] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id t7-20020a05600c198700b00389fb24f397sm6819411wmq.21.2022.03.17.00.32.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Mar 2022 00:32:05 -0700 (PDT)
Message-ID: <31a776ed-3371-55d6-747b-8e70e72619d7@canonical.com>
Date:   Thu, 17 Mar 2022 08:32:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH RFC] memory: renesas-rpc-if: Fix HF/OSPI data transfer in
 Manual mode
Content-Language: en-US
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Sergey Shtylyov <s.shtylyov@omp.ru>, Lad@rox.of.borg,
        Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Andrew Gabbasov <andrew_gabbasov@mentor.com>,
        linux-renesas-soc@vger.kernel.org, linux-mtd@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <27107f2d578b198078df841ee2e4d7b71b183898.1647017136.git.geert+renesas@glider.be>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <27107f2d578b198078df841ee2e4d7b71b183898.1647017136.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 11/03/2022 17:53, Geert Uytterhoeven wrote:
> HyperFlash devices fail to probe:
> 
>     rpc-if-hyperflash rpc-if-hyperflash: probing of hyperbus device failed
> 
> In HyperFLASH or Octal-SPI Flash mode, the Transfer Data Enable bits
> (SPIDE) in the Manual Mode Enable Setting Register (SMENR) are derived
> from half of the transfer size, cfr. the rpcif_bits_set() helper
> function.
> 
> Hence when converting back from Transfer Data Enable bits to transfer
> size, the bus width must be taken into account, and all Manual Mode Data
> Register access sizes must be doubled when communicating with a
> HyperFLASH or Octal-SPI Flash device.
> 
> Fixes: fff53a551db50f5e ("memory: renesas-rpc-if: Correct QSPI data transfer in Manual mode")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Marked RFC, a (1) we should avoid the back-and-forth conversion between
> transfer size and Transfer Data Enable bits, and (2) actual HyperFlash
> data reads (which follows a completely different code path) still return
> all zeros.
> 
> On Salvator-XS with unlocked HyperFlash, the HyperFlash is now detected
> again, cfr. (with DEBUG_CFI enabled):
> 
>     Number of erase regions: 1
>     Primary Vendor Command Set: 0002 (AMD/Fujitsu Standard)
>     Primary Algorithm Table at 0040
>     Alternative Vendor Command Set: 0000 (None)
>     No Alternate Algorithm Table
>     Vcc Minimum:  1.7 V
>     Vcc Maximum:  1.9 V
>     No Vpp line
>     Typical byte/word write timeout: 512 \xc2\xb5s
>     Maximum byte/word write timeout: 2048 \xc2\xb5s
>     Typical full buffer write timeout: 512 \xc2\xb5s
>     Maximum full buffer write timeout: 2048 \xc2\xb5s
>     Typical block erase timeout: 1024 ms
>     Maximum block erase timeout: 4096 ms
>     Typical chip erase timeout: 262144 ms
>     Maximum chip erase timeout: 1048576 ms
>     Device size: 0x4000000 bytes (64 MiB)
>     Flash Device Interface description: 0x0000
>       - x8-only asynchronous interface
>     Max. bytes in buffer write: 0x200
>     Number of Erase Block Regions: 1
>       Erase Region #0: BlockSize 0x40000 bytes, 256 blocks
>     rpc-if-hyperflash: Found 1 x16 devices at 0x0 in 16-bit bank. Manufacturer ID 0x000001 Chip ID 0x007000
>     Amd/Fujitsu Extended Query Table at 0x0040
>       Amd/Fujitsu Extended Query version 1.5.
>     rpc-if-hyperflash: CFI contains unrecognised boot bank location (0). Assuming bottom.
>     number of CFI chips: 1
> 
> At first, the failure looked like an endianness-issue, as reading two
> bytes resulted in e.g. 0x51 0x00 instead of 0x00 0x51.  But it turned
> out to be reading a single 8-bit value of 0x51 instead of a 16-bit value
> of 0x5100.
> 
> Note that commit 0d37f69cacb33435 ("memory: renesas-rpc-if: Correct QSPI
> data transfer in Manual mode") in the BSP does not suffer from this bug,
> as it bases its decision on the real number of bytes to transfer, not on
> the SMENR.SPIDE register bits.
> ---
>  drivers/memory/renesas-rpc-if.c | 20 ++++++++++++++++----
>  1 file changed, 16 insertions(+), 4 deletions(-)
>

Some reviews and tests will be useful. Anyway it's too late upcoming
cycle, so I will pick it up after merge window.


Best regards,
Krzysztof
