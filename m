Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DF6267AA2D8
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 Sep 2023 23:35:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231481AbjIUVfr convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 21 Sep 2023 17:35:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232224AbjIUVfg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 21 Sep 2023 17:35:36 -0400
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E044FC9BCB
        for <linux-renesas-soc@vger.kernel.org>; Thu, 21 Sep 2023 11:19:20 -0700 (PDT)
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-417e013061eso7846561cf.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 21 Sep 2023 11:19:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695320323; x=1695925123;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PMvhYNwFGARBa/MF4HER8mJJeim1I3oHk5U3f+QpCSI=;
        b=Wo5t6bTOwgrH4QCwUYnfAEwQc7G+23iluuHdYSBSti1SfoNmp55L9/+4nIwZ09YNuG
         VvBpLIpjdRA0oxixkeeUG7P/CRsbg8UOGFx23UufQyB3RGnMfyJOmmuucM02YRWFNu+q
         hc0Z0eoXuIM2qhl9wo6MQPnvuig9CElYchWkkJVy66OVodjIKGTctdgaA106JqXJ+RcW
         cdLODWqY7kmLvf6IcZwbjB9WgsMSAhuOrAuU8zq5+QXSPZLNWS8HFxxZ88UgJNYw42jZ
         xdaNraT6JtUwuyTtmiqnpzAYcLlnIjlXd+p7IJQhD2tt1pAgFfpUcjuV+MWLhjv7iRuJ
         p9RQ==
X-Gm-Message-State: AOJu0YwGCOZ1Xj8SnjJKAwD4kH/NkELo5qPgAoaAeZFRADox0BcmEj8I
        FigQJd6O+tplqCDH+FrWnBj8vH0j0Srb1EDz
X-Google-Smtp-Source: AGHT+IGWd5u0CJLvIXSnh5yTl1jTXJ7ERh5f6P++TzlbA3UnzbX9KTHgXJYUlu4BcXdHxj6CAIzZAA==
X-Received: by 2002:a81:9106:0:b0:59e:7f14:4b48 with SMTP id i6-20020a819106000000b0059e7f144b48mr4336217ywg.41.1695281844501;
        Thu, 21 Sep 2023 00:37:24 -0700 (PDT)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com. [209.85.128.173])
        by smtp.gmail.com with ESMTPSA id g143-20020a815295000000b005897fd75c80sm197666ywb.78.2023.09.21.00.37.23
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Sep 2023 00:37:23 -0700 (PDT)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-59ec6d7bb89so7970697b3.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 21 Sep 2023 00:37:23 -0700 (PDT)
X-Received: by 2002:a0d:ca86:0:b0:589:e66e:abe4 with SMTP id
 m128-20020a0dca86000000b00589e66eabe4mr4575374ywd.11.1695281843515; Thu, 21
 Sep 2023 00:37:23 -0700 (PDT)
MIME-Version: 1.0
References: <87fs382yhk.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87fs382yhk.wl-kuninori.morimoto.gx@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 21 Sep 2023 09:37:10 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX6Jisc+KgCpzARPvsLZTeGLM-4cMxmDFErm31RWoonCA@mail.gmail.com>
Message-ID: <CAMuHMdX6Jisc+KgCpzARPvsLZTeGLM-4cMxmDFErm31RWoonCA@mail.gmail.com>
Subject: Re: [PATCH v3] arm64: dts: renesas: use multi Component for ULCB/KF
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Sep 21, 2023 at 1:53 AM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
>
>         +-- ULCB -------------------+
>         |+--------+       +--------+|
>         ||    SSI0| <---> |ak4613  ||
>         ||    SSI1| <---> |        ||
>         ||        |       +--------+|
>         ||        |       +--------+|
>         ||    SSI2| <---> |HDMI    ||
>         ||        |       +--------+|
>         ||    SSI3| <--+            |
>         ||    SSI4| <-+|            |
>         |+--------+   ||            |
>         +-------------||------------+
>         +-- Kingfisher -------------+
>         |             ||  +--------+|
>         |             |+->|pcm3168a||
>         |             +-->|        ||
>         |                 +--------+|
>         +---------------------------+
>
> On UCLB/KF, we intuitively think we want to handle these
> as "2 Sound Cards".
>
>         card0,0: 1st sound of ULCB (SSI0 - ak4613)
>         card0,1: 2nd sound of ULCB (SSI2 - HDMI)
>         card1,0: 1st sound of KF   (SSI3 - pcm3168a)
>             ^ ^
>
> But, we needed to handle it as "1 big Sound Card",
> because of ASoC Component vs Card framework limitation.
>
>         card0,0: 1st sound of ULCB/KF (SSI0 - ak4613)
>         card0,1: 2nd sound of ULCB/KF (SSI2 - HDMI)
>         card0,2: 3rd sound of ULCB/KF (SSI3 - pcm3168a)
>             ^ ^
>
> Now ASoC support multi Component which allow us to handle "2 Sound Cards"
> such as "ULCB Sound Card" and "Kingfisher Sound Card".
>
> This patch updates all ULCB/KF Audio dtsi.
> One note is that Sound Card specification method from userland will be
> changed, especially for Kingfisher Sound.
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
> v2 -> v3
>         - fix type on git-log "framwork" -> framework"
>         - fix comment-out style
>         - "rcar_sound,dai" -> "rcar_sound,dai@0" on ulcb

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.7.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
