Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E6BC744AD74
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Nov 2021 13:21:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236467AbhKIMY3 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 9 Nov 2021 07:24:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241979AbhKIMYW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 9 Nov 2021 07:24:22 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CE0AC0613F5
        for <linux-renesas-soc@vger.kernel.org>; Tue,  9 Nov 2021 04:21:35 -0800 (PST)
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1mkQ7v-0005tj-Pb; Tue, 09 Nov 2021 13:21:23 +0100
Received: from pza by lupine with local (Exim 4.94.2)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1mkQ7p-000boc-CW; Tue, 09 Nov 2021 13:21:17 +0100
Message-ID: <8c3107537be9bc430de5547ce4ab168b9705cc12.camel@pengutronix.de>
Subject: Re: [PATCH v2 3/3] serial: sh-sci: Add support to deassert/assert
 reset line
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jiri Slaby <jirislaby@kernel.org>
Cc:     linux-serial@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>
Date:   Tue, 09 Nov 2021 13:21:17 +0100
In-Reply-To: <20211109121631.26687-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20211109121631.26687-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
         <20211109121631.26687-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

On Tue, 2021-11-09 at 12:16 +0000, Lad Prabhakar wrote:
> On RZ/G2L SoC we need to explicitly deassert the reset line
> for the device to work, use this opportunity to deassert/assert
> reset line in sh-sci driver.
> 
> This patch adds support to read the "resets" property (if available)
> from DT and perform deassert/assert when required.
> 
> Also, propagate the error to the caller of sci_parse_dt() instead of
> returning NULL in case of failure.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp
