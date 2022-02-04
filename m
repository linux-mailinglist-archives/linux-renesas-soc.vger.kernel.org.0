Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F32314A980C
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Feb 2022 11:53:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244627AbiBDKxx (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 4 Feb 2022 05:53:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230164AbiBDKxu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 4 Feb 2022 05:53:50 -0500
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FBE0C061714;
        Fri,  4 Feb 2022 02:53:49 -0800 (PST)
Received: by mail-lj1-x22b.google.com with SMTP id a25so7896570lji.9;
        Fri, 04 Feb 2022 02:53:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=MCd5FvTHoJXq79AcAX0dk9oGdW9cYwxE282nBZk47JA=;
        b=m3enqia+QjfqXIdfC9C0O99EZV+yUD5ggbnRGgMmoBEpJsEBXfFmwjCINqtSbW9kyk
         1FoMHA2fW9LyYoQPlCPh1weQzaEG+saZ7g0xbKjf7XjqcHNaYGjr27124Tvv6Cvzg9rJ
         RsVhRv8P61aK17kb6IJv/lu/oTw2iXEvjDj3vAbJUr1k3Q5TFO0VFnAwJWeHCsiC69lh
         OQpLHm0/c8iw2A5Wb/SHyq3ROPFEKRs3ztdEkAcKynLInJD0FCr4+ixcp6PwnrjJC7uu
         hPp4P4mySZBINfVms4gxyakPfT0f4OIBIfbxgYK0aIpkdlnQ32DLxnZBn0YR9/feu6MQ
         eXtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=MCd5FvTHoJXq79AcAX0dk9oGdW9cYwxE282nBZk47JA=;
        b=eNAYuEXbq2suogFl7W5+OvkuwMJUVOna+OCamSlZCmGiDA2zv9cNgcwRj9MqXnysxN
         2YoTd+NTSzK/ivfme3mjIL/uSuiU/1bZb+tMPQUrcCiWNCsVbbqgoWp+u/MJJnzClF7/
         FoVGQBScI0sLrbvFCsd8rw2V1n/itvaiDstY/URW31mBkU8YLXzZ9YSnpeVGcvRLuhiL
         a4CKWNoGInIVdOtQyo3JKHjZYbcdkpiN8Bpc2GzsAr3wkT6QGg9pmJc+tWZicNpqSLJO
         j7ZF9r6TnarYwFv6UUmO0cnk9be2s9W1Av8fYxteus8BtUqcnmbZAk4EuBagO4jEI8G9
         xCUQ==
X-Gm-Message-State: AOAM5328IoW9/LecLmpjVY4/V/q1o+Ouk7Gn1QVFYQMjFDGqRVmIFtTO
        BpUJ9SWGox65GTRaY/dbE5k4WvSKrPk=
X-Google-Smtp-Source: ABdhPJwNPZVbMWpgWXGqKc9QooQhS/Rp+GFP+v/cpmkXs+b2z6hM/2I3YfyLji+7lqc15elscD3MMg==
X-Received: by 2002:a05:651c:50f:: with SMTP id o15mr1393279ljp.119.1643972027273;
        Fri, 04 Feb 2022 02:53:47 -0800 (PST)
Received: from [192.168.1.103] ([31.173.86.75])
        by smtp.gmail.com with ESMTPSA id j16sm257976lfp.306.2022.02.04.02.53.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Feb 2022 02:53:46 -0800 (PST)
Subject: Re: [PATCH resend] dt-bindings: ata: renesas,rcar-sata: Add r8a774e1
 support
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
From:   Sergei Shtylyov <sergei.shtylyov@gmail.com>
Message-ID: <1cec2ed2-23cb-c838-f25c-f86d7b74d380@gmail.com>
Date:   Fri, 4 Feb 2022 13:53:45 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <CAMuHMdXvsUevw8dHTracUHn5Uu4XsbtBssOKss_txH87rtUV7w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 2/4/22 10:32 AM, Geert Uytterhoeven wrote:

[...]
>>> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>>> Document SATA support for the RZ/G2H SoC, no driver change required.
>>
>>    I don't have the RZ/G2H manual, is it available online somewhere?
> 
> https://www.renesas.com/eu/en/products/microcontrollers-microprocessors/rz-cortex-a-mpus/rzg-linux-platform/rzg-marketplace/document
> You do have to register at the website before you can download it.

   Yeah, was able to download, thank you! Looking at the manuals...

> Gr{oetje,eeting}s,
> 
>                         Geert

MBR, Sergey
