Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E196649C05A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Jan 2022 01:54:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235446AbiAZAyI (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 25 Jan 2022 19:54:08 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:43874 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234910AbiAZAyG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 25 Jan 2022 19:54:06 -0500
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E62BF71;
        Wed, 26 Jan 2022 01:54:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1643158445;
        bh=HpNQj7fzshRfpKmiUN6409YbFRa+P6QMrztZkSLSYjM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=lBojZHzW6UTACCy522TRZnBMuMvvlV71dSIyixe7EC3cK6zLiyjz0qbXQY+MQZU4p
         s0oDjIZMYBs9v816eB1n1SST4GSRmpGrwXaTlKX8mJg3geh1z4+EVcrsi9sRQit2AH
         TmHdNWg2VNKx0jWEkjd+PCj335WNt+sBSf+j2PfE=
Date:   Wed, 26 Jan 2022 02:53:46 +0200
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
Message-ID: <YfCbmohm5bX1jMhb@pendragon.ideasonboard.com>
References: <20220112174612.10773-1-biju.das.jz@bp.renesas.com>
 <20220112174612.10773-11-biju.das.jz@bp.renesas.com>
 <CAMuHMdUyPbykGc+OPPmxd63qsSRjG1h_xm3GXHsdbcwfZ+48ew@mail.gmail.com>
 <Ye1dhPKT2FGgXKLO@pendragon.ideasonboard.com>
 <CAMuHMdWWQeumgcHMNnG7Zntxnc0y=B6C_V_cYVYk2L45vujywg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAMuHMdWWQeumgcHMNnG7Zntxnc0y=B6C_V_cYVYk2L45vujywg@mail.gmail.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

On Mon, Jan 24, 2022 at 09:18:52AM +0100, Geert Uytterhoeven wrote:
> On Sun, Jan 23, 2022 at 2:52 PM Laurent Pinchart wrote:
> > On Fri, Jan 14, 2022 at 11:17:19AM +0100, Geert Uytterhoeven wrote:
> > > On Wed, Jan 12, 2022 at 6:46 PM Biju Das wrote:
> > > > Increase buff size for compatible variable to avoid stack corruption
> > > > with RZ/G2L SoC's(renesas,du-r9a07g044l) which requires a buff size
> > > > more than the current allocated size.
> > > >
> > > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > >
> > > Thanks for your patch!
> > >
> > > > --- a/drivers/gpu/drm/rcar-du/rcar_du_of.c
> > > > +++ b/drivers/gpu/drm/rcar-du/rcar_du_of.c
> > > > @@ -200,7 +200,7 @@ static void __init rcar_du_of_lvds_patch(const struct of_device_id *of_ids)
> > > >         struct device_node *lvds_node;
> > > >         struct device_node *soc_node;
> > > >         struct device_node *du_node;
> > > > -       char compatible[22];
> > > > +       char compatible[24];
> > > >         const char *soc_name;
> > > >         unsigned int i;
> > > >         int ret;
> > >
> > > What about changing the code to use kasprintf() instead, to prevent
> > > this from ever happening again?
> >
> > Or maybe it's time to drop this backward compatibility code altogether ?
> 
> The last R-Car Gen2 DTS was converted in commit edb0c3affe5214a2
> ("ARM: dts: r8a7793: Convert to new LVDS DT bindings") in v4.17.
> The last RZ/G1 DTS was converted in commit 6a6a797625b5fe85 ("ARM:
> dts: r8a7743: Convert to new LVDS DT bindings") in v5.0.
> 
> Both are older than commit 58256143cff7c2e0 ("clk: renesas: Remove
> R-Car Gen2 legacy DT clock support") in v5.5, so I'd say let's get
> rid of it.

Let's do so then. Biju, would you drop the compat code in v2, or would
you like me to send patches ?

-- 
Regards,

Laurent Pinchart
