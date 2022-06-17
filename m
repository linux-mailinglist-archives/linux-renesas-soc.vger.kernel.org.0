Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2232B54F156
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Jun 2022 09:03:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231145AbiFQHDF (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 17 Jun 2022 03:03:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1380007AbiFQHDE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 17 Jun 2022 03:03:04 -0400
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5CDB22507
        for <linux-renesas-soc@vger.kernel.org>; Fri, 17 Jun 2022 00:03:03 -0700 (PDT)
Received: by mail-qk1-f178.google.com with SMTP id x75so2583683qkb.12
        for <linux-renesas-soc@vger.kernel.org>; Fri, 17 Jun 2022 00:03:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=782clpgKbkbkIFunSIHJAHC4GaZ8B8BhsKlBvD6iDNE=;
        b=LMcoyTfdM4tAxNXitfo085rwQ1b+H+GFtk39p8vp6wP04pJfTPftsMABKvM9r+1CUY
         iYkenvomauQ9vzc2/G1sUUIS+fNGCYOsx9jOFoy5rMW2hI7dpx1trNhS0838Im0tPoR9
         01SShOWiTF1Lkcbctqtax0GuiPOP30O05McBdymgFJ1UZCd4FMZTznXWeVyIbse+WGYt
         v0gLm+urY+VpAhP0LLqgSK+qYPxPyQ8dNIw/pi2V+NQOFHx4D0ccyHZRXGgxq/ThEMnB
         o1WBBGXsB4FeC6jeNnIioYLRo9UMMbxQQsyxMIZATsBBu+4EmtLQ1RDMxj1pG61DFDOr
         FBwQ==
X-Gm-Message-State: AJIora+5cSC9OyCZLe+zHzVgrfcdBgQWGn1TcuH1GRabQET+F3galcpx
        3JezALacz0bbG3cmP6+1pRlutaJ08J8QtA==
X-Google-Smtp-Source: AGRyM1sMebL/qGGAgGADHudOz43HDXX8xtF3yts2Tlp7OR1NY0iwE2upTCjLcwbNU5Bv+Z8Xna3+KA==
X-Received: by 2002:a37:ab16:0:b0:6a6:8992:9aa2 with SMTP id u22-20020a37ab16000000b006a689929aa2mr6178407qke.190.1655449382764;
        Fri, 17 Jun 2022 00:03:02 -0700 (PDT)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com. [209.85.128.180])
        by smtp.gmail.com with ESMTPSA id b22-20020ac85bd6000000b00304e33f21f7sm3763868qtb.68.2022.06.17.00.03.01
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jun 2022 00:03:01 -0700 (PDT)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-317741c86fdso32485947b3.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 17 Jun 2022 00:03:01 -0700 (PDT)
X-Received: by 2002:a81:6157:0:b0:30c:7e4d:b28e with SMTP id
 v84-20020a816157000000b0030c7e4db28emr9810613ywb.502.1655449380718; Fri, 17
 Jun 2022 00:03:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220617010107.3229784-1-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <20220617010107.3229784-1-yoshihiro.shimoda.uh@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 17 Jun 2022 09:02:49 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVrPYyM6SHFoo0HrnQNvsCswBVFfeavf0LyES4-_ESa1g@mail.gmail.com>
Message-ID: <CAMuHMdVrPYyM6SHFoo0HrnQNvsCswBVFfeavf0LyES4-_ESa1g@mail.gmail.com>
Subject: Re: [PATCH] iommu/ipmmu-vmsa: Fix compatible for rcar-gen4
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Linux IOMMU <iommu@lists.linux-foundation.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Jun 17, 2022 at 3:16 AM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> Fix compatible string for R-Car Gen4.
>
> Fixes: ae684caf465b ("iommu/ipmmu-vmsa: Add support for R-Car Gen4")
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
