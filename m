Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B3D344C05A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Nov 2021 12:53:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231158AbhKJLzx convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 10 Nov 2021 06:55:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229653AbhKJLzw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 10 Nov 2021 06:55:52 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F90BC061764
        for <linux-renesas-soc@vger.kernel.org>; Wed, 10 Nov 2021 03:53:05 -0800 (PST)
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1mkm9r-0004Z4-FQ; Wed, 10 Nov 2021 12:52:51 +0100
Received: from pza by lupine with local (Exim 4.94.2)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1mkm9n-000A1I-IA; Wed, 10 Nov 2021 12:52:47 +0100
Message-ID: <92389952d7072efafaf7da67acfce84fd5f3b932.camel@pengutronix.de>
Subject: Re: [PATCH 2/2] clocksource/drivers/renesas-ostm: Add RZ/G2L OSTM
 support
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Chris Brandt <Chris.Brandt@renesas.com>,
        "linux-stm32@st-md-mailman.stormreply.com" 
        <linux-stm32@st-md-mailman.stormreply.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Date:   Wed, 10 Nov 2021 12:52:47 +0100
In-Reply-To: <OS0PR01MB59224396F5796647A675D75486939@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20211110083152.31144-1-biju.das.jz@bp.renesas.com>
         <20211110083152.31144-3-biju.das.jz@bp.renesas.com>
         <CAMuHMdX+3TfX21HtuUcUQp1SZKJgZ0By8XFxzpxSED1H8_ua0w@mail.gmail.com>
         <d9f7b80e1abbd1323c5ec7fcdf57fb1a855929cd.camel@pengutronix.de>
         <OS0PR01MB59224396F5796647A675D75486939@OS0PR01MB5922.jpnprd01.prod.outlook.com>
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

On Wed, 2021-11-10 at 11:37 +0000, Biju Das wrote:
> Hi Philipp and Geert,
> 
> Thanks for the feedback.
> 
> > Subject: Re: [PATCH 2/2] clocksource/drivers/renesas-ostm: Add RZ/G2L OSTM
> > support
> > 
> > Hi Geert, Biju,
> > 
> > On Wed, 2021-11-10 at 11:27 +0100, Geert Uytterhoeven wrote:
> > > Hi Biju,
> > > 
> > > On Wed, Nov 10, 2021 at 9:32 AM Biju Das <biju.das.jz@bp.renesas.com>
> > wrote:
> > > > RZ/G2L SoC has Generic Timer Module(a.k.a OSTM) which needs to
> > > > deassert the reset line before accessing any registers.
> > > > 
> > > > This patch adds an entry point for RZ/G2L so that we can deassert
> > > > the reset line in probe callback.
> > > > 
> > > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > > Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > 
> > > Thanks for your patch!
> > > 
> > > > --- a/drivers/clocksource/renesas-ostm.c
> > > > +++ b/drivers/clocksource/renesas-ostm.c
> > > > @@ -209,3 +211,39 @@ static int __init ostm_init(struct device_node
> > > > *np)
> > > >  }
> > > > 
> > > >  TIMER_OF_DECLARE(ostm, "renesas,ostm", ostm_init);
> > > 
> > > Background: this driver uses TIMER_OF_DECLARE() because the OSTM is
> > > the system timer on RZ/A SoCs, which do not have the ARM architectured
> > > timer.  RZ/G2L does have the ARM architectured timer.
> > 
> > Thanks.
> > 
> > > > +
> > > > +#ifdef CONFIG_ARCH_R9A07G044
> > > > +static int __init ostm_probe(struct platform_device *pdev) {
> > > > +       struct device *dev = &pdev->dev;
> > > > +       struct reset_control *rstc;
> > > > +       int ret;
> > > > +
> > > > +       rstc = devm_reset_control_get_exclusive(dev, NULL);
> > > > +       if (IS_ERR(rstc))
> > > > +               return dev_err_probe(dev, PTR_ERR(rstc), "failed to
> > > > + get reset");
> > > > +
> > > > +       reset_control_deassert(rstc);
> > > > +
> > > > +       ret = ostm_init(dev->of_node);
> > > > +       if (ret) {
> > > > +               reset_control_assert(rstc);
> > > > +               return ret;
> > > > +       }
> > > > +
> > > > +       return 0;
> > > > +}
> > > > +
> > > > +static const struct of_device_id ostm_of_table[] = {
> > > > +       { .compatible = "renesas,rzg2l-ostm", },
> > > 
> > > I believe the OSTM block on RZ/G2L is identical to the one on RZ/A,
> > > and the requirement to deassert its module reset is an SoC integration
> > > feature on RZ/G2L.  Hence the driver should match on "renesas,ostm"
> > > for both?
> > 
> > If that is the case, the reset could be made required for
> >   compatible = "renesas,r9a07g044-ostm", "renesas,ostm"; in the .yaml
> > file.
> > 
> > > So my suggestion would be to include the reset handling in ostm_init()
> > > instead, but make it optional, and error out in case of -EPROBE_DEFER.
> > > 
> > > In case initialization from TIMER_OF_DECLARE() failed, the platform
> > > driver can kick in later and retry.
> > > 
> > > However, it seems __of_reset_control_get() ignores all errors,
> > > including -EPROBE_DEFER, if optional is true, so this won't work?
> > > 
> > > Philipp: is that correct? If yes, ostm_init() has to check the
> > > presence of a resets property to see if the reset is optional or
> > required.
> > 
> > No, __of_reset_control_get() should only replace its -ENOENT return value
> > due to errors from of_property_match_string() and
> > of_parse_phandle_with_args() with NULL. Anything else I'd consider a bug.
> > 
> > Specifically, -EPROBE_DEFER is still returned if no existing rcdev is
> > found matching the successful "resets" phandle lookup. So
> > 
> > 	rstc = devm_reset_control_get_optional_exclusive(dev, NULL);
> 
> In this case, How do we get dev here from device_node, as device is not available at this point?

Oh, right.
We are missing an of_reset_control_get_optional_exclusive() for this:

static inline struct reset_control *of_reset_control_get_optional_exclusive(
		struct device_node *node, const char *id)
{
	return __of_reset_control_get(node, id, 0, false, true, true);
}

regards
Philipp
