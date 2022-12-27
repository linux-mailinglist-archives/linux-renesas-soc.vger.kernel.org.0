Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7FCE66568BA
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Dec 2022 10:09:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229445AbiL0JJS (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 27 Dec 2022 04:09:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229496AbiL0JJQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 27 Dec 2022 04:09:16 -0500
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66AF1658B
        for <linux-renesas-soc@vger.kernel.org>; Tue, 27 Dec 2022 01:09:15 -0800 (PST)
Received: by mail-qt1-f179.google.com with SMTP id z12so10028617qtv.5
        for <linux-renesas-soc@vger.kernel.org>; Tue, 27 Dec 2022 01:09:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/FYGfnRiHNsfEf2GWEdJfJFr4taavkQ04WPkzJJ6TH4=;
        b=jhWcN5QOSVTWgbZeIGh7stHtm1cl5/ZWBhXFUxuSEANqDNQn9aoUZjSOr6Ss0UhY2m
         sVsFqMMr4Jqdwp1fVKECA9QZtuQPPCHGbGPrr5munY8952gEGCwotljdp+AizxuqdNtC
         01w4T0DOIclSUSIGkf1yH0lSnsebzvXuAyX5uATP09kNUA+3VZfMcRJqG2FNKe2x21UJ
         scYDe+VJ1IsCH8+d4ezY5cmDKaH3sYA1N2IiSrSs3A/7Isjrpc/4Mj8jkEJIrvFXJ1EL
         TAoqYNM+CqIIcVYboIYZNW+x7P+VeHy5WSJrsbqdUBDf7LQtp0b0BcpNNLjUjnXyFSAB
         mXxA==
X-Gm-Message-State: AFqh2kpICYq1gDX27+qlAhfV2hFs/jcBsuty89p69hfzfmO5CsRVUnt6
        kXCqy812GZwL+ghdKph63DQKMrArLUpUFA==
X-Google-Smtp-Source: AMrXdXuzXkaETy7wf5iKorgv1ct8aKs1VG8rdq+/SmQy/hPG5vwWD7n71ptIFxNCS7mSYczSJ1ocZg==
X-Received: by 2002:a05:622a:4a8b:b0:3a8:1617:bdac with SMTP id fw11-20020a05622a4a8b00b003a81617bdacmr30057440qtb.5.1672132154403;
        Tue, 27 Dec 2022 01:09:14 -0800 (PST)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com. [209.85.219.174])
        by smtp.gmail.com with ESMTPSA id g8-20020ac81248000000b003a69de747c9sm8009880qtj.19.2022.12.27.01.09.14
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Dec 2022 01:09:14 -0800 (PST)
Received: by mail-yb1-f174.google.com with SMTP id n78so13756806yba.12
        for <linux-renesas-soc@vger.kernel.org>; Tue, 27 Dec 2022 01:09:14 -0800 (PST)
X-Received: by 2002:a25:ab49:0:b0:6de:6183:c5c3 with SMTP id
 u67-20020a25ab49000000b006de6183c5c3mr2387410ybi.89.1672132153853; Tue, 27
 Dec 2022 01:09:13 -0800 (PST)
MIME-Version: 1.0
References: <63a9bc8c.a70a0220.7cd88.c530@mx.google.com> <CAMuHMdX9NorMheSh30gSBw2iaMneffWqOifs1wNmbv+vO2ca=w@mail.gmail.com>
In-Reply-To: <CAMuHMdX9NorMheSh30gSBw2iaMneffWqOifs1wNmbv+vO2ca=w@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 27 Dec 2022 10:09:01 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWQUTsv0=wZTg=SNGR3WLs9i+SfWR6tWgrBrHL1jxeYVw@mail.gmail.com>
Message-ID: <CAMuHMdWQUTsv0=wZTg=SNGR3WLs9i+SfWR6tWgrBrHL1jxeYVw@mail.gmail.com>
Subject: Re: renesas/master baseline-nfs: 136 runs, 6 regressions (renesas-devel-2022-12-26-v6.2-rc1)
To:     "kernelci.org bot" <bot@kernelci.org>
Cc:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Dec 27, 2022 at 10:08 AM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> On Mon, Dec 26, 2022 at 4:41 PM kernelci.org bot <bot@kernelci.org> wrote:
> > renesas/master baseline-nfs: 136 runs, 6 regressions (renesas-devel-2022-12-26-v6.2-rc1)
> >
> > Regressions Summary
> > -------------------
> >
> > platform                     | arch  | lab          | compiler | defconfig                    | regressions
> > -----------------------------+-------+--------------+----------+------------------------------+------------
> > meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre | gcc-10   | defconfig+CON...OMIZE_BASE=y | 1
> > meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre | gcc-10   | defconfig                    | 1
> > meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre | gcc-10   | defconfig+ima                | 1
> > meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre | gcc-10   | defconfig+videodec           | 1
> > sun50i-a64-pine64-plus       | arm64 | lab-broonie  | gcc-10   | defconfig+debug              | 1
> > sun50i-h5-lib...ch-all-h3-cc | arm64 | lab-broonie  | gcc-10   | defconfig+debug              | 1
> >
> >   Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/renesas-devel-2022-12-26-v6.2-rc1/plan/baseline-nfs/
>
> More regressions in v6.2-rc1 not introduced in renesas/next.

s/next/master/

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
