Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CBB656373DB
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 24 Nov 2022 09:28:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229541AbiKXI2J (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 24 Nov 2022 03:28:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229480AbiKXI2I (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 24 Nov 2022 03:28:08 -0500
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8226956ED7;
        Thu, 24 Nov 2022 00:28:07 -0800 (PST)
Received: by mail-qk1-f182.google.com with SMTP id i9so600565qkl.5;
        Thu, 24 Nov 2022 00:28:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Dwqo+aPqDnP0bEZRL6rSm5BGllSO4V9pda1/2AYM1HI=;
        b=MOAnfGy82m52aSDHQ+0EHMPVMtKo40WwsGFF1gYxLyBzYLjnhE9YII9DumCBjWhwez
         zhuHYFivEkHRyZ2yB3P7WAYCvUCwAFHCbyE4Ly6Xl5dZeJR70fWyxwcs+7Vxut2zKgOT
         KTJsuhKsTDrvJRDrngmmtgijrepz6O9vOzssHwHij9Yt05Sihgfsq0cJuMDIB8uIfgNU
         E0pmk7gcllRuDVPwgqL/Kwy4uKm9OdqZ8RGHlTbr/EG/32mYDYsJd2nnM+A9OLxs7JKN
         tKZ3Xyg8FU+k3YVcdrSO9tuAH2mTu5xnE24pZwrKqcFsahxlKRAG02ODtaLcYI45c2RZ
         5jMw==
X-Gm-Message-State: ANoB5plaSfhJztZKvVODei5ns7vlEJEPXt3EFcJXFCIJlzMWjvrRku2V
        zusxMWwDFIt1DyXP2AJXBhysJtk6DNN6Ig==
X-Google-Smtp-Source: AA0mqf76TJXEsFN1Wdeurd9N6WFtavOwkczYKEpWrt+fkixGEk7kpGNd+qCGxxXfhKMxnL9i6ht4XA==
X-Received: by 2002:ae9:e509:0:b0:6f5:5aa7:c772 with SMTP id w9-20020ae9e509000000b006f55aa7c772mr13913340qkf.97.1669278486518;
        Thu, 24 Nov 2022 00:28:06 -0800 (PST)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com. [209.85.219.169])
        by smtp.gmail.com with ESMTPSA id bz13-20020a05622a1e8d00b0039cc0fbdb61sm279976qtb.53.2022.11.24.00.28.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Nov 2022 00:28:04 -0800 (PST)
Received: by mail-yb1-f169.google.com with SMTP id z192so1096768yba.0;
        Thu, 24 Nov 2022 00:28:04 -0800 (PST)
X-Received: by 2002:a25:8249:0:b0:6dd:b521:a8f2 with SMTP id
 d9-20020a258249000000b006ddb521a8f2mr10946728ybn.380.1669278483856; Thu, 24
 Nov 2022 00:28:03 -0800 (PST)
MIME-Version: 1.0
References: <20221122195413.1882486-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20221122195413.1882486-1-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 24 Nov 2022 09:27:52 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWW7vG+EQ3hNcNxuPpMaBLtLztEpZC1Y=0f4MUy9RN67g@mail.gmail.com>
Message-ID: <CAMuHMdWW7vG+EQ3hNcNxuPpMaBLtLztEpZC1Y=0f4MUy9RN67g@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: display: bridge: renesas,rzg2l-mipi-dsi:
 Document RZ/V2L support
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <robert.foss@linaro.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Nov 22, 2022 at 8:54 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Document RZ/V2L DSI bindings. RZ/V2L MIPI DSI is identical to one found on
> the RZ/G2L SoC. No driver changes are required as generic compatible
> string "renesas,rzg2l-mipi-dsi" will be used as a fallback.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
