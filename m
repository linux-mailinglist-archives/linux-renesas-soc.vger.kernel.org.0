Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3FA2536FD7
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Jun 2019 11:30:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727540AbfFFJaD (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 6 Jun 2019 05:30:03 -0400
Received: from asavdk4.altibox.net ([109.247.116.15]:54620 "EHLO
        asavdk4.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727509AbfFFJaD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 6 Jun 2019 05:30:03 -0400
Received: from ravnborg.org (unknown [158.248.194.18])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk4.altibox.net (Postfix) with ESMTPS id B7D1580522;
        Thu,  6 Jun 2019 11:30:00 +0200 (CEST)
Date:   Thu, 6 Jun 2019 11:29:59 +0200
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3 07/10] drm: rcar-du: Skip LVDS1 output on Gen3 when
 using dual-link LVDS mode
Message-ID: <20190606092959.GB17442@ravnborg.org>
References: <20190528141234.15425-1-laurent.pinchart+renesas@ideasonboard.com>
 <20190528141234.15425-8-laurent.pinchart+renesas@ideasonboard.com>
 <20190528164213.GB9610@ravnborg.org>
 <20190528165052.GB17874@pendragon.ideasonboard.com>
 <20190528170242.GB10262@ravnborg.org>
 <20190606075750.GE4931@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190606075750.GE4931@pendragon.ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
        a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
        a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10
        a=gi-eZXJGFL57LBb4nr0A:9 a=CjuIK1q_8ugA:10
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Laurent.

> > > Gen3 is the newest generation :-) We thus use >= through the DU and LVDS
> > > drivers to prepare for support of Gen4, just in case.
> >
> > OK, but I guess we agree that the comment needs a small update them.
> > 
> > Actually I implicitly reads that it is only from Gen3 onwards that the
> > LVDS1 encoder can be used as a companion.
> > My initial understanding reading the comment was that this implmented a
> > workaround for Gen3 - but it is a workarounf for missing features in
> > older than Gen3.
> 
> I wouldn't say workaround, it just makes sure that we don't try to
> support LVDS dual-mode on older SoCs as the feature was added in Gen3
> hardware.
> 
> > So, assuming this is correct, when trying to specify a companion on
> > older then Gen3 should result in some kind of error/warning?
> > (Maybe it does).
> 
> The property is ignored in that case. I could add an error message, but
> I'm not sure I should, as we don't usually check that DT nodes don't
> contain any other property than the ones specified in the DT bindings
> (an automatic DT runtime validator based on the YAML bindings could be
> interesting ;-)).
Again, thanks for taking your time.
This clarifies it nicely.

	Sam
