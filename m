Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8C7DC785FA9
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Aug 2023 20:31:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231407AbjHWSbV (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 23 Aug 2023 14:31:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230453AbjHWSbU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 23 Aug 2023 14:31:20 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 883EF10C2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Aug 2023 11:31:18 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-99c0290f0a8so751120466b.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Aug 2023 11:31:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1692815474; x=1693420274;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q3RwIooZabMesmbY4FdeXUzYTvCj8JKd8sUgSjAw+Sc=;
        b=BxTOnK3F1QMjyw875e9kMNH6xjAD9wR12Wgx81wJB6V04l5XQOr2mIcOWgW+eM8AmD
         uI1+ENB838GntHgWCEGbkuG/FRhCrdHaKT82+G7y6uhLD4PjbxthAJQ+yw9uu/2hcP62
         fC0SNQ2Ay7vx7vL9APRyGmSAYnDJ9pimkv02s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692815474; x=1693420274;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q3RwIooZabMesmbY4FdeXUzYTvCj8JKd8sUgSjAw+Sc=;
        b=Y1kdqpsspl288jeDeak3m0OMob/9kSB/x0KDtUkbATQ4bS9INZ/4tZ6SvxJKlkAZp9
         m9EqZrQnhAH8pbxc/+gBBS5+DSy56QO+2BOBkaiNy3IUZFKIq7YDYaWa1OgwKdMKwK10
         wYcYU3fpOnIqGUt3tfKeGLD+FTQA5ih4/9EJYyl3drcUQ2ExVf4+Fa141Rh4Qs1GUPnk
         TwYgUSqOGBHH2LKuqi4b7uz4xb+gT2/barLqDwgQ5NhaWNYOym3CSVbAoJaSLI0Pc6ww
         DiOwmfYMMvCYuFa2Fe/LxRE1Mb8wt22QJe7QhfeKisEhpQvsL5owoAygDjkLgQEVCAlY
         6e9w==
X-Gm-Message-State: AOJu0YzcC5b8hryd4AndxUSe4RTIKjS5VGH2TXnnL+Jdv3dxyhKU1T/Y
        dF44rEztiUckTw+JT8FyX8C5G01/ZdDBvVqhSyKfw65+
X-Google-Smtp-Source: AGHT+IHaHVk0sjo+NQ6+limP8UePgyGr1iW4TGpCn5ED/sySHwiBY3S5owQaszZRn0QyNxHs5VBktQ==
X-Received: by 2002:a17:906:151:b0:9a1:e07c:1ae9 with SMTP id 17-20020a170906015100b009a1e07c1ae9mr1339209ejh.57.1692815474464;
        Wed, 23 Aug 2023 11:31:14 -0700 (PDT)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com. [209.85.128.45])
        by smtp.gmail.com with ESMTPSA id m6-20020a1709061ec600b00992e14af9b9sm9999275ejj.134.2023.08.23.11.31.13
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Aug 2023 11:31:14 -0700 (PDT)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-3fe2d620d17so14135e9.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Aug 2023 11:31:13 -0700 (PDT)
X-Received: by 2002:a05:600c:3ba0:b0:3fe:dd72:13ae with SMTP id
 n32-20020a05600c3ba000b003fedd7213aemr312232wms.0.1692815473212; Wed, 23 Aug
 2023 11:31:13 -0700 (PDT)
MIME-Version: 1.0
References: <20230813085137.74608-1-biju.das.jz@bp.renesas.com>
 <CAD=FV=W6aoaUuMx5OvG2xMX+fBG6B-c5Fmvmit4f2CTZq=x1vQ@mail.gmail.com>
 <OS0PR01MB5922E0300F53BED1AFFD916E861CA@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAHp75VcjA-99ckLWNczNuP5f2FGx67o1=O8MFVThBTVzPzJBdA@mail.gmail.com> <CAHp75VeJ-JjcrfLZd2dyisBmq5r66j=Sq5ubSLpK=kFrodzb-g@mail.gmail.com>
In-Reply-To: <CAHp75VeJ-JjcrfLZd2dyisBmq5r66j=Sq5ubSLpK=kFrodzb-g@mail.gmail.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 23 Aug 2023 11:31:00 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VbsfAc4Pb3LY3w3-krqfkmmaZLiBxcxjgea+4S0HU1Vw@mail.gmail.com>
Message-ID: <CAD=FV=VbsfAc4Pb3LY3w3-krqfkmmaZLiBxcxjgea+4S0HU1Vw@mail.gmail.com>
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

On Wed, Aug 23, 2023 at 10:10=E2=80=AFAM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> > No. Please, do not remove the I2C ID table. It had already been
> > discussed a few years ago.
> >
> > > Yes, it make sense, as it saves some memory
>
> Okay, reading code a bit, it seems that it won't work with purely i2c
> ID matching.

OK, so you are in agreement that it would be OK to drop the I2C ID table?


> So the question here is "Do we want to allow enumeration via sysfs or not=
?"

Is there some pressing need for it? If not, I guess I'd tend to wait
until someone needs this support before adding it.

-Doug
