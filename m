Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D5840787789
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 24 Aug 2023 20:13:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242974AbjHXSND (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 24 Aug 2023 14:13:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242993AbjHXSMb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 24 Aug 2023 14:12:31 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0445019BF
        for <linux-renesas-soc@vger.kernel.org>; Thu, 24 Aug 2023 11:12:29 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-9a1de3417acso252188766b.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 24 Aug 2023 11:12:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1692900747; x=1693505547;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4GfcWh6x1HosL+RT76H/1NldrglLzyYkGU3K8IIi0sw=;
        b=Tgwtnz7A1gwcOPzSFJaJzOTYc1DTpZpZweqP4RRVVmHloma/MrM+FXaIiu+kHwlBcR
         9LFLRPkxqwauBh4v42RwiRvCYD0F5gvPmLl1M4ZDsK2AKCB/Byz3QrNcpVd/M9tgK1UN
         5HOTTtQqKOEuJ4MYdgyQ1cC2TRtG6eDHQF+Uw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692900747; x=1693505547;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4GfcWh6x1HosL+RT76H/1NldrglLzyYkGU3K8IIi0sw=;
        b=ff2rqAi0oSwjmwv7zOyFf2mkwld6LU+XNgLhZy5gtRNTIoCnMhq25X5sgwxQgU7lN4
         uc1USSrh831BPvih071IklHJ3xApQZ19Hokwa07UXTZQAEhy5pqEm4u5HGjJYWx0gQWf
         TOE4MFwZxSVz7wdgKTUW4bkPEk07J030sRBg/tHTAyVh/tKe9OIk4k3iUOQUh072uDDJ
         6hrBs0l8OX/snttJb3Vdm0EIw694bjIqhCgxU/z198MIURYMo2cRvOQYiyf/AeGtFEsW
         QqGEVCSCYWjGQ7rgUfKNl8moTd0vK5MeW2fj5IzzcFhrMWmpma+3mNBh1e0mwcEriEJn
         U41w==
X-Gm-Message-State: AOJu0YzByD8xHf0dqM9UYcGbDJTEi6f+hpr0SbvdmynVRw30fK8zdnMx
        VOFSUPNcKr5yxTGhAE1q4isX+XOGw9sxBfkeJ9rM5Rtk
X-Google-Smtp-Source: AGHT+IGAkEX5AYFs2d1SDTBwWudnGSZMotWjO+G4wmIe/uGFN4e6XGtP8VLCHSVIs3/aJB+1QQTc9A==
X-Received: by 2002:a17:907:9627:b0:995:3c9e:a629 with SMTP id gb39-20020a170907962700b009953c9ea629mr20656034ejc.31.1692900746801;
        Thu, 24 Aug 2023 11:12:26 -0700 (PDT)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com. [209.85.128.43])
        by smtp.gmail.com with ESMTPSA id fx15-20020a170906b74f00b0099290e2c163sm11208762ejb.204.2023.08.24.11.12.26
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Aug 2023 11:12:26 -0700 (PDT)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-3fef2fafee2so13805e9.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 24 Aug 2023 11:12:26 -0700 (PDT)
X-Received: by 2002:a05:600c:3b02:b0:400:46db:1bf2 with SMTP id
 m2-20020a05600c3b0200b0040046db1bf2mr18583wms.2.1692900745735; Thu, 24 Aug
 2023 11:12:25 -0700 (PDT)
MIME-Version: 1.0
References: <20230824181030.389643-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20230824181030.389643-1-biju.das.jz@bp.renesas.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 24 Aug 2023 11:12:13 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XcNwHyhgq1wYqtSXnq05JXp6dw_MD2rhEPH3FxR+0=hw@mail.gmail.com>
Message-ID: <CAD=FV=XcNwHyhgq1wYqtSXnq05JXp6dw_MD2rhEPH3FxR+0=hw@mail.gmail.com>
Subject: Re: [PATCH v2] drm/bridge/analogix/anx78xx: Extend match data support
 for ID table
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
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi,

On Thu, Aug 24, 2023 at 11:10=E2=80=AFAM Biju Das <biju.das.jz@bp.renesas.c=
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
> v1->v2:
>  * Dropped ID table support.
> ---
>  drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c | 7 -------
>  1 file changed, 7 deletions(-)

Patch ${SUBJECT} needs to be updated to match the change from v1 to v2.
