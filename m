Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1E9F34D05A1
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Mar 2022 18:48:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235330AbiCGRsf (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 7 Mar 2022 12:48:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238593AbiCGRse (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 7 Mar 2022 12:48:34 -0500
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF8CBDEE7
        for <linux-renesas-soc@vger.kernel.org>; Mon,  7 Mar 2022 09:47:39 -0800 (PST)
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com [209.85.218.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 4AEC63F618
        for <linux-renesas-soc@vger.kernel.org>; Mon,  7 Mar 2022 17:47:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1646675258;
        bh=gTUG1OTofQBqLGH5jr70EzskQgnPGihE88XHWWMxRM8=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=m7n0TEA14a38l/RLiNINpwQpviEWwR8tCDuGCp05RPRmVNoamORa4fSpca+3qURrj
         6lzDItUf8eUcRL61iuoSXti9V8VT45/uM7kVw8Aqd7I7RyqmcV8nfcELk95koqjqfa
         G3EPerzmgqfRBr8CS7HyTCl8Ao66I4jkmRRrTMMimeZTN00+ZRyHzGqUOMpeFWAQQ4
         6YMrzWwCRSokPjNVnaTfjIWB9/jKauqEcGXVo1o217v+UuH1VHLFU+pXvUyfPvv1M9
         iOM7lTfxYUKOFMFI4Hz1D4DxXp0P4HUc/IjJvBVQV9yvPb16zQ4XoXhsj92FjW4G2Y
         S1TQb/46UFjJg==
Received: by mail-ej1-f72.google.com with SMTP id q22-20020a1709064cd600b006db14922f93so1419528ejt.7
        for <linux-renesas-soc@vger.kernel.org>; Mon, 07 Mar 2022 09:47:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=gTUG1OTofQBqLGH5jr70EzskQgnPGihE88XHWWMxRM8=;
        b=yKlOOAOV0Uanykx1pBsp8kkwJMBJnJ7oiLhylQeavvIIbftvNJ+ip1fuvntLWybmFx
         /IA63SrYbY9ZgftWog2XiodfGY9SZiNlYmHCofs4/B+oDD+ZKUOXWZ1Ew8lmutSkeLNI
         enq4drBN8vFxya4Ctcioyi4JQQ2VwLEJGeQPg/fh+7V6U/CN/BZaFOLviqCOLJ2ktgFk
         jCTvcre++YNiBbwptJjaBbka6v9cwTjQudcUGTt2DO/uGYMFamllsGpf4DyNliLSYqm1
         A3Q5BHw39OhIp9Tygz0a+Rc7sjCyn1/bRwiAYwz3VeUQ25aVWAbC6gI89LIhz64jZK0K
         CSxA==
X-Gm-Message-State: AOAM530LM5Kv5T+Dwr2yXqvvSBSZZzVNYcy49h23cFN/ZLKg0i/iq8Ok
        /mPi3uJzBuYCbZi2BAslF5ptiz6CsmAaVluAYkBiOaoRNWIlhwsJOlAcUsTY3aLUNl4sogO0EFb
        dyNiOOdPXqf8JddZd2TpsIGpOIxOszYlsmGPD54FppTyl2Gel
X-Received: by 2002:a17:907:6d0e:b0:6d7:c85:5bf5 with SMTP id sa14-20020a1709076d0e00b006d70c855bf5mr9948794ejc.31.1646675257523;
        Mon, 07 Mar 2022 09:47:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw9M5dMPsi5MKepY8dS9wOPTh8x1ZtnMj54rZ1pD4rAdYCgeFDf0Br8WQjd2Pjp+ziQJ7gGaQ==
X-Received: by 2002:a17:907:6d0e:b0:6d7:c85:5bf5 with SMTP id sa14-20020a1709076d0e00b006d70c855bf5mr9948781ejc.31.1646675257319;
        Mon, 07 Mar 2022 09:47:37 -0800 (PST)
Received: from [192.168.0.143] (xdsl-188-155-174-239.adslplus.ch. [188.155.174.239])
        by smtp.gmail.com with ESMTPSA id p14-20020aa7cc8e000000b0040f13865fa9sm6544264edt.3.2022.03.07.09.47.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Mar 2022 09:47:36 -0800 (PST)
Message-ID: <8078e6af-034f-d705-c14d-49f86495f86b@canonical.com>
Date:   Mon, 7 Mar 2022 18:47:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [RFC PATCH] memory: renesas-rpc-if: Correct QSPI data transfer in
 Manual mode
Content-Language: en-US
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Duc Nguyen <duc.nguyen.ub@renesas.com>,
        Sergey Shtylyov <s.shtylyov@omp.ru>,
        "Lad, Prabhakar" <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Andrew Gabbasov <andrew_gabbasov@mentor.com>
References: <20210922091007.5516-1-wsa+renesas@sang-engineering.com>
 <163282533892.34438.1878675609177525004.b4-ty@canonical.com>
 <CAMuHMdUqQLo7=NFaNEukqniTJbx-mSZv7eQNB9eCT=L28y3u=A@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <CAMuHMdUqQLo7=NFaNEukqniTJbx-mSZv7eQNB9eCT=L28y3u=A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 07/03/2022 17:44, Geert Uytterhoeven wrote:
> Hi Krzysztof and Wolfram,
> 
> CC Sergey, Prabhakar, Andrew,
> 
> On Tue, Sep 28, 2021 at 12:36 PM Krzysztof Kozlowski
> <krzysztof.kozlowski@canonical.com> wrote:
>> On Wed, 22 Sep 2021 11:10:06 +0200, Wolfram Sang wrote:
>>> This patch fixes 2 problems:
>>> [1] The output warning logs and data loss when performing
>>> mount/umount then remount the device with jffs2 format.
>>> [2] The access width of SMWDR[0:1]/SMRDR[0:1] register is wrong.
>>>
>>> This is the sample warning logs when performing mount/umount then
>>> remount the device with jffs2 format:
>>> jffs2: jffs2_scan_inode_node(): CRC failed on node at 0x031c51d4:
>>> Read 0x00034e00, calculated 0xadb272a7
>>>
>>> [...]
>>
>> Applied, thanks!
>>
>> [1/1] memory: renesas-rpc-if: Correct QSPI data transfer in Manual mode
>>       commit: fff53a551db50f5edecaa0b29a64056ab8d2bbca
> 
> While trying to enable support for RPC on Salvator-X(S)[*], I
> discovered HyperFLASH detection is broken:
> 
>     rpc-if-hyperflash rpc-if-hyperflash: probing of hyperbus device failed
> 
> Reverting all commits to the RPC driver since Sergey's original
> commit 5de15b610f785f0e ("mtd: hyperbus: add Renesas RPC-IF driver")
> fixed probing:
> 
>     rpc-if-hyperflash: Found 1 x16 devices at 0x0 in 16-bit bank.
> Manufacturer ID 0x000001 Chip ID 0x007000
>     Amd/Fujitsu Extended Query Table at 0x0040
>       Amd/Fujitsu Extended Query version 1.5.
>     rpc-if-hyperflash: CFI contains unrecognised boot bank location
> (0). Assuming bottom.
>     number of CFI chips: 1
>     10 fixed-partitions partitions found on MTD device rpc-if-hyperflash
>     Creating 10 MTD partitions on "rpc-if-hyperflash":
>     0x000000000000-0x000000040000 : "bootparam"
>     [...]
> 
> However, there's still something wrong, as all HyperFLASH contents read
> back as zeros, while the FLASH contains the full boot loader stack.
> Bisecting the reverts pointed to this patch, and just reverting this
> patch (small whitespace conflict) fixes probing, too. Still, all zeros.
> 
> Summary: needs more investigation ;-)
> 
> Wolfram: which platform did you use for QSPI testing, so I don't
> break that again?
> 
> [*] Firmware compiled with RCAR_RPC_HYPERFLASH_LOCKED=0 of course.
>     Without that (e.g. old H3 R-Car ES1.0), it crashes with an
>     Asynchronous SError Interrupt during driver initialization.

Thanks for letting me know. This patch is already in mainline, so the
solution is either to revert it or fix it. I will wait for it from you
(as in plural "you" :) ).

Best regards,
Krzysztof
