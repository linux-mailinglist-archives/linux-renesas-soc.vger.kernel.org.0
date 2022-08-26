Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 703E35A2701
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 26 Aug 2022 13:44:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245530AbiHZLo1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 26 Aug 2022 07:44:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229752AbiHZLo0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 26 Aug 2022 07:44:26 -0400
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33E97D7CC8
        for <linux-renesas-soc@vger.kernel.org>; Fri, 26 Aug 2022 04:44:25 -0700 (PDT)
Received: by mail-qv1-f48.google.com with SMTP id j1so832831qvv.8
        for <linux-renesas-soc@vger.kernel.org>; Fri, 26 Aug 2022 04:44:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=uclvBB/KMCQWLNs+SliPKRmULykZPjst5ytIbriWG1c=;
        b=hGV5F3w3dVhixraLCrUg1zucgTMIoNhTTikmoMuN7JqjJ1GJGLlYB6IbKTrtzllzON
         mt8VVGTkLx2uZlqJaI4RopFaqMSo6FaWwwPauU/ptJjoZM0h/gm7Hulw1RzYBbSxA63j
         P+PkQ9S5MMXIyQGBZ/vBdGAoUli2wnj5Cv6jATB4rPJs+VIdmcJCPeEwVpGy9XPhFj9b
         K5I0si/zMuOTtgS4YQ/4WJ1K2B8QWNhceuSVZ+0WmX/AmQoTD0T1SRf2bzVB3PCPx1gp
         BF71F3tzzJPBBu+zdoHruRIr61P0q+JPwwrcyu11GWgLr331NSBAXmoC3F1kMVbKM38P
         ozGw==
X-Gm-Message-State: ACgBeo3n7liO9SSUOPZ6Yb7BQpVht74LkmqMZiYgSV8+ohtSj+nEK8T5
        fHwN7GtFWyHftGF27+6RXujqJNF5yqHyRw==
X-Google-Smtp-Source: AA6agR4k16xdNsrAuZsUjDRu2wvMlMJCb7tA9CKRZgklG6jysKVc04Kn1M6zDlj57W3sfz+NDPftmQ==
X-Received: by 2002:a05:6214:d02:b0:474:81cc:599e with SMTP id 2-20020a0562140d0200b0047481cc599emr7620112qvh.29.1661514264254;
        Fri, 26 Aug 2022 04:44:24 -0700 (PDT)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com. [209.85.128.171])
        by smtp.gmail.com with ESMTPSA id e2-20020ac80642000000b00342fc6a8e25sm1062239qth.50.2022.08.26.04.44.23
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Aug 2022 04:44:24 -0700 (PDT)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-333a4a5d495so28823717b3.10
        for <linux-renesas-soc@vger.kernel.org>; Fri, 26 Aug 2022 04:44:23 -0700 (PDT)
X-Received: by 2002:a81:f47:0:b0:31f:434b:5ee with SMTP id 68-20020a810f47000000b0031f434b05eemr8341644ywp.383.1661514263708;
 Fri, 26 Aug 2022 04:44:23 -0700 (PDT)
MIME-Version: 1.0
References: <87y1vf92do.wl-kuninori.morimoto.gx@renesas.com> <87wnaz92d1.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87wnaz92d1.wl-kuninori.morimoto.gx@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 26 Aug 2022 13:44:12 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWQstp738h8to9w+Z82=8+EqS8YsSMB2W-xCMG6QbpW+A@mail.gmail.com>
Message-ID: <CAMuHMdWQstp738h8to9w+Z82=8+EqS8YsSMB2W-xCMG6QbpW+A@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] arm64: dts: renesas: add condor-common.dtsi
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Andrey Dolnikov <andrey.dolnikov@cogentembedded.com>,
        Valentine Barshak <valentine.barshak@cogentembedded.com>,
        Koji Matsuoka <koji.matsuoka.xm@renesas.com>
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

Hi Morimoto-san,

On Tue, Aug 23, 2022 at 3:26 AM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>
> We have V3H Condor board, and will have V3H2 Condor-I board.
> This patch adds condor-common.dtsi to share the common settings
> between these boards.
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Thanks for your patch!

> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/condor-common.dtsi
> @@ -0,0 +1,542 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Device Tree Source for the Condor board with R-Car V3H
> + *
> + * Copyright (C) 2022 Renesas Electronics Corp.

Perhaps "2018-2022"?
Or just keep the original "2018", as nothing substantial has changed.

> + * Copyright (C) 2018 Cogent Embedded, Inc.
> + */

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
