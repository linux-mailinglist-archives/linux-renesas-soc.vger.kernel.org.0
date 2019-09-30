Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D9F59C20CE
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Sep 2019 14:45:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730867AbfI3Mpv (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 30 Sep 2019 08:45:51 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:35140 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729914AbfI3Mpu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 30 Sep 2019 08:45:50 -0400
Received: by mail-wr1-f66.google.com with SMTP id v8so11184961wrt.2;
        Mon, 30 Sep 2019 05:45:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:subject:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=PJhrjEXe+xzHtPNUW70+nF7eYn4Rt0IksQWllhw/WAk=;
        b=pZLd1h5JkC5nTha34R5MhAAXeVrRWcnpfELhNWVUu59JR2vi5syyK9nupCVsgC7MCT
         gutPdLdtMYXZsoUONUoKxKoIxEX9wnV5C1ju+TQp98EuaUsMb+Vxeg74fIW3+712b2HY
         1gfiItyyK7U2FfQ/61GayJVkLlpDLeptefiiH6waFYNG0gSv4DSMbJTXZzCbYRhn6Ma+
         1t/J7wiWB468U2GNtegDa6UDumTZ1NxSdRN8XRwCytRUmqXVbbk8Uw9mNXDeWwJzLfsm
         JT3UzFJ7qDi6M1yIw38UP4FwLVGqFPktkFn+3m2BHB/C4BqsNjdCFp0AhhIuuIO784b7
         gWnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=PJhrjEXe+xzHtPNUW70+nF7eYn4Rt0IksQWllhw/WAk=;
        b=Ae5QQPuf3w2sZJfkVf2SMJk4ccNUzR35DPdsWQeHIMqoSTiu3x/F4OttsqptKpmMCr
         nzM0N79ZizpiXfq1ow1TRqeAenRjQJnywdZPd0p+3gb4kTJX3xxyE98vyobql75C54nk
         ASQt0FsOYLfAzQwJsQtwtE/8zKauk0HHRx86Z4dM8gfwGwmbCXvqF2wPnaJ7mtFLniWW
         8OFlLyY5UBHwyV3z7BdGgz9JRePX9lkv0VB8vDaEmNQRj8JsRx82V61nd8D3eE9AedPe
         jMCbmciriOJ5q621QVdXB9RfgKigLzfByT1FOI8759WvwakgOymQWSTuIq2eEH9MOu52
         cEaw==
X-Gm-Message-State: APjAAAVHk4ct8vnxPDyvUWmyEGI6yksSHHp4ftRqoOqU4lRbtdxUU91b
        RnyJEUmaxmrZPE1UneNommGXy4qx
X-Google-Smtp-Source: APXvYqwvpvSEiCuQhm0DFtQunuc79toJaZNaQKNaiWTtRWTp9MTodBak09Q5J2Va4IMdxHBpyrwHsg==
X-Received: by 2002:a5d:4745:: with SMTP id o5mr13169825wrs.125.1569847548549;
        Mon, 30 Sep 2019 05:45:48 -0700 (PDT)
Received: from [192.168.1.4] (ip-86-49-35-8.net.upcbroadband.cz. [86.49.35.8])
        by smtp.gmail.com with ESMTPSA id r7sm12623807wrx.87.2019.09.30.05.45.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Sep 2019 05:45:47 -0700 (PDT)
From:   Marek Vasut <marek.vasut@gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: Add /soc dma-ranges
To:     Rob Herring <robh@kernel.org>
Cc:     "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Wolfram Sang <wsa@the-dreams.de>, devicetree@vger.kernel.org,
        "open list:MEDIA DRIVERS FOR RENESAS - FCP" 
        <linux-renesas-soc@vger.kernel.org>
References: <20190907161634.27378-1-marek.vasut@gmail.com>
 <CAL_JsqL47dQT-P78j4Ph61fsgA45Ha0AJjDajiMk52yFj++s+g@mail.gmail.com>
 <CAL_JsqK+SwX8Lu+-4UgpLVxL05yTcs8Af9mPVHqzbf6+HF9v3A@mail.gmail.com>
Message-ID: <0bf7c8c8-d03e-c08e-4879-3d3a2fb90ca7@gmail.com>
Date:   Mon, 30 Sep 2019 14:42:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAL_JsqK+SwX8Lu+-4UgpLVxL05yTcs8Af9mPVHqzbf6+HF9v3A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 9/24/19 12:33 AM, Rob Herring wrote:
> On Fri, Sep 13, 2019 at 10:14 AM Rob Herring wrote:
>>
>> On Sat, Sep 7, 2019 at 5:16 PM wrote:
>>>
>>> From: Marek Vasut
>>>
>>> Add dma-ranges property into /soc node to describe the DMA capabilities
>>> of the bus. This is currently needed to translate PCI DMA ranges, which
>>> are limited to 32bit addresses.
>>
>> FYI, I've started working on this problem and issues around
>> dma-ranges/dma_mask. Hopefully I'll get some patches out next week.
> 
> I've pushed out a branch here:
> 
> git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git dma-masks
> 
> Can you test it on Renesas. I don't have a real platform having the issue.


With the following patches applied:
      https://patchwork.ozlabs.org/patch/1144870/
      https://patchwork.ozlabs.org/patch/1144871/
on R8A7795 Salvator-XS, works fine.

-- 
Best regards,
Marek Vasut
