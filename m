Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1443749E46
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Jun 2019 12:31:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729189AbfFRKbX (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 18 Jun 2019 06:31:23 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:51448 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725934AbfFRKbX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 18 Jun 2019 06:31:23 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 7D3DF25AED3;
        Tue, 18 Jun 2019 20:31:21 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 609FC9408C4; Tue, 18 Jun 2019 12:31:19 +0200 (CEST)
Date:   Tue, 18 Jun 2019 12:31:19 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     devicetree@vger.kernel.org, mark.rutland@arm.com,
        linux-renesas-soc@vger.kernel.org, robh+dt@kernel.org
Subject: Re: [PATCH 0/8] dt-bindings: timer: renesas, cmt: Various updates
Message-ID: <20190618103118.xsgc5fp5d76itdwc@verge.net.au>
References: <156076216767.4736.16337667537984218274.sendpatchset@octo>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <156076216767.4736.16337667537984218274.sendpatchset@octo>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Jun 17, 2019 at 06:02:47PM +0900, Magnus Damm wrote:
> dt-bindings: timer: renesas, cmt: Various updates
> 
> [PATCH 1/8] dt-bindings: timer: renesas, cmt: Add CMT0234 to sh73a0 and r8a7740
> [PATCH 2/8] dt-bindings: timer: renesas, cmt: Update CMT1 on sh73a0 and r8a7740
> [PATCH 3/8] dt-bindings: timer: renesas, cmt: Add CMT0 and CMT1 to r8a7792
> [PATCH 4/8] dt-bindings: timer: renesas, cmt: Add CMT0 and CMT1 to r8a7795
> [PATCH 5/8] dt-bindings: timer: renesas, cmt: Add CMT0 and CMT1 to r8a77965
> [PATCH 6/8] dt-bindings: timer: renesas, cmt: Add CMT0 and CMT1 to r8a77990
> [PATCH 7/8] dt-bindings: timer: renesas, cmt: Add CMT0 and CMT1 to r8a77995
> [PATCH 8/8] dt-bindings: timer: renesas, cmt: Update R-Car Gen3 CMT1 usage
> 
> This series collect the following rather trivial DT binding changes:
> - Add 32-bit CMT0234 and convert CMT1 DT binding on sh73a0 and r8a7740.
> - Add documentation for the CMT on the R-Car Gen2 V2H (r8a7792) SoC.
> - Add missing R-Car Gen3 DT bindings for H3, M3-N, E3 an D3.
> - Update the R-Car Gen3 description to reflect current usage.
> 
> Please see each individual patch for more information.
> 
> Signed-off-by: Magnus Damm <damm+renesas@opensource.se>

Hi Magnus,

I think this series should include the Clocksource maintainers as
recipients:

Daniel Lezcano <daniel.lezcano@linaro.org>
Thomas Gleixner <tglx@linutronix.de>

And LKML for good measure.

