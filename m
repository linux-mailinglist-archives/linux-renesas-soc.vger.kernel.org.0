Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 270AE785F5B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Aug 2023 20:13:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230098AbjHWSNy (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 23 Aug 2023 14:13:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238062AbjHWSNr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 23 Aug 2023 14:13:47 -0400
Received: from mail-oo1-xc36.google.com (mail-oo1-xc36.google.com [IPv6:2607:f8b0:4864:20::c36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4930CC7
        for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Aug 2023 11:13:45 -0700 (PDT)
Received: by mail-oo1-xc36.google.com with SMTP id 006d021491bc7-570c54405b8so2076884eaf.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Aug 2023 11:13:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692814425; x=1693419225;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/Pd+nY7qFI+JVDVu42WXavNzAf+eijnePwIwfDKRrn4=;
        b=JB1GQa3vfyEOHTWHZV2Q95iLFCSKbY/eJHLr7yL66pa86xJ2/eEUI9RY+cMnuLXRNu
         URSG9nCGhlqqB9drf8oEE3O0AHk2mbe+X4Vmj1aAw1H+d81ansAlHDsR1XA1mLj2koeH
         ufsikJvlYHbSxCVoDkKUsMkg1Fm5+OfVnLf3JsQ/yEOeNvz3UJa8uTVInLyGA2EvrIXU
         wxHEfg5t7aJ1bex+6hYc8Op10c3/10aNF8Jo+ikOztHQnaeRZ0pRmT2MtZcxAvoBac7c
         CbhtW0skVnmuh7xpg2vQOIbSQUjkIkXo0QlckRl9M+5L5xURpu0+dqVufH6tjuWXm0gP
         8o7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692814425; x=1693419225;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/Pd+nY7qFI+JVDVu42WXavNzAf+eijnePwIwfDKRrn4=;
        b=J+x4bok3ez2r11yW+gpRLfiYlH0XJ2CicKKK5I2q4AmamQUiWM7dXY2zDU2/rzKDbp
         vSxf3uT1LHjNAzfALR+UysBbANh9WZzPovBTmJidbXS2A1a9PzjoyZ/1RG3w94CLWti0
         AfDW2Z4hjnjWEGvz3VxggHvUcXz62HKgEGE42u1viSWpz0t7bVZEUmKQzdlFyOZqPDIV
         nPqY/jLK7PlPBZSV6fbRgWyV/Zw5p50945dQ5f0KYabB8Z8Jr4C/CAtIN61y6xhON22a
         ZrbLSZoQu24PeyYPuktE7KYlwh5NHIsefsLPP8nUI0U2bh13X6SahkLsrxxc3XT6/BXm
         4mMg==
X-Gm-Message-State: AOJu0YxkF1IiZBNsmnvG1wCJkIsBnyyq9On2gCOVA98jASENZUZRqHt4
        DIvcwUwFzxCcNXW3yyItc4rRAxxcACRXo8OrAqQ=
X-Google-Smtp-Source: AGHT+IE+37tPaVddj+DiWfkLmSyxnc+h2o1Iej1yxesDIC0ATIw03wlLu3SeiY4j4g8bQX80VAJ+BPM127ysjehW7O4=
X-Received: by 2002:a4a:d216:0:b0:56c:cd04:9083 with SMTP id
 c22-20020a4ad216000000b0056ccd049083mr108834oos.1.1692814424826; Wed, 23 Aug
 2023 11:13:44 -0700 (PDT)
MIME-Version: 1.0
References: <20230813085137.74608-1-biju.das.jz@bp.renesas.com>
 <CAD=FV=W6aoaUuMx5OvG2xMX+fBG6B-c5Fmvmit4f2CTZq=x1vQ@mail.gmail.com>
 <OS0PR01MB5922E0300F53BED1AFFD916E861CA@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAHp75VcjA-99ckLWNczNuP5f2FGx67o1=O8MFVThBTVzPzJBdA@mail.gmail.com> <CAD=FV=Uwg9AuKuKpUAbfnzfm5wTRtYqhg5f24Y7cPSDugWz1wg@mail.gmail.com>
In-Reply-To: <CAD=FV=Uwg9AuKuKpUAbfnzfm5wTRtYqhg5f24Y7cPSDugWz1wg@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 23 Aug 2023 21:13:08 +0300
Message-ID: <CAHp75VchMj7hwOJ6oO=mRx7vnn9XUeT_XXsaCJc7hBfwh1m9nw@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge/analogix/anx78xx: Extend match data support
 for ID table
To:     Doug Anderson <dianders@chromium.org>
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
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Aug 23, 2023 at 8:14=E2=80=AFPM Doug Anderson <dianders@chromium.or=
g> wrote:
> On Wed, Aug 23, 2023 at 9:53=E2=80=AFAM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
> > On Wed, Aug 23, 2023 at 5:36=E2=80=AFPM Biju Das <biju.das.jz@bp.renesa=
s.com> wrote:

...

> > No. Please, do not remove the I2C ID table. It had already been
> > discussed a few years ago.
>
> If you really want the table kept then it's no skin off my teeth. I
> just happened to see that nobody was responding to the patch and I was
> trying to be helpful. My analysis above showed that the I2C table must
> not be used, but if you feel strongly that we need to add code then
> feel free to provide a Reviewed-by tag to Biju's patch! :-)

Have you seen my reply to my reply?
I agree with your above analysis.

--=20
With Best Regards,
Andy Shevchenko
