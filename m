Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0F510786C7D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 24 Aug 2023 12:00:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235862AbjHXKAY (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 24 Aug 2023 06:00:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240837AbjHXKAD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 24 Aug 2023 06:00:03 -0400
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com [IPv6:2607:f8b0:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0ED641984
        for <linux-renesas-soc@vger.kernel.org>; Thu, 24 Aug 2023 02:59:56 -0700 (PDT)
Received: by mail-ot1-x333.google.com with SMTP id 46e09a7af769-6bc9254a1baso4822753a34.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 24 Aug 2023 02:59:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692871195; x=1693475995;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7aA6C8SFUJVAZifyUeFXfLFXlX8WoF+XRY6UYD5KTo8=;
        b=DS0bTfg6BS/kfbsxitSQlwLHW8R2C6ew2IPlFVpEGuMz7rYBdJNrNz/WTLIY9cD5gs
         mog1z0cWD6Oxm2mMLsCVMdjQfNOfynIFIUvBvNhaSXCZo3uXZhorWUJ2udDQGqBM6PnA
         6EqgXUotPZjq/H/PTZKYZnOdhkGc1GgfwrgoS9Ep+uNNCgRfq6Vq0cPwJiUX19pguzPe
         hmQ4qSn01ERpLomFk7Urk+kPVuaNdRc0DUQwmAy851DivHOxwJrV27Gz8OzBWPkebqS8
         +q+1zRgAl2PDTjOPW9HfIMr26KKSwSpIzu23f/s1zNzEeNu94Vfcw6OShT1VCmkMhwDj
         egnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692871195; x=1693475995;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7aA6C8SFUJVAZifyUeFXfLFXlX8WoF+XRY6UYD5KTo8=;
        b=aGxagwpUL9jRiBgaM7OaYkDPCjMoLmsB8xwvHOkpEQzgpsj2rr0yqYKd5bTt70D2Ri
         5irhXznNIhgNyv+oPMERZvA20mgrNdwexPF88IgQn/Z3T/aHVWUsGRZyj0TMFQy5haPu
         WiWNw0CniD1bX87AjGSYOygYzVvntTZytoWiLR7m5b6NnxFkvfyCJBvzxPulX2vVIsW4
         p7yiBcsmJlV0kebUCJoqGAcDvbrxWUyXycLCE782V+a/2Mzkl1h8GjbhRsofDBXDMsAF
         x0QCf7LvluTuO2kM7epfx3l9R37rcygepIg09VG2FO673flTyaBo3lvEN81MdLeAlPQh
         NHGQ==
X-Gm-Message-State: AOJu0Yx6E2fH8bOf2olvjFF+YopyPMhuZKftq559YjqbH6/WULRdd7tU
        vM6P6Ss7R2+PQQjgEzpiQ3+F2I1XcCAJRaCVkoY=
X-Google-Smtp-Source: AGHT+IF/MMua9KNx318MWjDbEeXx0TKoPkLZpzb0TX3RNLV2py5bYh7ErX9ZTwsFRh3daYGlAx4ftH1X94KqSJZLaz8=
X-Received: by 2002:a05:6871:551:b0:1c0:a784:cf7e with SMTP id
 t17-20020a056871055100b001c0a784cf7emr21206970oal.51.1692871195368; Thu, 24
 Aug 2023 02:59:55 -0700 (PDT)
MIME-Version: 1.0
References: <20230813085137.74608-1-biju.das.jz@bp.renesas.com>
 <CAD=FV=W6aoaUuMx5OvG2xMX+fBG6B-c5Fmvmit4f2CTZq=x1vQ@mail.gmail.com>
 <OS0PR01MB5922E0300F53BED1AFFD916E861CA@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAHp75VcjA-99ckLWNczNuP5f2FGx67o1=O8MFVThBTVzPzJBdA@mail.gmail.com>
 <CAHp75VeJ-JjcrfLZd2dyisBmq5r66j=Sq5ubSLpK=kFrodzb-g@mail.gmail.com> <CAD=FV=VbsfAc4Pb3LY3w3-krqfkmmaZLiBxcxjgea+4S0HU1Vw@mail.gmail.com>
In-Reply-To: <CAD=FV=VbsfAc4Pb3LY3w3-krqfkmmaZLiBxcxjgea+4S0HU1Vw@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 24 Aug 2023 12:59:19 +0300
Message-ID: <CAHp75Vf-KLMGL-Exo5-+-AC51KhW+YOJSr7GpqHUG1WzZ0nkvQ@mail.gmail.com>
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

On Wed, Aug 23, 2023 at 9:39=E2=80=AFPM Doug Anderson <dianders@chromium.or=
g> wrote:
> On Wed, Aug 23, 2023 at 10:10=E2=80=AFAM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
> >
> > > No. Please, do not remove the I2C ID table. It had already been
> > > discussed a few years ago.
> > >
> > > > Yes, it make sense, as it saves some memory
> >
> > Okay, reading code a bit, it seems that it won't work with purely i2c
> > ID matching.
>
> OK, so you are in agreement that it would be OK to drop the I2C ID table?

Yes.

> > So the question here is "Do we want to allow enumeration via sysfs or n=
ot?"
>
> Is there some pressing need for it? If not, I guess I'd tend to wait
> until someone needs this support before adding it.

Depends. Is this device anyhow useful IRL as standalone if
instantiated via sysfs? I think it may be not, so it's unlikely we
want to have sysfs option for it.

--=20
With Best Regards,
Andy Shevchenko
