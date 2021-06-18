Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 043A23AC683
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Jun 2021 10:51:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230335AbhFRIyF (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 18 Jun 2021 04:54:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230006AbhFRIyF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 Jun 2021 04:54:05 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C25FC061574;
        Fri, 18 Jun 2021 01:51:56 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id ED5A39E2;
        Fri, 18 Jun 2021 10:51:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1624006314;
        bh=hQUo8DwHO+tQhJOPDPy0YoUUC+505MJXlaAzlDU0TRM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=SW73oHrQgZooWCoWzajTCIkAF8Z5FCYOY15yl4CPuvbxV0ccV3ravMF0lGHkoqp8u
         LESEP7FqQdFMA4/83CtrjZmjTSsXZ6aBXhbGWp5YBUv6VBZX3LGVEdzMm9/TmVFtCP
         ZRa0v8OVpNRfJh4FlldQQXrmkfZydHO+QiLPHduU=
Date:   Fri, 18 Jun 2021 11:51:30 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Ricardo =?utf-8?Q?Ca=C3=B1uelo?= <ricardo.canuelo@collabora.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Michal Simek <michal.simek@xilinx.com>,
        alexandre.torgue@foss.st.com,
        Collabora Kernel ML <kernel@collabora.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Rob Herring <robh+dt@kernel.org>,
        Wei Xu <xuwei5@hisilicon.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Marek Vasut <marex@denx.de>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [RESEND PATCH v4 3/3] dt-bindings: drm: bridge: adi,adv7511.txt:
 convert to yaml
Message-ID: <YMxekschULB87LKa@pendragon.ideasonboard.com>
References: <20210615131333.2272473-1-ricardo.canuelo@collabora.com>
 <20210615131333.2272473-4-ricardo.canuelo@collabora.com>
 <CAMuHMdU8ZC3LrhVLnZgOc_ZtNNcHbAHjEgP_5QpF8UEsbatGgA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdU8ZC3LrhVLnZgOc_ZtNNcHbAHjEgP_5QpF8UEsbatGgA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

On Fri, Jun 18, 2021 at 09:55:38AM +0200, Geert Uytterhoeven wrote:
> On Tue, Jun 15, 2021 at 3:15 PM Ricardo Cañuelo wrote:
> > Convert the ADV7511/11w/13/33/35 DT bindings to json-schema. The
> > original binding has been split into two files: adi,adv7511.yaml for
> > ADV7511/11W/13 and adi,adv7533.yaml for ADV7533/35.
> >
> > Signed-off-by: Ricardo Cañuelo <ricardo.canuelo@collabora.com>
> > Reviewed-by: Rob Herring <robh@kernel.org>
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> Thanks for your patch, which is now commit cfe34bb7a770c5d8
> ("dt-bindings: drm: bridge: adi,adv7511.txt: convert to yaml")
> in robh/for-next.
> 
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/bridge/adi,adv7511.yaml
> 
> > +required:
> > +  - compatible
> > +  - reg
> > +  - ports
> > +  - adi,input-depth
> > +  - adi,input-colorspace
> > +  - adi,input-clock
> > +  - avdd-supply
> > +  - dvdd-supply
> > +  - pvdd-supply
> > +  - dvdd-3v-supply
> > +  - bgvdd-supply
> 
> This causes lots of failures like:
> 
>     arm/boot/dts/r8a7743-iwg20d-q7-dbcm-ca.dt.yaml: hdmi@39:
> 'avdd-supply' is a required property
> 
> Should all supplies be required?
> Looking at the driver, missing supplies are automatically replaced by
> dummy regulators by the regulator framework.

Generally speaking, I like DT bindings to be descriptive of the
hardware, and thus require power supplies that are needed for the device
to function, even if they are fixed supplies.

This being said, I think there's also room to group some power supplies
together in the bindings, when they are not meant by the device to be
controlled separately. In this specific case, we also need to take into
account that the adv7511 and adv7533 have different supplies.

-- 
Regards,

Laurent Pinchart
