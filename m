Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F1411785E47
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Aug 2023 19:10:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237048AbjHWRKS (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 23 Aug 2023 13:10:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236266AbjHWRKS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 23 Aug 2023 13:10:18 -0400
Received: from mail-oo1-xc30.google.com (mail-oo1-xc30.google.com [IPv6:2607:f8b0:4864:20::c30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A5C710DB
        for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Aug 2023 10:10:06 -0700 (PDT)
Received: by mail-oo1-xc30.google.com with SMTP id 006d021491bc7-570c54405b8so2041756eaf.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Aug 2023 10:10:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692810605; x=1693415405;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/hyVSZ/uyEq53y0HZqdCOt35wbrFe7hx7mDP2krNpag=;
        b=ce7F6U5er550sOTJ5v0t0KspHLp18rI4QgdmsLVSjojk5+ABQOCjElioL2v8AK/aky
         hutJ9MuBmbZQdlw591t1ll9MRvw9yQtzJbyejYSefhVk/ABWHfZuSa9ULeSdNr7iVvzi
         FJRrmW1lFWa55bnF0NZSx3YQimzcB3a6FpktGP1kF9Km0AAy8VCU0SDR8FLxgAxzIkU3
         1xUcD7zDN8bD0VzbOmKCIew31ryPEbuqnOa3gfUVSWtiWSvD6gIGg9AVRIHD6oot2Odr
         0c/KdU143N2S/gnVjlc57J/xzOFvthseFZS0yjbc3eb9af5ewEV3GFmDqH7D4JJUKeDG
         ZN5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692810605; x=1693415405;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/hyVSZ/uyEq53y0HZqdCOt35wbrFe7hx7mDP2krNpag=;
        b=PRjXQyVed6GuwxWXAtCc69pXBGYkhJoFp/aHam64S2AXQIBFVJ0NIqJWmFJeX/dCFF
         fhHhwwyipnq2Bq3dBHpfe5tdNfRW0CmxFpToz8dydLn9D2m/N7sYYg7AfqGztnN39CL2
         76JybuaEtuiy7c0kFzPse3kxGb5Y9voadutMrbACvNnsKtVdBg5nTYfy7aX2XgSopYCU
         Ie4N2rftO9+mKin+8xatuiV/natitt8Oxjilr3aXRGKabNsimyoYJXjuC7aX/ezCeB++
         7RUtzhl/5gtob52ZlU3K8NGjqk5n+iZM6mA7Ka/WaESTjSbPokgoKbXNg9/6xxwkd9wJ
         2y/g==
X-Gm-Message-State: AOJu0YzFMmAwqcgZKvfU7yocdN1rQIEbMjt8jDE3nmSQIqI93wbHFeGI
        VhaDB/SQDlSpkv5eVpOMW5gJ3kLW2ObBWCsB0qQ=
X-Google-Smtp-Source: AGHT+IE3etSktXpnieusxbMl+Ub2+aFioaxeHteDwuBa2je8Ed3KNdPCo5MMZ6APGWz+p++lAQyKiRRMwlgE5fAtwJU=
X-Received: by 2002:a4a:270e:0:b0:56e:9e98:2cfd with SMTP id
 l14-20020a4a270e000000b0056e9e982cfdmr9772071oof.2.1692810605284; Wed, 23 Aug
 2023 10:10:05 -0700 (PDT)
MIME-Version: 1.0
References: <20230813085137.74608-1-biju.das.jz@bp.renesas.com>
 <CAD=FV=W6aoaUuMx5OvG2xMX+fBG6B-c5Fmvmit4f2CTZq=x1vQ@mail.gmail.com>
 <OS0PR01MB5922E0300F53BED1AFFD916E861CA@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAHp75VcjA-99ckLWNczNuP5f2FGx67o1=O8MFVThBTVzPzJBdA@mail.gmail.com>
In-Reply-To: <CAHp75VcjA-99ckLWNczNuP5f2FGx67o1=O8MFVThBTVzPzJBdA@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 23 Aug 2023 20:09:28 +0300
Message-ID: <CAHp75VeJ-JjcrfLZd2dyisBmq5r66j=Sq5ubSLpK=kFrodzb-g@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge/analogix/anx78xx: Extend match data support
 for ID table
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Doug Anderson <dianders@chromium.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Javier Martinez Canillas <javierm@redhat.com>,
        =?UTF-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>,
        Zhu Wang <wangzhu9@huawei.com>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Aug 23, 2023 at 7:52=E2=80=AFPM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Wed, Aug 23, 2023 at 5:36=E2=80=AFPM Biju Das <biju.das.jz@bp.renesas.=
com> wrote:
> > > On Sun, Aug 13, 2023 at 1:51=E2=80=AFAM Biju Das <biju.das.jz@bp.rene=
sas.com>
> > > wrote:

...

> > > It seems like this is a sign that nobody is actually using the i2c ma=
tch
> > > table.
>
> You can't know. The I2C ID table allows to instantiate a device from
> user space by supplying it's address and a name, that has to be
> matched with the one in ID table.
>
> > > It was probably added because the original author just copy/pasted
> > > from something else, but obviously it hasn't been kept up to date and=
 isn't
> > > working.
>
> How can you be so sure?
>
> > > While your patch would make it work for "anx7814", it wouldn't
> > > make it work for any of the other similar parts. ...and yes, you coul=
d add
> > > support for those parts in your patch too, but IMO it makes more sens=
e to
> > > just delete the i2c table and when someone has an actual need then th=
ey can
> > > re-add it.
> > >
> > > Sound OK?
>
> No. Please, do not remove the I2C ID table. It had already been
> discussed a few years ago.
>
> > Yes, it make sense, as it saves some memory

Okay, reading code a bit, it seems that it won't work with purely i2c
ID matching.
So the question here is "Do we want to allow enumeration via sysfs or not?"


--=20
With Best Regards,
Andy Shevchenko
