Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2B346786D62
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 24 Aug 2023 13:06:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230297AbjHXLGR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 24 Aug 2023 07:06:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231910AbjHXLFq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 24 Aug 2023 07:05:46 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B9E2E58
        for <linux-renesas-soc@vger.kernel.org>; Thu, 24 Aug 2023 04:05:44 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 3A13660F05
        for <linux-renesas-soc@vger.kernel.org>; Thu, 24 Aug 2023 11:05:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97E25C433C7;
        Thu, 24 Aug 2023 11:05:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692875143;
        bh=nPjOxjZZcTevjlfl94HJgpkhz5t8USny22T5xsJdqaI=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=dpHRQAaO2BhsxC5y8s4oloQHDiAzK8wRWb4AA4Lc51Kf0uU4wIyxSsIfII59N5NwN
         RMgnAg7vk2G/o3tpXcPmWExDYa3EpIkUtUqhht10xiARttHTj7IDfF9OAitp2CsQUz
         vdnZZzr4uBH5Y6rAJv+/UqcghnXEKg1bFCoSCXEasXgoRJe74wbOMN0J8BCXixvipD
         BGNxqLkWKEqxf9dwzCCtJpGGe92PNVueOWY1fmRHBkNh0/LpiI7p7cHM2ks9l27Apk
         27HYS9mu5YHQEib6VlM5moMdi8ABvSw513QFsGz0S+lo0E+Sn4lEC7YHh//N+OC8hl
         nJEQEy7mo5fhw==
Date:   Thu, 24 Aug 2023 13:05:37 +0200
From:   Marek =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Doug Anderson <dianders@chromium.org>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= 
        <u.kleine-koenig@pengutronix.de>,
        Javier Martinez Canillas <javierm@redhat.com>,
        Zhu Wang <wangzhu9@huawei.com>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH] drm/bridge/analogix/anx78xx: Extend match data support
 for ID table
Message-ID: <20230824130537.5d4028c2@dellmb>
In-Reply-To: <CAHp75Vf-KLMGL-Exo5-+-AC51KhW+YOJSr7GpqHUG1WzZ0nkvQ@mail.gmail.com>
References: <20230813085137.74608-1-biju.das.jz@bp.renesas.com>
        <CAD=FV=W6aoaUuMx5OvG2xMX+fBG6B-c5Fmvmit4f2CTZq=x1vQ@mail.gmail.com>
        <OS0PR01MB5922E0300F53BED1AFFD916E861CA@OS0PR01MB5922.jpnprd01.prod.outlook.com>
        <CAHp75VcjA-99ckLWNczNuP5f2FGx67o1=O8MFVThBTVzPzJBdA@mail.gmail.com>
        <CAHp75VeJ-JjcrfLZd2dyisBmq5r66j=Sq5ubSLpK=kFrodzb-g@mail.gmail.com>
        <CAD=FV=VbsfAc4Pb3LY3w3-krqfkmmaZLiBxcxjgea+4S0HU1Vw@mail.gmail.com>
        <CAHp75Vf-KLMGL-Exo5-+-AC51KhW+YOJSr7GpqHUG1WzZ0nkvQ@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, 24 Aug 2023 12:59:19 +0300
Andy Shevchenko <andy.shevchenko@gmail.com> wrote:

> On Wed, Aug 23, 2023 at 9:39=E2=80=AFPM Doug Anderson <dianders@chromium.=
org> wrote:
> > On Wed, Aug 23, 2023 at 10:10=E2=80=AFAM Andy Shevchenko
> > <andy.shevchenko@gmail.com> wrote: =20
> > > =20
> > > > No. Please, do not remove the I2C ID table. It had already been
> > > > discussed a few years ago.
> > > > =20
> > > > > Yes, it make sense, as it saves some memory =20
> > >
> > > Okay, reading code a bit, it seems that it won't work with purely i2c
> > > ID matching. =20
> >
> > OK, so you are in agreement that it would be OK to drop the I2C ID tabl=
e? =20
>=20
> Yes.
>=20
> > > So the question here is "Do we want to allow enumeration via sysfs or=
 not?" =20
> >
> > Is there some pressing need for it? If not, I guess I'd tend to wait
> > until someone needs this support before adding it. =20
>=20
> Depends. Is this device anyhow useful IRL as standalone if
> instantiated via sysfs? I think it may be not, so it's unlikely we
> want to have sysfs option for it.
>=20

So this is what the id table is about :D I guess I should remove it for
leds-turris-omnia :D

