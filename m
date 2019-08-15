Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F0E2D8F2CE
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 Aug 2019 20:06:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729560AbfHOSGt (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 15 Aug 2019 14:06:49 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:51556 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729210AbfHOSGt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 15 Aug 2019 14:06:49 -0400
Received: from pendragon.ideasonboard.com (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id BD1132AF;
        Thu, 15 Aug 2019 20:06:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1565892406;
        bh=zSZrTeCBrQTp1u2GZFwS+KZBuw8HzikCk+YGmksbVr0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=KZd07T7RZTOJW2fuJtYfQt9PLJw15GsaPJPuTzgRCaJfd6h/p+1bHa+F5zwvspLpl
         bEc6eIOBnCwi9UKOdXkLUhCWjHHRvKJztl1GhACJJebKECs9xk30cOI3c4z3mkIbji
         wR99mJBa5xZkEBJtYVr7VoNDjMt6O1uO3/ouHkI0=
Date:   Thu, 15 Aug 2019 21:06:41 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Andrzej Hajda <a.hajda@samsung.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Sean Paul <sean@poorly.run>, Eric Anholt <eric@anholt.net>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: Re: [PATCH v2 3/9] drm: Rename drm_bridge_timings to drm_timings
Message-ID: <20190815180641.GY5011@pendragon.ideasonboard.com>
References: <1565867073-24746-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1565867073-24746-4-git-send-email-fabrizio.castro@bp.renesas.com>
 <20190815131838.GP5011@pendragon.ideasonboard.com>
 <20190815140400.GA7174@kroah.com>
 <20190815141440.GA20322@pendragon.ideasonboard.com>
 <TY1PR01MB1770404C560F6967FA81D521C0AC0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
 <20190815145300.GA15016@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190815145300.GA15016@kroah.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Greg,

On Thu, Aug 15, 2019 at 04:53:00PM +0200, Greg Kroah-Hartman wrote:
> On Thu, Aug 15, 2019 at 02:31:26PM +0000, Fabrizio Castro wrote:
> > On 15 August 2019 15:15, Laurent Pinchart wrote:
> > > On Thu, Aug 15, 2019 at 04:04:00PM +0200, Greg Kroah-Hartman wrote:
> > > > On Thu, Aug 15, 2019 at 04:18:38PM +0300, Laurent Pinchart wrote:
> > > > > Hi Fabrizio,
> > > > >
> > > > > (CC'ing Greg as the architect of the SPDX move)
> > > >
> > > > _one of_, not the one that did the most of he work, that would be Thomas :)
> > > >
> > > > > On Thu, Aug 15, 2019 at 12:04:27PM +0100, Fabrizio Castro wrote:
> > > > > > The information represented by drm_bridge_timings is also
> > > > > > needed by panels, therefore rename drm_bridge_timings to
> > > > > > drm_timings.
> > > > > >
> > > > > > Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> > > > > > Link: https://www.spinics.net/lists/linux-renesas-soc/msg43271.html
> > > > > >
> > > > > > ---
> > > > > > v1->v2:
> > > > > > * new patch
> > > > > >
> > > > > > I have copied the license from include/drm/drm_bridge.h as that's
> > > > > > where the struct originally came from. What's the right SPDX license
> > > > > > to use in this case?
> > > > >
> > > > > https://wiki.spdx.org/view/Legal_Team/Decisions/Dealing_with_Public_Domain_within_SPDX_Files
> > > > >
> > > > > Greg, any idea on how we should handle this ?
> > > >
> > > > Ugh, what lunacy.  But drm_bridge.h is NOT under any "public domain"
> > > > license, so why is that an issue here?  This looks like a "normal" bsd 3
> > > > clause license to me, right?
> > > 
> > > You're right, I overread part of the text in drm_bridge.h, it seems to
> > > indeed be covered by a BSD 3 clause license. Sorry for the noise.
> > 
> > Mmm... This is the template for the BSD-3-Clause:
> > 
> > Copyright (c) <YEAR>, <OWNER>                                                    
> > All rights reserved.                                                             
> >                                                                                  
> > Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
> >                                                                                  
> > Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
> > Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
> > Neither the name of the <ORGANIZATION> nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.
> > THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
> > 
> > And this is the license coming from include/drm/drm_bridge.h:
> > 
> > /*                                                                                                                                                                                                                                                                              
> >  * Copyright (c) 2016 Intel Corporation                                          
> >  *                                                                               
> >  * Permission to use, copy, modify, distribute, and sell this software and its   
> >  * documentation for any purpose is hereby granted without fee, provided that    
> >  * the above copyright notice appear in all copies and that both that copyright  
> >  * notice and this permission notice appear in supporting documentation, and     
> >  * that the name of the copyright holders not be used in advertising or          
> >  * publicity pertaining to distribution of the software without specific,        
> >  * written prior permission.  The copyright holders make no representations      
> >  * about the suitability of this software for any purpose.  It is provided "as   
> >  * is" without express or implied warranty.                                      
> >  *                                                                               
> >  * THE COPYRIGHT HOLDERS DISCLAIM ALL WARRANTIES WITH REGARD TO THIS SOFTWARE,   
> >  * INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS, IN NO        
> >  * EVENT SHALL THE COPYRIGHT HOLDERS BE LIABLE FOR ANY SPECIAL, INDIRECT OR      
> >  * CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS OF USE,   
> >  * DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER        
> >  * TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR PERFORMANCE  
> >  * OF THIS SOFTWARE.                                                             
> >  */
> > 
> > Perhaps I am completely wrong here, and I am not a lawyer, but the wording seems different enough to me...
> > I am happy to use "BSD-3-Clause" though. Laurent please double check.
> 
> Please talk to your lawyers about this, we are not them...

I don't think that's fair though. Fabrizio is reworking kernel code, and
as part of that wondered what SPDX tag to apply to a new file that
contains code moved from an existing file that has no SPDX tag, but the
above copyright notice. He's not trying to change a license, or reword
it. As SPDX is the preferred way of expressing licenses in the kernel,
he legitimately asked for help, and I think we should provide an
official answer for this (which could be not to use SPDX but copy the
license text).

-- 
Regards,

Laurent Pinchart
