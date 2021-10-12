Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E5EB42ABB3
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Oct 2021 20:14:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232809AbhJLSQb (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 12 Oct 2021 14:16:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232462AbhJLSQa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 12 Oct 2021 14:16:30 -0400
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45813C061745
        for <linux-renesas-soc@vger.kernel.org>; Tue, 12 Oct 2021 11:14:22 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:9c93:91ff:d58:ecfb])
        by laurent.telenet-ops.be with bizsmtp
        id 56EE2600J0KW32a016EEoF; Tue, 12 Oct 2021 20:14:17 +0200
Received: from geert (helo=localhost)
        by ramsan.of.borg with local-esmtp (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1maMI2-004QmP-Cm; Tue, 12 Oct 2021 20:14:14 +0200
Date:   Tue, 12 Oct 2021 20:14:14 +0200 (CEST)
From:   Geert Uytterhoeven <geert@linux-m68k.org>
X-X-Sender: geert@ramsan.of.borg
To:     Christian Gromm <christian.gromm@microchip.com>,
        gregkh@linuxfoundation.org
cc:     Rob Herring <robh+dt@kernel.org>,
        Nikita Yushchenko <nikita.yoush@cogentembedded.com>,
        linux-staging@lists.linux.dev, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 23/28] staging: most: dim2: use device tree
In-Reply-To: <1525772716-15742-24-git-send-email-christian.gromm@microchip.com>
Message-ID: <alpine.DEB.2.22.394.2110121749450.1045463@ramsan.of.borg>
References: <1525772716-15742-1-git-send-email-christian.gromm@microchip.com> <1525772716-15742-24-git-send-email-christian.gromm@microchip.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

 	Hi Christian, Greg,

CC devicetree, linux-renesas-soc

On Tue, 8 May 2018, Christian Gromm wrote:
> This patch removes the dependency to platform specific source files
> that do platform specific initialization and supply the IRQ number.
> Instead DT code is added
>
> Signed-off-by: Christian Gromm <christian.gromm@microchip.com>

This patch bypassed review by the DT people, and ended up in v4.18 as
commit 21e57ff086056c01 ("staging: most: dim2: use device tree").

> --- a/drivers/staging/most/dim2/dim2.c
> +++ b/drivers/staging/most/dim2/dim2.c
> +static const struct of_device_id dim2_of_match[] = {
> +	{
> +		.compatible = "fsl,imx6q-mlb150",
> +		.data = plat_data + FSL_MX6
> +	},
> +	{
> +		.compatible = "renesas,mlp",
> +		.data = plat_data + RCAR_H2
> +	},
> +	{
> +		.compatible = "rcar,medialb-dim2",
> +		.data = plat_data + RCAR_M3
> +	},
> +	{
> +		.compatible = "xlnx,axi4-os62420_3pin-1.00.a",
> +	},
> +	{
> +		.compatible = "xlnx,axi4-os62420_6pin-1.00.a",
> +	},
> +	{},
> };

There are no documented DT bindings for this hardware block, nor any
upstream example users.  Given some compatible values do not follow
standard practises (no idea about the other parts), it's very likely
these de facto bindings, and all their out-of-tree users, will have to
be changed.

Gr{oetje,eeting}s,

 						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
 							    -- Linus Torvalds
