Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 937EE6522B8
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Dec 2022 15:36:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234054AbiLTOgB (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 20 Dec 2022 09:36:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234056AbiLTOfc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 20 Dec 2022 09:35:32 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A79CF186F2;
        Tue, 20 Dec 2022 06:35:28 -0800 (PST)
Received: from [192.168.1.15] (91-154-32-225.elisa-laajakaista.fi [91.154.32.225])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8EC2B4F8;
        Tue, 20 Dec 2022 15:35:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1671546927;
        bh=YQDi/3LJt+gT69X7KRKbaW9jyhfDa/9LxhNPa1qAHbg=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=BMNm1meIM395k4XIZDapWRBvxTmT/h3SZcRS/4e8M3wthEAjjQq2Btjn6YXnnEfd6
         MPy2+IiaCioVkLJdzobYiJ4MyyBoe/VqRyGLNqMgd0CNiQypRWIiQ6PaQvM7BuWyzz
         L2MLOloRFDbmsS2BrOE3FIYZ0JgXS+iC7p+UX94o=
Message-ID: <af2bf62c-2a25-addc-5250-935e125ac009@ideasonboard.com>
Date:   Tue, 20 Dec 2022 16:35:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 1/7] media: Add 2-10-10-10 RGB formats
Content-Language: en-US
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-renesas-soc@vger.kernel.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Geert Uytterhoeven <geert@linux-m68k.org>
References: <20221219140139.294245-1-tomi.valkeinen+renesas@ideasonboard.com>
 <20221219140139.294245-2-tomi.valkeinen+renesas@ideasonboard.com>
 <Y6C3PtnjAdv/seMy@pendragon.ideasonboard.com>
 <cfbb8f85-2bf9-4623-96bd-c05390a57a10@ideasonboard.com>
 <Y6HFmVXL/A/gazTn@pendragon.ideasonboard.com>
From:   Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
In-Reply-To: <Y6HFmVXL/A/gazTn@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 20/12/2022 16:24, Laurent Pinchart wrote:
> Hi Tomi,
> 
> On Tue, Dec 20, 2022 at 04:12:29PM +0200, Tomi Valkeinen wrote:
>> On 19/12/2022 21:10, Laurent Pinchart wrote:
>>> On Mon, Dec 19, 2022 at 04:01:33PM +0200, Tomi Valkeinen wrote:
>>>> Add XBGR2101010, ABGR2101010 and BGRA1010102 formats.
>>>>
>>>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
>>>> ---
>>>>    .../userspace-api/media/v4l/pixfmt-rgb.rst    | 194 ++++++++++++++++++
>>>>    drivers/media/v4l2-core/v4l2-ioctl.c          |   3 +
>>>>    include/uapi/linux/videodev2.h                |   3 +
>>>>    3 files changed, 200 insertions(+)
>>>>
>>>> diff --git a/Documentation/userspace-api/media/v4l/pixfmt-rgb.rst b/Documentation/userspace-api/media/v4l/pixfmt-rgb.rst
>>>> index 30f51cd33f99..de78cd2dcd73 100644
>>>> --- a/Documentation/userspace-api/media/v4l/pixfmt-rgb.rst
>>>> +++ b/Documentation/userspace-api/media/v4l/pixfmt-rgb.rst
>>>> @@ -763,6 +763,200 @@ nomenclature that instead use the order of components as seen in a 24- or
>>>>        \normalsize
>>>>    
>>>>    
>>>> +10 Bits Per Component
>>>> +=====================
>>>> +
>>>> +These formats store a 30-bit RGB triplet with an optional 2 bit alpha in four
>>>> +bytes. They are named based on the order of the RGB components as seen in a
>>>> +32-bit word, which is then stored in memory in little endian byte order
>>>> +(unless otherwise noted by the presence of bit 31 in the 4CC value), and on the
>>>> +number of bits for each component.
>>>> +
>>>> +.. raw:: latex
>>>> +
>>>> +    \begingroup
>>>> +    \tiny
>>>> +    \setlength{\tabcolsep}{2pt}
>>>> +
>>>> +.. tabularcolumns:: |p{2.8cm}|p{2.0cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|
>>>> +
>>>> +
>>>> +.. flat-table:: RGB Formats 10 Bits Per Color Component
>>>> +    :header-rows:  2
>>>> +    :stub-columns: 0
>>>> +
>>>> +    * - Identifier
>>>> +      - Code
>>>> +      - :cspan:`7` Byte 0 in memory
>>>> +      - :cspan:`7` Byte 1
>>>> +      - :cspan:`7` Byte 2
>>>> +      - :cspan:`7` Byte 3
>>>> +    * -
>>>> +      -
>>>> +      - 7
>>>> +      - 6
>>>> +      - 5
>>>> +      - 4
>>>> +      - 3
>>>> +      - 2
>>>> +      - 1
>>>> +      - 0
>>>> +
>>>> +      - 7
>>>> +      - 6
>>>> +      - 5
>>>> +      - 4
>>>> +      - 3
>>>> +      - 2
>>>> +      - 1
>>>> +      - 0
>>>> +
>>>> +      - 7
>>>> +      - 6
>>>> +      - 5
>>>> +      - 4
>>>> +      - 3
>>>> +      - 2
>>>> +      - 1
>>>> +      - 0
>>>> +
>>>> +      - 7
>>>> +      - 6
>>>> +      - 5
>>>> +      - 4
>>>> +      - 3
>>>> +      - 2
>>>> +      - 1
>>>> +      - 0
>>>> +    * .. _V4L2-PIX-FMT-XBGR2101010:
>>>> +
>>>> +      - ``V4L2_PIX_FMT_XBGR2101010``
>>>> +      - 'RX30'
>>>> +
>>>> +      - b\ :sub:`5`
>>>> +      - b\ :sub:`4`
>>>> +      - b\ :sub:`3`
>>>> +      - b\ :sub:`2`
>>>> +      - b\ :sub:`1`
>>>> +      - b\ :sub:`0`
>>>> +      - x
>>>> +      - x
>>>> +
>>>> +      - g\ :sub:`3`
>>>> +      - g\ :sub:`2`
>>>> +      - g\ :sub:`1`
>>>> +      - g\ :sub:`0`
>>>> +      - b\ :sub:`9`
>>>> +      - b\ :sub:`8`
>>>> +      - b\ :sub:`7`
>>>> +      - b\ :sub:`6`
>>>> +
>>>> +      - r\ :sub:`1`
>>>> +      - r\ :sub:`0`
>>>> +      - g\ :sub:`9`
>>>> +      - g\ :sub:`8`
>>>> +      - g\ :sub:`7`
>>>> +      - g\ :sub:`6`
>>>> +      - g\ :sub:`5`
>>>> +      - g\ :sub:`4`
>>>> +
>>>> +      - r\ :sub:`9`
>>>> +      - r\ :sub:`8`
>>>> +      - r\ :sub:`7`
>>>> +      - r\ :sub:`6`
>>>> +      - r\ :sub:`5`
>>>> +      - r\ :sub:`4`
>>>> +      - r\ :sub:`3`
>>>> +      - r\ :sub:`2`
>>>> +      -
>>>
>>> This doesn't match the text above. This would be RGBX2101010. I'm not
>>> sure which format you want, so I don't know if it's the documentation or
>>> the format name that is incorrect. The next two formats also seem
>>> incorrect to me.
>>
>> Right, the text should say big endian instead of little endian.
> 
> No, in big-endian format, you would have, for instance,
> V4L2_PIX_FMT_XBGR2101010 defined as
> 
> 	[x, x, B[9:4]], [B[3:0], G[9:6]], [G[5:0], R[1:0]], [R[7:0]]
> 
> in memory byte order, while the format you want to define is
> 
> 	[B[5:0], x, x], [G[3:0], B[9:6]], [R[1:0], G[9:4]], [R[9:2]]

Yes, I see your point.

> The issue here is that 10-bpp formats don't have an integer number of
> bytes per component. They are thus more similar to the 16-bit RGB
> formats, where the macro named defined the order in a 16-bit word, which
> was then stored in little-endian format in memory. For 24-bit and 32-bit
> formats, we departed from that rule by using the byte memory order in
> the macro name. For 10-bpp RGB formats we can't do so anymore. The most
> sensible option is thus, I think, to use the same naming scheme as the
> 16-bit RGB formats, which incidentaly matches the DRM naming scheme.

I agree. It wasn't quite clear to me if Hans agreed to that in the patch 
7 discussions, but as you say, maybe that's the only option that makes 
sense.

  Tomi

