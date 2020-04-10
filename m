Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 24E901A4321
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Apr 2020 09:45:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725975AbgDJHpO (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 10 Apr 2020 03:45:14 -0400
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:49811 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725776AbgDJHpO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 10 Apr 2020 03:45:14 -0400
X-Originating-IP: 2.224.242.101
Received: from uno.localdomain (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id C5E2A20009;
        Fri, 10 Apr 2020 07:45:11 +0000 (UTC)
Date:   Fri, 10 Apr 2020 09:48:14 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Hyun Kwon <hyunk@xilinx.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH v8 11/13] squash! max9286: Disable overlap window
Message-ID: <20200410074814.gc5f6mwjimbtnvum@uno.localdomain>
References: <20200409121202.11130-1-kieran.bingham+renesas@ideasonboard.com>
 <20200409121202.11130-12-kieran.bingham+renesas@ideasonboard.com>
 <20200409163236.mudhnpvq37wqn3y4@uno.localdomain>
 <cd390e5b-1da6-32c9-458a-a9aa5a29094c@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <cd390e5b-1da6-32c9-458a-a9aa5a29094c@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Kieran,

On Fri, Apr 10, 2020 at 08:14:18AM +0100, Kieran Bingham wrote:
> Hi Jacopo,
>
> On 09/04/2020 17:32, Jacopo Mondi wrote:
> > Hi Kieran,
> >
> > On Thu, Apr 09, 2020 at 01:12:00PM +0100, Kieran Bingham wrote:
> >> Provide a function to control setting of the overlap window, but disable
> >> it by default.
> >>
> >> The function will allow the value to be easily updated in the future,
> >> either statically in the code, or via an external control mechanism.
> >>
> >> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> >> ---
> >>  drivers/media/i2c/max9286.c | 42 +++++++++++++++++++++++++++++++++++++
> >>  1 file changed, 42 insertions(+)
> >>
> >> diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
> >> index 008a93910300..61178ae363d6 100644
> >> --- a/drivers/media/i2c/max9286.c
> >> +++ b/drivers/media/i2c/max9286.c
> >> @@ -118,6 +118,9 @@
> >>  #define MAX9286_REV_FLEN(n)		((n) - 20)
> >>  /* Register 0x49 */
> >>  #define MAX9286_VIDEO_DETECT_MASK	0x0f
> >> +/* Register 0x64 */
> >> +#define MAX9286_ENFSINLAST		BIT(5)
> >> +#define MAX9286_OVLP_WINDOWH_MASK	GENMASK(4, 0)
> >>  /* Register 0x69 */
> >>  #define MAX9286_LFLTBMONMASKED		BIT(7)
> >>  #define MAX9286_LOCKMONMASKED		BIT(6)
> >> @@ -632,6 +635,34 @@ static int max9286_s_stream(struct v4l2_subdev *sd, int enable)
> >>  	return 0;
> >>  }
> >>
> >> +/*
> >> + * The overlap window is a 13 bit value with the low byte in register 0x63 and
> >> + * the high byte(5bits) stored in the least significant bits of register 0x64.
> >                    ^ space
> >
> > But I'm not sure this is useful comment. The register layout is
> > actually the only documented thing of this register :)
>
> Sure, but readers won't necessarily have the documentation :-) I think I
> was just trying to explain what was happening because we have so many
> unidentified registers (i.e. they're all just numbers, so we can't do,
>
>   max9286_write(priv, MAX9286_OVERLAP_LOW, overlap & 0xff);
>   max9286_write(priv, MAX9286_OVERLAP_HIGH, (overlap >> SHIFT) & MASK);
>
> I can drop this comment all the same, although I'd like to document
> clearly that it's a 13-bit value as an input, (not a full 16 bit)
>
> Will this be better suited?
>
>
> /*
>  * The overlap window is a 13 bit value stored across two registers.
>  * The definition and units of the value is undocumented.
>  */

Oh no worries, if you want to keep that comment the first version is
perfectly fine.
