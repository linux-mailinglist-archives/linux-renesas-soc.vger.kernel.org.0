Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DB80B5A2A17
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 26 Aug 2022 16:55:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235038AbiHZOzC (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 26 Aug 2022 10:55:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230408AbiHZOzB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 26 Aug 2022 10:55:01 -0400
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B537431341;
        Fri, 26 Aug 2022 07:54:58 -0700 (PDT)
Received: by mail-qt1-f174.google.com with SMTP id l5so1417064qtv.4;
        Fri, 26 Aug 2022 07:54:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=TGG7RFn3BVl+Oefs79Y8GNDxRct9/9pzR4kVRiTb/ZM=;
        b=VJvaEGodxKNpNU+pT5FXdkvgLg4ekeunA3d2VAdX99W3/BPaIGAUWwtT0uMg63lUSO
         F52A56CsF5Vqo4tRuutlSanzbyqzxJ0zO8gy0s1F7iIIRpSodDYMCgy3LLARQPxCLSba
         YBc/SNx27H8LEXckFYAW/H+NDbTltJGp9yl9RzcX/dQFC6/6fF9UvQxT+XIEG6nPI2yG
         tO4Tz/9V2NekoD30e0bmixGVYi/SY7sBmetumVnj94xCa7zsKDxWHSohIhqMXwGUMpds
         eT2eelny+kVANFIFDzUhxV3hAbqowLVp57xcz+xkz1tK5xxcoWGdFAb5ooY/2YnLP+eY
         sTwg==
X-Gm-Message-State: ACgBeo3OwZmlsU/Bdbh5z94cOsweZ+ipoC31oEq9p7bUHPLTSUpJ8f2Q
        DDmQszz+4S0JM1ScslYkq4IKfu3Ky8FMVA==
X-Google-Smtp-Source: AA6agR75E0pmS9MAl6PvMulYVIcqgU6Os/6EiRMZRDtGkRPtl4hqN2kPgzqRHWrq9jZgptESabuzDg==
X-Received: by 2002:ac8:5cc4:0:b0:344:688f:f06f with SMTP id s4-20020ac85cc4000000b00344688ff06fmr54533qta.502.1661525697022;
        Fri, 26 Aug 2022 07:54:57 -0700 (PDT)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com. [209.85.128.177])
        by smtp.gmail.com with ESMTPSA id z23-20020ac81017000000b00338ae1f5421sm21951qti.0.2022.08.26.07.54.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Aug 2022 07:54:56 -0700 (PDT)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-33dbbf69b3dso42340777b3.1;
        Fri, 26 Aug 2022 07:54:56 -0700 (PDT)
X-Received: by 2002:a0d:cb47:0:b0:337:8db6:b0c0 with SMTP id
 n68-20020a0dcb47000000b003378db6b0c0mr22948ywd.47.1661525696554; Fri, 26 Aug
 2022 07:54:56 -0700 (PDT)
MIME-Version: 1.0
References: <20220825071022.7864-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20220825071022.7864-1-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 26 Aug 2022 16:54:45 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVrScCGTDr4DgW5uKSjrbGB=SsDnY8s+i45RqAjGz6n0w@mail.gmail.com>
Message-ID: <CAMuHMdVrScCGTDr4DgW5uKSjrbGB=SsDnY8s+i45RqAjGz6n0w@mail.gmail.com>
Subject: Re: [PATCH v2 0/6] arm64: dts: renesas: move I2C aliases to board files
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
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

Hi Wolfram.

On Thu, Aug 25, 2022 at 9:11 AM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Change since v1:
> * converted r8a774a1 boards, too (Thanks, Geert!)
>
> Old coverletter follows:
>
> For R-Car Gen3 and Gen4, we had I2C aliases in per-SoC DTS include
> files. That doesn't really fit as bus naming is a board property. This
> series moves the aliases to the board files. The following procedure has
> been applied to avoid regressions:
>
> 1) move the aliases from SoC files to board files. Keep the empty
>    alias-nodes in the SoC file and add the new aliases before existing
>    ones. This ensured that identical binaries[1] were created.
>
> 2) Once all aliases were moved and all binaries[1] stayed identical,
>    then the empty alias nodes from the SoC files were removed.
>
> The result is this series based on the renesas-drivers tag
> 'renesas-drivers-2022-08-16-v6.0-rc1'.
>
> It could be discussed if the aliases should be sorted alphabetically,
> but I'd think this is a seperate series then.
>
> I also leave it to Geert, if the commits should be squashed. At least
> for reviewing, I think this separation makes sense, though.

Thanks for the update!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.1.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
