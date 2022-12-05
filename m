Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7CAD964247E
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  5 Dec 2022 09:24:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232068AbiLEIYn (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 5 Dec 2022 03:24:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231812AbiLEIYk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 5 Dec 2022 03:24:40 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E52F7A1A9
        for <linux-renesas-soc@vger.kernel.org>; Mon,  5 Dec 2022 00:24:33 -0800 (PST)
Received: from [192.168.1.15] (91-154-32-225.elisa-laajakaista.fi [91.154.32.225])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 30F4425B;
        Mon,  5 Dec 2022 09:24:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1670228672;
        bh=SO9Ex6Or5HYFmLuLB8DhK3g4apxt+z98dVKj4oDbdlk=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=YCPM9n427Y+Y5BZ6b4sjYvnrNql0Qjf5kAWFyRhpLvtuZj9OKvmt32ERZoFLYkTIu
         SWDv5oB6w4Y7V7teWDLRTt3TaVFCakb2K1sRCBVYkVgHfgsXdzmvBYVWDgNpZPf9gp
         NeLQuenMyZLpUf+KQ3+boG3vm7mL+s4O2KhEs2FY=
Message-ID: <3ffbddbd-3a28-9950-ae2f-f60e1bd829de@ideasonboard.com>
Date:   Mon, 5 Dec 2022 10:24:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH kms++ v2 4/4] kms++util: Add Y21x drawing support
Content-Language: en-US
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
References: <20221205080339.12801-1-tomi.valkeinen+renesas@ideasonboard.com>
 <20221205080339.12801-5-tomi.valkeinen+renesas@ideasonboard.com>
 <Y42o/eaEDIxxYf2X@pendragon.ideasonboard.com>
From:   Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
In-Reply-To: <Y42o/eaEDIxxYf2X@pendragon.ideasonboard.com>
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

On 05/12/2022 10:17, Laurent Pinchart wrote:
> Hi Tomi,
> 
> Thank you for the patch.
> 
> On Mon, Dec 05, 2022 at 10:03:39AM +0200, Tomi Valkeinen wrote:
>> Add support for drawing Y210, Y212, Y216 pixels.
>>
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
>> ---
>>   kms++util/src/drawing.cpp | 63 +++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 63 insertions(+)
>>
>> diff --git a/kms++util/src/drawing.cpp b/kms++util/src/drawing.cpp
>> index 79e0d90..5764b08 100644
>> --- a/kms++util/src/drawing.cpp
>> +++ b/kms++util/src/drawing.cpp
>> @@ -3,6 +3,7 @@
>>   
>>   #include <kms++/kms++.h>
>>   #include <kms++util/kms++util.h>
>> +#include <kms++util/endian.h>
>>   
>>   using namespace std;
>>   
>> @@ -179,6 +180,62 @@ static void draw_yuv422_packed_macropixel(IFramebuffer& buf, unsigned x, unsigne
>>   	}
>>   }
>>   
>> +static void draw_y2xx_packed_macropixel(IFramebuffer& buf, unsigned x, unsigned y,
>> +					  YUV yuv1, YUV yuv2)
>> +{
>> +	const uint32_t macro_size = 4;
>> +	uint16_t* p = (uint16_t*)(buf.map(0) + buf.stride(0) * y + x * macro_size);
>> +
>> +	switch (buf.format()) {
>> +	case PixelFormat::Y210: {
>> +		// XXX naive expansion to 10 bits, similar to 10-bit funcs in class RGB
>> +		uint16_t y0 = yuv1.y << 2;
>> +		uint16_t y1 = yuv2.y << 2;
>> +		uint16_t cb = ((yuv1.u  << 2) + (yuv2.u << 2)) / 2;
>> +		uint16_t cr = ((yuv1.v  << 2) + (yuv2.v << 2)) / 2;
>> +
>> +		// The 10 bits occupy the msb, so we shift left by 16-10 = 6
>> +		write16le(&p[0], y0 << 6);
>> +		write16le(&p[1], cb << 6);
>> +		write16le(&p[2], y1 << 6);
>> +		write16le(&p[3], cr << 6);
>> +		break;
>> +	}
>> +
>> +	case PixelFormat::Y212: {
>> +		// XXX naive expansion to 12 bits
>> +		uint16_t y0 = yuv1.y << 4;
>> +		uint16_t y1 = yuv2.y << 4;
>> +		uint16_t cb = ((yuv1.u  << 4) + (yuv2.u << 4)) / 2;
>> +		uint16_t cr = ((yuv1.v  << 4) + (yuv2.v << 4)) / 2;
>> +
>> +		// The 10 bits occupy the msb, so we shift left by 16-12 = 4
>> +		write16le(&p[0], y0 << 4);
>> +		write16le(&p[1], cb << 4);
>> +		write16le(&p[2], y1 << 4);
>> +		write16le(&p[3], cr << 4);
>> +		break;
>> +	}
>> +
>> +	case PixelFormat::Y216: {
>> +		// XXX naive expansion to 16 bits
>> +		uint16_t y0 = yuv1.y << 8;
>> +		uint16_t y1 = yuv2.y << 8;
>> +		uint16_t cb = ((yuv1.u  << 8) + (yuv2.u << 8)) / 8;
>> +		uint16_t cr = ((yuv1.v  << 8) + (yuv2.v << 8)) / 8;
>> +
>> +		write16le(&p[0], y0);
>> +		write16le(&p[1], cb);
>> +		write16le(&p[2], y1);
>> +		write16le(&p[3], cr);
>> +		break;
> 
> These three cases end up all shifting left by 8 bits. It looks like you
> could simplify the code by merging all implementations into one.

That's true. I'd like to expand the RGB and YUV classes to contain 
16-bits per component pixels. Then this code will change a bit, as 
instead of shifting we'll need to zero-out the lsbs in Y210 and Y212.

  Tomi

