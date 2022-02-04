Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 999FE4A98DF
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Feb 2022 13:06:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243968AbiBDMGD (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 4 Feb 2022 07:06:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242133AbiBDMGC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 4 Feb 2022 07:06:02 -0500
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1547AC061714;
        Fri,  4 Feb 2022 04:06:02 -0800 (PST)
Received: by mail-lf1-x134.google.com with SMTP id i34so12257725lfv.2;
        Fri, 04 Feb 2022 04:06:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=0PiuzhkDSK07MsbEwoEoA/uuR/ma2ITfvJL1R2U2KKk=;
        b=ZU3EkKTrqhSdoLgHkr7o/85oZwku3/8xN3ohCIzh+xoq7LU0dttJtK6GniXS+XoWmL
         XG7TVsa2PxDmuqdCbC0IdaauNuHXxKvp91kLRIh5Hx4eBmR5gV3BHmddJchZ+qdMjiYo
         1ja2/rIZkncnU5dV4iB3ydlALMYk1ggV/U5n84O88FQcW7PFIwJVPIEhML7WFAzt0VAr
         85FdHeYKZBBmTDksV7PhKbkUwT6v7FrhCQF3kqVCdOK5b+xnmC2Trs4SmwSEoO/irVTQ
         vfCiYg5sdI96Ff1fgSiBeEEuatc5mx5qVswDYmDdPf/Y4GKCOSM8xzzrXd75/ax/jBMz
         2XhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=0PiuzhkDSK07MsbEwoEoA/uuR/ma2ITfvJL1R2U2KKk=;
        b=larYPvHTOlzXUkIKBWMejfpJYR3qsRubjcxpfZBX/UwTUluR6KGWcRHAa02TwHCUfC
         PDN/IfE3izz/6hC/S2P1FQfy9u3JhYAkcAvHCZLL6aPrm1ikzyRCtoXzoEWrGcPVKSrv
         oUujWB7ygTGAbRYkJJa+s1Cam4oXKJaVzGgzV4559FG48JMK/BiqdRlCQBeofwDBTybJ
         qFLwyRl12zboyK6tDeFYgyxyk0Zt/ya0AcVz9PaTbbGbe4GXy/o6M/YhkPkooEgA0H/x
         e8Y4Qa5P3SdXJx6cDGnQlyccHkCAWQGiic20BeEV6G+kSml4rOcr+NSKXxHlsC38H4sa
         N7kg==
X-Gm-Message-State: AOAM530zaOaWCVoE8vxA00vwNZ9NePo/hidBJC44xKlnN5buP7G5oJq7
        rPiI20LMkm8ANxbrq5T2XTVF/g5/FTU=
X-Google-Smtp-Source: ABdhPJz4OyjwK2lva1oi8lzNA5Bd25QynvZqSiIE3TwBlwPY7cgVW+9uAXpPhVGCawGGbHsqbGbkfA==
X-Received: by 2002:a05:6512:3b12:: with SMTP id f18mr2098421lfv.607.1643976360051;
        Fri, 04 Feb 2022 04:06:00 -0800 (PST)
Received: from [192.168.1.103] ([31.173.86.75])
        by smtp.gmail.com with ESMTPSA id z15sm237878ljm.64.2022.02.04.04.05.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Feb 2022 04:05:59 -0800 (PST)
Subject: Re: [PATCH resend] dt-bindings: ata: renesas,rcar-sata: Add r8a774e1
 support
From:   Sergei Shtylyov <sergei.shtylyov@gmail.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Damien Le Moal <damien.lemoal@opensource.wdc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-ide@vger.kernel.org,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
References: <507cc45f44603afa6a70c05a3956fb7b13b49ed9.1643896347.git.geert+renesas@glider.be>
 <99ac1fc9-fa12-325c-3b54-eb3cb996a5df@gmail.com>
 <CAMuHMdXvsUevw8dHTracUHn5Uu4XsbtBssOKss_txH87rtUV7w@mail.gmail.com>
 <1cec2ed2-23cb-c838-f25c-f86d7b74d380@gmail.com>
Message-ID: <d15a1a4b-1e7c-bcaf-caaf-5b1c2828c1e6@gmail.com>
Date:   Fri, 4 Feb 2022 15:05:58 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <1cec2ed2-23cb-c838-f25c-f86d7b74d380@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 2/4/22 1:53 PM, Sergei Shtylyov wrote:

[...]
>>>> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>>>> Document SATA support for the RZ/G2H SoC, no driver change required.
>>>
>>>    I don't have the RZ/G2H manual, is it available online somewhere?
>>
>> https://www.renesas.com/eu/en/products/microcontrollers-microprocessors/rz-cortex-a-mpus/rzg-linux-platform/rzg-marketplace/document
>> You do have to register at the website before you can download it.
> 
>    Yeah, was able to download, thank you! Looking at the manuals...

   The darn RZ/G2 manual is still incomplete when it comes to the SATA part --
the register table misses the ATAPI module control registers... :-/

[...]

MBR, Sergey
