Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 95438787794
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 24 Aug 2023 20:18:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239328AbjHXSR7 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 24 Aug 2023 14:17:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243029AbjHXSRf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 24 Aug 2023 14:17:35 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4488D1BF6
        for <linux-renesas-soc@vger.kernel.org>; Thu, 24 Aug 2023 11:17:33 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-99cce6f7de2so5549566b.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 24 Aug 2023 11:17:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1692901049; x=1693505849;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rPas7Wif5nIjow68vkOqqHoz5PSF9sPjZXPo/r5vhhg=;
        b=joLQW6QVP/k5x5weSKl7nJtmL2DHDAwmvzg09/UJNKaACUxGwa83OahXRDbv4AV3aT
         uIIPv6GttpX47vnjQWbdTOhwfgmFeBTJhkfccr9rksqhpV2jZ9zYYqA2s3aO7kOW2VZp
         sZQPsB0Ab80LnJaWGgthjH4TUtDd1VEZXac9A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692901049; x=1693505849;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rPas7Wif5nIjow68vkOqqHoz5PSF9sPjZXPo/r5vhhg=;
        b=iCcvSDIofalqKJk7waeUGBIFX9HMMCqKLrs07Q4jW93phgDKvfPq5lPiWHn0VwMnjA
         YeiFZRr8uiWDlPK9knC6djaZq5/lCNVOXfVhHzWHIzDPJQBjv5H3zg+nzCn8awCodyER
         NCRVzA4oByXFbqoyvg+RZWCeJ/l8DseAH2JeOT72rQxiRxRCxWQafRIBfQ4XltVHKI5n
         +JxGd7T8ZaiH58O0bFz8WulPJ34lPwrxLB37ItDCU2h/egukNvSzeAh2dh5skLKsBAva
         IzTzQjYOXOel6AsaGm3k6kNyBbCuFPMt5P+Samf7XvJqo6PRHtzlv+CR+TRAjoQQK9b4
         R+eQ==
X-Gm-Message-State: AOJu0YwopeWmf6SVaeZCMR5J/uBUnvsonV9WzbO+Ztx/O4kWLL/pN3TT
        VqGF+l7J47jRuPytkXky/S+ypBEEszzzym33/MRi1xiC
X-Google-Smtp-Source: AGHT+IFidA61YkUvnwn95O/QUXfleQkWXw40142V+JlDbN+/5UOubQ/NyMwlHVUyQKNgT7hpOT0TkQ==
X-Received: by 2002:a17:906:8a50:b0:9a1:fab3:ee43 with SMTP id gx16-20020a1709068a5000b009a1fab3ee43mr2851694ejc.0.1692901048900;
        Thu, 24 Aug 2023 11:17:28 -0700 (PDT)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com. [209.85.208.45])
        by smtp.gmail.com with ESMTPSA id h3-20020a170906260300b00992afee724bsm11129053ejc.76.2023.08.24.11.17.27
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Aug 2023 11:17:27 -0700 (PDT)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-521e046f6c7so1675a12.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 24 Aug 2023 11:17:27 -0700 (PDT)
X-Received: by 2002:a50:a6d4:0:b0:525:573c:6444 with SMTP id
 f20-20020a50a6d4000000b00525573c6444mr12956edc.1.1692901047044; Thu, 24 Aug
 2023 11:17:27 -0700 (PDT)
MIME-Version: 1.0
References: <20230824181546.391796-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20230824181546.391796-1-biju.das.jz@bp.renesas.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 24 Aug 2023 11:17:15 -0700
X-Gmail-Original-Message-ID: <CAD=FV=W20En+k_FhakGVEFQTSPAUujJhB-UE0SyEK67nLgVVWg@mail.gmail.com>
Message-ID: <CAD=FV=W20En+k_FhakGVEFQTSPAUujJhB-UE0SyEK67nLgVVWg@mail.gmail.com>
Subject: Re: [PATCH v3] drm/bridge/analogix/anx78xx: Drop ID table
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
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
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi,

On Thu, Aug 24, 2023 at 11:15=E2=80=AFAM Biju Das <biju.das.jz@bp.renesas.c=
om> wrote:
>
> The driver has an ID table, but it uses the wrong API for retrieving matc=
h
> data and that will lead to a crash, if it is instantiated by user space o=
r
> using ID. From this, there is no user for the ID table and let's drop it
> from the driver as it saves some memory.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v2->v3:
>  * Updated commit header.
> v1->v2:
>  * Dropped ID table support.
> ---
>  drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c | 7 -------
>  1 file changed, 7 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>

Unless there are objections, I'm happy to apply this late next week to
drm-misc-next.

-Doug
