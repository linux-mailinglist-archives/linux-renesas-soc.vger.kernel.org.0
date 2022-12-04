Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BE10E641D1C
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  4 Dec 2022 13:51:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229753AbiLDMvh (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 4 Dec 2022 07:51:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229539AbiLDMvh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 4 Dec 2022 07:51:37 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54041270A
        for <linux-renesas-soc@vger.kernel.org>; Sun,  4 Dec 2022 04:51:36 -0800 (PST)
Received: from [192.168.1.15] (91-154-32-225.elisa-laajakaista.fi [91.154.32.225])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7F20B32A;
        Sun,  4 Dec 2022 13:51:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1670158294;
        bh=z5unN2zZBINw5N8Ue8bgXUYPRmUsHnM46Ycl3wfn5H4=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=ttKOPzp8DQ7TF8vjyr/spAwWMqUO4UV1ktrGRVpBdpXGkJA+H3nycMIhJaj/WRvrU
         p5VkBw9NTn/xdf7bxp6bfGsGrDZshVcA71Qkf9ZyvbrLV8iSLICfnXGj7gs2iSDszr
         B4EB/tt8mMUsDtq812Xev9XyyMBd0peZgPS8/AcU=
Message-ID: <d1aee242-fc5e-3dd0-ca34-28e4f78edf05@ideasonboard.com>
Date:   Sun, 4 Dec 2022 14:51:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH kms++ 0/4] Support Y210
Content-Language: en-US
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
References: <20221202131658.434114-1-tomi.valkeinen+renesas@ideasonboard.com>
 <8f147834-095b-caae-fec1-66b1740ff1c2@ideasonboard.com>
 <CAMuHMdXHzDh-F4Bm=7kERQYnodt3JncAGPNFQwfHg5PaJfcCyA@mail.gmail.com>
 <3e925b7f-8c8c-db2d-296c-5ae41b500891@ideasonboard.com>
 <Y4qOo0lYKOeQnP2i@pendragon.ideasonboard.com>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <Y4qOo0lYKOeQnP2i@pendragon.ideasonboard.com>
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

On 03/12/2022 01:47, Laurent Pinchart wrote:
> On Fri, Dec 02, 2022 at 06:06:01PM +0200, Tomi Valkeinen wrote:
>> On 02/12/2022 17:56, Geert Uytterhoeven wrote:
>>> On Fri, Dec 2, 2022 at 4:32 PM Tomi Valkeinen wrote:
>>>> On 02/12/2022 15:16, Tomi Valkeinen wrote:
>>>>> These kms++ patches add support for Y210 format.
>>>>>
>>>>> I didn't find a super clear description of the byte order for Y210
>>>>> anywhere.  If someone knows what it is supposed to be, I'd appreciate
>>>>> verifying the code =).
>>>>
>>>> Actually, this:
>>>>
>>>> https://learn.microsoft.com/en-us/windows/win32/medfound/10-bit-and-16-bit-yuv-video-formats#overview
>>>>
>>>> indicates that the 10-bit values should be shifted by 6. So the drawing
>>>> code in this series is probably not right.
>>>
>>> https://elixir.bootlin.com/linux/latest/source/include/uapi/drm/drm_fourcc.h#L212
>>> seems to confirm that?
>>
>> Hmm, indeed. I've looked at that before but I couldn't decipher it, but
>> now the text makes sense. Although afaics, it doesn't say that each
>> component is a 16-bit little endian. And I don't get the "little endian
>> per 2 Y pixels".
>>
>> So if I get this right...
>>
>> The first byte in memory is the two lowest bits of Y0 in bits 6 and 7.
>> The rest of the first byte is zero padding.
>>
>> The second byte is the 8 highest bits of Y0.
>>
>> Then following the same method, Cb, Y1, Cr.
> 
> I would have said in bits 7 and 6 for the first byte, but I assume we
> mean the same. Apart from that, your interpretation is the same as mind.
> However, if your aim is to support the 10bpp YUV 4:2:2 format of the
> VSP, I'm not sure this is correct. Assuming you plan to set F2B=1 to
> align bits towards the MSB, it's not clear if the endianness can be
> configured. The four permutations of the packed YUYV components are
> achievable as far as I can tell (see figure 60.12 in the documentation),
> but I didn't immediately find a place where the endianness of each
> 16-bit value could be configured. Figure 60.15 mentions "example in case
> of big endian", I don't know if it's an example, or the only possible
> option. You may want to try both.

The pixel format can be set using F2B and swap options in VI6_RPFn_DSWAP 
(Table 60.14). I have Y210 working (and I have had multiple other 
variations working too). And by "working" I mean that it looks good to 
me, but I can only see it via a web meeting as the board is at Kieran's.

The HW seems to be very versatile, and a lot of different variations can 
be supported, especially for RGB formats. So this has been a bit 
difficult as I didn't have any ready and validated test tool to draw 
Y210, but I hope I got it working now correctly in kms++.

I don't know what format for 10-bit YUV Renesas really needs, but the 
BSP commits said Y210, so that's what I added. Although afaik, the DU 
only handles 8-bits per component, so I'm not sure what's the benefit of 
10-bit formats (especially for RGB).

  Tomi

