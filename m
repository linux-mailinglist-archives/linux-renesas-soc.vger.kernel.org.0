Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C3F848CD74
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Jan 2022 22:10:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232951AbiALVKj (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 12 Jan 2022 16:10:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230204AbiALVKi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 12 Jan 2022 16:10:38 -0500
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20117C06173F
        for <linux-renesas-soc@vger.kernel.org>; Wed, 12 Jan 2022 13:10:38 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id x7so12548961lfu.8
        for <linux-renesas-soc@vger.kernel.org>; Wed, 12 Jan 2022 13:10:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=KrbHF0DzPNfCOOgkFkmmAa72D7KbaWV3xb9yz2Rt3bM=;
        b=XbEGC7g/EgPNokcJrlfE/n7WGNBoNGbLkn9yVUz8n49hP1iGzSzDburUVxqWzgYetL
         COz/ZlUCJWiK5yJri/2IhCg1ndJTnFnyehv+Mprt6eL2Oeew+92qGEV/KveFfXjdnEw1
         bcyL5Fm1AJCwwnMAAP5QWSjPCQpwIXptig3ePQNwTJMngcZRQHELYp3aSpr1/VYg6z4B
         kUWObpwdXyOnu7sllSMysu6bUNXWAqVO2fvC6/tpCr6wfhxSqJeyy1MWLArmEfgQCDUI
         rmEG9pP+T8rubzuOO2doVOrMDzWvh1XiwsS0dtiVYgSk6QImLd08N+3F1BnPP2PpGRr+
         iczQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=KrbHF0DzPNfCOOgkFkmmAa72D7KbaWV3xb9yz2Rt3bM=;
        b=Ysz4dt8SfXyE8YfgS/JiZDp7I9fIXN7vT06lOrysA5NRBJ5PvyEJx+r2x7ZZt/QoGt
         dSoH1hJdpIEu55iEfAmQ7zrmljcsY6lCBaKeM7qN0V8KVMzSWvlMV7+1YOReZdxlTaco
         CtF86Ezlz5F2ERTR6UF4UA2s5utAK2s6kIQ1HOlPwpTDZR9hXTntEy60sYSBJJYppUwg
         9V1NWowh1djKXJAkdWgI8YsRmjWyHOBiXSE6lntFg28DtkLjW7VG7wNkaBZlT2VIX7ji
         lV8uEdSeoG0UQCQ7yKqbSokji40xt5cacP7L6tvRpbp0MfsYRU3uOZQOl575k17hYFup
         Nnmg==
X-Gm-Message-State: AOAM532kUHK1caQK12GumT1XWcZkmmRREifZT1fZliahRNVDp3erZMY7
        okG5bh54xKY5G5tdTuXWDwTgkg==
X-Google-Smtp-Source: ABdhPJw9RfokvC4wwM+qsCTx/+HZcVAAN/tnfXnOw39oZ0M2m9VGVeMk6Qq7nqQbK08fk1bliRmcUA==
X-Received: by 2002:a05:6512:3a85:: with SMTP id q5mr1140468lfu.35.1642021836492;
        Wed, 12 Jan 2022 13:10:36 -0800 (PST)
Received: from [192.168.112.17] (nikaet.starlink.ru. [94.141.168.29])
        by smtp.gmail.com with ESMTPSA id q5sm91870lfb.135.2022.01.12.13.10.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Jan 2022 13:10:36 -0800 (PST)
Message-ID: <17b8de50-426a-2543-a79a-aab44c9d52cf@cogentembedded.com>
Date:   Thu, 13 Jan 2022 00:10:35 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH 2/3] arm64: dts: renesas: r8a77961: Add lvds0 device node
Content-Language: en-US
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     David Airlie <airlied@linux.ie>, Rob Herring <robh+dt@kernel.org>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20211224052309.1997096-1-nikita.yoush@cogentembedded.com>
 <20211224052309.1997096-3-nikita.yoush@cogentembedded.com>
 <YcyTV4fJqMHIeyYB@pendragon.ideasonboard.com>
 <87626d61-ada0-c220-bea5-5330f5256629@cogentembedded.com>
 <YcyXQxW3kRqQ2Yv0@pendragon.ideasonboard.com>
From:   Nikita Yushchenko <nikita.yoush@cogentembedded.com>
In-Reply-To: <YcyXQxW3kRqQ2Yv0@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

>>>> +				port@1 {
>>>> +					reg = <1>;
>>>> +					lvds0_out: endpoint {
>>>>    					};
>>>
>>> Endpoints must have a remote-endpoint property. Let's drop the endpoint
>>> here and keep the port only, the endpoint can be declared in board
>>> files.
>>>
>>> If you're fine with this change I can make it when applying the patch.
>>
>> This empty endpoint is currently defined in dtsi files for other r-car
>> gen3 SoCs.
>>
>> Goal here is to define lvds0_out label that is then used in extension
>> board dtsi files to link to the port.
>>
>> In this patch I just used the same approach as in files laying nearby.
>>
>> If this approach is not appropriate, then perhaps need to fix it in
>> files for all SoCs, to make it possible for extension board dtsi to be
>> compatible with all of them.
> 
> I'm writing a patch to drop those right now :-) I'll CC you.

This is not the only place where rcag-gen3 dtsi files are using empty-endpoint pattern.

du rgb port is defined in the same way.

And, I've submitted a patch some weeks ago [1] that hooked into that.

[1] https://lore.kernel.org/lkml/20211225115308.2152364-1-nikita.yoush@cogentembedded.com/

Since there was no reply, I am about to resubmit it.
But, perhaps need to do something with empty-endpoint pattern first?

Nikita
