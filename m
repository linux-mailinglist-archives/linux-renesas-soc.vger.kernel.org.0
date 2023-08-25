Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BB91D787EC0
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 25 Aug 2023 05:50:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238610AbjHYDto (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 24 Aug 2023 23:49:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240370AbjHYDtY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 24 Aug 2023 23:49:24 -0400
Received: from mail-oa1-x35.google.com (mail-oa1-x35.google.com [IPv6:2001:4860:4864:20::35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D6181BEB
        for <linux-renesas-soc@vger.kernel.org>; Thu, 24 Aug 2023 20:49:22 -0700 (PDT)
Received: by mail-oa1-x35.google.com with SMTP id 586e51a60fabf-1c4d67f493bso338766fac.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 24 Aug 2023 20:49:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692935361; x=1693540161;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oaRgqvEayejHdHjo+Vb4wpZc82Sn3tsmMDNX5I53Fa8=;
        b=KnE5cGW/HUiIaHohWIwrK0drYW/FqIqcuCzQaqtCRl4szjAsv+mkzmcE2jxqxhusK+
         0yuPG2g3PG1BxEl6peLt782VA8qQwBIU1fAP3drhgFY/2CVATBN1EgGFMtkx2Tr3hkW+
         1rjeas/FCpN3Ua+96hGR9/cno3HZWXDnT2pewpJI0TMaG6uT7bjIPKDIQuotqLCTK5Fc
         o5n+YcT+yGHaUyaZIBuztH36eEZQTLatXE0So7MXVRDyizlFjd2sFOmuGRB2ECPv1Exq
         3ydQPEO6X2q6OK00rpaFKSQTHE2rkjqWyTrki6Yn9E8+iK5WBrkAvqMc13L1qpCILqbZ
         iL7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692935361; x=1693540161;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oaRgqvEayejHdHjo+Vb4wpZc82Sn3tsmMDNX5I53Fa8=;
        b=UtdXiIh6N6AZY25PVUiKaEC+yyt2vc5vVVFsKzUgIHyPJTx/nh6TIv99haWAKvv/nT
         IB/Bg3/9vSfMdpxlzLjG+9ahK7iKHgRZX5c+tUe1BwEAI34ocZ4sMx5o2JASnFFH15U8
         b/OUq/+CbMzosqEJtazv+WVkWw2XrBi4Wb855o3y//CUTh1CEm69E3DTFHQoMgYfv0m/
         ePSaTaxjOddlqmkIkDfH9XqEPnCmwcBngmfYb5z9Y1J6HnvkPbz0145bdkW1KXkT+ULL
         eEKl57G2DNbcebCc1UzoBXR6hNtaCMpcDPapKU9JZIa5I5vkmtKsFhL2fshwIRRw1Ix1
         +d8A==
X-Gm-Message-State: AOJu0YxTxo3Fl3NEKG+MwLsPvTCMp3ZOtEMMvexsb7Nwhq7kdS/EUt0x
        sGyOjp8gNLH36H6AnPGYq/cETrrYbt0nFVf7Awo=
X-Google-Smtp-Source: AGHT+IFz3uxVhAMLCyy5LbMp6B/ElxF/bgUn0StLMVs+ZrEjaKhokN9PT2On3y8oytVd3ndlCEqQxcZgwGr8dEhfdVI=
X-Received: by 2002:a05:6870:d18a:b0:1b0:1e3b:5c21 with SMTP id
 a10-20020a056870d18a00b001b01e3b5c21mr2054858oac.1.1692935361628; Thu, 24 Aug
 2023 20:49:21 -0700 (PDT)
MIME-Version: 1.0
References: <20230824181546.391796-1-biju.das.jz@bp.renesas.com> <20230824182609.GA6477@pendragon.ideasonboard.com>
In-Reply-To: <20230824182609.GA6477@pendragon.ideasonboard.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 25 Aug 2023 06:48:45 +0300
Message-ID: <CAHp75VeK_0MnPtku7W6_ZDUWBTOFgmFZiwnOcnGgiVzbeU6FKQ@mail.gmail.com>
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
        Douglas Anderson <dianders@chromium.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Guenter Roeck <groeck@chromium.org>,
        Zhu Wang <wangzhu9@huawei.com>,
        dri-devel@lists.freedesktop.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
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

On Thu, Aug 24, 2023 at 9:26=E2=80=AFPM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Thu, Aug 24, 2023 at 07:15:46PM +0100, Biju Das wrote:

...

> I wonder, as the device can only be instantiated from OF, should we add
>
>         depends on OF

Generally speaking this is a bad idea. It prevents a component from
being instantiated on ACPI based systems (even if there is no ACPI ID
table, due to a gateway called PRP0001).

> to Kconfig, and drop the
>
> #if IS_ENABLED(CONFIG_OF)
>
> from the driver ?

Contrary this is an idea I fully support!

--=20
With Best Regards,
Andy Shevchenko
