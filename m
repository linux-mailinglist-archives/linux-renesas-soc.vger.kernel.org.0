Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6602D7EE4EB
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Nov 2023 17:04:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345272AbjKPQEV convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 16 Nov 2023 11:04:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344652AbjKPQEV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 16 Nov 2023 11:04:21 -0500
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8BB6193
        for <linux-renesas-soc@vger.kernel.org>; Thu, 16 Nov 2023 08:04:17 -0800 (PST)
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-da3b4b7c6bdso927870276.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 16 Nov 2023 08:04:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700150657; x=1700755457;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Oqx3bXxdEF5eGmOFUaEEnJRV+EqOOyEh1+4SG0dDQpA=;
        b=SEvZJba1xtFbb2yf1UggKhdp/t37DALe3SQuO/jIKQ6Ns6rNKhQjb4ZMtjdZna/CUh
         E3qhUgFnqx/Olq+BvJ2Fj++QVyFKOhsdvYl4e4m4MdFPswSoBhkb9ozuNfjcdVQyPBJJ
         XfevYIFP4N76W9bXU5eXpMDp2+12oUBp5eYWATGh965yayguyXlhbPnQZzelc4yVBG9q
         0hQd+0GXEaUtndHx/eBuYx3lOEbDET2Z8qhaqkXfS31EwK00Qcxm6Zphb0BOgAA8vHY4
         XjakEd25otDheuZ2irGRMTrEC4pSV94P/ir+kiMCWvvSh7FXVSpIAJKFrc86TP84FhQc
         2K6g==
X-Gm-Message-State: AOJu0Yw6LwGUMohTYY9hyNsoUl8TwgNnKPD4q+p/Vm1gawKzOqzH31Gp
        /AS+gvF+xwQ2qESrFdLtUYA2a0q6VeiYxw==
X-Google-Smtp-Source: AGHT+IFA8M79tivNo4vmYyj5p4HRfNSMlmm0szWT+ueiqHCJfRmoNuPEg+TfC30p3H6UtMWSaMl4FQ==
X-Received: by 2002:a25:b094:0:b0:da0:c9bc:5877 with SMTP id f20-20020a25b094000000b00da0c9bc5877mr15889080ybj.18.1700150656732;
        Thu, 16 Nov 2023 08:04:16 -0800 (PST)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com. [209.85.128.178])
        by smtp.gmail.com with ESMTPSA id b202-20020a2534d3000000b00da076458395sm950112yba.43.2023.11.16.08.04.15
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Nov 2023 08:04:16 -0800 (PST)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-5a81ab75f21so10747767b3.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 16 Nov 2023 08:04:15 -0800 (PST)
X-Received: by 2002:a25:4b02:0:b0:daf:bf52:62e4 with SMTP id
 y2-20020a254b02000000b00dafbf5262e4mr10831050yba.37.1700150655377; Thu, 16
 Nov 2023 08:04:15 -0800 (PST)
MIME-Version: 1.0
References: <20231116141608.252452-1-biju.das.jz@bp.renesas.com>
 <20231116141608.252452-5-biju.das.jz@bp.renesas.com> <eywaoaudaqtrv5ky46ahenapkjwk4tajxdrkuentehezw4ajid@aioncg5rahws>
In-Reply-To: <eywaoaudaqtrv5ky46ahenapkjwk4tajxdrkuentehezw4ajid@aioncg5rahws>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 16 Nov 2023 17:04:03 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXZjft3AVEF7cPnhH4pz_2+9U51jnSg-tFJ-ppfi7GTZw@mail.gmail.com>
Message-ID: <CAMuHMdXZjft3AVEF7cPnhH4pz_2+9U51jnSg-tFJ-ppfi7GTZw@mail.gmail.com>
Subject: Re: [PATCH v14 4/4] MAINTAINERS: Create entry for Renesas RZ DRM drivers
To:     Maxime Ripard <mripard@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Biju Das <biju.das.au@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Maxime,

On Thu, Nov 16, 2023 at 4:58 PM Maxime Ripard <mripard@kernel.org> wrote:
> On Thu, Nov 16, 2023 at 02:16:08PM +0000, Biju Das wrote:
> > Create entry for Renesas RZ DRM drivers and add my self as a maintainer.
> >
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > ---
> > v13->v14:
> >  * Now SHMOBILE has maintainer entries. So dropped updating
> >    DRM DRIVERS FOR RENESAS RCAR AND SHMOBILE.
> >  * Updated comment header and description.
> >  * The above changes are trivial, so kept the Rb tag from Laurent.

> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -7154,6 +7154,14 @@ F:     Documentation/devicetree/bindings/display/renesas,shmobile-lcdc.yaml
> >  F:   drivers/gpu/drm/renesas/shmobile/
> >  F:   include/linux/platform_data/shmob_drm.h
> >
> > +DRM DRIVERS FOR RENESAS RZ
> > +M:   Biju Das <biju.das.jz@bp.renesas.com>
> > +L:   dri-devel@lists.freedesktop.org
> > +L:   linux-renesas-soc@vger.kernel.org
> > +S:   Maintained
> > +F:   Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
> > +F:   drivers/gpu/drm/renesas/rz-du/
>
> Any particular reason you want to opt-out of drm-misc?

IIRC, you opted all Renesas drivers out in commit 5a44d50f00725f31
("MAINTAINERS: Update drm-misc entry to match all drivers")?

Probably that should be restricted to drivers/gpu/drm/renesas/rcar-du/?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
