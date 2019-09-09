Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 92BA6AD56E
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Sep 2019 11:13:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728221AbfIIJNA (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 9 Sep 2019 05:13:00 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:41081 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728145AbfIIJNA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 9 Sep 2019 05:13:00 -0400
Received: by mail-wr1-f65.google.com with SMTP id h7so11923993wrw.8;
        Mon, 09 Sep 2019 02:12:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=TOP8rH1TcBHjVsyQobZq5kxXku7IvcnwfDzFzX6ktls=;
        b=Sv8yMv7xWt1DU0bHbjx4WGaKAEH2FbWTCT1B3GV/rJSUcpK/1GQcFX4FuLgFfsZOKa
         PLL7yTCayUCymevxbuf6OvYGTm6lIL2f2N38QcVO/SVNbncxw3jlcyMINcongJ+veK/K
         WKwxxe0w88kA1DR5AEZIs4ut9Ry4fNM4AfKW13ABvzeFi0C7ANmVuXeDWxmJ5DVogeZ0
         wvLnTJzpEa//JsqQqN+uwvXWaf7z0CjSOsCQ8LybnM7dY3pGDs4SBiyKZrcL7cwpBkF9
         eGhkWJC3GZOr+0ewc8n9gxQeqeS79JlbeOjnch8PLwDFctTtUkV83rHtbO1PqFVgA5Jr
         8eqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=TOP8rH1TcBHjVsyQobZq5kxXku7IvcnwfDzFzX6ktls=;
        b=oN7pyatYgjk08ac1lK5SwkJRJqpFOaAEgSXfOD1R/aqy4dQpp4EfmwEdccSweE9Moc
         nSpOlOAMbJtawT8Y5xGcUowHH4GnkANMCoDZEyez+RM6wWID3/y1rkTeUjIa0KjORYZu
         PctGkP3CKR24q7LSwSFznbTMp7ca47bvlEYa2eJ+xnx6C6Z1SvPlBbL3pIggUQ+vexii
         QlITegC5WODlJe7NCEmADEROJ14CwyEhx0KQRSGS40SpzUI6Zs2Gqb2oTIfAijwr6HWn
         6RlV2Avyqyuj2sSE4GTpuXGsInM12A69+Fzdab1vmKBBmd1gODWJicWy/bEd5Q0I+BBt
         SqBA==
X-Gm-Message-State: APjAAAWDQTFUBtGLCCjc+o8ks3+V80/5asIXZBlFvicw+yDEnQ4EeiWu
        yungKe2TjtPxVsHsUmY2TItUcJYNZmk=
X-Google-Smtp-Source: APXvYqzcUrHe6QFnvn3wlKYzRx00vQB3EZSjYjgCfq1vAk3l2W2TkecTuseCX/pslokvp8gon/nXEw==
X-Received: by 2002:adf:ce81:: with SMTP id r1mr17963489wrn.114.1568020376928;
        Mon, 09 Sep 2019 02:12:56 -0700 (PDT)
Received: from [192.168.42.85] (p578adb1c.dip0.t-ipconnect.de. [87.138.219.28])
        by smtp.gmail.com with ESMTPSA id r17sm13323337wrt.68.2019.09.09.02.12.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Sep 2019 02:12:56 -0700 (PDT)
Subject: Re: [PATCH] arm64: dts: renesas: Add /soc dma-ranges
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Wolfram Sang <wsa@the-dreams.de>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
References: <20190907161634.27378-1-marek.vasut@gmail.com>
 <CAMuHMdXkExZXeXnxuKkMC0J4m56cZUmJpcq2JCXuMv3PBzA0Dg@mail.gmail.com>
 <b77e6a66-be14-4f94-c116-788b8fa18b31@gmail.com>
 <CAMuHMdUWezNDVv+U=VeryssmSFm79zU-ptuKmMechcWBboV1=w@mail.gmail.com>
From:   Marek Vasut <marek.vasut@gmail.com>
Message-ID: <3e7aebea-9394-8e87-2dbd-0b503fc52799@gmail.com>
Date:   Mon, 9 Sep 2019 11:12:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAMuHMdUWezNDVv+U=VeryssmSFm79zU-ptuKmMechcWBboV1=w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 9/9/19 11:05 AM, Geert Uytterhoeven wrote:
> Hi Marek,

Hi,

> On Mon, Sep 9, 2019 at 10:42 AM Marek Vasut <marek.vasut@gmail.com> wrote:
>> On 9/9/19 10:19 AM, Geert Uytterhoeven wrote:
>>> On Sat, Sep 7, 2019 at 6:16 PM <marek.vasut@gmail.com> wrote:
>>>> From: Marek Vasut <marek.vasut+renesas@gmail.com>
>>>>
>>>> Add dma-ranges property into /soc node to describe the DMA capabilities
>>>> of the bus. This is currently needed to translate PCI DMA ranges, which
>>>> are limited to 32bit addresses.
>>>>
>>>> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
>>>
>>> Thanks for your patch!
>>>
>>>> NOTE: This is needed for the following patches to work correctly:
>>>>       https://patchwork.ozlabs.org/patch/1144870/
>>>>       https://patchwork.ozlabs.org/patch/1144871/
>>>
>>> What happens with the above patches applied, and without this one?
>>
>> It triggers https://patchwork.kernel.org/patch/11087391/#22811745
> 
> Sure. But what does that mean?
> PCI devices just not working?
> Random memory corruption?
> System lockup?
> Anything else?

Instead of translating the PCI DMA range to 0x40000000-0xffffffff , the
PCI code in the aforementioned patches defaults to maximum range, which
prevents various devices from working correctly, as the buffers get
allocated above the 32bit boundary.

>>> As PCI/OF driver patches go in through different trees, is it safe to apply
>>> this patch now?
>>> Should they go in together?
>>
>> I didn't get any feedback on the other two patches, but this one here is
>> safe to go in either way.
>>
>>>>  arch/arm64/boot/dts/renesas/r8a7795.dtsi  | 1 +
>>>>  arch/arm64/boot/dts/renesas/r8a7796.dtsi  | 1 +
>>>>  arch/arm64/boot/dts/renesas/r8a77965.dtsi | 1 +
>>>
>>> Do we need similar patches for the other R-Car Gen3 and RZ/G2 DTS files?
>>> What about R-Car Gen2 and RZ/G1?
>> I suspect we need such patches for any ARM64 machine with PCIe with this
>> 32bit limitation.
> 
> What about R-Car Gen2 and RZ/G1, which are ARM32, with LPAE?

Presumably we need that too ?

-- 
Best regards,
Marek Vasut
