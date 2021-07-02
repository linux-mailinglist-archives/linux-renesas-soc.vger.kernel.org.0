Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C94FA3B9DC2
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  2 Jul 2021 10:52:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230486AbhGBIyr convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 2 Jul 2021 04:54:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230424AbhGBIyr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 2 Jul 2021 04:54:47 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5EF94C061762
        for <linux-renesas-soc@vger.kernel.org>; Fri,  2 Jul 2021 01:52:15 -0700 (PDT)
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1lzEu5-00048K-Sf; Fri, 02 Jul 2021 10:52:05 +0200
Received: from pza by lupine with local (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1lzEu4-0003KP-2c; Fri, 02 Jul 2021 10:52:04 +0200
Message-ID: <634d5d9203b633ffdcc05a9b388cdab12f383d8d.camel@pengutronix.de>
Subject: Re: [PATCH v3 05/11] reset: renesas: Add RZ/G2L usbphy control
 driver
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Date:   Fri, 02 Jul 2021 10:52:04 +0200
In-Reply-To: <TYCPR01MB593358CF332F7C5CC1A852DD86019@TYCPR01MB5933.jpnprd01.prod.outlook.com>
References: <20210630073013.22415-1-biju.das.jz@bp.renesas.com>
         <20210630073013.22415-6-biju.das.jz@bp.renesas.com>
         <83276a09d6aea1b6e8ac4aa2bfef77ef99c2d76e.camel@pengutronix.de>
         <TYCPR01MB593358CF332F7C5CC1A852DD86019@TYCPR01MB5933.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-renesas-soc@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, 2021-06-30 at 13:25 +0000, Biju Das wrote:
[...]
> > What else does it control? Are we missing any functionality that would
> > have to be added later?
> 
> It has other controls like direct power down, clock control and connection control to
> handle the cases, when USB interface is not used permanently(like when port1 and port2 unused permanently)
> 
> In future, if there is a case like below(for eg:- )
> 1) when port1 and port2 unused permanently ( This case recommends HW mod as well)
> 2) when either port1 or port2 unused permanently( This case recommends, from HW point not to supply the power to unused port)
> 
> May be we could expose these properties in dt and probe time set the required control, if there is a requirement to support
> this cases in future.

Ok, thanks. If that's board design specific static configuration, I see
no issue.

[...]
> > > +	if ((val & 0xff) == (PHY_RESET_PORT1 | PHY_RESET_PORT2))
> >                    ^^^^
> > What is the significance of the magic 0xff?
> 
>  We should use (PHY_RESET_PORT1 | PHY_RESET_PORT2) instead.
> 
> Basically it is checking both ports are in reset state or not?

That would be better. Right now it's checking that bits 2, 3, 6, and 7
are cleared, and I couldn't tell whether that was by accident or on
purpose.

[...]
> > > +static void rzg2l_usbphy_ctrl_release_reset(struct reset_controller_dev
> > *rcdev,
> > > +					    unsigned long id)
> > > +{
> > > +	struct rzg2l_usbphy_ctrl_priv *priv = rcdev_to_priv(rcdev);
> > > +	void __iomem *base = priv->base;
> > > +	u32 val = readl(base + RESET);
> > > +
> > > +	val |= SEL_PLLRESET;
> > > +	val &= ~(PLL_RESET | (id ? PHY_RESET_PORT2 : PHY_RESET_PORT1));
> > > +	writel(val, base + RESET);

It would be good to protect the RESET register read-modify-writes with a
spinlock, same in the _set_reset() function.

regards
Philipp
