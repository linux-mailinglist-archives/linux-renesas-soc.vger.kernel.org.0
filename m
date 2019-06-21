Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 110CE4E0EC
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Jun 2019 09:09:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726054AbfFUHIz (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 21 Jun 2019 03:08:55 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:55706 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726008AbfFUHIy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 21 Jun 2019 03:08:54 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 0FC9025AE8A;
        Fri, 21 Jun 2019 17:08:52 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 121309408C4; Fri, 21 Jun 2019 09:08:50 +0200 (CEST)
Date:   Fri, 21 Jun 2019 09:08:50 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     linux-mmc@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH] dt-binding: mmc: rename tmio_mmc.txt to renesas_sdhi.txt
Message-ID: <20190621070849.7efe5qihb3zxgjse@verge.net.au>
References: <20190621035010.13884-1-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190621035010.13884-1-yamada.masahiro@socionext.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Jun 21, 2019 at 12:50:10PM +0900, Masahiro Yamada wrote:
> As commit b6147490e6aa ("mmc: tmio: split core functionality, DMA and
> MFD glue") said, these MMC controllers use the IP from Panasonic.
> 
> TMIO (Toshiba Mobile IO) MMC was the first upstreamed user of this IP.
> The common driver code was split and expanded as 'tmio-mmc-core', then
> it become historical misnomer since 'tmio' is not the name of this IP
> in the first place.
> 
> In the discussion [1], we decide to keep calling these MMC variants
> 'TMIO MMC' at least in Linux driver level because renaming all of them
> is a big churn.
> 
> However, DT should not be oriented to a particular project even though
> it is developed in Linux communities.
> 
> Let's stop exporting this unfortunate things to other projects, where
> there is no good reason to call this "TMIO". Rename the file to
> renesas_sdhi.txt. In fact, all the information in this file is specific
> to the Renesas platform.
> 
> This commit also removes the first paragraph entirely. The DT-binding
> should describe the hardware. It is really strange to talk about Linux
> driver internals such as how the drivers are probed, how platform data
> are handed off, etc.
> 
> [1] https://www.spinics.net/lists/linux-mmc/msg46952.html
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
> 
> I sent this before, but it was dismissed somehow.
> I am resending this.

Hi Yamada-san,

I for one am fine with this change.

My minor nit is that I think that renesas,sdhi.txt would be a slightly
better filename in terms of consistency with other renesas bindings
documentation filenames.

> 
> 
>  .../bindings/mmc/{tmio_mmc.txt => renesas_sdhi.txt}   | 11 +----------
>  1 file changed, 1 insertion(+), 10 deletions(-)
>  rename Documentation/devicetree/bindings/mmc/{tmio_mmc.txt => renesas_sdhi.txt} (87%)
> 
> diff --git a/Documentation/devicetree/bindings/mmc/tmio_mmc.txt b/Documentation/devicetree/bindings/mmc/renesas_sdhi.txt
> similarity index 87%
> rename from Documentation/devicetree/bindings/mmc/tmio_mmc.txt
> rename to Documentation/devicetree/bindings/mmc/renesas_sdhi.txt
> index 2b4f17ca9087..dd08d038a65c 100644
> --- a/Documentation/devicetree/bindings/mmc/tmio_mmc.txt
> +++ b/Documentation/devicetree/bindings/mmc/renesas_sdhi.txt
> @@ -1,13 +1,4 @@
> -* Toshiba Mobile IO SD/MMC controller
> -
> -The tmio-mmc driver doesn't probe its devices actively, instead its binding to
> -devices is managed by either MFD drivers or by the sh_mobile_sdhi platform
> -driver. Those drivers supply the tmio-mmc driver with platform data, that either
> -describe hardware capabilities, known to them, or are obtained by them from
> -their own platform data or from their DT information. In the latter case all
> -compulsory and any optional properties, common to all SD/MMC drivers, as
> -described in mmc.txt, can be used. Additionally the following tmio_mmc-specific
> -optional bindings can be used.
> +* Renesas SDHI SD/MMC controller
>  
>  Required properties:
>  - compatible: should contain one or more of the following:
> -- 
> 2.17.1
> 
