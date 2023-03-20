Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B80B16C1D61
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Mar 2023 18:10:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232611AbjCTRKp (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 20 Mar 2023 13:10:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232656AbjCTRKZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 20 Mar 2023 13:10:25 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6D3F37547
        for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Mar 2023 10:06:06 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id eg48so49373602edb.13
        for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Mar 2023 10:06:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679331886;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JxAMY3nizWvmEM95cg4R6Wfdn2zdVJgYEOfRPSqXtRI=;
        b=r4JhAHhfafhmyI4TU0nAUQtxvk41RQN4oAb1orcyfMNfTXWhkK1ajC8BMUUeqdom16
         ODr8q9/WyUBLcRPk61YMNVSNJM4Qamn0DhyuxK6Ki1kftGU23qOc9vm5cOYl4crd5EBv
         dVql06uAOVIpOEAzAgAAt2M7J5pv+oVGAzDVlqoaDdHuF/G7gs9/plV6idCXdWO/fJO5
         pkZd7uNBIjkWODsrzzfCEGvI5gVbTMUa3OEJcBwZ4wez5T4C6OrNP9CK8pupqJjspjAZ
         olFafLsOpnFvijEQCblR6MytBLqO23+o/O51AQLEurFdtY/CzZkSz/dh6rEzBSfpuMFM
         wZYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679331886;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JxAMY3nizWvmEM95cg4R6Wfdn2zdVJgYEOfRPSqXtRI=;
        b=bjKoOjPkiDT7KxnKnkcTntkrXjDhFXVKItR/1PQ1uB566UEU33k7YWlHoMfOoxc5KN
         IG0tX+z3TCjvRFgLFww7BLOkTSiLxXxV96dNw9bP5tp2Mzlx4sBDYP865XwNMIC7fg4s
         SxCZ5TLvwo5ZsCTdAf7HcdwoEKpK2iYC9TvZmkJJP//u587kQYaI8SdjwcRfT+GioxOz
         k5ByqtsSzEy0GtiaQDFHPN8pvxN5AFZLMZLTLUynFRBrj7S2Ivc7nHs823348UsYfnCo
         91hBGX22BoZWzhva3suuQYG3hv9MtjDE+pRipZL+DUr0TCPr2NoVEavuQ3lj9DHGeNPz
         9GDQ==
X-Gm-Message-State: AO0yUKXZ4pCx+0sBqzriPv/jaEwXjrN6GkmafpjJDz3OqPLPU2MNgaU4
        Z11OQGbfSDQlUPh0ZGZ1h7HAWw==
X-Google-Smtp-Source: AK7set8XL9XScqbcQ4aPIKdObxT2yw+c0UNuVjrlEkoaV28Y6/AuWRgmT52/uNzmDhi4kmEisZV8CA==
X-Received: by 2002:a17:906:7c57:b0:930:fded:5bf2 with SMTP id g23-20020a1709067c5700b00930fded5bf2mr8895750ejp.52.1679331886164;
        Mon, 20 Mar 2023 10:04:46 -0700 (PDT)
Received: from [192.168.2.107] ([79.115.63.78])
        by smtp.gmail.com with ESMTPSA id lc13-20020a170906f90d00b00927341bf69dsm4671842ejb.88.2023.03.20.10.04.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Mar 2023 10:04:45 -0700 (PDT)
Message-ID: <4afd79ba-215d-8b33-4999-4afaa88ae051@linaro.org>
Date:   Mon, 20 Mar 2023 17:04:44 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH/RFC] ARM: dts: marzen: Add FLASH node
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-mtd@lists.infradead.org
References: <07cf5e2b466f3ba217403afc66a8246460609e09.1679330105.git.geert+renesas@glider.be>
Content-Language: en-US
From:   Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <07cf5e2b466f3ba217403afc66a8246460609e09.1679330105.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi, Geert!

Vignesh used to review CFI code, maybe he can intervene. I've never
worked with CFI, but I can try to help. I'll need more debug data though.

On 3/20/23 16:43, Geert Uytterhoeven wrote:
> Add a device node for the Spansion S29GL512N NOR FLASH on the Marzen
> development board.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Although the S29GL512N is a CFI FLASH, using "cfi-flash" instead of
> "mtd-rom" does not work:
>   1. Probing fails with "physmap-flash 0.flash: map_probe failed",

I would first try to understand why the probe fails.

>   2. The kernel crashes later in a spectacular way, cfr. the logs below.
> 
> U-Boot flinfo says:
> 
>     Bank # 1: CFI conformant flash (16 x 16)  Size: 64 MB in 512 Sectors
>       AMD Standard command set, Manufacturer ID: 0x01, Device ID: 0x227E
>       Erase timeout: 4096 ms, write timeout: 1 ms
>       Buffer write timeout: 3 ms, buffer size: 64 bytes
>       Sector Start Addresses:
>       00000000   RO   00020000        00040000   RO   00060000   RO   00080000
>       000A0000        000C0000        000E0000        00100000        00120000
>       00140000        00160000        00180000        001A0000        001C0000
>       ...
>       03FC0000        03FE0000
> 
>     Bank # 2: missing or unknown FLASH type
> 

Do you use "cfi-flash" compatible in u-boot and it works just fine? If
yes, I would try to understand what are the differences between the
probe paths from u-boot and linux. I know it doesn't help much, but we
should start from somewhere if we don't have any other feedback.

Cheers,
ta

