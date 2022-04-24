Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5793F50D2F7
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 24 Apr 2022 17:48:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232125AbiDXPrT (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 24 Apr 2022 11:47:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229657AbiDXPrS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 24 Apr 2022 11:47:18 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 664F833340
        for <linux-renesas-soc@vger.kernel.org>; Sun, 24 Apr 2022 08:44:17 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7F0B630B;
        Sun, 24 Apr 2022 17:44:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1650815055;
        bh=wRIeNrks/S3W0CSNWzdwa/hP/i+vgQrx8t91l+9ccjE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=LEAmwamPFNiFIX5z4fRFH8Y5r20FuU4mm8Iw/IHZBb/lKNAq4nNvdONkR+MWFB7s3
         2lMQtNbwKdt7WYOh/oE8Qzox6T7Vt8MVSCr6g6eWdv2CxjK0xbAo4bXMe5CJUngpUo
         TDlnIAoLq6fISRuCs0itOjvWAYUpzLRuGeUXxgVw=
Date:   Sun, 24 Apr 2022 18:44:15 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v3 2/4] drm: rcar-du: Fix typo
Message-ID: <YmVwT0ZKInxbgKQ7@pendragon.ideasonboard.com>
References: <20220421163128.101520-1-biju.das.jz@bp.renesas.com>
 <20220421163128.101520-3-biju.das.jz@bp.renesas.com>
 <CAMuHMdV_eNxM4yHgkUFPz58KyiGFtjjBeePtuAg8pZYfsS5t9g@mail.gmail.com>
 <OS0PR01MB59222BB60DE4DFEA83A851C186F79@OS0PR01MB5922.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <OS0PR01MB59222BB60DE4DFEA83A851C186F79@OS0PR01MB5922.jpnprd01.prod.outlook.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello,

On Fri, Apr 22, 2022 at 09:38:00AM +0000, Biju Das wrote:
> > Subject: Re: [PATCH v3 2/4] drm: rcar-du: Fix typo
> > On Thu, Apr 21, 2022 at 6:31 PM Biju Das wrote:
> > > Fix typo rcar_du_vsp.h->rcar_du_vsp.c
> > >
> > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > 
> > Thanks for your patch!
> > 
> > > --- a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
> > > +++ b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
> > > @@ -1,6 +1,6 @@
> > >  // SPDX-License-Identifier: GPL-2.0+
> > >  /*
> > > - * rcar_du_vsp.h  --  R-Car Display Unit VSP-Based Compositor
> > > + * rcar_du_vsp.c  --  R-Car Display Unit VSP-Based Compositor
> > 
> > Perhaps drop the file name completely instead?
> 
> Currently all the R-Car DU files have file name. May be
> A single patch to remove all off them if we are planning to do.
> 
> Laurent, please share your thoughts on this.

Geert has a point, the file names cause issues and don't add much value.
Would you like to send a patch to drop them all, to replace this one ? I
can also handle it myself if you prefer.

-- 
Regards,

Laurent Pinchart
