Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D9A232ECE0
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Mar 2021 15:15:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229737AbhCEOPO (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 5 Mar 2021 09:15:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230415AbhCEOPM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 5 Mar 2021 09:15:12 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 338DCC061574;
        Fri,  5 Mar 2021 06:15:12 -0800 (PST)
Received: from [192.168.0.20] (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 94F8FCC;
        Fri,  5 Mar 2021 15:15:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1614953710;
        bh=Cbw6099cw1FB1FobLkAEAw3yWtepurQfxncP/jwuB7I=;
        h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=cSxv4MLvux3c+IsjnZe5QMAE+kF+28lDaW5MJjRvIoUc0Yw+7PiPhmMI0poF8+Ao8
         OwbLoWJeIyLT2C2C73DeAuOWtSQDapLTtsrZ8y4WRYrrh/E7bpzXIOlov3F8UYO/Ui
         JpJ2VGeArrebF/kvS0KHDE+PMO0Jbrry0+lGKEfE=
Reply-To: kieran.bingham+renesas@ideasonboard.com
Subject: Re: [PATCH] arm64: dts: renesas: falcon: Add GP LEDs
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20210304165300.295952-1-kieran.bingham+renesas@ideasonboard.com>
 <CAMuHMdWRe0HVzQD9U_8+35_HTaK28Ayb+9tsb8q5+3VNpYniHg@mail.gmail.com>
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <17ee8b80-8522-7fb5-508d-6be18dea36d8@ideasonboard.com>
Date:   Fri, 5 Mar 2021 14:15:08 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAMuHMdWRe0HVzQD9U_8+35_HTaK28Ayb+9tsb8q5+3VNpYniHg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 05/03/2021 14:10, Geert Uytterhoeven wrote:
> Hi Kieran,
> 
> On Thu, Mar 4, 2021 at 5:53 PM Kieran Bingham
> <kieran.bingham+renesas@ideasonboard.com> wrote:
>> Three general purpose LEDs are provided on the Falcon CPU board.
>>
>> Connect GP_LED1, GP_LED2, and GP_LED3 to the gpio-leds frameworks.
>> These LEDs are arranged in a block of four LEDs on the board itself, but
>> the fourth LED is as yet unidentified.
>>
>> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> 
> Thanks for your patch!
> 
>> --- a/arch/arm64/boot/dts/renesas/r8a779a0-falcon.dts
>> +++ b/arch/arm64/boot/dts/renesas/r8a779a0-falcon.dts
> 
> I believe the LEDs are on the CPU board, so they belong in
> r8a779a0-falcon-cpu.dtsi instead?

Yes, I hadn't quite grasped the layouts of this new board yet.

Sorry - I'll move it.


> 
>> @@ -20,6 +20,20 @@ aliases {
>>         chosen {
>>                 stdout-path = "serial0:115200n8";
>>         };
>> +
>> +       leds {
>> +               compatible = "gpio-leds";
>> +
>> +               led1 {
>> +                       gpios = <&gpio4 18 GPIO_ACTIVE_HIGH>;
> 
> Any need for other properties from
> Documentation/devicetree/bindings/leds/common.yaml, like
> color = <LED_COLOR_ID_GREEN>?

Oh, I wasn't aware of those. But indeed the LED is green, so it seems
appropriate.

I'll test it out, and see if I can make it glow red (jokes).


> 
>> +               };
>> +               led2 {
>> +                       gpios = <&gpio4 19 GPIO_ACTIVE_HIGH>;
>> +               };
>> +               led3 {
>> +                       gpios = <&gpio4 20 GPIO_ACTIVE_HIGH>;
>> +               };
>> +       };
>>  };
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 

