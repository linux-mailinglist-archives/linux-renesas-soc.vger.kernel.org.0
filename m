Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AD89D50C2A3
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 23 Apr 2022 01:09:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232127AbiDVWPh (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 22 Apr 2022 18:15:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232118AbiDVWPZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 22 Apr 2022 18:15:25 -0400
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com [IPv6:2607:f8b0:4864:20::b33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D91F243340
        for <linux-renesas-soc@vger.kernel.org>; Fri, 22 Apr 2022 14:05:46 -0700 (PDT)
Received: by mail-yb1-xb33.google.com with SMTP id f17so16629471ybj.10
        for <linux-renesas-soc@vger.kernel.org>; Fri, 22 Apr 2022 14:05:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KnPyabG9pOxh8qzjo3GHxlP7qD0ZYp0TVCp6JnkWkhg=;
        b=rumSCGY3OftqFYEShtWIG/w2M+t8QkSzOAJXSGtX2CHX2irFE2VPMHSOpJkt8ZQaFH
         57B37rusFOHExaTz59ZP9VZYsEq/4ZPv5idTXn1FgT28jHv5wGG1sPRH6OwwX/Q8CrXM
         ZQBjkMD8ZEQ2iVz0noypoNsZwrFkLppphR/DuYVqp9NSWmQwyqv5Pce32Ra2PDksdZL4
         lRC+6HjK7uYuBCjpmMWFz8ePfWhP2we1K/PqzXyyw8GBBJPhKHNpp2d5/flDoPiG5xxb
         r+sgtPeu39Sx+m8uX6WJmM/9bK96sFfh6o91GBeAxVb/Icew5yvkCmjRQsbo5Qv8U61J
         2lvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KnPyabG9pOxh8qzjo3GHxlP7qD0ZYp0TVCp6JnkWkhg=;
        b=WKZar2BpiiWS3U/CEijEeNKNPjDn8m827P//u+W6A3tlpcwWf4M9oAEWlRtN/NWPw/
         /JHuny718rasI+jjGGJDBEGur+bBKqo0UFjFqIcd2a+wbEe5mK3zyx/RQN9McZ0WaOfY
         eV2jQ03Bm4Y+ZN5UusvdLZyzyZqE4Eu654zbMLTUGz2y4UzGna+N7qLJPivuUkGkN/21
         hh6ZEgrFmOHkY+KHHrkURdhMeDLSSZMy2WYdrdHZRTdaAVOwzcC0tvxLrXG0pQMHsKry
         6dgpwwbCsUZjYPdDZvcnHKUrPSzC6i2u/D2ZORpOz9DJe/K4FZTYIgVM9X5AxfDliMfZ
         4WMw==
X-Gm-Message-State: AOAM532qHijjGuq4L+Xs2TzN127q52fGd5DpIsszDDwqH4l1mLSspueu
        9Z59P1zZTBWNlYygJ7rV65dPwSlIzf/MLv+w24MTzRlA2gY=
X-Google-Smtp-Source: ABdhPJzPVTezAdZ+Jr0d3h8Qm6Ovc094t90vwEkbZlWbsLUFVVYMcdlha24zBLWFvznvY1/XZnOh2r90Wvl6S0MtNXY=
X-Received: by 2002:a25:4e82:0:b0:633:68d7:b864 with SMTP id
 c124-20020a254e82000000b0063368d7b864mr6702096ybb.514.1650661545453; Fri, 22
 Apr 2022 14:05:45 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1650638951.git.geert+renesas@glider.be>
In-Reply-To: <cover.1650638951.git.geert+renesas@glider.be>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 22 Apr 2022 23:05:34 +0200
Message-ID: <CACRpkdZK9Y19bWpRcH3QgDSQRnpfyvf1zA8YO0RD7SdWiUpdBw@mail.gmail.com>
Subject: Re: [GIT PULL] pinctrl: renesas: Updates for v5.19
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Apr 22, 2022 at 4:55 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> The following changes since commit 3123109284176b1532874591f7c81f3837bbdc17:
>
>   Linux 5.18-rc1 (2022-04-03 14:08:21 -0700)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/renesas-pinctrl-for-v5.19-tag1

Pulled in, thanks!

Yours,
Linus Walleij
