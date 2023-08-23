Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 82E84785DE8
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Aug 2023 18:53:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234897AbjHWQxX (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 23 Aug 2023 12:53:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234205AbjHWQxW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 23 Aug 2023 12:53:22 -0400
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com [IPv6:2607:f8b0:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 234CEE5C
        for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Aug 2023 09:53:21 -0700 (PDT)
Received: by mail-oi1-x230.google.com with SMTP id 5614622812f47-3a36b52b4a4so19878b6e.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Aug 2023 09:53:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692809600; x=1693414400;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=60vitW1Ii90u436mOW3P7n/14Uw/HX9UVNZgbZ6VZFw=;
        b=YMvhMSGUKUEwJcZCKSgKrgNIPXd8dpcWPr0adKfbQvbvQ6YzJhjijELNS9ZgAtalNZ
         ySnei9A3YmbyvRnlHNlMiUpSvGZM+uec0rbRAajq/N4gbXgxNzsg/mtyIvbGpbolofoF
         y3dKWYmF3KIXzYnJoR77igkpP58SZ6Juy58kFGTnbSaIVm7j9UTQFTFyOpbn8medvBOU
         On9eiSKI/2RaDwSlHzNMza5V6h05+cIR2aMQRDVvdRdheIpKIvmVj4lK7w/clzwLjLB8
         zYJpWvGlQD1WTGdJ5AeFqDIxm0SM4NKa6/gLt46pM+/+gFMNMPa2k6EPf+yjHpHpzlya
         T8yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692809600; x=1693414400;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=60vitW1Ii90u436mOW3P7n/14Uw/HX9UVNZgbZ6VZFw=;
        b=JrbtoGesO0WFI3c4bcAvaFz1jrPQSUC9CPrPhOqwblzz/ncPd3syQ4A6KeKC1Y8dFf
         vTI5n7ok2ZGY9iwL/o2Mi3o0XKO7xncbdf+GXbM82duJMHOTf2RwxYIlfY7s9IaiG46F
         Tf4ST1UcUlhrN3Sw8nAcDX85b43hBSe+7wN4+JtHC1xPTfigW2rdDiZDJGdMDIfvfm4/
         JGw+7a1mBzCMO/XNIYrx2CfeHGR788xS59I/6nLiw7xH6l6KnFd2ewNVfs/hhFxq6z0+
         r2zj8zq8eAEkVteJIe3T2HvrmOiif+HKpGKOBtH3hGjA+bKVDKbVmSkjrndSQr8Zsqct
         cHJQ==
X-Gm-Message-State: AOJu0YwJ/MEi0t52gzRdHlXkSBvx6goWrilZhlbFbJSfDNz/S2AkoReD
        mDpIWUgqQY8AEML3qKnAz2ielGqbsFYClX9eEH8=
X-Google-Smtp-Source: AGHT+IGohFNsM5lxfh901g2mPHLDLoP/rBL6blyLLFnGi/0yi0EYAhmmbxViSD/V60MRLGx85Hq6vLVyav/6Rnb5qCQ=
X-Received: by 2002:a05:6808:2201:b0:3a7:5346:fcee with SMTP id
 bd1-20020a056808220100b003a75346fceemr9641483oib.0.1692809600412; Wed, 23 Aug
 2023 09:53:20 -0700 (PDT)
MIME-Version: 1.0
References: <20230813085137.74608-1-biju.das.jz@bp.renesas.com>
 <CAD=FV=W6aoaUuMx5OvG2xMX+fBG6B-c5Fmvmit4f2CTZq=x1vQ@mail.gmail.com> <OS0PR01MB5922E0300F53BED1AFFD916E861CA@OS0PR01MB5922.jpnprd01.prod.outlook.com>
In-Reply-To: <OS0PR01MB5922E0300F53BED1AFFD916E861CA@OS0PR01MB5922.jpnprd01.prod.outlook.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 23 Aug 2023 19:52:44 +0300
Message-ID: <CAHp75VcjA-99ckLWNczNuP5f2FGx67o1=O8MFVThBTVzPzJBdA@mail.gmail.com>
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

On Wed, Aug 23, 2023 at 5:36=E2=80=AFPM Biju Das <biju.das.jz@bp.renesas.co=
m> wrote:
> > On Sun, Aug 13, 2023 at 1:51=E2=80=AFAM Biju Das <biju.das.jz@bp.renesa=
s.com>
> > wrote:

...

> > It seems like this is a sign that nobody is actually using the i2c matc=
h
> > table.

You can't know. The I2C ID table allows to instantiate a device from
user space by supplying it's address and a name, that has to be
matched with the one in ID table.

> > It was probably added because the original author just copy/pasted
> > from something else, but obviously it hasn't been kept up to date and i=
sn't
> > working.

How can you be so sure?

> > While your patch would make it work for "anx7814", it wouldn't
> > make it work for any of the other similar parts. ...and yes, you could =
add
> > support for those parts in your patch too, but IMO it makes more sense =
to
> > just delete the i2c table and when someone has an actual need then they=
 can
> > re-add it.
> >
> > Sound OK?

No. Please, do not remove the I2C ID table. It had already been
discussed a few years ago.

> Yes, it make sense, as it saves some memory.

--=20
With Best Regards,
Andy Shevchenko
