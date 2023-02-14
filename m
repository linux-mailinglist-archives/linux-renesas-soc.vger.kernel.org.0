Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 38041695FCA
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Feb 2023 10:52:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231839AbjBNJw4 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 14 Feb 2023 04:52:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231579AbjBNJwm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 14 Feb 2023 04:52:42 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4CFA7ECB;
        Tue, 14 Feb 2023 01:52:40 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3FFFC3D7;
        Tue, 14 Feb 2023 10:52:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1676368358;
        bh=pojofoT94i1r3Cg5jPpj87wxoW+/jiXXYsr3K3tIEyI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=FspyDc2KsZOduE2YUELew6+1GO9mfD/vm6qF1T2PYax+T4JJMTpvskHbhVFUxB243
         VwykcDUe8cFwnm2gOf3Ty0sQd8Zlh8/qZJOW+RAfar9CqpLPD3yUfhdH4FCHC7NeCi
         Y/K29xt/+hggHKfZDePAhOWEspNnjKzr4zS8W8C8=
Date:   Tue, 14 Feb 2023 11:52:37 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: renesas: draak: Add overlay for CVBS
 input
Message-ID: <Y+tZ5ZdTvcJSKaw/@pendragon.ideasonboard.com>
References: <20230211165715.4024992-1-niklas.soderlund+renesas@ragnatech.se>
 <20230211165715.4024992-3-niklas.soderlund+renesas@ragnatech.se>
 <CAMuHMdUALJ7QGtHmb5fkrPotw-8vj6biM5_M-sc6eV3dK0tqZA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdUALJ7QGtHmb5fkrPotw-8vj6biM5_M-sc6eV3dK0tqZA@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

On Tue, Feb 14, 2023 at 10:46:48AM +0100, Geert Uytterhoeven wrote:
> On Sat, Feb 11, 2023 at 5:58 PM Niklas Söderlund wrote:
> > From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> >
> > The Draak board has an ADV7180 CVBS decoder and an ADV7612 HDMI decoder,
> > both connected to the same VIN input. DIP switches are used to select
> > one of the two devices, with the HDMI decoder being the default. Add an
> > overlay that selects the CVBS decoder.
> >
> > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > [Niklas: Inverted it from HDMI to CVBS]
> > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> 
> Thanks for your patch!
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/renesas/draak-cvbs-input.dtso
> > @@ -0,0 +1,33 @@
> > +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> > +/*
> > + * Copyright 2023 Ideas on Board Oy
> > + *
> > + * Device tree overlay for the Draak board, to enable CVBS input. This requires
> > + * setting DIP switches SW49, SW50, SW51 and SW52 to OFF, and SW53 and SW54 to
> > + * ON.
> > + */
> > +
> > +/dts-v1/;
> > +/plugin/;
> > +
> > +&adv7180_out {
> > +       remote-endpoint = <&vin4_in>;
> > +};
> 
> [...]
> 
> > +&vin4_in {
> > +       remote-endpoint = <&adv7180_out>;
> > +};
> 
> Unfortunately dtc doesn't like references to nodes it cannot find the
> names of:
> 
>     arch/arm64/boot/dts/renesas/draak-cvbs-input.dtbo: Warning
> (graph_port): /fragment@0: graph port node name should be 'port'
>     arch/arm64/boot/dts/renesas/draak-cvbs-input.dtbo: Warning
> (graph_port): /fragment@2: graph port node name should be 'port'
>     arch/arm64/boot/dts/renesas/draak-cvbs-input.dtso:13.14-15.3:
> Warning (graph_endpoint): /fragment@0/__overlay__: graph endpoint node
> name should be 'endpoint'
>     arch/arm64/boot/dts/renesas/draak-cvbs-input.dtso:27.10-29.3:
> Warning (graph_endpoint): /fragment@2/__overlay__: graph endpoint node
> name should be 'endpoint'
> 
> Do you think it would be worthwhile to add more hierarchy (like in
> arch/arm64/boot/dts/renesas/draak-ebisu-panel-aa104xd12.dtso), to get
> rid of the dtc warnings?

We could, but I think this is an issue that will need to somehow be
fixed in dtc. There are lots of warnings when compiling overlays, they
can only be validated when applied to a base DT.

-- 
Regards,

Laurent Pinchart
