Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 305CE902BF
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 16 Aug 2019 15:19:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726742AbfHPNT1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 16 Aug 2019 09:19:27 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:54702 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726597AbfHPNT1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 16 Aug 2019 09:19:27 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 0149225BDF3;
        Fri, 16 Aug 2019 23:19:25 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id F117D94057D; Fri, 16 Aug 2019 15:19:22 +0200 (CEST)
Date:   Fri, 16 Aug 2019 15:19:22 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Daniel Lezcano <daniel.lezcano@linaro.org>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Chris Brandt <Chris.Brandt@renesas.com>,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] clocksource/drivers/renesas-ostm: Fix probe error
 path
Message-ID: <20190816131922.rzusel5ylggqo4r7@verge.net.au>
References: <20190807084635.24173-1-geert+renesas@glider.be>
 <20190807084635.24173-3-geert+renesas@glider.be>
 <db9961d5-e075-5dca-3417-023b7b8ba4c1@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <db9961d5-e075-5dca-3417-023b7b8ba4c1@linaro.org>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Aug 07, 2019 at 08:13:27PM +0200, Daniel Lezcano wrote:
> On 07/08/2019 10:46, Geert Uytterhoeven wrote:
> > Fix various issues in the error path of ostm_init():
> >   1. Drop error message printing on of_iomap() failure, as the memory
> >      allocation core already takes of that,
> >   2. Handle irq_of_parse_and_map() failures correctly: it returns
> >      unsigned int, hence make irq unsigned int, and zero is an error,
> >   3. Propagate/return appropriate error codes instead of -EFAULT.
> >   4. Add a missing clk_put(),
> >   5. Split the single cleanup block in separate phases, to avoid
> >      clk_put() calling WARN() when passed an error pointer.
> 
> Does it make sense to convert to timer-of API?

I don't have an opinion on that at this time,
but as an improvement this patch looks good to me.

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
