Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 23B011ABA9
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 12 May 2019 12:16:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726274AbfELKQG (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 12 May 2019 06:16:06 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:54206 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726232AbfELKQG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 12 May 2019 06:16:06 -0400
Received: from pendragon.ideasonboard.com (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1CBEB2B6;
        Sun, 12 May 2019 12:16:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1557656163;
        bh=Smh8RnsdxUUwrCpSlzhBkPYPaqOf6kzTv3VYY4pns2A=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=n/bb+H7oHP1+Yqk7gyZBwSx62GTmAJK25PN2UuWMYilITsTd7kWfVyRbUm4f3vII8
         JHw6+DIH7Y0G4Wu4V8HR//FxZikXmWHDee0EKPvwqw5Pevx/hfMKrrG7WhguMeF+5L
         G/KCzA+l2LNo5oeErSlYbG8j2QFbqLjZkeqRKu3w=
Date:   Sun, 12 May 2019 13:15:47 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Andrzej Hajda <a.hajda@samsung.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: Re: [PATCH v2 00/10] R-Car DU: LVDS dual-link mode support
Message-ID: <20190512101547.GA4960@pendragon.ideasonboard.com>
References: <20190511210702.18394-1-laurent.pinchart+renesas@ideasonboard.com>
 <CAMuHMdWqvKXXfjSAk3GRyk8fwa2TS+EwcV_n0YwcEU9d8XohUA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAMuHMdWqvKXXfjSAk3GRyk8fwa2TS+EwcV_n0YwcEU9d8XohUA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

On Sun, May 12, 2019 at 10:55:20AM +0200, Geert Uytterhoeven wrote:
> On Sat, May 11, 2019 at 11:07 PM Laurent Pinchart wrote:
> > On the receiving side, the THC63LVD1024 LVDS-to-parallel bridge has two
> > LVDS inputs and two parallel outputs. It can operate in four different
> > modes:
> >
> > - Single-in, single-out: The first LVDS input receives the video stream,
> >   and the bridge outputs it on the first parallel output. The second
> >   LVDS input and the second parallel output are not used.
> >
> > - Single-in, dual-out: The first LVDS input receives the video stream,
> >   and the bridge splits even- and odd-numbered pixels and outputs them
> >   on the first and second parallel outputs. The second LVDS input is not
> >   used.
> >
> > - Dual-in, single-out: The two LVDS inputs are used in dual-link mode,
> >   and the bridge combines the even- and odd-numbered pixels and outputs
> >   them on the first parallel output. The second parallel output is not
> >   used.
> >
> > - Dual-in, dual-out: The two LVDS inputs are used in dual-link mode,
> >   and the bridge outputs the even- and odd-numbered pixels on the first
> >   parallel output.
> 
> and the second?

I should have read "on the first and second parallel outputs
respectively" indeed.

> > The operating mode is selected by two input pins of the bridge, which
> > are connected to DIP switches on the development boards I use. The mode
> > is thus fixed from a Linux point of view.
> 
> Can the state of these switches be read from software?

Unfortunately not :-(

-- 
Regards,

Laurent Pinchart
