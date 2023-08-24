Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 561DC787B1E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 25 Aug 2023 00:02:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243686AbjHXWCC (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 24 Aug 2023 18:02:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243823AbjHXWBm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 24 Aug 2023 18:01:42 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23A251FDA
        for <linux-renesas-soc@vger.kernel.org>; Thu, 24 Aug 2023 15:01:32 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7B9A28808;
        Fri, 25 Aug 2023 00:00:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1692914409;
        bh=njXF1BFmgLojXBHTViNb5H2eBLkMkjfk5gY9ejdbIlU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=XX/uNdv6Se3VusoYvnlCar4o08oE16kpa1Pg+zDvhOR8UL4GSvhftY0I1eGv1CS/7
         xaG39YYXfPZPdp8E20ySeN25T00hQxXcDWVlLXubyO5iLCKXju/QjXdcOOXlyBAAG5
         Wz3gYth6nIN3PThtvoIlYTzl4NfL5//cuB63Nuho=
Date:   Fri, 25 Aug 2023 01:01:33 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Doug Anderson <dianders@chromium.org>
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
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Guenter Roeck <groeck@chromium.org>,
        Zhu Wang <wangzhu9@huawei.com>,
        dri-devel@lists.freedesktop.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3] drm/bridge/analogix/anx78xx: Drop ID table
Message-ID: <20230824220133.GB6477@pendragon.ideasonboard.com>
References: <20230824181546.391796-1-biju.das.jz@bp.renesas.com>
 <20230824182609.GA6477@pendragon.ideasonboard.com>
 <CAD=FV=Wg1LY3601vN1qhKOEuZ9hVf-+hX8ajC6DKsC-5TNpy7g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD=FV=Wg1LY3601vN1qhKOEuZ9hVf-+hX8ajC6DKsC-5TNpy7g@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Aug 24, 2023 at 01:51:59PM -0700, Doug Anderson wrote:
> On Thu, Aug 24, 2023 at 11:26 AM Laurent Pinchart wrote:
> > On Thu, Aug 24, 2023 at 07:15:46PM +0100, Biju Das wrote:
> > > The driver has an ID table, but it uses the wrong API for retrieving match
> > > data and that will lead to a crash, if it is instantiated by user space or
> > > using ID. From this, there is no user for the ID table and let's drop it
> > > from the driver as it saves some memory.
> > >
> > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> >
> > Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> >
> > I wonder, as the device can only be instantiated from OF, should we add
> >
> >         depends on OF
> >
> > to Kconfig, and drop the
> >
> > #if IS_ENABLED(CONFIG_OF)
> >
> > from the driver ?
> 
> In my opinion we shouldn't add the "depends on OF" since that will
> decrease the amount of compile testing. It's somewhat the opposite of
> adding "if COMPILE_TEST" to your driver. ;-)

We could add a || COMPILE_TEST :-)

> I think we could get rid of one of the "#if" statements in the driver
> anyway as of commit c9e358dfc4a8 ("driver-core: remove conditionals
> around devicetree pointers") from ~12 years ago. If we did something
> similar in "struct drm_bridge" we could drop both #ifs.

I'd be fine with that too.

-- 
Regards,

Laurent Pinchart
