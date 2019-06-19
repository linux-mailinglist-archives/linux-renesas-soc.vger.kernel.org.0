Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 570534BA83
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Jun 2019 15:51:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727882AbfFSNva (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 19 Jun 2019 09:51:30 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:35634 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726047AbfFSNv3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 19 Jun 2019 09:51:29 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id F035D25B262;
        Wed, 19 Jun 2019 23:51:27 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 049D59409FF; Wed, 19 Jun 2019 15:51:25 +0200 (CEST)
Date:   Wed, 19 Jun 2019 15:51:25 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>
Subject: Re: [PATCH 1/3] dt-bindings: display: renesas: Add r8a774a1 support
Message-ID: <20190619135123.jym5j6qtgxq23dec@verge.net.au>
References: <1560871119-16570-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1560871119-16570-2-git-send-email-fabrizio.castro@bp.renesas.com>
 <20190618164338.GG21105@pendragon.ideasonboard.com>
 <TY1PR01MB1770E12DBC116A3F395DE17BC0E50@TY1PR01MB1770.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TY1PR01MB1770E12DBC116A3F395DE17BC0E50@TY1PR01MB1770.jpnprd01.prod.outlook.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Jun 19, 2019 at 08:08:09AM +0000, Fabrizio Castro wrote:
> Hi Laurent,
> 
> Thank you for your feedback!
> 
> > From: linux-renesas-soc-owner@vger.kernel.org <linux-renesas-soc-owner@vger.kernel.org> On Behalf Of Laurent Pinchart
> > Sent: 18 June 2019 17:44
> > Subject: Re: [PATCH 1/3] dt-bindings: display: renesas: Add r8a774a1 support
> > 
> > Hi Fabrizio,
> > 
> > Thank you for the patch.
> > 
> > On Tue, Jun 18, 2019 at 04:18:37PM +0100, Fabrizio Castro wrote:
> > > Document RZ/G2M (R8A774A1) SoC bindings.
> > >
> > > Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> > 
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > 
> > I don't have pending changes for this file for this kernel release. As
> > your series contains DT changes, I'm fine if this patch gets merged
> > through the ARM SoC tree along with the rest. Otherwise please let me
> > know if I should handle it myself.
> 
> Thank you Laurent, I think this patch can go along with the rest, if that's OK with
> Simon?

Thanks,

I've queued this up in the renesas tree for inclusion in v5.3.
