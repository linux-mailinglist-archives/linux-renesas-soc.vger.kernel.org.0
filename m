Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A9486456E56
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 19 Nov 2021 12:44:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235141AbhKSLkS convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 19 Nov 2021 06:40:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235131AbhKSLkP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 19 Nov 2021 06:40:15 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1870AC06173E
        for <linux-renesas-soc@vger.kernel.org>; Fri, 19 Nov 2021 03:37:14 -0800 (PST)
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1mo2CU-0001Lo-Gn; Fri, 19 Nov 2021 12:37:02 +0100
Received: from pza by lupine with local (Exim 4.94.2)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1mo2CS-0008Yh-FY; Fri, 19 Nov 2021 12:37:00 +0100
Message-ID: <b3bfa4b6e96f8a057c0ee7743a4e11aa9be4e8bb.camel@pengutronix.de>
Subject: Re: [PATCH v3 1/4] reset: Add
 of_reset_control_get_optional_exclusive()
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Date:   Fri, 19 Nov 2021 12:37:00 +0100
In-Reply-To: <20211112184413.4391-2-biju.das.jz@bp.renesas.com>
References: <20211112184413.4391-1-biju.das.jz@bp.renesas.com>
         <20211112184413.4391-2-biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.38.3-1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-renesas-soc@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Daniel, Thomas,

On Fri, 2021-11-12 at 18:44 +0000, Biju Das wrote:
> Add optional variant of of_reset_control_get_exclusive(). If the
> requested reset is not specified in the device tree, this function
> returns NULL instead of an error.
> 
> Suggested-by: Philipp Zabel <p.zabel@pengutronix.de>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v2->v3:
>  * Added Geert's Rb tag
> ---

I've picked up this patch for the reset/next branch:

----------8<----------
The following changes since commit fa55b7dcdc43c1aa1ba12bca9d2dd4318c2a0dbf:

  Linux 5.16-rc1 (2021-11-14 13:56:52 -0800)

are available in the Git repository at:

  git://git.pengutronix.de/pza/linux reset/of-get-optional-exclusive

for you to fetch changes up to c4f5b30dda01f2f6979a9681142de454991182ee:

  reset: Add of_reset_control_get_optional_exclusive() (2021-11-19 12:23:45 +0100)

----------------------------------------------------------------
Biju Das (1):
      reset: Add of_reset_control_get_optional_exclusive()

 include/linux/reset.h | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)
---------->8----------

Patch 3/4 of the "Add RZ/G2L OSTM support" series depends on it. Let me
know if you prefer this to be merged together with the rest of the
series instad, in which case you'll have my

Acked-by: Philipp Zabel <p.zabel@pengutronix.de>

on the patch and I'll drop it from reset/next.

regards
Philipp
