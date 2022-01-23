Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C0EAF4971C6
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 23 Jan 2022 14:52:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233090AbiAWNwX (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 23 Jan 2022 08:52:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233067AbiAWNwX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 23 Jan 2022 08:52:23 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50060C06173B
        for <linux-renesas-soc@vger.kernel.org>; Sun, 23 Jan 2022 05:52:23 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5DDEB25E;
        Sun, 23 Jan 2022 14:52:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1642945940;
        bh=qHD4oKNycRUEuZ6CCYBe9r+LQnFmc6q5fJQb6zwYYYA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Sd+18gD/nSxRtCbX+2/ZOH/FKCoPRdtREJ5FgBv8MNGNWEWa0Bi0FIkNg53cpdqBg
         DKJtMI6t0+rtdK0DIRViz6RBW7q3SCBI+Oohat90vCDIjebfDYj1GsoI/naqHcj+pH
         2WxZ8oxpxguSdsGnBom/z3UaS64vWvGQhzrLZWdU=
Date:   Sun, 23 Jan 2022 15:52:04 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [RFC 10/28] drm: rcar-du: of: Increase buff size for compatible
 variable
Message-ID: <Ye1dhPKT2FGgXKLO@pendragon.ideasonboard.com>
References: <20220112174612.10773-1-biju.das.jz@bp.renesas.com>
 <20220112174612.10773-11-biju.das.jz@bp.renesas.com>
 <CAMuHMdUyPbykGc+OPPmxd63qsSRjG1h_xm3GXHsdbcwfZ+48ew@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAMuHMdUyPbykGc+OPPmxd63qsSRjG1h_xm3GXHsdbcwfZ+48ew@mail.gmail.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Jan 14, 2022 at 11:17:19AM +0100, Geert Uytterhoeven wrote:
> On Wed, Jan 12, 2022 at 6:46 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > Increase buff size for compatible variable to avoid stack corruption
> > with RZ/G2L SoC's(renesas,du-r9a07g044l) which requires a buff size
> > more than the current allocated size.
> >
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> 
> Thanks for your patch!
> 
> > --- a/drivers/gpu/drm/rcar-du/rcar_du_of.c
> > +++ b/drivers/gpu/drm/rcar-du/rcar_du_of.c
> > @@ -200,7 +200,7 @@ static void __init rcar_du_of_lvds_patch(const struct of_device_id *of_ids)
> >         struct device_node *lvds_node;
> >         struct device_node *soc_node;
> >         struct device_node *du_node;
> > -       char compatible[22];
> > +       char compatible[24];
> >         const char *soc_name;
> >         unsigned int i;
> >         int ret;
> 
> What about changing the code to use kasprintf() instead, to prevent
> this from ever happening again?

Or maybe it's time to drop this backward compatibility code altogether ?

-- 
Regards,

Laurent Pinchart
