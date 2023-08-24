Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D08B07879A3
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 24 Aug 2023 22:53:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243602AbjHXUws (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 24 Aug 2023 16:52:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243601AbjHXUwT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 24 Aug 2023 16:52:19 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 029AB1991
        for <linux-renesas-soc@vger.kernel.org>; Thu, 24 Aug 2023 13:52:18 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-99c0290f0a8so22713266b.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 24 Aug 2023 13:52:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1692910334; x=1693515134;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GLD88l6nfbCK8qQhLvGjFf0/R5bFvFW7oJpPe1xAIgU=;
        b=hpw7wUKMvd8KCbsqyNBVA/GDcsbV8Cv9GNQxd6mWs6v+2AzVsV3BEV1Bh6FMqFYEeI
         bajlysTpCZ4zyByqvSaPvfiWAnlqJCATVfJQvhCYPMIwcFzlKtYKTjASqHX8JsEr0/md
         W9Jf2B180GdO1DlxC5Lfdzb8u5eWixZ0t20rI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692910334; x=1693515134;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GLD88l6nfbCK8qQhLvGjFf0/R5bFvFW7oJpPe1xAIgU=;
        b=iT+TWgue267oOl7/22r9zQmXzNpvtXtuOUymkwmoxvym3LeLNJZs428amCo5pdJUP6
         prEI9snbO6lKqUjGIfXY9ruBI8R0CQV57YcBd0i5QdRBxxvqjoMVoQKZxTRYHGjV5t/f
         CnTkXmpuiLvkAFKkRRkhhnU+B73+mRsa9ycaJhvuyJglOfxX/iIcMPZ6crPRcSzLID2e
         qcMK6VmshnZccTJo0tML59U5wZU1ntqJV3cyr6Mn3Sup0hcu+rGiVDl+jbbjHNbZSaX5
         1dfgG1B0Jg16yzDZxTHoqDaNxaP42QbZeyJ3y0zv0XCeo0p43VzDC2hvzaSmI63SMspc
         7hZA==
X-Gm-Message-State: AOJu0YxwPqJWRM0zvAQYiAQr8cPCHixQDns7AlR/ISz4XuHSDvgGuhmU
        atWJx4kJaVMALBFdWwNUrn7WJAxsPAf3Rh7dHUVDXMvD
X-Google-Smtp-Source: AGHT+IF9AnhHLNM0lJqGPkATisJP5Apx1vAG1d50FohgJV9hakosPEIUeCds4wcdpeowL1ZTtb0SCg==
X-Received: by 2002:a17:907:75cf:b0:9a1:6fcf:fcf9 with SMTP id jl15-20020a17090775cf00b009a16fcffcf9mr11623663ejc.62.1692910333914;
        Thu, 24 Aug 2023 13:52:13 -0700 (PDT)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com. [209.85.128.49])
        by smtp.gmail.com with ESMTPSA id lx16-20020a170906af1000b0098de7d28c34sm64046ejb.193.2023.08.24.13.52.12
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Aug 2023 13:52:13 -0700 (PDT)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4009fdc224dso6475e9.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 24 Aug 2023 13:52:12 -0700 (PDT)
X-Received: by 2002:a05:600c:3b02:b0:400:46db:1bf2 with SMTP id
 m2-20020a05600c3b0200b0040046db1bf2mr52771wms.2.1692910332441; Thu, 24 Aug
 2023 13:52:12 -0700 (PDT)
MIME-Version: 1.0
References: <20230824181546.391796-1-biju.das.jz@bp.renesas.com> <20230824182609.GA6477@pendragon.ideasonboard.com>
In-Reply-To: <20230824182609.GA6477@pendragon.ideasonboard.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 24 Aug 2023 13:51:59 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Wg1LY3601vN1qhKOEuZ9hVf-+hX8ajC6DKsC-5TNpy7g@mail.gmail.com>
Message-ID: <CAD=FV=Wg1LY3601vN1qhKOEuZ9hVf-+hX8ajC6DKsC-5TNpy7g@mail.gmail.com>
Subject: Re: [PATCH v3] drm/bridge/analogix/anx78xx: Drop ID table
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Guenter Roeck <groeck@chromium.org>,
        Zhu Wang <wangzhu9@huawei.com>,
        dri-devel@lists.freedesktop.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi,

On Thu, Aug 24, 2023 at 11:26=E2=80=AFAM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Biju,
>
> Thank you for the patch.
>
> On Thu, Aug 24, 2023 at 07:15:46PM +0100, Biju Das wrote:
> > The driver has an ID table, but it uses the wrong API for retrieving ma=
tch
> > data and that will lead to a crash, if it is instantiated by user space=
 or
> > using ID. From this, there is no user for the ID table and let's drop i=
t
> > from the driver as it saves some memory.
> >
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
>
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
>
> I wonder, as the device can only be instantiated from OF, should we add
>
>         depends on OF
>
> to Kconfig, and drop the
>
> #if IS_ENABLED(CONFIG_OF)
>
> from the driver ?

In my opinion we shouldn't add the "depends on OF" since that will
decrease the amount of compile testing. It's somewhat the opposite of
adding "if COMPILE_TEST" to your driver. ;-)

I think we could get rid of one of the "#if" statements in the driver
anyway as of commit c9e358dfc4a8 ("driver-core: remove conditionals
around devicetree pointers") from ~12 years ago. If we did something
similar in "struct drm_bridge" we could drop both #ifs.


-Doug
