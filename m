Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7F3404FBCFB
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 Apr 2022 15:23:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346456AbiDKNZ6 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 11 Apr 2022 09:25:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346454AbiDKNZ5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 11 Apr 2022 09:25:57 -0400
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4C7E3B54D
        for <linux-renesas-soc@vger.kernel.org>; Mon, 11 Apr 2022 06:23:43 -0700 (PDT)
Received: by mail-qv1-f54.google.com with SMTP id kl29so13189872qvb.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 11 Apr 2022 06:23:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Tpl8Vzq4y3GMZxZdlTgtcxu3x6mCvZh3Ft+hBHyMsbk=;
        b=pJ+GM9vvGq6c5rAmX/qSSHZle0/hrNLR9nkobC1sRCcn/Eg5StrgME+TYan3rWAHYH
         RE51osJfifbwtCTU2GSfpRmV3AvZRsN4XcSZJk7EpayeHEC+8xwNv17IIA0Bq07rQxwS
         XAUoCybkcnjlft3jsFeKqt3bofvSBWrn+JNRLIKbLlxTRxeL1H0zGk3b/DtZkTqn/SoQ
         /XFpAf9qpxopfE3fQyyzKKq0Md/8w7tG7B15BfesA6Yo8DjiM/KI6twiiw/dIJAa7obX
         +v2y+DJHonMO7oWnSl5JIim7ilUQXe8fj/RTg1H1Fovh+eX6ZR5C/H70t9uw1B+O7Agt
         vHUA==
X-Gm-Message-State: AOAM532yggsZgQ3NmKVPjIaSASyB/J+Xn5+jSANhF49qBGcI1PbHC05h
        4+0yeuVgiLfQXV9jt/YO+u+fRxiF1Gzsyg==
X-Google-Smtp-Source: ABdhPJySH17Mi8kSNGP/sXPqHhpvD8FvZxAH280IQOlE4hUfTcTSfh2K/M26o4g/fuf+YSSgwZ8STA==
X-Received: by 2002:a0c:9045:0:b0:443:cec9:e349 with SMTP id o63-20020a0c9045000000b00443cec9e349mr26684078qvo.88.1649683422387;
        Mon, 11 Apr 2022 06:23:42 -0700 (PDT)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com. [209.85.128.171])
        by smtp.gmail.com with ESMTPSA id p13-20020a05622a048d00b002e1ce0c627csm26114789qtx.58.2022.04.11.06.23.42
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Apr 2022 06:23:42 -0700 (PDT)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-2ebdf6ebd29so94015377b3.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 11 Apr 2022 06:23:42 -0700 (PDT)
X-Received: by 2002:a81:c703:0:b0:2d0:cc6b:3092 with SMTP id
 m3-20020a81c703000000b002d0cc6b3092mr25487693ywi.449.1649683421805; Mon, 11
 Apr 2022 06:23:41 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1648548339.git.geert+renesas@glider.be> <cfc6af8a4c42febcc405b7356c38448eec8e29b0.1648548339.git.geert+renesas@glider.be>
 <Yk6N8L6UdZNRhvrD@ninjato>
In-Reply-To: <Yk6N8L6UdZNRhvrD@ninjato>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 11 Apr 2022 15:23:30 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVzt0D6CNCSaksmv80SHqBR14GXt-Jug6cZGWpObUYomQ@mail.gmail.com>
Message-ID: <CAMuHMdVzt0D6CNCSaksmv80SHqBR14GXt-Jug6cZGWpObUYomQ@mail.gmail.com>
Subject: Re: [PATCH 4/5] arm64: dts: renesas: salvator-common: Add RPC
 HyperFlash device node
To:     Wolfram Sang <wsa@kernel.org>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
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

On Thu, Apr 7, 2022 at 9:08 AM Wolfram Sang <wsa@kernel.org> wrote:
> On Tue, Mar 29, 2022 at 02:20:04PM +0200, Geert Uytterhoeven wrote:
> > Add the RPC HyperFlash device node along with its partitions to the
> > common Salvator-X(S) board DTS file.
> >
> > Based on a patch in the BSP by Valentine Barshak.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> No pinctrl settings for patch 4+5?

The QSPI pins are single-function on R-Car H3, M3-W, M3-W+, and M3-N.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
