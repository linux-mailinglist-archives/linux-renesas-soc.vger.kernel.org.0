Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6D1315F6563
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Oct 2022 13:50:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229610AbiJFLt7 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 6 Oct 2022 07:49:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229484AbiJFLt6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 6 Oct 2022 07:49:58 -0400
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1541112764
        for <linux-renesas-soc@vger.kernel.org>; Thu,  6 Oct 2022 04:49:57 -0700 (PDT)
Received: by mail-pf1-x433.google.com with SMTP id d10so1812118pfh.6
        for <linux-renesas-soc@vger.kernel.org>; Thu, 06 Oct 2022 04:49:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=OnZpre1fe4k7jZ/K9xnlhZVO9qKp7dPiAt23c+rWMmM=;
        b=paCFS2xZCUvLUB1huClE6sRhJuXH155SJp4YI21E5aR5POLpyBOXU1mEDWCVSDxBsB
         xfRtuKL/qcoweozoBe/3kh89cg7le/IXJPnl69WjT7sH4W0MxfWlxHzBsL7B7C4naY0m
         7KzWbYxqTZoQEQp+fJ4QZd/sf9WU03is2x/zT0JEyno5eUUpenC6Xfyaj2OjHk1WQQRE
         ss78yFs267zTkqIpCVjYPxVqI+sTB1lynZAWWLrF84eabBuGoL8H/TC9zW2/PA+5OwU7
         CUq0npWz5jnx99V03oIwyqHuLui7yuzEK5U54aAnkYbOkwj069uK+MJWypPB+kVIU1Qf
         sVkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=OnZpre1fe4k7jZ/K9xnlhZVO9qKp7dPiAt23c+rWMmM=;
        b=jFx7h041QufFCj3abzGecd2/mKdMabO4W3hwpcrrZ3dp+wDEe12+68lqgRWske7Bi7
         pp6hrstG316VWYpHlSh2QtPobR6bG7Q+rBvi/Rne28U/rn31pTq8H05JRkmFHVFz4o8j
         qkaPmVU4xHX34np1LkM0P/IQ1NlRKMbrMJJIkUiWgzbivBp/imnybj6UGLM1zeEXHCVo
         l58sAWFaAizY5ZNDt5OMixd117OWDYJRBgdiGoe8ypG5wo0Tq0/dx663xlUWsIkCQ3kt
         nkYGGbnLGw8f5BlCl9mGYol8NrkchpyZeZp6rVoZik/v4i1NuL32+prlldKFHvDI7gCi
         ceng==
X-Gm-Message-State: ACrzQf17EIn+C+6R3cmaokAkYjFeMdEGAXgca1ACR8cez2QxuEmllAgW
        UvWYOZQpYZ6YgLvA0pa9Whc2TdfspnMfpQcGk8CHpyxKgk0=
X-Google-Smtp-Source: AMsMyM7Pth7yTTas9qoN6G4DZOwAq2stRcCFIdgoSylzf+V/c/1AdNocJRSuLP8F1ZgnaTnkNmV+dB081JB75EpQyTc=
X-Received: by 2002:a63:e617:0:b0:435:144e:4482 with SMTP id
 g23-20020a63e617000000b00435144e4482mr4315878pgh.434.1665056996606; Thu, 06
 Oct 2022 04:49:56 -0700 (PDT)
MIME-Version: 1.0
References: <20220928110755.849275-1-biju.das.jz@bp.renesas.com> <Yzsb7SCkNDyCghLg@shikoro>
In-Reply-To: <Yzsb7SCkNDyCghLg@shikoro>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Thu, 6 Oct 2022 13:49:19 +0200
Message-ID: <CAPDyKFpkfr9Rtrz6DF1zYxEypTYqyJyRsTyxHToBJu+1AFB+Hg@mail.gmail.com>
Subject: Re: [PATCH v5] mmc: renesas_sdhi: Fix rounding errors
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Biju Das <biju.das@bp.renesas.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <chris.paterson2@renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, 3 Oct 2022 at 19:29, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> On Wed, Sep 28, 2022 at 12:07:55PM +0100, Biju Das wrote:
> > Due to clk rounding errors on RZ/G2L platforms, it selects a clock source
> > with a lower clock rate compared to a higher one.
> > For eg: The rounding error (533333333 Hz / 4 * 4 = 533333332 Hz < 5333333
> > 33 Hz) selects a clk source of 400 MHz instead of 533.333333 MHz.
> >
> > This patch fixes this issue by adding a margin of (1/1024) higher to
> > the clock rate.
> >
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
>
> Can only test on Gen3 currently, but clock settings are the same there.
>
> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
>
> Thanks!
>

Can someone tell me, if there is a corresponding fixes tag we could use here?

Or is this just a general bugfix that we should tag for stable?

Kind regards
Uffe
