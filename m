Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1EDFF226561
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Jul 2020 17:54:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730871AbgGTPxW (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 20 Jul 2020 11:53:22 -0400
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:35767 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731454AbgGTPxV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 20 Jul 2020 11:53:21 -0400
X-Originating-IP: 93.34.118.233
Received: from uno.localdomain (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 4CB441C0002;
        Mon, 20 Jul 2020 15:53:16 +0000 (UTC)
Date:   Mon, 20 Jul 2020 17:56:50 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Janusz Krzysztofik <jmkrzyszt@gmail.com>
Cc:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        niklas.soderlund+renesas@ragnatech.se,
        kieran.bingham@ideasonboard.com, dave.stevenson@raspberrypi.com,
        hyun.kwon@xilinx.com, robert.jarzmik@free.fr,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v7 01/10] media: v4l2-subdev: Introduce
 [get|set]_mbus_config pad ops
Message-ID: <20200720155650.uvnyjzx4nbten3vt@uno.localdomain>
References: <20200716142713.110655-1-jacopo+renesas@jmondi.org>
 <4042930.ejJDZkT8p0@z50>
 <20200717072018.crgmvfrm44kgmvcb@uno.localdomain>
 <22470298.ouqheUzb2q@z50>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <22470298.ouqheUzb2q@z50>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Janusz,

On Sat, Jul 18, 2020 at 01:23:24AM +0200, Janusz Krzysztofik wrote:
> Hi Jacopo,
>
> On Friday, July 17, 2020 9:20:18 A.M. CEST Jacopo Mondi wrote:
> > Hi Janusz,
> >   thanks for review
> >
> > On Fri, Jul 17, 2020 at 12:15:27AM +0200, Janusz Krzysztofik wrote:
> > > Hi Jacopo,
> > >
> > > On Thursday, July 16, 2020 4:27:04 P.M. CEST Jacopo Mondi wrote:
> > > > Introduce two new pad operations to allow retrieving and configuring the
> > > > media bus parameters on a subdevice pad.
> > > >
> > > > The newly introduced operations aims to replace the s/g_mbus_config video
> > > > operations, which have been on their way for deprecation since a long
> > > > time.
> > > >
> > > > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > > > ---
> > > >  include/media/v4l2-subdev.h | 27 +++++++++++++++++++++++++++
> > > >  1 file changed, 27 insertions(+)
> > > >
> > > > diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> > > > index f7fe78a6f65a..d8b9d5735307 100644
> > > > --- a/include/media/v4l2-subdev.h
> > > > +++ b/include/media/v4l2-subdev.h
> > > > @@ -670,6 +670,29 @@ struct v4l2_subdev_pad_config {
> > > >   *
> > > >   * @set_frame_desc: set the low level media bus frame parameters, @fd array
> > > >   *                  may be adjusted by the subdev driver to device capabilities.
> > > > + *
> > > > + * @get_mbus_config: get the media bus configuration of a remote sub-device.
> > > > + *		     The media bus configuration is usually retrieved from the
> > > > + *		     firmware interface at sub-device probe time, immediately
> > > > + *		     applied to the hardware and eventually adjusted by the
> > > > + *		     driver. Remote sub-devices (usually video receivers) shall
> > > > + *		     use this operation to query the transmitting end bus
> > > > + *		     configuration in order to adjust their own one accordingly.
> > > > + *		     Callers should make sure they get the most up-to-date as
> > > > + *		     possible configuration from the remote end, likely calling
> > > > + *		     this operation as close as possible to stream on time. The
> > > > + *		     operation shall fail if the pad index it has been called on
> > > > + *		     is not valid.
> > > > + *
> > > > + * @set_mbus_config: set the media bus configuration of a remote sub-device.
> > > > + *		     This operations is intended to allow, in combination with
> > > > + *		     the get_mbus_config operation, the negotiation of media bus
> > > > + *		     configuration parameters between media sub-devices. The
> > > > + *		     operation shall not fail if the requested configuration is
> > > > + *		     not supported, but the driver shall update the content of
> > > > + *		     the %config argument to reflect what has been actually
> > > > + *		     applied to the hardware. The operation shall fail if the
> > > > + *		     pad index it has been called on is not valid.
> >
> > First of all, Hans sent a pull request for this series yesterday. Are
> > you ok with that and with sending patches on top, or do you think the
> > inclusion of the series should be post-poned ? (you can imagine what
> > my preference is :)
> >
> > >
> > > Could this description also clarify what results are expected in case of
> > > hardware errors?  The ov6650 implementation you propose may suggest such
> > > errors may be expected to be ignored silently as long as current configuration
> > > can be successfully obtained from hardware and passed back to the caller.
> >
> > I guess "it depends"(tm)
> > I know this doesn't sound like a good answer :)
> >
> > A failure in applying or reading register likely means the driver is
> > trying to access the hardware while it is in low power state. In this
> > case I would consider this a driver bug, as it should try to be smart
> > and cache settings and apply them at the proper time and return the
> > current configuration, which should be cached as well.
> >
> > Of course things could go wrong for several reasons, and in the case
> > if any unexpected error occurs I think an error is expected to be
> > reported. Please note that this v7 of ov6650 does that by returning
> > the return value of ov6650_get_mbus_config() at the end of
> > ov6650_set_mbus_config.
>
> Current configuration is not cached in your implementation proposed for ov6650.
> If it was, would ov6650_set_mbus_config() always succeed, just passing it back
> updated with successful writes and ignoring write errors?  In other words,
> is this the expected behavior of .set_mbus_config() to always treat
> unsuccessful writes as recoverable errors and never report them to the caller
> as long as there is a current configuration available that can passed back?

I don't see that driver implementing any sort of power ref-counting at
the moment... In example s_ftm goes to the register without actually
making sure the chip is powered or not.

I guess this is /fine/, currently there's a big confusion in the i2c
sensor drivers land on where this has to be implemented... However
this is a 'legacy' driver, with no media controller support and no
devnode exposed to userspace, so I guess the bridge driver is in
charge of making sure it interacts with the sensor after s_power(1)
has been called.

Modern sensor drivers, which use runtime_pm and implement the
VIDIOC_SUBDEV_ API to userspace, are expected to handle power properly
as they can receive  calls from applications at any time. The most
trivial solution would be to power up the sensor at fops.open() time
and keep it powered, but that's clearly a waste, hence if the driver
implements a smarter power management scheme it should take care of
caching, as it would do for formats and controls.

Does that make sense to you ?

Thanks
  j

>
> Thanks,
> Janusz
>
> >
> > I guess this is pretty regular behaviour, although I missed it in the
> > previous version, so it might be worth adding an additional line to
> > the documentation.
> >
> > >
> > > Moreover, since validity of the pad argument is expected to be verified, I
> > > think this should be handled by the media infrastructure layer with the
> > > drivers/media/v4l2-core/v4l2-subdev.c:check_pad() helper called from a
> > > .set_mbus_config() wrapper added to v4l2_subdev_call_pad_wrappers, freeing
> > > drivers from reimplementing it.
> > >
> >
> > Good point, and indeed my bad as I thought v4l2_subdev_call() would
> > already do that by default, but looking at the actual implementation a
> > wrapper might be a good idea indeed.
> >
> > Patches on top ?
> >
> > Thanks
> >   j
> >
> > > Thanks,
> > > Janusz
> > >
> > > >   */
> > > >  struct v4l2_subdev_pad_ops {
> > > >  	int (*init_cfg)(struct v4l2_subdev *sd,
> > > > @@ -710,6 +733,10 @@ struct v4l2_subdev_pad_ops {
> > > >  			      struct v4l2_mbus_frame_desc *fd);
> > > >  	int (*set_frame_desc)(struct v4l2_subdev *sd, unsigned int pad,
> > > >  			      struct v4l2_mbus_frame_desc *fd);
> > > > +	int (*get_mbus_config)(struct v4l2_subdev *sd, unsigned int pad,
> > > > +			       struct v4l2_mbus_config *config);
> > > > +	int (*set_mbus_config)(struct v4l2_subdev *sd, unsigned int pad,
> > > > +			       struct v4l2_mbus_config *config);
> > > >  };
> > > >
> > > >  /**
> > > >
> > >
> > >
> > >
> > >
> >
>
>
>
>
