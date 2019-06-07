Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6E9E938929
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  7 Jun 2019 13:37:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728576AbfFGLhN (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 7 Jun 2019 07:37:13 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:35870 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728197AbfFGLhN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 7 Jun 2019 07:37:13 -0400
Received: from pendragon.ideasonboard.com (unknown [IPv6:2a02:a03f:44f0:8500:ca05:8177:199c:fed4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7E7CD334;
        Fri,  7 Jun 2019 13:37:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1559907431;
        bh=h8nNlFwztfsVZRShmhKejPLZbbtWBGar1pZQXZWtef4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=QdVf2z/obGcSpSa+as048Dj+EKhXDVel+ZE/VzBlsyBBvw5KbscRuZhg1MGRoJoxl
         pt2QDbciEc/3qSjdG/cc9DMkPh0DR5wC2ecGDCTydSWrsc3HYOviYMNio2pCxlsn8h
         6aGYDtS8cQtAuxHnWSCzQBas9JAXkj1O7H9NEKdQ=
Date:   Fri, 7 Jun 2019 14:36:57 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Koji Matsuoka <koji.matsuoka.xm@renesas.com>, muroya@ksk.co.jp,
        VenkataRajesh.Kalakodima@in.bosch.com,
        Harsha.ManjulaMallikarjun@in.bosch.com,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 03/20] dt-bindings: display, renesas,du: Update 'vsps' in
 example
Message-ID: <20190607113657.GC7593@pendragon.ideasonboard.com>
References: <20190606142220.1392-1-jacopo+renesas@jmondi.org>
 <20190606142220.1392-4-jacopo+renesas@jmondi.org>
 <20190606165352.GK12825@pendragon.ideasonboard.com>
 <CAMuHMdVJEJ9Sehm5Ug4P+HW0iPYufPuYVD9vQ3qKg=htXFmuLg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAMuHMdVJEJ9Sehm5Ug4P+HW0iPYufPuYVD9vQ3qKg=htXFmuLg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

On Thu, Jun 06, 2019 at 10:00:23PM +0200, Geert Uytterhoeven wrote:
> On Thu, Jun 6, 2019 at 8:50 PM Laurent Pinchart wrote:
> > On Thu, Jun 06, 2019 at 04:22:03PM +0200, Jacopo Mondi wrote:
> >> Update the 'vsps' property structure in the documentation example to
> >> reflect what's actually implemented in the device tree sources.
> >>
> >> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> 
> >> --- a/Documentation/devicetree/bindings/display/renesas,du.txt
> >> +++ b/Documentation/devicetree/bindings/display/renesas,du.txt
> >> @@ -92,7 +92,7 @@ Example: R8A7795 (R-Car H3) ES2.0 DU
> >>                        <&cpg CPG_MOD 722>,
> >>                        <&cpg CPG_MOD 721>;
> >>               clock-names = "du.0", "du.1", "du.2", "du.3";
> >> -             vsps = <&vspd0 0>, <&vspd1 0>, <&vspd2 0>, <&vspd0 1>;
> >> +             vsps = <&vspd0 0 &vspd1 0 &vspd2  &vspd0 1>;
> >
> > The former is simpler to read than the latter in my opinion. Shouldn't
> > we update the .dtsi files instead ?
> 
> Yes, it is easier to read (for humans).
> 
> >>               cmms = <&cmm0 &cmm1 &cmm2 &cmm3>;
> 
> Perhaps we want grouping here, too?

As there's a single entry per CMM it matters less in my opinion. I'm
fine with either options.

> 
> >>
> >>               ports {

-- 
Regards,

Laurent Pinchart
