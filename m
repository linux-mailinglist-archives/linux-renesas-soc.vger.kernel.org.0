Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 18DF86DA94D
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  7 Apr 2023 09:16:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231980AbjDGHQu (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 7 Apr 2023 03:16:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231523AbjDGHQs (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 7 Apr 2023 03:16:48 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 547957DBF
        for <linux-renesas-soc@vger.kernel.org>; Fri,  7 Apr 2023 00:16:47 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id l26-20020a05600c1d1a00b003edd24054e0so378551wms.4
        for <linux-renesas-soc@vger.kernel.org>; Fri, 07 Apr 2023 00:16:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680851806;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mJPzTdNzFdaPr6BlrQB+3yd4U8wxB5qohEgaOPDsDoM=;
        b=pF89GaUgpAfQvquLWFkl08TMWh5OhL0h/Im9u0LHtCnFQidElktNTPWSZf153AS2P1
         CAJENYc5AWvIJ9ifl6bCKkrmdr3oSPyuwp/HUwSVf9yfgiy7i9RaHCY+Wq8ETP46ypo+
         xywKhPyKgxTP/0s5fecLUYgExhj3FEmOwOOqIgTwIi6e91PTVK/RBg8BiCMNO7UgayC5
         dZUlE3QWOIytlRT62qi+LhkPBS4gSgFoqpqylUMQun9IsL5fiVCy4UqpGvh7hObxo7iJ
         2rR1nM6y0wg/r+pDmeuyoqUq9Tt30vlEg579DLGdLuWxHQ7YU3/PX9hH0YVUlR6JAZfo
         GaHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680851806;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mJPzTdNzFdaPr6BlrQB+3yd4U8wxB5qohEgaOPDsDoM=;
        b=jpSecYMY2fZZjYnCwC4yosFWcUOZD1forAN2aII6zdiYqINGPbc4Nsk2jXOLfj9I7F
         M5U3BCqwHhlbDZiOUqE+OOtskveZVr5h1Co95ofPQz6/M8h6Zj6V7mfcRdaVSJY7iIKL
         ybiyWcAB/pFeIKHbUix9kdjtuD5tcnv1UybjanBzNwtJfSLU36CU538gqUyT6p94JaEL
         /LmmTM9EOfmbA2fJrPkMq+UvJ3Anj2XXXwHWTnbwSIsTXKs6wLycf1lOy1vgIekdwvJA
         G5S6s8LgDvbEzDQWTCj13Q14eOwp3YLyHybNXga1XTjOLVRE80u/Z6Lk86uwlYfcC5PY
         vZXA==
X-Gm-Message-State: AAQBX9cGyo5a9SaEFppaTSc1ax78tiGaCMBcsLGU3ed1DAa8sppKmrUw
        PoHUACbZVcPIwez5nZhrlMwNQomQJbzGgfNVmV73Eg==
X-Google-Smtp-Source: AKy350axyNtSE7VTvG3Mh8xX4YgCQFQOOZbw/S6z81U89krvupdHrxWG7EFhYaXHuxfS03Ah0K1rIA==
X-Received: by 2002:a05:600c:21d7:b0:3ef:561d:255d with SMTP id x23-20020a05600c21d700b003ef561d255dmr473386wmj.41.1680851805765;
        Fri, 07 Apr 2023 00:16:45 -0700 (PDT)
Received: from [192.168.2.107] ([79.115.63.91])
        by smtp.gmail.com with ESMTPSA id p5-20020a05600c358500b003ede04deb14sm7550447wmq.48.2023.04.07.00.16.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Apr 2023 00:16:44 -0700 (PDT)
Message-ID: <8dc85429-5e04-96b6-4e54-85cc823cbe5a@linaro.org>
Date:   Fri, 7 Apr 2023 08:16:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH/RFC] ARM: dts: marzen: Add FLASH node
Content-Language: en-US
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-mtd@lists.infradead.org
References: <07cf5e2b466f3ba217403afc66a8246460609e09.1679330105.git.geert+renesas@glider.be>
 <4afd79ba-215d-8b33-4999-4afaa88ae051@linaro.org>
 <CAMuHMdXE=jvjKTekRgWpYRPa7_T51qRdTXTgB3nQn5Dcjjg7bA@mail.gmail.com>
 <CAMuHMdVsbcuH+UYKb2be34LAk=gu8GMOQ+5+uxk_O585X4rWBg@mail.gmail.com>
 <CAMuHMdWvVmQ6ZuYAs2z9xAJ9y82UNAckXDmkSQSXxGY_KyT4tg@mail.gmail.com>
From:   Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <CAMuHMdWvVmQ6ZuYAs2z9xAJ9y82UNAckXDmkSQSXxGY_KyT4tg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi, Geert,

On 4/3/23 17:29, Geert Uytterhoeven wrote:
> On Tue, Mar 21, 2023 at 4:01 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>> On Mon, Mar 20, 2023 at 7:57 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>>> On Mon, Mar 20, 2023 at 6:04 PM Tudor Ambarus <tudor.ambarus@linaro.org> wrote:
>>>> Vignesh used to review CFI code, maybe he can intervene. I've never
>>>> worked with CFI, but I can try to help. I'll need more debug data though.
>>>>
>>>> On 3/20/23 16:43, Geert Uytterhoeven wrote:
>>>>> Add a device node for the Spansion S29GL512N NOR FLASH on the Marzen
>>>>> development board.
>>>>>
>>>>> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>>>>> ---
>>>>> Although the S29GL512N is a CFI FLASH, using "cfi-flash" instead of
>>>>> "mtd-rom" does not work:
>>>>>   1. Probing fails with "physmap-flash 0.flash: map_probe failed",
>>>>
>>>> I would first try to understand why the probe fails.
> 
>> I suddenly remembered I have a different board (APE6-EVM), where
>> the CFI-FLASH stopped working after adding support for secondary
>> CPUs. I always thought that was a hardware quirk...
>>
>> Turns out the CFI-FLASH on Marzen (quad Cortex-A9) is detected when
>> booting with "nosmp":
> 
>> My first guess was that the probing process is migrated to a different
>> CPU core during probing, but printing smp_processor_id() didn't
>> confirm that; it's just running on a different CPU core than CPU0.
>> Wrapping the body of cfi_qry_mode_on() inside a get_cpu()/put_cpu()
>> pair to prevent migration also didn't fix it.
>>
>> Is CFI-FLASH known-broken on SMP?
> 
> After actively looking for more boards with CFI FLASHes, and finding one
> more board where FLASH probing fails on SMP, I dug deeper.
> Turns out they all have in common that (a) the CFI FLASH is located at
> physical address zero, and (b) the secondary CPU bringup code relies
> on mapping (by special hardware) the region at address zero to the
> CPU boot code...
> 
> Hence fixing this involves making sure that accessing FLASH and bringing
> CPU cores online do not happen concurrently...
> 

Would deferring probe for CFI work?

ta
