Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7FF0D5FC661
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Oct 2022 15:26:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229653AbiJLNZ6 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 12 Oct 2022 09:25:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229604AbiJLNZ5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 12 Oct 2022 09:25:57 -0400
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18835BB064;
        Wed, 12 Oct 2022 06:25:50 -0700 (PDT)
Received: by mail-qk1-f174.google.com with SMTP id 8so2939630qka.1;
        Wed, 12 Oct 2022 06:25:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OYKvj3GVd5Tg+NDlIwQQt8ZJzcXS92tatY/+DrOpNx0=;
        b=KrQOKqI4omqX9KwgG0d35aQQPfUYQfu4psZM3xxYp8iNWUe4FHq+c4Sfrc+WJpDQOw
         JfjzcNpIMo2h1cfvAK6409T1si8CMr79MogOtfhbz6zP/8pfFps7rd/JIzm/ZYRxCKBK
         NvyoP+EExP++/tb8Mw4mHRczCTHPd8ZE7bZ71DEjKIVl38bPaMrf4pOV5KI4RKEXoAZ4
         RnRtPGLfEjDpb12FvrUOQe2lCU3nbrCFzQC+sBnZiDD1PuGkMrNhjx0Nf0RWoXN9bSow
         Lr8KWZFfftzxjTSkFnWV8RkyfQdYdO0C6kko2ZDnLLXtp8NjkxoyNUMEP0NaK5H/fXJ0
         VQyA==
X-Gm-Message-State: ACrzQf3GQ/4RhRyIq/tOtw7uno45Kaq0LiGQn66KeekvOfEoLgQeXcVN
        Ei8RZhXFiQMWEl0FrcZiVIIMfLvBvOFz+g==
X-Google-Smtp-Source: AMsMyM5JYC344l9EsauacZWTiz5vALdpOPusV5XZAsjANwQx+toYpgioYa42VdS5gNlDAZAznY5Y+Q==
X-Received: by 2002:a05:620a:12d5:b0:6ee:9a95:8c72 with SMTP id e21-20020a05620a12d500b006ee9a958c72mr1552530qkl.362.1665581149655;
        Wed, 12 Oct 2022 06:25:49 -0700 (PDT)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com. [209.85.128.177])
        by smtp.gmail.com with ESMTPSA id h19-20020a05620a245300b006ccc96c78easm16053213qkn.134.2022.10.12.06.25.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Oct 2022 06:25:49 -0700 (PDT)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-354c7abf786so155804027b3.0;
        Wed, 12 Oct 2022 06:25:48 -0700 (PDT)
X-Received: by 2002:a81:5a57:0:b0:353:6de6:3263 with SMTP id
 o84-20020a815a57000000b003536de63263mr26251333ywb.358.1665581148424; Wed, 12
 Oct 2022 06:25:48 -0700 (PDT)
MIME-Version: 1.0
References: <7ee7fdb6a46fc9f0e50c2b803ede6b4b2fdfa450.1665558324.git.geert+renesas@glider.be>
 <166558066055.1938423.17466826000089973236.robh@kernel.org>
In-Reply-To: <166558066055.1938423.17466826000089973236.robh@kernel.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 12 Oct 2022 15:25:36 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWg=G0NfFARtixMWTdPuQFYMy7f+JJTr420+shXRYD8=A@mail.gmail.com>
Message-ID: <CAMuHMdWg=G0NfFARtixMWTdPuQFYMy7f+JJTr420+shXRYD8=A@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: mmc: renesas,sdhi: Document R-Car V4H support
To:     Rob Herring <robh@kernel.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-mmc@vger.kernel.org,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
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

Hi Rob(ot),

On Wed, Oct 12, 2022 at 3:19 PM Rob Herring <robh@kernel.org> wrote:
> On Wed, 12 Oct 2022 09:05:56 +0200, Geert Uytterhoeven wrote:
> > Document support for the SD Card/MMC Interface on the Renesas R-Car V4H
> > (R8A779G0) SoC.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> >  Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml | 1 +
> >  1 file changed, 1 insertion(+)
> >
>
> Running 'make dtbs_check' with the schema in this patch gives the
> following warnings. Consider if they are expected or the schema is
> incorrect. These may not be new warnings.
>
> Note that it is not yet a requirement to have 0 warnings for dtbs_check.
> This will change in the future.
>
> Full log is available here: https://patchwork.ozlabs.org/patch/
>
>
> mmc@ee100000: Unevaluated properties are not allowed ('iommus' was unexpected)

JFYI, your tree is missing commit 1de7307270f5f203 ("dt-bindings: mmc:
renesas,sdhi: Add iommus property") in linus/master.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
