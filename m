Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D95A66424E9
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  5 Dec 2022 09:43:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232157AbiLEIn5 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 5 Dec 2022 03:43:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232204AbiLEIny (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 5 Dec 2022 03:43:54 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0214512632
        for <linux-renesas-soc@vger.kernel.org>; Mon,  5 Dec 2022 00:43:50 -0800 (PST)
Received: from [192.168.1.15] (91-154-32-225.elisa-laajakaista.fi [91.154.32.225])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id EBDEF327;
        Mon,  5 Dec 2022 09:43:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1670229828;
        bh=gb9HiMzvBD3lRDj3FPs9901rvma7YOeKxxV35uCPnLg=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=KT4mmu143uu0jybj/Z+Osjg+b+lwBEb8aNsVMZuIejdgVqrtIybJORXL7ICwtzq+9
         xCki+yNp6SoCP56KhvTfGA2AL6Dl2G+1EgSVCxOvLi3iafX7O9cBwSCXrrmFpA4VnV
         Tih+s/qQeYE3M4DyrAlwPsRh/HMJfY7YrnglXMs0=
Message-ID: <8dc1ccf0-f5f1-5569-a436-7107caf71c61@ideasonboard.com>
Date:   Mon, 5 Dec 2022 10:43:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH kms++ v2 4/4] kms++util: Add Y21x drawing support
Content-Language: en-US
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-renesas-soc@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
References: <20221205080339.12801-1-tomi.valkeinen+renesas@ideasonboard.com>
 <20221205080339.12801-5-tomi.valkeinen+renesas@ideasonboard.com>
 <CAMuHMdUW6x1g3VBoHwmZCLo38oM_oA6modHuJi-YZ1shVzHwEA@mail.gmail.com>
From:   Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
In-Reply-To: <CAMuHMdUW6x1g3VBoHwmZCLo38oM_oA6modHuJi-YZ1shVzHwEA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi,

On 05/12/2022 10:34, Geert Uytterhoeven wrote:
> Hi Tomi,
> 
> On Mon, Dec 5, 2022 at 9:07 AM Tomi Valkeinen
> <tomi.valkeinen+renesas@ideasonboard.com> wrote:
>> Add support for drawing Y210, Y212, Y216 pixels.
>>
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> 
> Thanks for your patch!
> 
>> --- a/kms++util/src/drawing.cpp
>> +++ b/kms++util/src/drawing.cpp
> 
>> @@ -179,6 +180,62 @@ static void draw_yuv422_packed_macropixel(IFramebuffer& buf, unsigned x, unsigne
>>          }
>>   }
>>
>> +static void draw_y2xx_packed_macropixel(IFramebuffer& buf, unsigned x, unsigned y,
>> +                                         YUV yuv1, YUV yuv2)
>> +{
>> +       const uint32_t macro_size = 4;
>> +       uint16_t* p = (uint16_t*)(buf.map(0) + buf.stride(0) * y + x * macro_size);
>> +
>> +       switch (buf.format()) {
>> +       case PixelFormat::Y210: {
>> +               // XXX naive expansion to 10 bits, similar to 10-bit funcs in class RGB
>> +               uint16_t y0 = yuv1.y << 2;
> 
> "yuv1.y << 2 | yuv1.y >> 6" etc...

Yes, the current code leaves the lsbs zero. That's done in a few other 
places too. I want to do the proper expansion in some separate class, or 
rather, I want the RGB and YUV classes to contain 16-bit components so 
that we'll just downshift instead of expand. But I have not gotten there 
yet. It's been on my todo-list only for years now...

>> +               uint16_t y1 = yuv2.y << 2;
>> +               uint16_t cb = ((yuv1.u  << 2) + (yuv2.u << 2)) / 2;
>> +               uint16_t cr = ((yuv1.v  << 2) + (yuv2.v << 2)) / 2;
>> +
>> +               // The 10 bits occupy the msb, so we shift left by 16-10 = 6
>> +               write16le(&p[0], y0 << 6);
>> +               write16le(&p[1], cb << 6);
>> +               write16le(&p[2], y1 << 6);
>> +               write16le(&p[3], cr << 6);
>> +               break;
>> +       }
>> +
>> +       case PixelFormat::Y212: {
>> +               // XXX naive expansion to 12 bits
>> +               uint16_t y0 = yuv1.y << 4;
> 
> "yuv1.y << 4 | yuv1.y >> 4" etc.
> 
>> +               uint16_t y1 = yuv2.y << 4;
>> +               uint16_t cb = ((yuv1.u  << 4) + (yuv2.u << 4)) / 2;
>> +               uint16_t cr = ((yuv1.v  << 4) + (yuv2.v << 4)) / 2;
>> +
>> +               // The 10 bits occupy the msb, so we shift left by 16-12 = 4
>> +               write16le(&p[0], y0 << 4);
>> +               write16le(&p[1], cb << 4);
>> +               write16le(&p[2], y1 << 4);
>> +               write16le(&p[3], cr << 4);
>> +               break;
>> +       }
>> +
>> +       case PixelFormat::Y216: {
>> +               // XXX naive expansion to 16 bits
>> +               uint16_t y0 = yuv1.y << 8;
> 
> "yuv1.y << 8 | yuv1.y" etc.
> 
> 
>> +               uint16_t y1 = yuv2.y << 8;
>> +               uint16_t cb = ((yuv1.u  << 8) + (yuv2.u << 8)) / 8;
> 
> Why divide by 8 instead of 2?

Oops, good that someone is awake! That was a mistake.

  Tomi

