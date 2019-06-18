Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2118749E45
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Jun 2019 12:31:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729209AbfFRKbO (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 18 Jun 2019 06:31:14 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:51420 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725934AbfFRKbO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 18 Jun 2019 06:31:14 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id CB23725AED3;
        Tue, 18 Jun 2019 20:31:11 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id B54119408C4; Tue, 18 Jun 2019 12:31:09 +0200 (CEST)
Date:   Tue, 18 Jun 2019 12:31:09 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 0/3] clocksource/drivers/sh_cmt: Minor DT compat string
 update
Message-ID: <20190618103109.pdhlhnz623ypqrju@verge.net.au>
References: <156076560641.6960.5508309411424406087.sendpatchset@octo>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <156076560641.6960.5508309411424406087.sendpatchset@octo>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Jun 17, 2019 at 07:00:06PM +0900, Magnus Damm wrote:
> clocksource/drivers/sh_cmt: Minor DT compat string update
> 
> [PATCH 1/3] clocksource/drivers/sh_cmt: SoC-specific match for CMT1 on r8a7740 and sh73a0
> [PATCH 2/3] clocksource/drivers/sh_cmt: Remove "cmt-48-gen2" support
> [PATCH 3/3] clocksource/drivers/sh_cmt: Document "cmt-48" as deprecated
> 
> Move over to new CMT1 bindings on r8a7740 and sh73a0 and get rid of old
> stale stuff such as "cmt-48-gen2" while keeping "cmt-48" around but document
> it as deprecated.
> 
> Signed-off-by: Magnus Damm <damm+renesas@opensource.se>


Hi Magnus,

I think this series should include the Clocksource maintainers as
recipients:

Daniel Lezcano <daniel.lezcano@linaro.org>
Thomas Gleixner <tglx@linutronix.de>

And LKML for good measure.

> ---
> 
> Patch 1 and patch 3 depend on updated SoC-specific DT bindings in:
> [PATCH 2/8] dt-bindings: timer: renesas, cmt: Update CMT1 on sh73a0 and r8a7740
> 
>  drivers/clocksource/sh_cmt.c |   19 +++++++++++++------
>  1 file changed, 13 insertions(+), 6 deletions(-)
> 
