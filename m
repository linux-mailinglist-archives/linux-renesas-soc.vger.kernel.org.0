Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9DBB16EDD48
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Apr 2023 09:55:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232240AbjDYHzl convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 25 Apr 2023 03:55:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231646AbjDYHzk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 25 Apr 2023 03:55:40 -0400
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B6D093
        for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Apr 2023 00:55:39 -0700 (PDT)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-54f8b46d031so61420787b3.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Apr 2023 00:55:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682409338; x=1685001338;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=32lcqM6Fq0qcXElBsoyKk2B7Vu57XT2++1XOz45oKjQ=;
        b=gkg2EOru/8vnLN7wCit6rLklEr0ivstQKhwwB92xHTQ4LhkoOkcmnLodHXsYGHNJ5n
         /e3GNy7spT7DByQtHkNZt9Zd0sulPV8qgJUOZEIOHP2PxV8N5zCGSUmI56xSoPVBUeyX
         U9v1T4QQ7E8ljI3Ehgx5bV52vyDm5iHNekKiJBMTwhB1VFTz21tV+L7M6TAYtZGkkE/b
         2Qgii0NCUwBesavfdKWB0rVk1zW0vaEirNxHoIyR4UsRPJmzppKDeNlLbIOnuZjPHDEb
         ozYcQCaxYN+pDkcRLEFhGWZUyIUjEXZbEVUI+rrGRcj1LMgsdaobIoT2ipNyHctMJttE
         wpgg==
X-Gm-Message-State: AAQBX9eDOZgQb5QQSTHpVwYwew3tiJchagaMNVrksXiQcwIrGQ25o4Aw
        029IZrDQPopVjw9TVbrWZWvGv67LQvisCQ==
X-Google-Smtp-Source: AKy350bU8y4E81TDZbL78b6eSDkc1cSKZCV2GQL+Rvxq/nxi2MahCVeGuZUyD7X7s9ojnHT8+xWqXA==
X-Received: by 2002:a0d:c644:0:b0:54f:895e:70ff with SMTP id i65-20020a0dc644000000b0054f895e70ffmr9606573ywd.21.1682409338386;
        Tue, 25 Apr 2023 00:55:38 -0700 (PDT)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com. [209.85.128.178])
        by smtp.gmail.com with ESMTPSA id s128-20020a817786000000b00545a08184b8sm3418234ywc.72.2023.04.25.00.55.37
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Apr 2023 00:55:37 -0700 (PDT)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-54fbee69fc4so61348407b3.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Apr 2023 00:55:37 -0700 (PDT)
X-Received: by 2002:a0d:ccc9:0:b0:546:4626:bfc5 with SMTP id
 o192-20020a0dccc9000000b005464626bfc5mr10570998ywd.31.1682409337504; Tue, 25
 Apr 2023 00:55:37 -0700 (PDT)
MIME-Version: 1.0
References: <20230424161024.136316-1-biju.das.jz@bp.renesas.com> <20230424161024.136316-6-biju.das.jz@bp.renesas.com>
In-Reply-To: <20230424161024.136316-6-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 25 Apr 2023 09:55:25 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWR1XE3SqCwqG=81WLDc_rY8Ec_rH7mjt6_5cL7=JA=TQ@mail.gmail.com>
Message-ID: <CAMuHMdWR1XE3SqCwqG=81WLDc_rY8Ec_rH7mjt6_5cL7=JA=TQ@mail.gmail.com>
Subject: Re: [PATCH v8 5/5] MAINTAINERS: Add maintainer for RZ DU drivers
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
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

On Mon, Apr 24, 2023 at 6:10 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Add my self as maintainer for RZ DU drivers.
> While at it, update the entries for rcar-du and shmobile.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -6948,7 +6948,7 @@ F:        drivers/gpu/host1x/
>  F:     include/linux/host1x.h
>  F:     include/uapi/drm/tegra_drm.h
>
> -DRM DRIVERS FOR RENESAS
> +DRM DRIVERS FOR RENESAS RCAR AND SHMOBILE
>  M:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>  M:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>  L:     dri-devel@lists.freedesktop.org
> @@ -6959,9 +6959,18 @@ F:       Documentation/devicetree/bindings/display/bridge/renesas,dsi-csi2-tx.yaml
>  F:     Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.yaml
>  F:     Documentation/devicetree/bindings/display/bridge/renesas,lvds.yaml
>  F:     Documentation/devicetree/bindings/display/renesas,du.yaml
> -F:     drivers/gpu/drm/renesas/
> +F:     drivers/gpu/drm/renesas/rcar-du/
> +F:     drivers/gpu/drm/renesas/shmobile/
>  F:     include/linux/platform_data/shmob_drm.h
>
> +DRM DRIVERS FOR RENESAS RZ
> +M:     Biju Das <biju.das.jz@bp.renesas.com>
> +L:     dri-devel@lists.freedesktop.org
> +L:     linux-renesas-soc@vger.kernel.org
> +S:     Maintained
> +F:     Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
> +F:     drivers/gpu/drm/renesas/rz-du/
> +
>  DRM DRIVERS FOR ROCKCHIP
>  M:     Sandy Huang <hjc@rock-chips.com>
>  M:     Heiko Stübner <heiko@sntech.de>

Who's gonna maintain the common parts under drivers/gpu/drm/renesas/?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
