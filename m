Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9C978A43B7
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 31 Aug 2019 11:48:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726313AbfHaJsh (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 31 Aug 2019 05:48:37 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:53016 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726102AbfHaJsh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 31 Aug 2019 05:48:37 -0400
Received: from penelope.horms.nl (ip4dab7138.direct-adsl.nl [77.171.113.56])
        by kirsty.vergenet.net (Postfix) with ESMTPA id A4F8E25AE77;
        Sat, 31 Aug 2019 19:48:35 +1000 (AEST)
Received: by penelope.horms.nl (Postfix, from userid 7100)
        id 76A5BE22BF5; Sat, 31 Aug 2019 11:48:33 +0200 (CEST)
Date:   Sat, 31 Aug 2019 11:48:33 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 0/7] soc: renesas: rcar-gen3-sysc: Fix power request
 conflicts
Message-ID: <20190831094833.qhj6otyocnq2di5l@verge.net.au>
References: <20190828113618.6672-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190828113618.6672-1-geert+renesas@glider.be>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Aug 28, 2019 at 01:36:11PM +0200, Geert Uytterhoeven wrote:
> 	Hi all,
> 
> Recent R-Car Gen3 SoCs added an External Request Mask Register to the
> System Controller (SYSC).  This register allows to mask external power
> requests for CPU or 3DG domains, to prevent conflicts between powering
> off CPU cores or the 3D Graphics Engine, and changing the state of
> another power domain through SYSC, which could lead to CPG state machine
> lock-ups.
> 
> This patch series starts making use of this register.  Note that the
> register is optional, and that its location and contents are
> SoC-specific.
> 
> This was inspired by a patch in the BSP by Dien Pham
> <dien.pham.ry@renesas.com>.
> 
> Note that the issue fixed cannot happen in the upstream kernel, as
> upstream has no support for graphics acceleration yet.  SoCs lacking the
> External Request Mask Register may need a different mitigation in the
> future.
> 
> Changes compared to v1[1]:
>   - Improve description of cover letter and first patch.
> 
> Changes compared to RFC[2]:
>   - Rebased.
> 
> This has been boot-tested on R-Car H3 ES1.0, H3 ES2.0, M3-W ES1.0, M3-N,
> V3M, and E3 (only the last 3 have this register!), and regression-tested
> on R-Car Gen2.
> 
> This has not been tested on R-Car H3 ES3.0, M3-W ES2.0, and V3H.
> 
> For your convenience, this series is available in the
> topic/rcar3-sysc-extmask-v2 branch of my renesas-drivers git repository at
> git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git.
> 
> Thanks for your comments!

Looks good to me.

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

