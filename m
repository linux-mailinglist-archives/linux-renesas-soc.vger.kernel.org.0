Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9AFC0785E76
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Aug 2023 19:21:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236166AbjHWRVf (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 23 Aug 2023 13:21:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230498AbjHWRVe (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 23 Aug 2023 13:21:34 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7608E67
        for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Aug 2023 10:21:32 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-99c1c66876aso777586066b.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Aug 2023 10:21:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1692811291; x=1693416091;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wQv89qTB/4ocabDX/Qs6CKP5Tk03134i0Ytt/LFMjok=;
        b=gg1fuh/O17TXIaXlZNIQ3g+ve9vQPUtZBdHOZxnmSdluVTrhH90RBFcXEkLJx6ieFQ
         0luQKyNz0dFBrONCSflyt9UeFMunZfpsEVov7pA8fVvYuhN57jU3nMFoNNTEuMV3rVoh
         IB8/IwvcrHWD67vDjcpL9ntV2WyAF3VegpNHs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692811291; x=1693416091;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wQv89qTB/4ocabDX/Qs6CKP5Tk03134i0Ytt/LFMjok=;
        b=QDcCr6tGcDW9EpEVL2XH8OJKsjcLe96O/oEvVI5ECpv8iFrIcJbI3v4wLCtGMndG1a
         hNBSpoNqLWjQMgdpz0wRpnHEvc/7h63ZMbutwu872hVcP1IYnO0wDSYr3RHdorjof8Ad
         L9xEzWDc3zHyQ9EkE/+s7Y2ZVq0l2DDWHC2ooaEbcwY4DJcnRTcNcsn2HpmlI6c7qmli
         wlyGRcauSxHRGomDXIE2xUA8kee2uH0dq016mnq9BjCy73xM/wrlonNYsBoq1ESILmmz
         L44G/TJY0WfVicXgEjpfRfhgZLbtbizuqsuqnEQsP2c+SMBxdJMZNBVOpDGNGdHfd5Wu
         l7MA==
X-Gm-Message-State: AOJu0YwR7FVoQQXyRLM0nOkLgGJXgH739adj0x1mnG8xR0BZ9oWkULr3
        8ppAPwU+yC+IjW502U1SJltqQA1VCKoJoaW+3wIAvFT/
X-Google-Smtp-Source: AGHT+IFaFwILtaB0MDSzFY8JYRX0Ev7WoI/w8Y8ZvIaMu9bTW/ZwRxAgv9duFhrrJiZE349lDVmVgg==
X-Received: by 2002:a17:907:a04c:b0:9a1:d25c:55e3 with SMTP id gz12-20020a170907a04c00b009a1d25c55e3mr2399806ejc.16.1692811290824;
        Wed, 23 Aug 2023 10:21:30 -0700 (PDT)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com. [209.85.128.48])
        by smtp.gmail.com with ESMTPSA id a6-20020a170906368600b0099bc038eb2bsm9938359ejc.58.2023.08.23.10.21.30
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Aug 2023 10:21:30 -0700 (PDT)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-3fe2d620d17so6985e9.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Aug 2023 10:21:30 -0700 (PDT)
X-Received: by 2002:a05:600c:3ba0:b0:3fe:dd72:13ae with SMTP id
 n32-20020a05600c3ba000b003fedd7213aemr301803wms.0.1692810846360; Wed, 23 Aug
 2023 10:14:06 -0700 (PDT)
MIME-Version: 1.0
References: <20230813085137.74608-1-biju.das.jz@bp.renesas.com>
 <CAD=FV=W6aoaUuMx5OvG2xMX+fBG6B-c5Fmvmit4f2CTZq=x1vQ@mail.gmail.com>
 <OS0PR01MB5922E0300F53BED1AFFD916E861CA@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAHp75VcjA-99ckLWNczNuP5f2FGx67o1=O8MFVThBTVzPzJBdA@mail.gmail.com>
In-Reply-To: <CAHp75VcjA-99ckLWNczNuP5f2FGx67o1=O8MFVThBTVzPzJBdA@mail.gmail.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 23 Aug 2023 10:13:53 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Uwg9AuKuKpUAbfnzfm5wTRtYqhg5f24Y7cPSDugWz1wg@mail.gmail.com>
Message-ID: <CAD=FV=Uwg9AuKuKpUAbfnzfm5wTRtYqhg5f24Y7cPSDugWz1wg@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge/analogix/anx78xx: Extend match data support
 for ID table
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
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
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi,

On Wed, Aug 23, 2023 at 9:53=E2=80=AFAM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Wed, Aug 23, 2023 at 5:36=E2=80=AFPM Biju Das <biju.das.jz@bp.renesas.=
com> wrote:
> > > On Sun, Aug 13, 2023 at 1:51=E2=80=AFAM Biju Das <biju.das.jz@bp.rene=
sas.com>
> > > wrote:
>
> ...
>
> > > It seems like this is a sign that nobody is actually using the i2c ma=
tch
> > > table.
>
> You can't know. The I2C ID table allows to instantiate a device from
> user space by supplying it's address and a name, that has to be
> matched with the one in ID table.

In general, right, you can't know. ...and in general, I wouldn't have
suggested removing the table. However, in this specific case I think
we have a very good idea that nobody is using it. Specifically, if you
take a look at Biju's patch you can see that if anyone had been trying
to use the I2C table then they would have been getting a NULL pointer
dereference at probe time for the last ~5 years.

Specifically, I think that as of commit 025910db8057 ("drm/bridge:
analogix-anx78xx: add support for 7808 addresses") that if anyone were
using the I2C ID table:

1. In anx78xx_i2c_probe(), device_get_match_data() would have returned NULL
2. We would have tried to dereference that NULL in the loop.


> > > It was probably added because the original author just copy/pasted
> > > from something else, but obviously it hasn't been kept up to date and=
 isn't
> > > working.
>
> How can you be so sure?

Unless I misunderstood the code, they'd be crashing.


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

If you really want the table kept then it's no skin off my teeth. I
just happened to see that nobody was responding to the patch and I was
trying to be helpful. My analysis above showed that the I2C table must
not be used, but if you feel strongly that we need to add code then
feel free to provide a Reviewed-by tag to Biju's patch! :-)

-Doug
