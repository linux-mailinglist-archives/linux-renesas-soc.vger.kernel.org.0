Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 31A0D20825
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 May 2019 15:28:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726955AbfEPN2L (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 16 May 2019 09:28:11 -0400
Received: from mga04.intel.com ([192.55.52.120]:12658 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727584AbfEPN2K (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 16 May 2019 09:28:10 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 16 May 2019 06:28:09 -0700
X-ExtLoop1: 1
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
  by fmsmga007.fm.intel.com with SMTP; 16 May 2019 06:28:04 -0700
Received: by stinkbox (sSMTP sendmail emulation); Thu, 16 May 2019 16:28:03 +0300
Date:   Thu, 16 May 2019 16:28:03 +0300
From:   Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To:     Daniel Vetter <daniel@ffwll.ch>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sean Paul <sean@poorly.run>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Sean Paul <seanpaul@chromium.org>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Ben Skeggs <bskeggs@redhat.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Eric Anholt <eric@anholt.net>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        David Airlie <airlied@linux.ie>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        intel-gfx <intel-gfx@lists.freedesktop.org>,
        Nouveau Dev <nouveau@lists.freedesktop.org>,
        "open list:DRM DRIVERS FOR RENESAS" 
        <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH v3 04/10] drm: Convert
 connector_helper_funcs->atomic_check to accept drm_atomic_state
Message-ID: <20190516132803.GM24299@intel.com>
References: <20190502194956.218441-1-sean@poorly.run>
 <20190502194956.218441-5-sean@poorly.run>
 <20190511191202.GL13043@pendragon.ideasonboard.com>
 <20190513144747.GR17751@phenom.ffwll.local>
 <20190516120221.GI14820@pendragon.ideasonboard.com>
 <CAKMK7uG_TmzZBgVkJ+j9C53KRp1OgswYuxpFV77+eU6BPWwGgw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKMK7uG_TmzZBgVkJ+j9C53KRp1OgswYuxpFV77+eU6BPWwGgw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, May 16, 2019 at 02:07:34PM +0200, Daniel Vetter wrote:
> On Thu, May 16, 2019 at 2:02 PM Laurent Pinchart
> <laurent.pinchart@ideasonboard.com> wrote:
> >
> > Hi Daniel,
> >
> > On Mon, May 13, 2019 at 04:47:47PM +0200, Daniel Vetter wrote:
> > > On Sat, May 11, 2019 at 10:12:02PM +0300, Laurent Pinchart wrote:
> > > > On Thu, May 02, 2019 at 03:49:46PM -0400, Sean Paul wrote:
> > > >> From: Sean Paul <seanpaul@chromium.org>
> > > >>
> > > >> Everyone who implements connector_helper_funcs->atomic_check reaches
> > > >> into the connector state to get the atomic state. Instead of continuing
> > > >> this pattern, change the callback signature to just give atomic state
> > > >> and let the driver determine what it does and does not need from it.
> > > >>
> > > >> Eventually all atomic functions should do this, but that's just too much
> > > >> busy work for me.
> > > >
> > > > Given that drivers also access the connector state, isn't this slightly
> > > > more inefficient ?
> > >
> > > It's atomic code, we're trying to optimize for clean code at the expense
> > > of a bit of runtime overhead due to more pointer chasing. And I agree with
> > > the general push, the pile of old/new_state pointers of various objects
> > > we're passing around is confusing. Passing the overall drm_atomic_state
> > > seems much more reasonable, and with that we can get everything else. Plus
> > > it's much more obvious whether you have the old/new state (since that's
> > > explicit when you look it up from the drm_atomic_state).
> >
> > Yes, I agree it's cleaner. I just hope the atomic state tracking cost
> > can be kept under control :-)
> >
> > By the way, this is likely not going to happen as it would be way too
> > intrusive, but it would be nice to rename drm_atomic_state to
> > drm_atomic_transaction (or something similar). It doesn't model a state,
> > but a change between an old state to a new state. This confused me in
> > the past, and I'm sure it can still be confusing to newcomers.
> 
> Why are you the first to suggest this, this is awesome!

Can't quite tell if that's irony or not. Anyways, this has been
suggested before but no volunteers stepped forward.

> drm_atomic_state is indeed not a state, but a transaction representing
> how we go from the old to the new state.

On a semi-related topic, I've occasionally pondered about moving
mode_changed & co. from the obj states to the top level
state/transaction (maybe stored as a bitmask). But that would
definitely not be a trivial sed job.

-- 
Ville Syrjälä
Intel
