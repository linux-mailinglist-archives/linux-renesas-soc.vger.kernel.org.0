Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7E98E5CE52
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Jul 2019 13:24:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726369AbfGBLYj (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 2 Jul 2019 07:24:39 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:33860 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726150AbfGBLYj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 2 Jul 2019 07:24:39 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id D2EC625AEC8;
        Tue,  2 Jul 2019 21:24:36 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id CE40F940476; Tue,  2 Jul 2019 13:24:34 +0200 (CEST)
Date:   Tue, 2 Jul 2019 13:24:34 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     linux-mmc@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>,
        Simon Horman <simon.horman@netronome.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH v2] dt-binding: mmc: rename tmio_mmc.txt to
 renesas,sdhi.txt
Message-ID: <20190702112434.ll3btya7fepkb5tn@verge.net.au>
References: <20190624070345.20373-1-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190624070345.20373-1-yamada.masahiro@socionext.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Jun 24, 2019 at 04:03:45PM +0900, Masahiro Yamada wrote:
> As commit b6147490e6aa ("mmc: tmio: split core functionality, DMA and
> MFD glue") said, these MMC controllers use the IP from Panasonic.
> 
> TMIO (Toshiba Mobile IO) MMC was the first upstreamed user of this IP.
> The common driver code was split and expanded as 'tmio-mmc-core', then
> it became historical misnomer since 'tmio' is not the name of this IP.
> 
> In the discussion [1], we decide to keep this name as-is at least in
> Linux driver level because renaming everything is a big churn.
> 
> However, DT should not be oriented to a particular project even though
> it is mainly developed in Linux communities.
> 
> This is the misfortune only in Linux. Let's stop exporting it to other
> projects, where there is no good reason to call this hardware "TMIO".
> Rename the file to renesas,sdhi.txt. In fact, all the information in
> this file is specific to the Renesas platform.
> 
> This commit also removes the first paragraph entirely. The DT-binding
> should describe the hardware. It is strange to talk about Linux driver
> internals such as how the drivers are probed, how platform data are
> handed off, etc.
> 
> [1] https://www.spinics.net/lists/linux-mmc/msg46952.html
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

> ---
> 
> Changes in v2:
>  - Rename to renesas,sdhi.txt instead of renesas_sdhi.txt
> 
>  .../bindings/mmc/{tmio_mmc.txt => renesas,sdhi.txt}   | 11 +----------
>  1 file changed, 1 insertion(+), 10 deletions(-)
>  rename Documentation/devicetree/bindings/mmc/{tmio_mmc.txt => renesas,sdhi.txt} (87%)
> 
> diff --git a/Documentation/devicetree/bindings/mmc/tmio_mmc.txt b/Documentation/devicetree/bindings/mmc/renesas,sdhi.txt
> similarity index 87%
> rename from Documentation/devicetree/bindings/mmc/tmio_mmc.txt
> rename to Documentation/devicetree/bindings/mmc/renesas,sdhi.txt
> index 2b4f17ca9087..dd08d038a65c 100644
> --- a/Documentation/devicetree/bindings/mmc/tmio_mmc.txt
> +++ b/Documentation/devicetree/bindings/mmc/renesas,sdhi.txt
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
