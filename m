Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1E8078EEB4
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 Aug 2019 16:53:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728922AbfHOOxD (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 15 Aug 2019 10:53:03 -0400
Received: from mail.kernel.org ([198.145.29.99]:44116 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726120AbfHOOxD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 15 Aug 2019 10:53:03 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2CFBF2067D;
        Thu, 15 Aug 2019 14:53:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1565880782;
        bh=bRZvm6yxXSrefvnsJeDbE6ci/lTE+/CpIr134zPqLQA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=q2nQc79vb2vvtXIZoJ5+ep0LduuzugDb84RMSrRmkNDQ4znUasvwCqpfzuXOuPGNZ
         FWDAHTC5tF89vXDgv9N3Hfs3AWngTYoAaq1iY6r5s0pemq6o9gKhWcLavGGuajLMoa
         CaVPbQ+fbgyQaslbWr4uHynOoJUiDi4BPR6os2jY=
Date:   Thu, 15 Aug 2019 16:53:00 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
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
Message-ID: <20190815145300.GA15016@kroah.com>
References: <1565867073-24746-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1565867073-24746-4-git-send-email-fabrizio.castro@bp.renesas.com>
 <20190815131838.GP5011@pendragon.ideasonboard.com>
 <20190815140400.GA7174@kroah.com>
 <20190815141440.GA20322@pendragon.ideasonboard.com>
 <TY1PR01MB1770404C560F6967FA81D521C0AC0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TY1PR01MB1770404C560F6967FA81D521C0AC0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Aug 15, 2019 at 02:31:26PM +0000, Fabrizio Castro wrote:
> Hi Greg, hi Laurent,
> 
> Thank you for your feedback!
> 
> > From: linux-kernel-owner@vger.kernel.org <linux-kernel-owner@vger.kernel.org> On Behalf Of Laurent Pinchart
> > Sent: 15 August 2019 15:15
> > Subject: Re: [PATCH v2 3/9] drm: Rename drm_bridge_timings to drm_timings
> > 
> > Hi Greg,
> > 
> > On Thu, Aug 15, 2019 at 04:04:00PM +0200, Greg Kroah-Hartman wrote:
> > > On Thu, Aug 15, 2019 at 04:18:38PM +0300, Laurent Pinchart wrote:
> > > > Hi Fabrizio,
> > > >
> > > > (CC'ing Greg as the architect of the SPDX move)
> > >
> > > _one of_, not the one that did the most of he work, that would be Thomas :)
> > >
> > > > On Thu, Aug 15, 2019 at 12:04:27PM +0100, Fabrizio Castro wrote:
> > > > > The information represented by drm_bridge_timings is also
> > > > > needed by panels, therefore rename drm_bridge_timings to
> > > > > drm_timings.
> > > > >
> > > > > Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> > > > > Link: https://www.spinics.net/lists/linux-renesas-soc/msg43271.html
> > > > >
> > > > > ---
> > > > > v1->v2:
> > > > > * new patch
> > > > >
> > > > > I have copied the license from include/drm/drm_bridge.h as that's
> > > > > where the struct originally came from. What's the right SPDX license
> > > > > to use in this case?
> > > >
> > > > https://wiki.spdx.org/view/Legal_Team/Decisions/Dealing_with_Public_Domain_within_SPDX_Files
> > > >
> > > > Greg, any idea on how we should handle this ?
> > >
> > > Ugh, what lunacy.  But drm_bridge.h is NOT under any "public domain"
> > > license, so why is that an issue here?  This looks like a "normal" bsd 3
> > > clause license to me, right?
> > 
> > You're right, I overread part of the text in drm_bridge.h, it seems to
> > indeed be covered by a BSD 3 clause license. Sorry for the noise.
> 
> Mmm... This is the template for the BSD-3-Clause:
> 
> Copyright (c) <YEAR>, <OWNER>                                                    
> All rights reserved.                                                             
>                                                                                  
> Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
>                                                                                  
> Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
> Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
> Neither the name of the <ORGANIZATION> nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.
> THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
> 
> And this is the license coming from include/drm/drm_bridge.h:
> 
> /*                                                                                                                                                                                                                                                                              
>  * Copyright (c) 2016 Intel Corporation                                          
>  *                                                                               
>  * Permission to use, copy, modify, distribute, and sell this software and its   
>  * documentation for any purpose is hereby granted without fee, provided that    
>  * the above copyright notice appear in all copies and that both that copyright  
>  * notice and this permission notice appear in supporting documentation, and     
>  * that the name of the copyright holders not be used in advertising or          
>  * publicity pertaining to distribution of the software without specific,        
>  * written prior permission.  The copyright holders make no representations      
>  * about the suitability of this software for any purpose.  It is provided "as   
>  * is" without express or implied warranty.                                      
>  *                                                                               
>  * THE COPYRIGHT HOLDERS DISCLAIM ALL WARRANTIES WITH REGARD TO THIS SOFTWARE,   
>  * INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS, IN NO        
>  * EVENT SHALL THE COPYRIGHT HOLDERS BE LIABLE FOR ANY SPECIAL, INDIRECT OR      
>  * CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS OF USE,   
>  * DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER        
>  * TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR PERFORMANCE  
>  * OF THIS SOFTWARE.                                                             
>  */
> 
> Perhaps I am completely wrong here, and I am not a lawyer, but the wording seems different enough to me...
> I am happy to use "BSD-3-Clause" though. Laurent please double check.

Please talk to your lawyers about this, we are not them...

thanks,

greg k-h
