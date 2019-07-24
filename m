Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8DF0A72D1C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Jul 2019 13:13:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727556AbfGXLNV (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 24 Jul 2019 07:13:21 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:45602 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726981AbfGXLNV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 24 Jul 2019 07:13:21 -0400
Received: from penelope.horms.nl (ip4dab7138.direct-adsl.nl [77.171.113.56])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 01B3D25BE40;
        Wed, 24 Jul 2019 21:13:19 +1000 (AEST)
Received: by penelope.horms.nl (Postfix, from userid 7100)
        id E5462E22041; Wed, 24 Jul 2019 13:13:16 +0200 (CEST)
Date:   Wed, 24 Jul 2019 13:13:16 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-kernel@vger.kernel.org, mark.rutland@arm.com,
        devicetree@vger.kernel.org, geert+renesas@glider.be,
        daniel.lezcano@linaro.org, linux-renesas-soc@vger.kernel.org,
        robh+dt@kernel.org, tglx@linutronix.de
Subject: Re: [PATCH 5/7] dt-bindings: timer: renesas, cmt: Update R-Car Gen3
 CMT1 usage
Message-ID: <20190724111316.nrkfzeh4e7nwdtau@verge.net.au>
References: <156345023791.5307.6113391102648394591.sendpatchset@octo>
 <156345031152.5307.4388075759256453367.sendpatchset@octo>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <156345031152.5307.4388075759256453367.sendpatchset@octo>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Jul 18, 2019 at 08:45:11PM +0900, Magnus Damm wrote:
> From: Magnus Damm <damm+renesas@opensource.se>
> 
> The R-Car Gen3 SoCs so far come with a total for 4 on-chip CMT devices:
>  - CMT0
>  - CMT1
>  - CMT2
>  - CMT3
> 
> CMT0 includes two rather basic 32-bit timer channels. The rest of the on-chip
> CMT devices support 48-bit counters and have 8 channels each.
> 
> Based on the data sheet information "CMT2/3 are exactly same as CMT1"
> it seems that CMT2 and CMT3 now use the CMT1 compat string in the DTSI.
> 
> Clarify this in the DT binding documentation by describing R-Car Gen3 and
> RZ/G2 CMT1 as "48-bit CMT devices".
> 
> Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Rob Herring <robh@kernel.org>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

