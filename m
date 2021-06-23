Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA48D3B13C3
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Jun 2021 08:12:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229726AbhFWGOU (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 23 Jun 2021 02:14:20 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:45028 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229660AbhFWGOT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 23 Jun 2021 02:14:19 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: rcn)
        with ESMTPSA id 75EF81F42F80
Message-ID: <52caf3779aa5b764bf193264cd5c5b8a542dea0a.camel@collabora.com>
Subject: Re: [RESEND PATCH v4 3/3] dt-bindings: drm: bridge:
 adi,adv7511.txt: convert to yaml
From:   Ricardo =?ISO-8859-1?Q?Ca=F1uelo?= <ricardo.canuelo@collabora.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
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
Date:   Wed, 23 Jun 2021 08:11:51 +0200
In-Reply-To: <YMxekschULB87LKa@pendragon.ideasonboard.com>
References: <20210615131333.2272473-1-ricardo.canuelo@collabora.com>
         <20210615131333.2272473-4-ricardo.canuelo@collabora.com>
         <CAMuHMdU8ZC3LrhVLnZgOc_ZtNNcHbAHjEgP_5QpF8UEsbatGgA@mail.gmail.com>
         <YMxekschULB87LKa@pendragon.ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi,
 
> On Fri, Jun 18, 2021 at 09:55:38AM +0200, Geert Uytterhoeven wrote:
> > This causes lots of failures like:
> > 
> >     arm/boot/dts/r8a7743-iwg20d-q7-dbcm-ca.dt.yaml: hdmi@39:
> > 'avdd-supply' is a required property
> > 
> > Should all supplies be required?
> > Looking at the driver, missing supplies are automatically replaced by
> > dummy regulators by the regulator framework.
> 
> Generally speaking, I like DT bindings to be descriptive of the
> hardware, and thus require power supplies that are needed for the device
> to function, even if they are fixed supplies.
> 
> This being said, I think there's also room to group some power supplies
> together in the bindings, when they are not meant by the device to be
> controlled separately. In this specific case, we also need to take into
> account that the adv7511 and adv7533 have different supplies.

Thanks for the review, guys. Yes, there were some dtbs check warnings to
be expected, the consensus in a previous version of the patch was that
that shouldn't be a blocker for a binding conversion and that the *.dts
definitions should eventually be fixed to comply with the binding, which
is, IMO, a more reasonable process to keep the binding conversion
effort progressing.

Cheers,
Ricardo


