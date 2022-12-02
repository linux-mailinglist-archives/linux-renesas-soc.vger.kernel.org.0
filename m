Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 14F41640A2C
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  2 Dec 2022 17:06:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233663AbiLBQG2 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 2 Dec 2022 11:06:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233844AbiLBQGN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 2 Dec 2022 11:06:13 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7B81EAA
        for <linux-renesas-soc@vger.kernel.org>; Fri,  2 Dec 2022 08:06:05 -0800 (PST)
Received: from [192.168.1.15] (91-154-32-225.elisa-laajakaista.fi [91.154.32.225])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0D8896E0;
        Fri,  2 Dec 2022 17:06:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1669997164;
        bh=ooFJEHGqARuufFw5oi8/LYFp9AlUo19OfTtzcDpQvd4=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=KNh6uGbL/sM59SsJ4qJKxVYz1g0xu+HvAXle/Gc9onA9ThSFFOfbmCnVUIJF1LUWo
         KMvLsS+ecqefGjn/7FeeOAeuyJvZojqncSPpuKbp+uqhEMJit2LTVoaI9FXjFN1ARF
         7nQ9NoJ1t0IgTzNPHQXkbneH5D23YBgEvwmqHbXY=
Message-ID: <3e925b7f-8c8c-db2d-296c-5ae41b500891@ideasonboard.com>
Date:   Fri, 2 Dec 2022 18:06:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH kms++ 0/4] Support Y210
Content-Language: en-US
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
References: <20221202131658.434114-1-tomi.valkeinen+renesas@ideasonboard.com>
 <8f147834-095b-caae-fec1-66b1740ff1c2@ideasonboard.com>
 <CAMuHMdXHzDh-F4Bm=7kERQYnodt3JncAGPNFQwfHg5PaJfcCyA@mail.gmail.com>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <CAMuHMdXHzDh-F4Bm=7kERQYnodt3JncAGPNFQwfHg5PaJfcCyA@mail.gmail.com>
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

On 02/12/2022 17:56, Geert Uytterhoeven wrote:
> Hi Tomi,
> 
> On Fri, Dec 2, 2022 at 4:32 PM Tomi Valkeinen
> <tomi.valkeinen@ideasonboard.com> wrote:
>> On 02/12/2022 15:16, Tomi Valkeinen wrote:
>>> These kms++ patches add support for Y210 format.
>>>
>>> I didn't find a super clear description of the byte order for Y210
>>> anywhere.  If someone knows what it is supposed to be, I'd appreciate
>>> verifying the code =).
>>
>> Actually, this:
>>
>> https://learn.microsoft.com/en-us/windows/win32/medfound/10-bit-and-16-bit-yuv-video-formats#overview
>>
>> indicates that the 10-bit values should be shifted by 6. So the drawing
>> code in this series is probably not right.
> 
> https://elixir.bootlin.com/linux/latest/source/include/uapi/drm/drm_fourcc.h#L212
> seems to confirm that?

Hmm, indeed. I've looked at that before but I couldn't decipher it, but 
now the text makes sense. Although afaics, it doesn't say that each 
component is a 16-bit little endian. And I don't get the "little endian 
per 2 Y pixels".

So if I get this right...

The first byte in memory is the two lowest bits of Y0 in bits 6 and 7. 
The rest of the first byte is zero padding.

The second byte is the 8 highest bits of Y0.

Then following the same method, Cb, Y1, Cr.

  Tomi

