Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 968C9542EFF
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Jun 2022 13:17:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237902AbiFHLR1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 8 Jun 2022 07:17:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237780AbiFHLR0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 8 Jun 2022 07:17:26 -0400
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39E17384CDB;
        Wed,  8 Jun 2022 04:17:24 -0700 (PDT)
Received: by mail-qk1-f169.google.com with SMTP id o73so10270314qke.7;
        Wed, 08 Jun 2022 04:17:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nLJ7chKHyiO7PE6NS7EjPn0VMZXhEx3i2ZBaw0w7Dz4=;
        b=2R8ZofLnA43iKSZscVNwH2Z5NXsi+yXM3410rm5goPVhDBgPxiKzg7yDC4jMXFA2do
         Ha/MjvJxVr6hibLW+AwM0XkkEhLTnIcr1isQ4sPLLMhtlyjGXwxbpj/KRThULT7HL+rY
         pdDPCSjBMJJzLxtoyzL9a0X5TqSA2TNEkRH5HvC1OHoFNcUtDDK1Ne0I1FVs3UTaSCbC
         PeaXcxiS4LgLhXe2b6YU2z5nmUPwx1LMtIKus/9Iit3E2sNENWPvsERXgabiLyTqa77t
         55lNNnClKARUqBV+KOG3g8ZeRG+qnl9A+dft6n+t9lP4HwsP1+b6xDuQvqSHB64ccbn1
         2xIw==
X-Gm-Message-State: AOAM532KCS0++iVyil5tNmS6pAp8T0yu4Aoi4NFKe4i+5C/u7ct+4dRR
        U4JO8nh7yGYhU3VMmk8eju0z3lKr2jbOvw==
X-Google-Smtp-Source: ABdhPJzusVNEr10lvvwsV74TSTKil10dwRnwub1jBUPA+rTgU49l+KjJd5qqz2hAM7ZI/juyyMmFFw==
X-Received: by 2002:a05:620a:3714:b0:6a5:564b:222f with SMTP id de20-20020a05620a371400b006a5564b222fmr22591208qkb.648.1654687043119;
        Wed, 08 Jun 2022 04:17:23 -0700 (PDT)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com. [209.85.219.170])
        by smtp.gmail.com with ESMTPSA id f2-20020a05620a408200b006a6ab8f761csm10734551qko.62.2022.06.08.04.17.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jun 2022 04:17:22 -0700 (PDT)
Received: by mail-yb1-f170.google.com with SMTP id w2so35950342ybi.7;
        Wed, 08 Jun 2022 04:17:22 -0700 (PDT)
X-Received: by 2002:a25:d748:0:b0:65c:6b00:55af with SMTP id
 o69-20020a25d748000000b0065c6b0055afmr33412057ybg.365.1654687042524; Wed, 08
 Jun 2022 04:17:22 -0700 (PDT)
MIME-Version: 1.0
References: <20220608094831.8242-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20220608094831.8242-1-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 8 Jun 2022 13:17:11 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUF0jBDvO6F-7a8BGMdw+P1O+1_6wKmvpN7CKUc69b_AQ@mail.gmail.com>
Message-ID: <CAMuHMdUF0jBDvO6F-7a8BGMdw+P1O+1_6wKmvpN7CKUc69b_AQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: mmc: renesas,sdhi: R-Car V3U is R-Car Gen4
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux MMC List <linux-mmc@vger.kernel.org>,
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

On Wed, Jun 8, 2022 at 12:39 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Despite the name, R-Car V3U is the first member of the R-Car Gen4
> family.  Hence move its compatible value to the R-Car Gen4 section.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
