Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 98A2D571416
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Jul 2022 10:12:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232060AbiGLIM3 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 12 Jul 2022 04:12:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232559AbiGLIMZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 12 Jul 2022 04:12:25 -0400
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93A9B9FE01
        for <linux-renesas-soc@vger.kernel.org>; Tue, 12 Jul 2022 01:12:24 -0700 (PDT)
Received: by mail-qv1-f42.google.com with SMTP id v5so2068848qvq.8
        for <linux-renesas-soc@vger.kernel.org>; Tue, 12 Jul 2022 01:12:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aAzVavcJMJzJMzgPnyUdgpckG8GbKFj9iFOgsaqK9fM=;
        b=o/xY5YseqE9kXfqGiNO/UvbUxwjkOi8NXJGqYD7cqcx9eCEgzW+9H70zJPP2PeIad4
         wpDtl5CjAfyJ76GcvS1pUP6KUA6jgCnTJU74ShRkbAZdAeDGNleqI9e6Fnq/WA11Zl5h
         VlNXdx1lPfXOalz1SVUNyoMEDBVFT4GO2xHF25Y83Y+RDJ4msM33tN7BG1OMcs0ycn/M
         fiOYBZ/TM4axdOecoueDjUgi0X3/9a4+ycEkQ+nXk3ldqwJ7eqoU2vR0B62cwblsgCcd
         8ZF49LsNZ7XX2sqFejFUy+j0Hwt/xUl13UkGx4YaFzPoM/nikaLlKwpbed6cFPBWp2XD
         /bog==
X-Gm-Message-State: AJIora/5mQ47/kswCuuklj8j8HFRhIoe9wTFyLUm+keobaqp4Iy6RTNk
        b2AwuhHmTMr5rBLkdS2vZWlyfk4i8Y+Ktw==
X-Google-Smtp-Source: AGRyM1uy4GGyWBBZVZLA66uI/fsWCRP1jy5vTryS6yCJqHlb9SfpALFp6kpq5mJDwpCdkN8is9UykQ==
X-Received: by 2002:a0c:db0e:0:b0:473:5450:b8a4 with SMTP id d14-20020a0cdb0e000000b004735450b8a4mr11652921qvk.125.1657613543476;
        Tue, 12 Jul 2022 01:12:23 -0700 (PDT)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com. [209.85.219.176])
        by smtp.gmail.com with ESMTPSA id r22-20020ac85e96000000b00317c3ce1f4esm6898022qtx.45.2022.07.12.01.12.22
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Jul 2022 01:12:22 -0700 (PDT)
Received: by mail-yb1-f176.google.com with SMTP id y195so12751040yby.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 12 Jul 2022 01:12:22 -0700 (PDT)
X-Received: by 2002:a05:6902:154f:b0:66e:e2d3:ce1 with SMTP id
 r15-20020a056902154f00b0066ee2d30ce1mr16359508ybu.365.1657613542206; Tue, 12
 Jul 2022 01:12:22 -0700 (PDT)
MIME-Version: 1.0
References: <20220711134656.277730-1-wsa+renesas@sang-engineering.com> <20220711134656.277730-4-wsa+renesas@sang-engineering.com>
In-Reply-To: <20220711134656.277730-4-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 12 Jul 2022 10:12:10 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWbZqYbNaOJYmpWF+ATB5DALdsWAXFQf+k6-knDP6ktkw@mail.gmail.com>
Message-ID: <CAMuHMdWbZqYbNaOJYmpWF+ATB5DALdsWAXFQf+k6-knDP6ktkw@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: dts: renesas: spider-cpu: enable eMMC0
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Wolfram Sang <wsa@kernel.org>
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

Hi Wolfram,

On Mon, Jul 11, 2022 at 3:56 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> From: Wolfram Sang <wsa@kernel.org>
>
> This enables the on-board eMMC on the Spider board. Switch SW3 has to be
> in the default (neutral) position. Other settings will not be supported
> upstream!
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thanks for your patch!

I guess you don't need "fixed-emmc-driver-type = <1>;"?

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.21, with the authorship fixed.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
