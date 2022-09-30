Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C82945F0673
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 Sep 2022 10:31:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230201AbiI3IbP (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 30 Sep 2022 04:31:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230344AbiI3IbN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 30 Sep 2022 04:31:13 -0400
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44E38D07A7
        for <linux-renesas-soc@vger.kernel.org>; Fri, 30 Sep 2022 01:31:12 -0700 (PDT)
Received: by mail-qv1-f54.google.com with SMTP id h10so685044qvq.7
        for <linux-renesas-soc@vger.kernel.org>; Fri, 30 Sep 2022 01:31:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=Ylx6JtWgdPAOmbglf4f6PUyY644oEC6YZcKeeRG3lw8=;
        b=q2QWlALCXgdzx4Izaiy/2EdJNPMAAt+nNP+42WDnRYXHKI8Ki1r/XJFl2+ojkLtNTi
         UIMS9T6lqfAu6eNseoJXq8kWJzGHyNBthw1m8NwuiqSnRm/1aS4SOrxBR/LIsYGPKqEx
         7xXtfJBaj6Ws+4CuBj85nsk3+Io4PGD/rJEy87CINHQf4BuTBzMsXtB/+J0xw1pCHZsA
         0ozdRHC/5OeTx5jYJ8hekubopeIIQQnootKHWmmnBwG46cH4jAqmVTt2S/mOH19erUFa
         g8DlQhXjpXGhIV6AVkj1c2PrJM2u3Ddq8K2AsqBCETlFznpAFExkBadFH+FI6J0aqRWj
         ewEw==
X-Gm-Message-State: ACrzQf1/eVlNbAjMq5DqrT/VpDX1G1woLS/e5HIQfUKKiDpNRDlCt8M8
        cFWX4q7qB8VOQT1MAJay/6UWYTnxVHuupA==
X-Google-Smtp-Source: AMsMyM4tmEItO/+PVh9RwHHPOCwdP8ZBAtalD+KdWhxhtvXbow7YWPIMf7EARbq0LHvOtx1OyhbiSg==
X-Received: by 2002:ad4:5bee:0:b0:4ad:a76d:c48e with SMTP id k14-20020ad45bee000000b004ada76dc48emr5817247qvc.127.1664526671193;
        Fri, 30 Sep 2022 01:31:11 -0700 (PDT)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com. [209.85.128.180])
        by smtp.gmail.com with ESMTPSA id s15-20020ae9f70f000000b006cf43968db6sm1729206qkg.76.2022.09.30.01.31.10
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Sep 2022 01:31:10 -0700 (PDT)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-351cee25568so37907297b3.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 30 Sep 2022 01:31:10 -0700 (PDT)
X-Received: by 2002:a81:78f:0:b0:34d:74c0:1110 with SMTP id
 137-20020a81078f000000b0034d74c01110mr7559598ywh.383.1664526670564; Fri, 30
 Sep 2022 01:31:10 -0700 (PDT)
MIME-Version: 1.0
References: <87edvt383k.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87edvt383k.wl-kuninori.morimoto.gx@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 30 Sep 2022 10:30:59 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXRj3yisDMNfb5YwB-LD56SOgL1Bi=HtQGPLDky4vwCLg@mail.gmail.com>
Message-ID: <CAMuHMdXRj3yisDMNfb5YwB-LD56SOgL1Bi=HtQGPLDky4vwCLg@mail.gmail.com>
Subject: Re: Condor doesn't work on Linus/master
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
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

Hi Morimoto-san,

On Fri, Sep 30, 2022 at 4:32 AM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> I noticed that Condor doesn't work on linus/master branch.
> It have worked at least v5.19 kernel.

Works fine for me on the Condor in Magnus' farm:

    / # uname -r
    6.0.0-rc7-rcar3-initrd-00132-g987a926c1d8a
    / # for i in machine family soc_id revision; do echo -n "$i: ";
cat /sys/devices/soc0/$i; done
    machine: Renesas Condor board based on r8a77980
    family: R-Car Gen3
    soc_id: r8a77980
    revision: ES1.1

What's happening for you?

> I tried git-bisect, but couldn't find the issue.
> Because it will keep getting compilation errors along the way.
>
> For example below commit can't compile,
> and I'm not sure which patch can solve the issue.
>
>         99f6b77f74c88ac1bc4c81e089dd0cbbf882aea6

That commit is building fine for me, both using a custom config and
a config derived from renesas-defconfig.
Which compile error are you seeing?
What is your config?

I'll send you my .config by private email.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
