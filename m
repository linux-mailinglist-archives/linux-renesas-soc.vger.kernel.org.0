Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9886F321AC9
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Feb 2021 16:07:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230205AbhBVPHM (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 22 Feb 2021 10:07:12 -0500
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:59677 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229947AbhBVPHJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 22 Feb 2021 10:07:09 -0500
X-Originating-IP: 93.61.96.190
Received: from uno.localdomain (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
        (Authenticated sender: jacopo@jmondi.org)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id AB8D8240003;
        Mon, 22 Feb 2021 15:06:16 +0000 (UTC)
Date:   Mon, 22 Feb 2021 16:06:43 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se, geert@linux-m68k.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 03/16] media: i2c: rdacm20: Replace goto with a loop
Message-ID: <20210222150643.cuv6uye3wpxaykim@uno.localdomain>
References: <20210216174146.106639-1-jacopo+renesas@jmondi.org>
 <20210216174146.106639-4-jacopo+renesas@jmondi.org>
 <c95022bc-3841-4d0a-653c-6d6974e20355@ideasonboard.com>
 <YDMDPymgU/N5wd/i@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YDMDPymgU/N5wd/i@pendragon.ideasonboard.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi,

On Mon, Feb 22, 2021 at 03:05:03AM +0200, Laurent Pinchart wrote:
> Hi Jacopo,
>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>
> On Wed, Feb 17, 2021 at 01:01:26PM +0000, Kieran Bingham wrote:
> > On 16/02/2021 17:41, Jacopo Mondi wrote:
> > > During the camera module initialization the image sensor PID is read to
> > > verify it can correctly be identified. The current implementation is
> > > rather confused and uses a loop implemented with a label and a goto.
> > >
> > > Replace it with a more compact for() loop.
> > >
> > > No functional changes intended.
> >
> > I think there is a functional change in here, but I almost like it.
> >
> > Before, if the read was successful, it would check to see if the
> > OV10635_PID == OV10635_VERSION, and if not it would print that the read
> > was successful but a mismatch.
> >
> > Now - it will retry again instead, and if at the end of the retries it
> > still fails then it's a failure.
> >
> > This means we perhaps don't get told if the device id is not correct in
> > the same way, but it also means that if the VERSION was not correct
> > because of a read error (which I believe i've seen occur), it will retry.
>
> I was going to ask about that, whether we can have a successful I2C read
> operation that would return incorrect data. If we do, aren't we screwed
> ? If there's a non-negligible probability that reads will return
> incorrect data without any way to know about it (for other registers
> than the version register of course), then I would consider that writes
> could fail the same way, and that would mean an unusable device,
> wouldn't it ?
>
> If, on the other hand, read failures can always (or nearly always,
> ignoring space neutrinos and similar niceties) be detected, then I think
> we should avoid the functional change.
>
> > Because there is a functional change you might want to update the
> > commit, but I still think this is a good change overall.
> >

I'm not sure I got your concerns to be honest :/
yes before the code flow was like

        ret = ov10635_read();
        if (ret < 0) {

        }

        if (ret != PID) {

        }

But the condition ret != PID implied ret < 0 so I don't really get
what changes, apart from the fact that in the previous version we
could have had two different error messages for the same issue, and yes,
I saw ID mistmatch happening but the value of knowing the i2c read
didn't fail but the read data was garbage (usually it's 0x01 when it
fails iirc) is, well, questionable.

I'm sorry I didn't fully get this comment.


> > Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> >
> > > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > > ---
> > >  drivers/media/i2c/rdacm20.c | 27 ++++++++++-----------------
> > >  1 file changed, 10 insertions(+), 17 deletions(-)
> > >
> > > diff --git a/drivers/media/i2c/rdacm20.c b/drivers/media/i2c/rdacm20.c
> > > index 4d9bac87cba8..6504ed0bd3bc 100644
> > > --- a/drivers/media/i2c/rdacm20.c
> > > +++ b/drivers/media/i2c/rdacm20.c
> > > @@ -59,6 +59,8 @@
> > >   */
> > >  #define OV10635_PIXEL_RATE		(44000000)
> > >
> > > +#define OV10635_PID_TIMEOUT		3
> > > +
> > >  static const struct ov10635_reg {
> > >  	u16	reg;
> > >  	u8	val;
> > > @@ -452,7 +454,7 @@ static const struct v4l2_subdev_ops rdacm20_subdev_ops = {
> > >
> > >  static int rdacm20_initialize(struct rdacm20_device *dev)
> > >  {
> > > -	unsigned int retry = 3;
> > > +	unsigned int i;
> > >  	int ret;
> > >
> > >  	/* Verify communication with the MAX9271: ping to wakeup. */
> > > @@ -501,23 +503,14 @@ static int rdacm20_initialize(struct rdacm20_device *dev)
> > >  		return ret;
> > >  	usleep_range(10000, 15000);
> > >
> > > -again:
> > > -	ret = ov10635_read16(dev, OV10635_PID);
> > > -	if (ret < 0) {
> > > -		if (retry--)
> > > -			goto again;
> > > -
> > > -		dev_err(dev->dev, "OV10635 ID read failed (%d)\n",
> > > -			ret);
> > > -		return -ENXIO;
> > > +	for (i = 0; i < OV10635_PID_TIMEOUT; ++i) {
> > > +		ret = ov10635_read16(dev, OV10635_PID);
> > > +		if (ret == OV10635_VERSION)
> > > +			break;
> > > +		usleep_range(1000, 2000);
> > >  	}
> > > -
> > > -	if (ret != OV10635_VERSION) {
> > > -		if (retry--)
> > > -			goto again;
> > > -
> > > -		dev_err(dev->dev, "OV10635 ID mismatch (0x%04x)\n",
> > > -			ret);
> > > +	if (i == OV10635_PID_TIMEOUT) {
> > > +		dev_err(dev->dev, "OV10635 ID read failed (%d)\n", ret);
> > >  		return -ENXIO;
> > >  	}
> > >
>
> --
> Regards,
>
> Laurent Pinchart
