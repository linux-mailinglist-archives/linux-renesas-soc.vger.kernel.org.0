Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 40303599995
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 19 Aug 2022 12:21:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348034AbiHSKPn (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 19 Aug 2022 06:15:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348051AbiHSKPm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 19 Aug 2022 06:15:42 -0400
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B56F5DAEED;
        Fri, 19 Aug 2022 03:15:39 -0700 (PDT)
Received: by mail-qt1-f182.google.com with SMTP id h22so2978553qtu.2;
        Fri, 19 Aug 2022 03:15:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=pYbJcXqu+HGBM+WMZ9dxCt6MszIknZUP0gMiIFKJaQs=;
        b=aSBEG/mAAKNnae8aCNpPgm8boZzf2GMPQkNtPP0warXedoJ7Dsi70z5LCrszpNHgjG
         KYilUonZV3qcbSxCmT0/7sVjOBZhvP5KB5ETkW3eRFAYHjN00OQ2iDIVOI2akddgJw7r
         5WEzJlp1AYXloBSrFGIUJIn91NrhoxINo+0hUL7aCYVfuskJ5WF3IOPc6cZFaOYwvMN5
         YDrD20ELl732qsuNFN8cz1hsUWFJ3w0u1erBp5WBVdkN4ZtWdzsVoS+JporZEweTanJj
         6DoIX8J6yOp/ZYewV/5XMO5SkeiZs112F8Dkn3b3TzvYXEEtwyaN72NFxHlFPFatY8mD
         GAkw==
X-Gm-Message-State: ACgBeo3LcUmP1+ZceMIrcxBg59Sfnhi8ast7VJVGMe7TfxzU/XuHNsGR
        JRsO1CY0FsTtGswa5z6crwpwdA9uep4N4A==
X-Google-Smtp-Source: AA6agR4RpFN/c5ov9Zr6UFOs6huBJv2lfRbGUSj73nGpBQxYbldz3bvqhOglsgzQXnmZv+IKNvUbBg==
X-Received: by 2002:a05:622a:546:b0:343:5a1a:9a9c with SMTP id m6-20020a05622a054600b003435a1a9a9cmr5977342qtx.417.1660904138331;
        Fri, 19 Aug 2022 03:15:38 -0700 (PDT)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com. [209.85.128.178])
        by smtp.gmail.com with ESMTPSA id i10-20020a05620a404a00b006b58d8f6181sm3399881qko.72.2022.08.19.03.15.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Aug 2022 03:15:37 -0700 (PDT)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-333a4a5d495so108953467b3.10;
        Fri, 19 Aug 2022 03:15:37 -0700 (PDT)
X-Received: by 2002:a0d:eb45:0:b0:333:f813:6c79 with SMTP id
 u66-20020a0deb45000000b00333f8136c79mr6767938ywe.384.1660904137258; Fri, 19
 Aug 2022 03:15:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220804190846.128370-1-phil.edworthy@renesas.com>
In-Reply-To: <20220804190846.128370-1-phil.edworthy@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 19 Aug 2022 12:15:26 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVo54QhnGo-DTGM4t8gNK9tTFgY-6iuR7fS68DQvPoU1g@mail.gmail.com>
Message-ID: <CAMuHMdVo54QhnGo-DTGM4t8gNK9tTFgY-6iuR7fS68DQvPoU1g@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: r9a09g011: Add pinctrl node
To:     Phil Edworthy <phil.edworthy@renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Aug 4, 2022 at 9:09 PM Phil Edworthy <phil.edworthy@renesas.com> wrote:
> Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.1.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
