Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D310B6732DE
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Jan 2023 08:47:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230038AbjASHrU (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 19 Jan 2023 02:47:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230087AbjASHqw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 19 Jan 2023 02:46:52 -0500
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2662A6D69A
        for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Jan 2023 23:44:25 -0800 (PST)
Received: by mail-wm1-x332.google.com with SMTP id f19-20020a1c6a13000000b003db0ef4dedcso2939416wmc.4
        for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Jan 2023 23:44:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eKZQ91Aw87nv1viQEfl8utbxQ45kNGlGmqk/4SGhfo0=;
        b=APlxfIM5M6KKMl7wxzQSVG/X+R3Otv6xmy8/ek59j069tVUBauUpKlA/NpRiyUTOYL
         D7lHh7ru4PscfSHCKTD+Br9JN/Uhwmqe0ilar2hD8SPN6E1JwDVybbA4oSw7uEgdFKeK
         BVx7RPozYTkiu//FFz1Ccinye/mdF4djVez8ALMfiEfiMupIFQzBqN9jEM5RAEcfh44b
         kuYmOUGeCT2F/iLe2o1OOkp3q+qSnF2+R/FXkb3LXgpsaAMzcElvBKoNUDwTw4Wz6dp4
         v6DRfT2Fof+tSEBLjJYIzMdWuJfbcAq2PiSwuC0nitaOvdKnXH4G1l+yOdE2zz7540m7
         gKDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eKZQ91Aw87nv1viQEfl8utbxQ45kNGlGmqk/4SGhfo0=;
        b=OsCimFD9rohSm/fFjL4/HK/hFKI94vaSXCKPr8kyCYQk5pFgj5mfsb3kxPFw9/hO41
         5g/ElGH7HQ53mxJWTmFUXpj+U9rcjm9S8rhKd35gT8yFmkMzFrGtVWmkWn+YPiqtmen/
         pD8HxSIJhm2fpXsd0Rn4KW5t4yyCkl86qL9PufvefE+qwunnCav8E6QRNbiAeFkDeSwR
         NrvAlVWlIscNsb71gDV4dr2rXG9ZV3tBdioaFheoIru4PThLtOqYWn2ZSHfjRkRyzC+p
         gAuWIlINx2Kh1Q1XhxdFtGxJyNAOo9oH20XKp6GCPZiYWgLT/Wdco84KYzFiC9tX03EA
         XOHQ==
X-Gm-Message-State: AFqh2koIrgrUneSSPih+B/jZvC9LJ7S80LSfPzfSHy1E6Hl1I+KAO2VS
        IoAC1fyHtjfQCjlUgF7s71XUCA==
X-Google-Smtp-Source: AMrXdXssvCc0ssiNmEmtP7KI9CPYfAoVDx4z1HqRc6HVFNdJza4wLoqwdqwR31tj/d37i2pUyCt9qQ==
X-Received: by 2002:a05:600c:539b:b0:3d9:f836:3728 with SMTP id hg27-20020a05600c539b00b003d9f8363728mr9342406wmb.11.1674114260907;
        Wed, 18 Jan 2023 23:44:20 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id bg14-20020a05600c3c8e00b003dab40f9eafsm5143529wmb.35.2023.01.18.23.44.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jan 2023 23:44:20 -0800 (PST)
From:   Neil Armstrong <neil.armstrong@linaro.org>
To:     Andrzej Hajda <andrzej.hajda@intel.com>,
        Robert Foss <robert.foss@linaro.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        linux-renesas-soc@vger.kernel.org
In-Reply-To: <20221122195413.1882486-1-biju.das.jz@bp.renesas.com>
References: <20221122195413.1882486-1-biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH] dt-bindings: display: bridge: renesas,rzg2l-mipi-dsi:
 Document RZ/V2L support
Message-Id: <167411426002.269815.4893986069711340416.b4-ty@linaro.org>
Date:   Thu, 19 Jan 2023 08:44:20 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.11.1
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi,

On Tue, 22 Nov 2022 19:54:13 +0000, Biju Das wrote:
> Document RZ/V2L DSI bindings. RZ/V2L MIPI DSI is identical to one found on
> the RZ/G2L SoC. No driver changes are required as generic compatible
> string "renesas,rzg2l-mipi-dsi" will be used as a fallback.
> 
> 

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-next)

[1/1] dt-bindings: display: bridge: renesas,rzg2l-mipi-dsi: Document RZ/V2L support
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=ae5a8dce3c86c1ea8e17910c3836b92a406f9ad8

-- 
Neil
