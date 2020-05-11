Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 91AC61CE4FA
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 May 2020 22:04:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729329AbgEKUEA (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 11 May 2020 16:04:00 -0400
Received: from mga12.intel.com ([192.55.52.136]:15801 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727873AbgEKUEA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 11 May 2020 16:04:00 -0400
IronPort-SDR: CCg39y0YwUKiUHeN+bqxcj2E5+VoI9e+jDPLacBGZoSPSUzX09J6ZKjpdtIRIFSGB2SxJ835+f
 ql+H2IQXunHQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2020 13:03:59 -0700
IronPort-SDR: mOvjjO2z2jqMGHxXSPmMzqNljFfWyMXYRBIOx7o3NqcdeYKv+gtb/ag5SmApOTyDGIFwKkGicn
 bvPKsAqAwg3w==
X-IronPort-AV: E=Sophos;i="5.73,381,1583222400"; 
   d="scan'208";a="306273605"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2020 13:03:56 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id E3A19204C7; Mon, 11 May 2020 23:03:54 +0300 (EEST)
Date:   Mon, 11 May 2020 23:03:54 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>, mchehab@kernel.org,
        hverkuil-cisco@xs4all.nl, niklas.soderlund+renesas@ragnatech.se,
        kieran.bingham@ideasonboard.com, dave.stevenson@raspberrypi.com,
        hyun.kwon@xilinx.com, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 1/6] media: v4l2-subdv: Introduce get_mbus_config pad
 op
Message-ID: <20200511200354.GH11272@paasikivi.fi.intel.com>
References: <20200415105004.2497356-1-jacopo+renesas@jmondi.org>
 <20200415105004.2497356-2-jacopo+renesas@jmondi.org>
 <20200420014457.GA15673@pendragon.ideasonboard.com>
 <20200429135430.GH9190@paasikivi.fi.intel.com>
 <20200511113239.dlbmr5gi7itjz6g4@uno.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200511113239.dlbmr5gi7itjz6g4@uno.localdomain>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Jacopo,

On Mon, May 11, 2020 at 01:32:39PM +0200, Jacopo Mondi wrote:
> Hi Sakari, Laurent,
> 
> On Wed, Apr 29, 2020 at 04:54:30PM +0300, Sakari Ailus wrote:
> > Hi Laurent,
> >
> > On Mon, Apr 20, 2020 at 04:44:57AM +0300, Laurent Pinchart wrote:
> > > Hi Jacopo,
> > >
> > > Thank you for the patch.
> > >
> > > On Wed, Apr 15, 2020 at 12:49:58PM +0200, Jacopo Mondi wrote:
> > > > Introduce a new pad operation to allow retrieving the media bus
> > > > configuration on a subdevice pad.
> > > >
> > > > The newly introduced operation reassembles the s/g_mbus_config video
> > > > operation, which have been on their way to be deprecated since a long
> > > > time.
> > > >
> > > > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > > > ---
> > > >  include/media/v4l2-subdev.h | 69 +++++++++++++++++++++++++++++++++++++
> > > >  1 file changed, 69 insertions(+)
> > > >
> > > > diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> > > > index a4848de59852..fc16af578471 100644
> > > > --- a/include/media/v4l2-subdev.h
> > > > +++ b/include/media/v4l2-subdev.h
> > > > @@ -350,6 +350,71 @@ struct v4l2_mbus_frame_desc {
> > > >  	unsigned short num_entries;
> > > >  };
> > > >
> > > > +/**
> > > > + * struct v4l2_mbus_parallel_config - parallel mbus configuration
> > > > + * @hsync_active: hsync active state: 1 for high, 0 for low
> > > > + * @vsync_active: vsync active state: 1 for high, 0 for low
> > > > + * @pclk_rising: pixel clock active edge: 1 for rising, 0 for falling
> > >
> > > Is this for the driving side or the sampling side ?
> >
> > Is there a difference? I'd expect the configuration needs to be the same on
> > both sides.
> 
> I was puzzled as well by this question, mostly because I never found
> anything like this in the existing documentation, but actually yes,
> the driving side clocks out data on one edge, sampling side samples on
> the opposite one ? Is this what you meant Laurent ?
> 
> To me this has always been about sampling side though, and the setting
> should match on both endpoints of course.
> 
> >
> > >
> > > > + * @data_active: data lines active state: 1 for high, 0 for low
> > >
> > > I wonder, is there any system with active low data lines ?
> 
> As this is part of the standard DT properties for video interfaces, I
> added it here.
> 
> > >
> > > > + */
> > > > +struct v4l2_mbus_parallel_config {
> > >
> > > Is this intended to cover BT.656 too ? Either way I think it should be
> > > documented.
> >
> > I think we should replace what directly refers to Bt.601 with something
> > that refers to that, and not "parallel". Both are parallel after all. I
> > think the naming is in line with that, assuming this covers both.
> >
> 
> Currently in v4l2-fwnode BT.656 is selected if no vertical/horizontal
> synch and field flags are specified. This implies the following DT
> properties are shared between BT.601 and BT.656:
> - pclk-sample
> - data-active
> - slave-mode
> - bus-width
> - data-shift
> - sync-on-green-active
> - data-enable-active
> 
> with
> - hsync-active
> - vsync-active
> - field-even-active
> being BT.601 only.
> 
> We could do here do the same and mention which flags apply to 601
> only, or more clearly split the config structure by keeping a generic
> 'parallel' flag structure, with a sub-structure which is 601 specific.
> I'm not sure it's worth the extra layer of indirection though.
> 
> 
> > >
> > > > +	unsigned int hsync_active : 1;
> > > > +	unsigned int vsync_active : 1;
> > > > +	unsigned int pclk_rising : 1;
> > > > +	unsigned int data_active : 1;
> > >
> > > Shouldn't we reuse the V4L2_MBUS_* flags, given that they're also used
> > > in v4l2_fwnode_bus_parallel ? While the v4l2_mbus_config structure is
> >
> > I'd think it's easier to work with fields in drivers than the flags. This
> 
> I find it easier and less error prone to work with fields as well,
> provided the space occupation is the same as working with flags.
> 
> > isn't uAPI so we don't need to think the ABI. The change could also be done
> > to struct v4l2_fwnode_bus_parallel.
> >
> > > getting deprecated, it doesn't mean we can reuse the same flags if they
> > > make sense. Otherwise we'll have to translate between
> > > v4l2_fwnode_bus_parallel.flags and the fields here. Ideally
> 
> Right, I agree this is not desirable. Every driver should inspect the
> fwnode properties and translate to this new config when queryed
> through get_mbus_format.
> 
> > > v4l2_fwnode_bus_parallel should be replaced with
> > > v4l2_mbus_parallel_config (once we add additional fields).
> 
> I like this idea
> 
> We could indeed expand the .flags structure of v4l2_fwnode_bus_parallel
> 
> struct v4l2_fwnode_bus_parallel {
> 	unsigned int flags;
> 	unsigned char bus_width;
> 	unsigned char data_shift;
> };
> 
> but then we should replace the whole structure.
> 
> All in all, working with the same set of flags is the less disruptive
> change and would not require translations in drivers... I'm not a fan,
> but currently seems the easiest way forward...
> 
> What do you think ?

Could we use a struct instead, say:

struct v4l2_parallel_flags {
	unsigned int hsync_active:1;
	/* and so on */
};

And then you'd add this to struct v4l2_fwnode_bus_parallel as a field. No
defines would be needed this way, and it'd be slightly safer because you
get types checked by the compilter.

I don't have strong opinion either way. Both would work just fine.

-- 
Regards,

Sakari Ailus
