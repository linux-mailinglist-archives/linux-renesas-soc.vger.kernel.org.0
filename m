Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 75C5D48C082
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Jan 2022 09:57:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351854AbiALI5S (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 12 Jan 2022 03:57:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351836AbiALI5F (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 12 Jan 2022 03:57:05 -0500
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FB66C061212
        for <linux-renesas-soc@vger.kernel.org>; Wed, 12 Jan 2022 00:56:53 -0800 (PST)
Received: by mail-lf1-x12b.google.com with SMTP id m1so5701098lfq.4
        for <linux-renesas-soc@vger.kernel.org>; Wed, 12 Jan 2022 00:56:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=IDxp9FEehAgEBeTvpHIK9wQEhQiO4fcWr7Sjuf0LJAY=;
        b=vuGmTB2J1fH0iBujlaSOiI3IPsdBAdSsSCZzotNymWfhsBtnWHFw05PrQYfIZ/YqJT
         gFQmQ7axOsaovrtuP7GT7uT2isBOQgR41KzhYHX3FfFyhRHZvxAAw0MTgoXMzfwZk60x
         Jlchm2EEQtZusZFteVLmQGKhMxGX3F7BsdIP1r2w6qWCFPEGS4BOloPATcLTPMc5rQXj
         gyEErB2ODq/pnrIUiOEsEoOlDRwuhVrZtRZp5CCMQZvrUt+D/RLZNFlGemI+yuYdl9I3
         UFetZEoz8J7F4FATydKaD6A5q5nkM62cT+1nh5e4IRCbMSS/7tQ21CIZ5UmCI4hAMJLX
         1Z3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=IDxp9FEehAgEBeTvpHIK9wQEhQiO4fcWr7Sjuf0LJAY=;
        b=EdhJoD8uFmV+4RIMfN7HAPwVQz8/TxtqVwjowlOW48mNLF+5scOWr7Slqg5CVshyID
         Y3V10fvGLsg8Cns9Ut9tB5pHp+Kl3tgncYx8pF3ZZT6SUledaCfha4cbSUTbwFBZVznh
         SDO/2QAWnbbEzRnuklKXAgaWKNeE4PiLgZjJqr5AhI/DgfTN0gWYM0P/IBmi4gNkuKtx
         Z/bUWTUSoaif5/Zy89KBFe2lkDWwAPrIHwo13VDkFlugR9GAv3H+g4zuoj8uuQectfLq
         yH9rxxjrLzMoz9lZoGFKNYuFu3aZk7mzAyXaIy59aQ/+w+NUReETQ2A9sqpa1TSOxrMa
         vC8Q==
X-Gm-Message-State: AOAM533IHcl7/4ofj+Yypy7QxIUmcrcz/wlL4kFsz45vaJPtqcxPY5/q
        d27pC90KW3CKY2lP1ySK3RF3Cg==
X-Google-Smtp-Source: ABdhPJwlZ3tdMoNqbxzIWmOER1wBJcpslBtRJoH2RKcV8qK3clqLQmuNhQ9NYHuCOS4FCZRSiALWMA==
X-Received: by 2002:a19:750b:: with SMTP id y11mr6135004lfe.265.1641977811417;
        Wed, 12 Jan 2022 00:56:51 -0800 (PST)
Received: from [192.168.112.17] (nikaet.starlink.ru. [94.141.168.29])
        by smtp.gmail.com with ESMTPSA id q14sm1581984lfu.74.2022.01.12.00.56.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Jan 2022 00:56:51 -0800 (PST)
Message-ID: <fccd00c9-ec44-9586-0df2-6e46568665c1@cogentembedded.com>
Date:   Wed, 12 Jan 2022 11:56:50 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH 3/3 v2] arm64: dts: renesas: add MOST device
Content-Language: en-US
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Christian Gromm <christian.gromm@microchip.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, linux-staging@lists.linux.dev,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20211226082530.2245198-4-nikita.yoush@cogentembedded.com>
 <20211226153349.2296024-1-nikita.yoush@cogentembedded.com>
 <CAMuHMdUJfq+nFFMoiPiTt1=Ny9zOm-O1EAmq3n56n4RJ6H8tdA@mail.gmail.com>
From:   Nikita Yushchenko <nikita.yoush@cogentembedded.com>
In-Reply-To: <CAMuHMdUJfq+nFFMoiPiTt1=Ny9zOm-O1EAmq3n56n4RJ6H8tdA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

>> +                       reg = <0 0xec520000 0 0x800>;
>> +                       interrupts = <GIC_SPI 384 IRQ_TYPE_LEVEL_HIGH>,
>> +                               <GIC_SPI 385 IRQ_TYPE_LEVEL_HIGH>,
>> +                               <GIC_SPI 386 IRQ_TYPE_LEVEL_HIGH>,
>> +                               <GIC_SPI 387 IRQ_TYPE_LEVEL_HIGH>,
>> +                               <GIC_SPI 388 IRQ_TYPE_LEVEL_HIGH>;
> 
> What is the purpose of the various interrupts?
> Perhaps you need interrupt-names?
> The driver seems to use only the first two, which is strange, as
> the second and third interrupt handle different channels.

Maybe Christian Gromm (the original driver author) can comment here?

As far as I understand:
- interrupts are: mlb, ahb0, ahb1, ch0rx, ch1rx
- of those, the first 3 are from dim2 itself, and the last two are from renesas-specific logic around dim2
- in the interrupt assignment tables for gen3 SoCs, renesas documents all 5 interrupts, however in the 
mlb section, renesas mentions only mlb, ahb0 and ch0rx interrupts
- moreover, renesas explicitly denies access dim2 registers responsible for channels 32..63 - which 
renders ahb1 interrupt useless; and renesas does not document any registers related to "async rx 
response" on channels 32..63 - which renders chrx1 interrupt useless
- anyway, dim2 driver registers only 32 channels (for all use cases, not only for renesas), and thus 
uses only ahb0 interrupt
- dim2 driver does not implement renesas-specific processing logic and thus does not use ch0rx interrupt

I'm not sure how to proceed here.
Is it better to define only two interrupts (mlb, ahb0) in device trees?

Regarding 'interrupt-names' - dim2 driver currently uses platform_get_irq() and thus depends on numeric 
positions (mlb interrupt at index 0 and ahb0 interrupt at index 1). I'm not sure about current use cases 
of the driver other than with rcar-gen3, and if it is ok to use of_get_irq_byname() instead. And without 
using of_get_irq_byname(), interrupt-names looks somewhat useless.

> But without any DT binding documentation
> for this hardware block, this is hard to validate, and not yet ready for
> upstream integration.

Christian, are you going to provide DT binding documentation for dim2?

Nikita
