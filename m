Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5EDB636F31
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Jun 2019 10:55:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727480AbfFFIzI (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 6 Jun 2019 04:55:08 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:56886 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727279AbfFFIzI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 6 Jun 2019 04:55:08 -0400
Received: from penelope.horms.nl (ip4dab7138.direct-adsl.nl [77.171.113.56])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 562C225B77A;
        Thu,  6 Jun 2019 18:55:06 +1000 (AEST)
Received: by penelope.horms.nl (Postfix, from userid 7100)
        id 50679E21A74; Thu,  6 Jun 2019 10:55:04 +0200 (CEST)
Date:   Thu, 6 Jun 2019 10:55:04 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>
Subject: Re: [PATCH v2 2/2] ARM: dts: iwg23s-sbc: Fix SDHI2 VccQ regulator
Message-ID: <20190606085504.agvtxu3vadicfxau@verge.net.au>
References: <1559555632-2258-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1559555632-2258-3-git-send-email-fabrizio.castro@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1559555632-2258-3-git-send-email-fabrizio.castro@bp.renesas.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Jun 03, 2019 at 10:53:52AM +0100, Fabrizio Castro wrote:
> SDR50 isn't working anymore because the GPIO regulator
> driver is using descriptors since
> commit d6cd33ad7102 ("regulator: gpio: Convert to use descriptors")
> which in turn causes the system to use the polarity of the
> GPIOs (as specified in the DT) for selecting the states,
> but the polarity specified in the DT is wrong.
> This patch fixes the regulator DT definition, and that fixes
> SDR50.
> 
> Fixes: 9eb36b945b5c ("ARM: dts: iwg23s-sbc: Add uSD and eMMC support")
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

Thanks, I have applied this for inclusion in v5.3.
