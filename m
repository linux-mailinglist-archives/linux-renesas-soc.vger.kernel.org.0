Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5107939E8D4
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Jun 2021 23:02:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230333AbhFGVE3 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 7 Jun 2021 17:04:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230329AbhFGVE2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 7 Jun 2021 17:04:28 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3916C061574
        for <linux-renesas-soc@vger.kernel.org>; Mon,  7 Jun 2021 14:02:36 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id f30so28598637lfj.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 07 Jun 2021 14:02:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=mBWx2oRqydcNEdp8RCquwp1qrgGotGINwUhyWH8v6Tw=;
        b=XVaaEJE9Mi9/Mz6j7vtWJhZPcG77b1HUFfeP0FO6QDW7nxAhoeI+TMBwUL1nOmLPn7
         JhmYwe1rbBkF80+5A7dUt1l2MSqs9olM84OKiYxwyU3bzHncnYTiJDJYnEogBR7FJpRX
         KFaKQy4daJ2C4m5TLTL0bCCJD1E5CqqyCOxXuvIu8zpdIq4PrURUBcsLNU99KvAB8l4j
         CLJRzoubg+z3ugP7NqwbOzapEA5tsXobs5HAxB0R0OsuTmyzs54SgRDJ+PyoBxFjaFBO
         KJQGRmuO19CqB2scixMD/+CN1LvZuYcD7Lf7guCjC1DgUM84WLstJUefHXTx272sQtxd
         bKZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=mBWx2oRqydcNEdp8RCquwp1qrgGotGINwUhyWH8v6Tw=;
        b=uDyALKSaNSOYPnzzdY6dr5wZuoAwTjOrHMa4bFGr12ieIg+j39ggCqhUyevY6V7+J0
         7CBwMhcN9OiKLqDOPOpKulC4VZl+QrIhKxYvEeDnPhyTFYHrPKE68tAh/9a0v+Y4+m/L
         BpGXp6cfup29cqwl7NXIe9CLIWMQnWRRUnFqRLrxkMz4/1TOEYgy+lX09As0B+Fnjx/Z
         NGJNGx9OUW0EzR8ucIOvfIv8p1wUx08IAOfWa0uruUk5X4o9uroqprBnVzxCbsOQADEc
         JG3nC7JJMO6KyvnEQpSwMQ27exX+GJy7N7maX0/lQDY+Qf8v/QfXIdDbWqDNJQVlvFwh
         icIg==
X-Gm-Message-State: AOAM532xH5j3tc8c/eEMLp9iVmh3lqCAmqLfr1F0c5GBSDCf0xhSd8iC
        04f5j2YJBeAs4fwX6WjBV9dLTjZpMimTag==
X-Google-Smtp-Source: ABdhPJwAq5OzuTmdQq0zimbsFhQTj2udHIprLq1IrIZCYBpsD5RUIiK5bGe3kJFfCBG6MeVfamRKxg==
X-Received: by 2002:ac2:4281:: with SMTP id m1mr12475955lfh.164.1623099753966;
        Mon, 07 Jun 2021 14:02:33 -0700 (PDT)
Received: from localhost (h-62-63-236-217.A463.priv.bahnhof.se. [62.63.236.217])
        by smtp.gmail.com with ESMTPSA id v2sm2064458ljv.63.2021.06.07.14.02.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jun 2021 14:02:33 -0700 (PDT)
Date:   Mon, 7 Jun 2021 23:02:32 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] arm64: dts: renesas: rcar-gen3: Add SoC model to comment
 headers
Message-ID: <YL6JaF8GEiuqnh4M@oden.dyn.berto.se>
References: <2cb7113d307b1bfdb33cd96245202b2d5d867818.1623087738.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2cb7113d307b1bfdb33cd96245202b2d5d867818.1623087738.git.geert+renesas@glider.be>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

Thanks for your work.

On 2021-06-07 19:42:38 +0200, Geert Uytterhoeven wrote:
> Make sure the R-Car Gen3 SoC model present is documented in the comment
> header of each board DTS.  This makes it easier to identify boards that
> are available with different SoC or SiP options.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

nit: Would it make sens to break the line length limit for this to make 
it easier for grep to be more useful? In either case,

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
> To be queued in renesas-devel for v5.14.
> 
>  arch/arm64/boot/dts/renesas/r8a77950-ulcb-kf.dts | 2 +-
>  arch/arm64/boot/dts/renesas/r8a77950-ulcb.dts    | 3 ++-
>  arch/arm64/boot/dts/renesas/r8a77951-ulcb-kf.dts | 2 +-
>  arch/arm64/boot/dts/renesas/r8a77951-ulcb.dts    | 3 ++-
>  arch/arm64/boot/dts/renesas/r8a77960-ulcb-kf.dts | 2 +-
>  arch/arm64/boot/dts/renesas/r8a77960-ulcb.dts    | 3 ++-
>  arch/arm64/boot/dts/renesas/r8a77961-ulcb-kf.dts | 2 +-
>  arch/arm64/boot/dts/renesas/r8a77965-ulcb-kf.dts | 2 +-
>  arch/arm64/boot/dts/renesas/r8a77965-ulcb.dts    | 3 ++-
>  arch/arm64/boot/dts/renesas/r8a77970-eagle.dts   | 2 +-
>  arch/arm64/boot/dts/renesas/r8a77980-condor.dts  | 2 +-
>  arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts   | 2 +-
>  arch/arm64/boot/dts/renesas/r8a77995-draak.dts   | 2 +-
>  arch/arm64/boot/dts/renesas/r8a779a0-falcon.dts  | 2 +-
>  14 files changed, 18 insertions(+), 14 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r8a77950-ulcb-kf.dts b/arch/arm64/boot/dts/renesas/r8a77950-ulcb-kf.dts
> index dcaaf12cec40dab4..85f008ef63ded5d6 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77950-ulcb-kf.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a77950-ulcb-kf.dts
> @@ -1,6 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0
>  /*
> - * Device Tree Source for the H3ULCB Kingfisher board
> + * Device Tree Source for the H3ULCB Kingfisher board with R-Car H3 ES1.x
>   *
>   * Copyright (C) 2017 Renesas Electronics Corp.
>   * Copyright (C) 2017 Cogent Embedded, Inc.
> diff --git a/arch/arm64/boot/dts/renesas/r8a77950-ulcb.dts b/arch/arm64/boot/dts/renesas/r8a77950-ulcb.dts
> index 38a6d6a108d488ed..f1df707b98a6e269 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77950-ulcb.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a77950-ulcb.dts
> @@ -1,6 +1,7 @@
>  // SPDX-License-Identifier: GPL-2.0
>  /*
> - * Device Tree Source for the H3ULCB (R-Car Starter Kit Premier) board
> + * Device Tree Source for the H3ULCB (R-Car Starter Kit Premier) board with
> + * R-Car H3 ES1.x
>   *
>   * Copyright (C) 2016 Renesas Electronics Corp.
>   * Copyright (C) 2016 Cogent Embedded, Inc.
> diff --git a/arch/arm64/boot/dts/renesas/r8a77951-ulcb-kf.dts b/arch/arm64/boot/dts/renesas/r8a77951-ulcb-kf.dts
> index 11f943a67703f0a8..2e58a27aa2766603 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77951-ulcb-kf.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a77951-ulcb-kf.dts
> @@ -1,6 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0
>  /*
> - * Device Tree Source for the H3ULCB Kingfisher board
> + * Device Tree Source for the H3ULCB Kingfisher board with R-Car H3 ES2.0+
>   *
>   * Copyright (C) 2017 Renesas Electronics Corp.
>   * Copyright (C) 2017 Cogent Embedded, Inc.
> diff --git a/arch/arm64/boot/dts/renesas/r8a77951-ulcb.dts b/arch/arm64/boot/dts/renesas/r8a77951-ulcb.dts
> index 8ad8f2a539771de8..21ce300b54abecef 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77951-ulcb.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a77951-ulcb.dts
> @@ -1,6 +1,7 @@
>  // SPDX-License-Identifier: GPL-2.0
>  /*
> - * Device Tree Source for the H3ULCB (R-Car Starter Kit Premier) board
> + * Device Tree Source for the H3ULCB (R-Car Starter Kit Premier) board with
> + * R-Car H3 ES2.0+
>   *
>   * Copyright (C) 2016 Renesas Electronics Corp.
>   * Copyright (C) 2016 Cogent Embedded, Inc.
> diff --git a/arch/arm64/boot/dts/renesas/r8a77960-ulcb-kf.dts b/arch/arm64/boot/dts/renesas/r8a77960-ulcb-kf.dts
> index 2151c37d77a6c942..02d61360692c0ac6 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77960-ulcb-kf.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a77960-ulcb-kf.dts
> @@ -1,6 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0
>  /*
> - * Device Tree Source for the M3ULCB Kingfisher board
> + * Device Tree Source for the M3ULCB Kingfisher board with R-Car M3-W
>   *
>   * Copyright (C) 2017 Renesas Electronics Corp.
>   * Copyright (C) 2017 Cogent Embedded, Inc.
> diff --git a/arch/arm64/boot/dts/renesas/r8a77960-ulcb.dts b/arch/arm64/boot/dts/renesas/r8a77960-ulcb.dts
> index d041042a56192ab2..d936fb9281be6edd 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77960-ulcb.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a77960-ulcb.dts
> @@ -1,6 +1,7 @@
>  // SPDX-License-Identifier: GPL-2.0
>  /*
> - * Device Tree Source for the M3ULCB (R-Car Starter Kit Pro) board
> + * Device Tree Source for the M3ULCB (R-Car Starter Kit Pro) board with R-Car
> + * M3-W
>   *
>   * Copyright (C) 2016 Renesas Electronics Corp.
>   * Copyright (C) 2016 Cogent Embedded, Inc.
> diff --git a/arch/arm64/boot/dts/renesas/r8a77961-ulcb-kf.dts b/arch/arm64/boot/dts/renesas/r8a77961-ulcb-kf.dts
> index 6ec958348eb025d9..d66eb27ee8c48189 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77961-ulcb-kf.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a77961-ulcb-kf.dts
> @@ -1,6 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0
>  /*
> - * Device Tree Source for the M3ULCB Kingfisher board
> + * Device Tree Source for the M3ULCB Kingfisher board with R-Car M3-W+
>   *
>   * Copyright (C) 2020 Eugeniu Rosca <rosca.eugeniu@gmail.com>
>   */
> diff --git a/arch/arm64/boot/dts/renesas/r8a77965-ulcb-kf.dts b/arch/arm64/boot/dts/renesas/r8a77965-ulcb-kf.dts
> index 12aa08fd6fd87f7e..a601968c5727e55a 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77965-ulcb-kf.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a77965-ulcb-kf.dts
> @@ -1,6 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0
>  /*
> - * Device Tree Source for the M3NULCB Kingfisher board
> + * Device Tree Source for the M3NULCB Kingfisher board with R-Car M3-N
>   *
>   * Copyright (C) 2018 Renesas Electronics Corp.
>   * Copyright (C) 2018 Cogent Embedded, Inc.
> diff --git a/arch/arm64/boot/dts/renesas/r8a77965-ulcb.dts b/arch/arm64/boot/dts/renesas/r8a77965-ulcb.dts
> index 964078b6cc49e959..87b013279c74dc48 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77965-ulcb.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a77965-ulcb.dts
> @@ -1,6 +1,7 @@
>  // SPDX-License-Identifier: GPL-2.0
>  /*
> - * Device Tree Source for the M3NULCB (R-Car Starter Kit Pro) board
> + * Device Tree Source for the M3NULCB (R-Car Starter Kit Pro) board with R-Car
> + * M3-N
>   *
>   * Copyright (C) 2018 Renesas Electronics Corp.
>   * Copyright (C) 2018 Cogent Embedded, Inc.
> diff --git a/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts b/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
> index 5c84681703edad2e..d24da54f312b9085 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
> @@ -1,6 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0
>  /*
> - * Device Tree Source for the Eagle board
> + * Device Tree Source for the Eagle board with R-Car V3M
>   *
>   * Copyright (C) 2016-2017 Renesas Electronics Corp.
>   * Copyright (C) 2017 Cogent Embedded, Inc.
> diff --git a/arch/arm64/boot/dts/renesas/r8a77980-condor.dts b/arch/arm64/boot/dts/renesas/r8a77980-condor.dts
> index 7bde0a549c09884f..edf7f2a2f958787c 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77980-condor.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a77980-condor.dts
> @@ -1,6 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0
>  /*
> - * Device Tree Source for the Condor board
> + * Device Tree Source for the Condor board with R-Car V3H
>   *
>   * Copyright (C) 2018 Renesas Electronics Corp.
>   * Copyright (C) 2018 Cogent Embedded, Inc.
> diff --git a/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts b/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
> index 4715e4a4abe064cd..236671401bc1e4de 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
> @@ -1,6 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0
>  /*
> - * Device Tree Source for the ebisu board
> + * Device Tree Source for the Ebisu board with R-Car E3
>   *
>   * Copyright (C) 2018 Renesas Electronics Corp.
>   */
> diff --git a/arch/arm64/boot/dts/renesas/r8a77995-draak.dts b/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
> index 6783c3ad08567e4b..9290ea49e2dd3c7a 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
> @@ -1,6 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0
>  /*
> - * Device Tree Source for the Draak board
> + * Device Tree Source for the Draak board with R-Car D3
>   *
>   * Copyright (C) 2016-2018 Renesas Electronics Corp.
>   * Copyright (C) 2017 Glider bvba
> diff --git a/arch/arm64/boot/dts/renesas/r8a779a0-falcon.dts b/arch/arm64/boot/dts/renesas/r8a779a0-falcon.dts
> index 687f019e79f059a1..dc671ff57ec7678a 100644
> --- a/arch/arm64/boot/dts/renesas/r8a779a0-falcon.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a779a0-falcon.dts
> @@ -1,6 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0
>  /*
> - * Device Tree Source for the Falcon CPU and BreakOut boards
> + * Device Tree Source for the Falcon CPU and BreakOut boards with R-Car V3U
>   *
>   * Copyright (C) 2020 Renesas Electronics Corp.
>   */
> -- 
> 2.25.1
> 

-- 
Regards,
Niklas Söderlund
