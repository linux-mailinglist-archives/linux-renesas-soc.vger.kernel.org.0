Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B2381CE208
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 May 2020 19:51:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726891AbgEKRvD (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 11 May 2020 13:51:03 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:37485 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726310AbgEKRvC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 11 May 2020 13:51:02 -0400
Received: by mail-ot1-f67.google.com with SMTP id z17so8268432oto.4;
        Mon, 11 May 2020 10:51:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dv11OYYCqnzc6zMWFHWY2m/yP18XAr5yVlsgzBkGlOM=;
        b=jeKc0vj/lVHo7vMpdJ786URFlXgonD6KRT0VxE0e+ypxSX/pdXc4RQoPZSkQvzy45T
         ykL1FQYnG+5RtAQ3anlImX69ymd8G07feSZZ2WNbQWBTSerQ8FkGECoazc7rdaZnjtnD
         kDi+XP3rjOJX4Wr1p6F4lz4bl7RGkOEpsJVHd3IFmhuDLA9OGIffZbCa2DxUfapQGJTY
         lwZCcuf8x1LOYiitlW+wixFP7Jtm9yhAuokS9lB2d6HGRQjM+DWhUYfzuwVIuiqnp6dP
         HKU0pPolwPEXXWybw4zqFWw/6h9IVFrCnUC5mviePs2GvT7QB8QZkwXcmCYOJqqwmjPN
         nyfg==
X-Gm-Message-State: AGi0PuadJ+j+DuAzFIfrcTsD84ORj0CcpQTaAWkdKdhonY8UwYGyjvJ/
        /2GNmegqJ9CoxFhF0L8huLe93D+QJXPCUTMv7rU=
X-Google-Smtp-Source: APiQypLVjWlhqHxdXs6KSsw3VJLCELYOE+LtyrIZWUD1fQqtgg6kKCl9e9spU9G/3/FvPyZy+0QABE7Z3QIA6tvq7Ps=
X-Received: by 2002:a9d:63da:: with SMTP id e26mr12743845otl.107.1589219461670;
 Mon, 11 May 2020 10:51:01 -0700 (PDT)
MIME-Version: 1.0
References: <1589214838-18075-1-git-send-email-uli+renesas@fpond.eu>
In-Reply-To: <1589214838-18075-1-git-send-email-uli+renesas@fpond.eu>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 11 May 2020 19:50:40 +0200
Message-ID: <CAMuHMdUTgrWZcEO6msW13hW=UzbkQZcGY5b0d9uhWyJN_K3yDQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] clk: renesas: cpg-mssr: add never-disable option
To:     Ulrich Hecht <uli+renesas@fpond.eu>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Wolfram Sang <wsa@the-dreams.de>,
        Magnus Damm <magnus.damm@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

CC clk

Complete series at
http://lore.kernel.org/r/1589214838-18075-1-git-send-email-uli+renesas@fpond.eu

On Mon, May 11, 2020 at 6:34 PM Ulrich Hecht <uli+renesas@fpond.eu> wrote:
> This revision should work more reliably as it keeps the never-disable
> handling in the clock driver instead of relying on the semantics of
> CLK_IGNORE_UNUSED, which still allows clocks to be turned off for power
> management.
>
> This series adds the option for declaring clocks as "never-disable", i.e.
> clocks that will not be turned on if not used, but also not turned off if
> unused. It also enables this option for the RWDT clocks in (almost) all
> SoCs.
>
> The point of this is to allow a WDT that has been enabled by the bootloader
> to survive these events:
>
> - deferred probing of the WDT device, which can lead the clock driver
>   to disable the WDT clock until the WDT is re-probed, giving it a
>   blind spot
> - probe failure in the WDT driver
>
> There are a number of Gen2 and RZ/G1 SoCs that have the RWDT clock declared
> as critical in order to allow SMP bringup code to work. These have been
> left as they are.
>
> CU
> Uli
>
>
> Changes since v2:
> - use the term "never-disable" instead of "ignore-unused"
> - do the handling internally instead of relying on the behavior of
>   CLK_IGNORE_UNUSED
>
> Changes since v1:
> - rename data structures for clarity
> - squash SoC-specific patches into one per family
>
>
> Ulrich Hecht (3):
>   clk: renesas: cpg-mssr: add support for never-disable clocks
>   clk: renesas: rcar-gen3: mark RWDT clocks as never-disable
>   clk: renesas: rzg2: mark RWDT clock as never-disable
>
>  drivers/clk/renesas/r8a774a1-cpg-mssr.c |  5 +++++
>  drivers/clk/renesas/r8a774b1-cpg-mssr.c |  5 +++++
>  drivers/clk/renesas/r8a774c0-cpg-mssr.c |  5 +++++
>  drivers/clk/renesas/r8a7795-cpg-mssr.c  |  6 +++++-
>  drivers/clk/renesas/r8a7796-cpg-mssr.c  |  6 +++++-
>  drivers/clk/renesas/r8a77965-cpg-mssr.c |  5 +++++
>  drivers/clk/renesas/r8a77970-cpg-mssr.c |  6 +++++-
>  drivers/clk/renesas/r8a77980-cpg-mssr.c |  6 +++++-
>  drivers/clk/renesas/r8a77990-cpg-mssr.c |  5 +++++
>  drivers/clk/renesas/r8a77995-cpg-mssr.c |  6 +++++-
>  drivers/clk/renesas/renesas-cpg-mssr.c  | 10 ++++++++++
>  drivers/clk/renesas/renesas-cpg-mssr.h  |  9 +++++++++
>  12 files changed, 69 insertions(+), 5 deletions(-)
