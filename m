Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 377C35F3D0F
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  4 Oct 2022 09:12:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229631AbiJDHMu (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 4 Oct 2022 03:12:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229501AbiJDHMt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 4 Oct 2022 03:12:49 -0400
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F077020F6C
        for <linux-renesas-soc@vger.kernel.org>; Tue,  4 Oct 2022 00:12:46 -0700 (PDT)
Received: by mail-qt1-f169.google.com with SMTP id r20so7670967qtn.12
        for <linux-renesas-soc@vger.kernel.org>; Tue, 04 Oct 2022 00:12:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=slBNUZrVSjtb3RN56au5p9VnQ4iSCUSp3M8LS/FoGt0=;
        b=e8614zDLmGf03JmInJ43nx0tfFBETyyXZDUZzjKKRB7Ud1L3g2cLH2d5by4LDGgcxm
         4GPIcKsn5VaSeLGDQzdGZYNTZ7iHPlwxGN4lwstWZZFk3rbfQFO5VZWJOLqV452uuDY+
         apf2akkOS6/O5Hk2xkm130EFibo9VZXqNi/UVXs17djQ9zzX+0AXEuMUDo81TP1ym+Ct
         cftz6/YQvSf9kENFwaxdNrIqJLt/KrWHVLIOIg8Gtgtuq+19U2SwpxWb+m4FE4ea6BtT
         d8A1t4/7AoKyK+sfuOQMKGaj/1jt4QyPiufvXWmWGb+yYdPlHmQvA07E3rVw5BHTWKPl
         qhKg==
X-Gm-Message-State: ACrzQf3WJiIUPgMbb32HulAMHWnG1/JGdCFduvGIzJKICbJscFOIrBZD
        lWLNRL/lIiYL2hfXwDPRmQq5uy6Ez/PbSg==
X-Google-Smtp-Source: AMsMyM5/z5+Ub/8bvJWD+i5E50FR1432wHPqQza5vSHz8tGqaWX8lhWtJOuTt/jdyVc0Jj5DkZb4Fg==
X-Received: by 2002:a05:622a:54e:b0:35d:d33:dff3 with SMTP id m14-20020a05622a054e00b0035d0d33dff3mr18566503qtx.115.1664867565993;
        Tue, 04 Oct 2022 00:12:45 -0700 (PDT)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com. [209.85.219.178])
        by smtp.gmail.com with ESMTPSA id ea20-20020a05620a489400b006ce76811a07sm12718323qkb.75.2022.10.04.00.12.45
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Oct 2022 00:12:45 -0700 (PDT)
Received: by mail-yb1-f178.google.com with SMTP id e20so1272081ybh.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 04 Oct 2022 00:12:45 -0700 (PDT)
X-Received: by 2002:a5b:506:0:b0:6af:ffac:4459 with SMTP id
 o6-20020a5b0506000000b006afffac4459mr21837341ybp.365.1664867565359; Tue, 04
 Oct 2022 00:12:45 -0700 (PDT)
MIME-Version: 1.0
References: <87h70lhd1c.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87h70lhd1c.wl-kuninori.morimoto.gx@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 4 Oct 2022 09:12:33 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW2EM0kVGRjmCBj7gZiF9U7Mxrh2Ed3OiJayQCt2fCETQ@mail.gmail.com>
Message-ID: <CAMuHMdW2EM0kVGRjmCBj7gZiF9U7Mxrh2Ed3OiJayQCt2fCETQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: condor-common: add missing bootargs
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Oct 3, 2022 at 4:11 AM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>
> This patch adds missing bootargs for V3H Condor board.
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.2.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
