Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 06A36243924
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Aug 2020 13:11:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726106AbgHMLLm (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 13 Aug 2020 07:11:42 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:38300 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726072AbgHMLLl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 13 Aug 2020 07:11:41 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 84B3EF9;
        Thu, 13 Aug 2020 13:11:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1597317097;
        bh=6+OyEWqifsz3+mafd2j5D1bEiypt87Aw3SXgHFWIW6s=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=tl/wB7wg5y7Z1dm89rsHU0IV98Fg7Y6izj9y/srCp246Udbz0oA5E57i+ff8FBm1T
         2GXimbBrECYY5IZTz3QllBEuq854zYzNYOUxotY+djZOrWWZ75rJxCR5xtllswM5b4
         0jYTymcQwCuNJmx/ZEu22vVObI+/sg0OOVB7aXaQ=
Date:   Thu, 13 Aug 2020 14:11:23 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/9] dt-bindings: display: renesas,du: Document r8a774e1
 bindings
Message-ID: <20200813111123.GD6057@pendragon.ideasonboard.com>
References: <20200812140217.24251-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20200812140217.24251-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdV4Tp=kz57pAJk0u5hVpbiEdVzTWDvK+F1AZ5TjGmLbMQ@mail.gmail.com>
 <CA+V-a8svAuDx51vuTCH4w5g0oF9qf8sWAEjMDMm+0+9u-UQhQw@mail.gmail.com>
 <20200813105910.GB6057@pendragon.ideasonboard.com>
 <CA+V-a8sRQ_R4UGkSjrZ7Rq5nUqTwPtbvuuT0t69mM8M8ZeTkRQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CA+V-a8sRQ_R4UGkSjrZ7Rq5nUqTwPtbvuuT0t69mM8M8ZeTkRQ@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Prabhakar,

On Thu, Aug 13, 2020 at 12:08:58PM +0100, Lad, Prabhakar wrote:
> On Thu, Aug 13, 2020 at 11:59 AM Laurent Pinchart wrote:
> > On Thu, Aug 13, 2020 at 11:38:03AM +0100, Lad, Prabhakar wrote:
> >> On Thu, Aug 13, 2020 at 10:05 AM Geert Uytterhoeven wrote:
> >>> On Wed, Aug 12, 2020 at 4:02 PM Lad Prabhakar wrote:
> >>>> From: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
> >>>>
> >>>> Document the RZ/G2H (a.k.a. r8a774e1) SoC in the R-Car DU bindings.
> >>>>
> >>>> Signed-off-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
> >>>> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >>>> ---
> >>>>  Documentation/devicetree/bindings/display/renesas,du.txt | 2 ++
> >>>>  1 file changed, 2 insertions(+)
> >>>>
> >>>> diff --git a/Documentation/devicetree/bindings/display/renesas,du.txt b/Documentation/devicetree/bindings/display/renesas,du.txt
> >>>> index 51cd4d162770..67cded5ad827 100644
> >>>> --- a/Documentation/devicetree/bindings/display/renesas,du.txt
> >>>> +++ b/Documentation/devicetree/bindings/display/renesas,du.txt
> >>>> @@ -10,6 +10,7 @@ Required Properties:
> >>>>      - "renesas,du-r8a774a1" for R8A774A1 (RZ/G2M) compatible DU
> >>>>      - "renesas,du-r8a774b1" for R8A774B1 (RZ/G2N) compatible DU
> >>>>      - "renesas,du-r8a774c0" for R8A774C0 (RZ/G2E) compatible DU
> >>>> +    - "renesas,du-r8a774e1" for R8A774E1 (RZ/G2H) compatible DU
> >>>>      - "renesas,du-r8a7779" for R8A7779 (R-Car H1) compatible DU
> >>>>      - "renesas,du-r8a7790" for R8A7790 (R-Car H2) compatible DU
> >>>>      - "renesas,du-r8a7791" for R8A7791 (R-Car M2-W) compatible DU
> >>>> @@ -75,6 +76,7 @@ corresponding to each DU output.
> >>>>   R8A774A1 (RZ/G2M)      DPAD 0         HDMI 0         LVDS 0         -
> >>>>   R8A774B1 (RZ/G2N)      DPAD 0         HDMI 0         LVDS 0         -
> >>>>   R8A774C0 (RZ/G2E)      DPAD 0         LVDS 0         LVDS 1         -
> >>>> + R8A774E1 (RZ/G2H)      DPAD 0         HDMI 0         LVDS 0         -
> >>>
> >>> As LVDS 0 is the fourth channel (DU3), should it be listed under port 3
> >>> instead of port 2?
> >>>
> >>> I know we did it the same for R-Car M3-N and RZ/G2N.
> >>> But my main worry is adding support for R-Car H3-N later.
> >
> > Why should we do so ? The port number here isn't tied to the DU channel
> > number. It only identifies the output port. Many DUs can route DU
> > channel outputs to different output ports.
> >
> The binding document (renesas,du.txt) does state that "The following
> table lists for each supported model the port number corresponding to
> each DU output.", hence the confusion.

It can be a bit confusing indeed. "DU output" here refers to the output
of the whoel DU, made of individual DU channels. Each DU channel is
listed as a DU device in the datasheet, and collectively they are the DU
device that Linux handles.

> >> I do agree too, with the below diff I tested the LVDS output on RZ/G2N
> >> Rev2 board and things work fine. But only thing it doesn't explain is
> >> why does LVDS work on DU2 for G2[H/N] boards :D
> >>
> >> Geert, Laurent, Kieran If you agree with the below changes I shall
> >> post a proper patch fixing it for RZ/G2[HN]
> >>
> >> diff --git a/arch/arm64/boot/dts/renesas/r8a774b1.dtsi
> >> b/arch/arm64/boot/dts/renesas/r8a774b1.dtsi
> >> index d661724fc28a..0b087d287202 100644
> >> --- a/arch/arm64/boot/dts/renesas/r8a774b1.dtsi
> >> +++ b/arch/arm64/boot/dts/renesas/r8a774b1.dtsi
> >> @@ -2540,8 +2540,8 @@
> >>                                                 remote-endpoint =
> >> <&dw_hdmi0_in>;
> >>                                         };
> >>                                 };
> >> -                               port@2 {
> >> -                                       reg = <2>;
> >> +                               port@3 {
> >> +                                       reg = <3>;
> >>                                         du_out_lvds0: endpoint {
> >>                                                 remote-endpoint = <&lvds0_in>;
> >>                                         };
> >> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> >> b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> >> index 3e67cf70f040..419d81c7763e 100644
> >> --- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> >> +++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> >> @@ -153,7 +153,7 @@ static const struct rcar_du_device_info
> >> rcar_du_r8a774b1_info = {
> >>                 },
> >>                 [RCAR_DU_OUTPUT_LVDS0] = {
> >>                         .possible_crtcs = BIT(0),
> >> -                       .port = 2,
> >> +                       .port = 3,
> >>                 },
> >>         },
> >>         .num_lvds = 1,
> >>
> >>>>   R8A7779 (R-Car H1)     DPAD 0         DPAD 1         -              -
> >>>>   R8A7790 (R-Car H2)     DPAD 0         LVDS 0         LVDS 1         -
> >>>>   R8A7791 (R-Car M2-W)   DPAD 0         LVDS 0         -              -
> >>>
> >>> Apart from that:
> >>> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

-- 
Regards,

Laurent Pinchart
