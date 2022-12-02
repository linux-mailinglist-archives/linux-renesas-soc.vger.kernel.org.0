Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C350B6411A5
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  3 Dec 2022 00:47:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229657AbiLBXr4 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 2 Dec 2022 18:47:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233221AbiLBXry (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 2 Dec 2022 18:47:54 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BDDE26101
        for <linux-renesas-soc@vger.kernel.org>; Fri,  2 Dec 2022 15:47:51 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2A9C225B;
        Sat,  3 Dec 2022 00:47:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1670024869;
        bh=jSiRi8YXuYU2pmHC1o5nJ5m0bheal76mVI/fJBSdyvk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=tgfPq5u/dw3Bt1RSFRaGapdMREhNQxQBD/U2iw5sFelIzfQVGhzXgecA4chEQJt2w
         Y25cm5U6VlH0s6zh1VRG6y6wHEwIA3vGc8kSWdjsGzxOZM6CHsJBAhneVPN9SpSpum
         wB4lvyybKmY9cEn0O8I0OOItJ3mV75PrtWQWxZVQ=
Date:   Sat, 3 Dec 2022 01:47:47 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: Re: [PATCH kms++ 0/4] Support Y210
Message-ID: <Y4qOo0lYKOeQnP2i@pendragon.ideasonboard.com>
References: <20221202131658.434114-1-tomi.valkeinen+renesas@ideasonboard.com>
 <8f147834-095b-caae-fec1-66b1740ff1c2@ideasonboard.com>
 <CAMuHMdXHzDh-F4Bm=7kERQYnodt3JncAGPNFQwfHg5PaJfcCyA@mail.gmail.com>
 <3e925b7f-8c8c-db2d-296c-5ae41b500891@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <3e925b7f-8c8c-db2d-296c-5ae41b500891@ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Dec 02, 2022 at 06:06:01PM +0200, Tomi Valkeinen wrote:
> On 02/12/2022 17:56, Geert Uytterhoeven wrote:
> > On Fri, Dec 2, 2022 at 4:32 PM Tomi Valkeinen wrote:
> >> On 02/12/2022 15:16, Tomi Valkeinen wrote:
> >>> These kms++ patches add support for Y210 format.
> >>>
> >>> I didn't find a super clear description of the byte order for Y210
> >>> anywhere.  If someone knows what it is supposed to be, I'd appreciate
> >>> verifying the code =).
> >>
> >> Actually, this:
> >>
> >> https://learn.microsoft.com/en-us/windows/win32/medfound/10-bit-and-16-bit-yuv-video-formats#overview
> >>
> >> indicates that the 10-bit values should be shifted by 6. So the drawing
> >> code in this series is probably not right.
> > 
> > https://elixir.bootlin.com/linux/latest/source/include/uapi/drm/drm_fourcc.h#L212
> > seems to confirm that?
> 
> Hmm, indeed. I've looked at that before but I couldn't decipher it, but 
> now the text makes sense. Although afaics, it doesn't say that each 
> component is a 16-bit little endian. And I don't get the "little endian 
> per 2 Y pixels".
> 
> So if I get this right...
> 
> The first byte in memory is the two lowest bits of Y0 in bits 6 and 7. 
> The rest of the first byte is zero padding.
> 
> The second byte is the 8 highest bits of Y0.
> 
> Then following the same method, Cb, Y1, Cr.

I would have said in bits 7 and 6 for the first byte, but I assume we
mean the same. Apart from that, your interpretation is the same as mind.
However, if your aim is to support the 10bpp YUV 4:2:2 format of the
VSP, I'm not sure this is correct. Assuming you plan to set F2B=1 to
align bits towards the MSB, it's not clear if the endianness can be
configured. The four permutations of the packed YUYV components are
achievable as far as I can tell (see figure 60.12 in the documentation),
but I didn't immediately find a place where the endianness of each
16-bit value could be configured. Figure 60.15 mentions "example in case
of big endian", I don't know if it's an example, or the only possible
option. You may want to try both.

-- 
Regards,

Laurent Pinchart
