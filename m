Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C466B641CF2
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  4 Dec 2022 13:41:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229919AbiLDMle (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 4 Dec 2022 07:41:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229638AbiLDMld (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 4 Dec 2022 07:41:33 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88AD612AE9
        for <linux-renesas-soc@vger.kernel.org>; Sun,  4 Dec 2022 04:41:32 -0800 (PST)
Received: from [192.168.1.15] (91-154-32-225.elisa-laajakaista.fi [91.154.32.225])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3826532A;
        Sun,  4 Dec 2022 13:41:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1670157690;
        bh=iq4MKaLe3lthTQs1l0i6wrE2s5mtrNKhAA1GpmJwIpQ=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=hrtnKcQko++cJcfe1mDIigMeE+v6dsjUhecUXupBU+stAr/mKM91MkoyQs8tXR6Ut
         jHjFtb0Hj9jiSS+y2/1DwUEp7b8WeYwGNjy+BfeASf0h4voPpTywObV8MHc3UG3KRD
         bNRxcWO8NETCR/vldquv9IwsA8Tf9l1wE8i7Y3zs=
Message-ID: <a7db3cbb-af2a-1ad0-3c8a-51875c8ae652@ideasonboard.com>
Date:   Sun, 4 Dec 2022 14:41:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH kms++ 4/4] kms++util: Add Y210 drawing support
Content-Language: en-US
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
References: <20221202131658.434114-1-tomi.valkeinen+renesas@ideasonboard.com>
 <20221202131658.434114-5-tomi.valkeinen+renesas@ideasonboard.com>
 <Y4qR2lAKELIOVcFQ@pendragon.ideasonboard.com>
From:   Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
In-Reply-To: <Y4qR2lAKELIOVcFQ@pendragon.ideasonboard.com>
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

On 03/12/2022 02:01, Laurent Pinchart wrote:
> Hi Tomi,
> 
> Thank you for the patch.
> 
> On Fri, Dec 02, 2022 at 03:16:58PM +0200, Tomi Valkeinen wrote:
>> Add support for drawing Y210 pixels.
>>
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
>> ---
>>   kms++util/src/drawing.cpp | 31 +++++++++++++++++++++++++++++++
>>   1 file changed, 31 insertions(+)
>>
>> diff --git a/kms++util/src/drawing.cpp b/kms++util/src/drawing.cpp
>> index 79e0d90..7e1b40b 100644
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
>> @@ -179,6 +180,32 @@ static void draw_yuv422_packed_macropixel(IFramebuffer& buf, unsigned x, unsigne
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
>> +		// XXX naive shift left, similar to 10-bit funcs in class RGB
> 
> As mentioned in replies to the cover letter, values should be shifted by
> 6 bits.
> 
>> +		uint16_t y0 = yuv1.y << 2;
>> +		uint16_t y1 = yuv2.y << 2;
>> +		uint16_t cb = ((yuv1.u  << 2) + (yuv2.u << 2)) / 2;
>> +		uint16_t cr = ((yuv1.v  << 2) + (yuv2.v << 2)) / 2;
>> +
>> +		write16le(y0, &p[0]);
>> +		write16le(cb, &p[1]);
>> +		write16le(y1, &p[2]);
>> +		write16le(cr, &p[3]);
> 
> If x is odd, won't this swap cb and cr ? draw_yuv422_packed_macropixel()
> seems to have the same possible issue, so I assume callers always pass
> an even x value. If so,

Yes, a macro pixel always needs to be correctly aligned. With YUYV style 
macropixels it's even aligned. The test pattern drawing handles this 
correctly, but I'm not sure if all the funcs available to the users 
check it correctly.

  Tomi

