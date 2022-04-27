Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 67FD6511919
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 Apr 2022 16:55:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235688AbiD0NUX (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 27 Apr 2022 09:20:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235542AbiD0NUO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 27 Apr 2022 09:20:14 -0400
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 170997B546;
        Wed, 27 Apr 2022 06:16:52 -0700 (PDT)
Received: by mail-qv1-f41.google.com with SMTP id js10so1029983qvb.0;
        Wed, 27 Apr 2022 06:16:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5pyrL+6b6rSSJQxOshFo+/aZqmufDbFDZUuYULDrFPs=;
        b=2EjDmkvfDwi2UyHAW6z/B7aktoLXcW8nhjEt07Zvd/joTnDyv30euuTC5UsA+acEZJ
         cjHA2VfMRa6gnCuzli1fbk9hb6pRLXgXzRavjFYCdDxPUN+G3ksgyTcBqmNqS3MxIHHQ
         hPq4QaUZZOkY5f78U0dMRU4Abzf+M/iiqcieUk3OVUhwpuQIzDRFLC6Hcprw04W1Idr6
         DhnB7ckoGoZkjlNp2EBxIqBhdvkDz/ELp7yHp5ee5fVX4TQCapajkLyLHkUqbDGkRwl3
         sTrg5HL2xDpscfz0bE5QXEljpFUIeceyDS0+1Jp6jt/j0P7yt4rBTl4dzYZ826t/irr7
         AHyw==
X-Gm-Message-State: AOAM530MVPX+Udtrtpt1BAbLEzvD8H1KiHxZoNGak68NqKPcEHKgcRgF
        wkhcrvmMIAuh7dL/euJF7/XZVzhl+Kximw==
X-Google-Smtp-Source: ABdhPJyEVP61/eSF+jueYJhSX2Tuz5UgokXRF5pNSFJxKtcMIKzfV+gcRXMzp+3BH3R1vLDjGarHYg==
X-Received: by 2002:a0c:eb8d:0:b0:456:3256:7ae0 with SMTP id x13-20020a0ceb8d000000b0045632567ae0mr12462487qvo.95.1651065331327;
        Wed, 27 Apr 2022 06:15:31 -0700 (PDT)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com. [209.85.128.169])
        by smtp.gmail.com with ESMTPSA id p14-20020a05622a13ce00b002f20a695972sm9993705qtk.14.2022.04.27.06.15.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Apr 2022 06:15:31 -0700 (PDT)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-2f7bb893309so17818247b3.12;
        Wed, 27 Apr 2022 06:15:30 -0700 (PDT)
X-Received: by 2002:a81:5210:0:b0:2ef:21e3:54dd with SMTP id
 g16-20020a815210000000b002ef21e354ddmr27148160ywb.438.1651065330695; Wed, 27
 Apr 2022 06:15:30 -0700 (PDT)
MIME-Version: 1.0
References: <20220420025450.289578-1-yoshihiro.shimoda.uh@renesas.com> <20220420025450.289578-8-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <20220420025450.289578-8-yoshihiro.shimoda.uh@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 27 Apr 2022 15:15:19 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXyyW+6tJyToX6Cz-HqaCAEcdd6Pgx_PWNxqYU0v+nyyg@mail.gmail.com>
Message-ID: <CAMuHMdXyyW+6tJyToX6Cz-HqaCAEcdd6Pgx_PWNxqYU0v+nyyg@mail.gmail.com>
Subject: Re: [PATCH v4 7/7] arm64: dts: renesas: r8a779f0: spider-cpu: Enable
 UFS device
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Alim Akhtar <alim.akhtar@samsung.com>, avri.altman@wdc.com,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        scsi <linux-scsi@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Apr 20, 2022 at 9:54 AM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> Enable UFS device for R-Car S4-8 Spider CPU board.
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
