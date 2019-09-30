Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 548E5C246D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Sep 2019 17:38:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731938AbfI3Pii (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 30 Sep 2019 11:38:38 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:34774 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727767AbfI3Pii (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 30 Sep 2019 11:38:38 -0400
Received: by mail-wr1-f67.google.com with SMTP id a11so11913344wrx.1;
        Mon, 30 Sep 2019 08:38:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=UKXLz9Q+LLB6BiMrKWPLQcSp+EA3Iu1euCxCi3Xv3c0=;
        b=n9sASN4UUOQPMdZuPwJozxZDdv83KL9DUcPizbcn2bvZxDQqLtYacXWM+0rzQd/iGl
         axWN+Xz3U8OgVrRGcEsgYLx81wnqMa1IoClrYmwTji0SPt0W7CRVEPsIhhY4lMNMFO5J
         rvjVPdlA9pZe+NVWgksF+ZW6iZ+WkCUSX1Y8iRHEb3Dly6TnhLkrwfzj+3C3Ju/6diQJ
         wrrBQ0K307e4QvincJsK2CUlfvBwNic9MR+oVXAruC21MwEhiiTIIKHuPiQfUNhGxzsu
         Z31LYorgUhJuEBwlilPNFYQmRii/uKas8+Tpu87L+JNxqC/0m9FGO/wlpn6isaabt1SP
         Sl8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=UKXLz9Q+LLB6BiMrKWPLQcSp+EA3Iu1euCxCi3Xv3c0=;
        b=ZNvgip3b/HjkQ0DwAcS8vqZDHfHuB7XCJnjqXy1jLieel6QzuUTSpJ1qVVFkaT7zVp
         CjK4KjHwG+GBjlv4Y6i1lYv/njU1jTdV0fmTA1u62esh7xwHWodO4uVyLaF6SPIiBLIG
         b6shiHbUpjLHjtXG/S0guBudGAtbU+6Yh/Vm0wHUf7CFKczEE+UX9Xs+kn6+7hLHbeOH
         2LLKwmJcnjqhRS+ufCZs4Lp4ljhqvD7hxkw0Z+FYNjoI9Ioy0+B8/v6Y3Z3e2ILGuJc+
         YzypaxdF2wSvKGpk4SIFZbn+FRO5s4NJkf6X/hE3rPFQnYXk9M8UmuCJINOzktikuypl
         BMIw==
X-Gm-Message-State: APjAAAX9D20OoZctz3hR8j5yB3dmT8UJsoo9fnRagZK7ivjxjg3iWCzX
        sTSFlbkfLBy5vwmnwKNG50X3Ap+6
X-Google-Smtp-Source: APXvYqzXeJsrBM05FF+CVOvVK9sssFUl+QHnshJfoiqGgKytLD4M4wEBeY+S6RBEqTKx0ZahcItYZA==
X-Received: by 2002:adf:f287:: with SMTP id k7mr14564862wro.206.1569857914153;
        Mon, 30 Sep 2019 08:38:34 -0700 (PDT)
Received: from [192.168.1.4] (ip-86-49-35-8.net.upcbroadband.cz. [86.49.35.8])
        by smtp.gmail.com with ESMTPSA id w12sm21332914wrg.47.2019.09.30.08.38.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Sep 2019 08:38:33 -0700 (PDT)
Subject: Re: [PATCH] arm64: dts: renesas: Add /soc dma-ranges
To:     Rob Herring <robh@kernel.org>
Cc:     "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Wolfram Sang <wsa@the-dreams.de>, devicetree@vger.kernel.org,
        "open list:MEDIA DRIVERS FOR RENESAS - FCP" 
        <linux-renesas-soc@vger.kernel.org>
References: <20190907161634.27378-1-marek.vasut@gmail.com>
 <CAL_JsqL47dQT-P78j4Ph61fsgA45Ha0AJjDajiMk52yFj++s+g@mail.gmail.com>
 <CAL_JsqK+SwX8Lu+-4UgpLVxL05yTcs8Af9mPVHqzbf6+HF9v3A@mail.gmail.com>
 <0bf7c8c8-d03e-c08e-4879-3d3a2fb90ca7@gmail.com>
 <CAL_JsqJf-TGE-SWWj=6AVbpfuN1AsEdDTSOCOk+iUzTT3yZSgw@mail.gmail.com>
From:   Marek Vasut <marek.vasut@gmail.com>
Message-ID: <9ff6eb72-a01d-37de-8aa1-671406f3d7ac@gmail.com>
Date:   Mon, 30 Sep 2019 17:38:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAL_JsqJf-TGE-SWWj=6AVbpfuN1AsEdDTSOCOk+iUzTT3yZSgw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 9/30/19 5:08 PM, Rob Herring wrote:
> On Mon, Sep 30, 2019 at 7:45 AM Marek Vasut wrote:
>>
>> On 9/24/19 12:33 AM, Rob Herring wrote:
>>> On Fri, Sep 13, 2019 at 10:14 AM Rob Herring wrote:
>>>>
>>>> On Sat, Sep 7, 2019 at 5:16 PM wrote:
>>>>>
>>>>> From: Marek Vasut
>>>>>
>>>>> Add dma-ranges property into /soc node to describe the DMA capabilities
>>>>> of the bus. This is currently needed to translate PCI DMA ranges, which
>>>>> are limited to 32bit addresses.
>>>>
>>>> FYI, I've started working on this problem and issues around
>>>> dma-ranges/dma_mask. Hopefully I'll get some patches out next week.
>>>
>>> I've pushed out a branch here:
>>>
>>> git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git dma-masks
>>>
>>> Can you test it on Renesas. I don't have a real platform having the issue.
>>
>>
>> With the following patches applied:
>>       https://patchwork.ozlabs.org/patch/1144870/
> 
> I'd rather not have yet another instance of {dma-}ranges parsing code.
> With this series[1], dma-ranges gets parsed into resource list for
> you.
> 
>>       https://patchwork.ozlabs.org/patch/1144871/
> 
> How can this one be applied? It would conflict horribly. Plus I think
> it duplicates what's in my series.

I fixed it up real quick, but apparently these are not needed indeed.

[...]

-- 
Best regards,
Marek Vasut
