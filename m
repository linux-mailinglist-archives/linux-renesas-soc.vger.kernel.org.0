Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C3206788543
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 25 Aug 2023 12:58:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229933AbjHYK5s (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 25 Aug 2023 06:57:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239272AbjHYK5r (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 25 Aug 2023 06:57:47 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFCBF19AD
        for <linux-renesas-soc@vger.kernel.org>; Fri, 25 Aug 2023 03:57:44 -0700 (PDT)
Received: from pendragon.ideasonboard.com (117.145-247-81.adsl-dyn.isp.belgacom.be [81.247.145.117])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 22CB96BE;
        Fri, 25 Aug 2023 12:56:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1692960982;
        bh=zoR0YokBKd/MGU58llzov4Yik2E+HryM2YY+WoItA3A=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Qq3vhOHIxOAmD5d13i8ALukwYD2OIjvNyC0KPrdnFNPvgI7IixIBMIjl8E0KYf2Zy
         H5NKVwgc8Yhtv+VjeZXlwznuyI57Fu7j6RULHvYNWm4Ml/+3GZs7LIG+Mo4fKLhhNU
         owhEabgOkzb80wHtE2C9fDhMqft1ji8DkzlZHIz8=
Date:   Fri, 25 Aug 2023 13:57:48 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Douglas Anderson <dianders@chromium.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Guenter Roeck <groeck@chromium.org>,
        Zhu Wang <wangzhu9@huawei.com>,
        dri-devel@lists.freedesktop.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3] drm/bridge/analogix/anx78xx: Drop ID table
Message-ID: <20230825105748.GE14596@pendragon.ideasonboard.com>
References: <20230824181546.391796-1-biju.das.jz@bp.renesas.com>
 <20230824182609.GA6477@pendragon.ideasonboard.com>
 <CAHp75VeK_0MnPtku7W6_ZDUWBTOFgmFZiwnOcnGgiVzbeU6FKQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHp75VeK_0MnPtku7W6_ZDUWBTOFgmFZiwnOcnGgiVzbeU6FKQ@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Aug 25, 2023 at 06:48:45AM +0300, Andy Shevchenko wrote:
> On Thu, Aug 24, 2023 at 9:26 PM Laurent Pinchart wrote:
> > On Thu, Aug 24, 2023 at 07:15:46PM +0100, Biju Das wrote:
> 
> ...
> 
> > I wonder, as the device can only be instantiated from OF, should we add
> >
> >         depends on OF
> 
> Generally speaking this is a bad idea. It prevents a component from
> being instantiated on ACPI based systems (even if there is no ACPI ID
> table, due to a gateway called PRP0001).

I'd be surprised if there were systems were that would work out of the
box for this particular driver, so we could always drop the dependency
when someone updates the driver to work on ACPI-based systems. I'm
however not pushing to add the dependency though.

> > to Kconfig, and drop the
> >
> > #if IS_ENABLED(CONFIG_OF)
> >
> > from the driver ?
> 
> Contrary this is an idea I fully support!
> 
> -- 
> With Best Regards,
> Andy Shevchenko

-- 
Regards,

Laurent Pinchart
