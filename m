Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A6E6E6EDF6A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Apr 2023 11:39:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233308AbjDYJjQ convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 25 Apr 2023 05:39:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233013AbjDYJjP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 25 Apr 2023 05:39:15 -0400
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1AC5310FD
        for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Apr 2023 02:39:15 -0700 (PDT)
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-b996127ec71so4527374276.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Apr 2023 02:39:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682415554; x=1685007554;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JfUVD5sHyhg+LQzHNaf7k/Kt0E3VestVkeRRTgHKlTo=;
        b=WTgU2M1e78sKP1e6x/0Y6vtQmO8eIqAvyMrj2+jOJRthqBNd9HTusGeJTd6gJgYaIC
         ZosFTYqTx0rEflGRlupGYfDEXa9ra/blAGxm4BAoGaQ3HYOue3nGXySH8dGONrsJVWY+
         xyvYj8/CiHLCA5ZEBZlpWPI0U07VU6czSHzIKvHyC/4jgxxJwzlZQFxlGiNw20EaOdrL
         qRzvkrfWsultjIW7gOR9gj++CHR5rq7m/v4FlQj0znSeP5M1F0xv47ncxOki80fqRKv/
         6IwTRrLowkBh5N9W4P/rQy3tP+b/xWmMSCpuRfC9SWyfe6afoD4H7wFKrVxk5uYf5eIJ
         7MGg==
X-Gm-Message-State: AAQBX9dTgU8PqYOqCNx8P20ZfAG/csSVj/2YBBr17pOW0/AfkD3pGfJq
        dl4pWk/xVCuzCdIgwQdcf1TgjhtViB3tJQ==
X-Google-Smtp-Source: AKy350abz6wUHAjZ2m+kAYdTzFO1R0yr3e6IrY3ZWsICKf4uCSFDVEsdLfWIE1tMe7CujrZn2ph8dA==
X-Received: by 2002:a25:2d3:0:b0:b8f:3b9d:7dd4 with SMTP id 202-20020a2502d3000000b00b8f3b9d7dd4mr12966294ybc.31.1682415554009;
        Tue, 25 Apr 2023 02:39:14 -0700 (PDT)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com. [209.85.128.177])
        by smtp.gmail.com with ESMTPSA id a7-20020a258047000000b00b99768e3b83sm1495574ybn.25.2023.04.25.02.39.13
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Apr 2023 02:39:13 -0700 (PDT)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-54f9d6eccf3so65016597b3.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Apr 2023 02:39:13 -0700 (PDT)
X-Received: by 2002:a81:4a05:0:b0:54f:bb39:792b with SMTP id
 x5-20020a814a05000000b0054fbb39792bmr10649787ywa.26.1682415553275; Tue, 25
 Apr 2023 02:39:13 -0700 (PDT)
MIME-Version: 1.0
References: <20230424161024.136316-1-biju.das.jz@bp.renesas.com>
 <20230424161024.136316-6-biju.das.jz@bp.renesas.com> <CAMuHMdWR1XE3SqCwqG=81WLDc_rY8Ec_rH7mjt6_5cL7=JA=TQ@mail.gmail.com>
 <OS0PR01MB59226ED2001DF994396014AD86649@OS0PR01MB5922.jpnprd01.prod.outlook.com>
In-Reply-To: <OS0PR01MB59226ED2001DF994396014AD86649@OS0PR01MB5922.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 25 Apr 2023 11:39:00 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVdMiVSpbnSjtLZwtAj0wutrXJPOTxDyzgN8a0OSA+5Rw@mail.gmail.com>
Message-ID: <CAMuHMdVdMiVSpbnSjtLZwtAj0wutrXJPOTxDyzgN8a0OSA+5Rw@mail.gmail.com>
Subject: Re: [PATCH v8 5/5] MAINTAINERS: Add maintainer for RZ DU drivers
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

On Tue, Apr 25, 2023 at 10:55 AM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > On Mon, Apr 24, 2023 at 6:10 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > > Add my self as maintainer for RZ DU drivers.
> > > While at it, update the entries for rcar-du and shmobile.
> > >
> > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> >
> > Thanks for your patch!
> >
> > > --- a/MAINTAINERS
> > > +++ b/MAINTAINERS
> > > @@ -6948,7 +6948,7 @@ F:        drivers/gpu/host1x/
> > >  F:     include/linux/host1x.h
> > >  F:     include/uapi/drm/tegra_drm.h
> > >
> > > -DRM DRIVERS FOR RENESAS
> > > +DRM DRIVERS FOR RENESAS RCAR AND SHMOBILE
> > >  M:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > >  M:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> > >  L:     dri-devel@lists.freedesktop.org
> > > @@ -6959,9 +6959,18 @@ F:
> > Documentation/devicetree/bindings/display/bridge/renesas,dsi-csi2-tx.yaml
> > >  F:     Documentation/devicetree/bindings/display/bridge/renesas,dw-
> > hdmi.yaml
> > >  F:     Documentation/devicetree/bindings/display/bridge/renesas,lvds.yaml
> > >  F:     Documentation/devicetree/bindings/display/renesas,du.yaml
> > > -F:     drivers/gpu/drm/renesas/
> > > +F:     drivers/gpu/drm/renesas/rcar-du/
> > > +F:     drivers/gpu/drm/renesas/shmobile/
> > >  F:     include/linux/platform_data/shmob_drm.h
> > >
> > > +DRM DRIVERS FOR RENESAS RZ
> > > +M:     Biju Das <biju.das.jz@bp.renesas.com>
> > > +L:     dri-devel@lists.freedesktop.org
> > > +L:     linux-renesas-soc@vger.kernel.org
> > > +S:     Maintained
> > > +F:     Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
> > > +F:     drivers/gpu/drm/renesas/rz-du/
> > > +
> > >  DRM DRIVERS FOR ROCKCHIP
> > >  M:     Sandy Huang <hjc@rock-chips.com>
> > >  M:     Heiko Stübner <heiko@sntech.de>
> >
> > Who's gonna maintain the common parts under drivers/gpu/drm/renesas/?
>
> At the moment, there is no common parts. But in future if we add common parts,
> We need to update the entries here. It will be either the person who is going to add
> the common part or it will be a collaborative effort.

Oh there is:
Kconfig
Makefile

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
