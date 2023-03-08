Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4F2136B03C5
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Mar 2023 11:11:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229760AbjCHKLT convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 8 Mar 2023 05:11:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229715AbjCHKLS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 8 Mar 2023 05:11:18 -0500
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C17957B111
        for <linux-renesas-soc@vger.kernel.org>; Wed,  8 Mar 2023 02:11:17 -0800 (PST)
Received: by mail-qt1-f181.google.com with SMTP id c3so17509336qtc.8
        for <linux-renesas-soc@vger.kernel.org>; Wed, 08 Mar 2023 02:11:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678270277;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4rSlwotQANx2jc8Jq+Fxnr6pXS9SYtLFSW9QChQJMK0=;
        b=wRJDKP4mwgMIzkhgZrwL75RwIQ7gh7VA12sfMaNiySJf4+tFKpO0Egz1BIBc7aW1vr
         +/AkqBaeZNArTDtJ0C83HdJW16EjddtF3tluR3zpdl7tqSGMcIIsBqGBgNBSPJW8ARdJ
         RufT+LggSqFkUsAVhNamnDkcNduxJ22iOh9VgAwvLspSz2kQCIb+UsComvgI6MQCHks8
         U4BW9lowqAMbtTBgCHRG5shTAiSqRwm+TF3P4EyqSG3/sE0ke1/RDOa0MWGydBjka+l5
         treVWBpSYVlv8pqBMWHaGIk+/O961lzcL17bEMk9gpJMM+lO06jyVzjDhzDE1PlkpgS2
         OlOQ==
X-Gm-Message-State: AO0yUKUUk+mimSt/QEFQnejp2b77/aUmgeiCVegBenor+J4BwwgJyzkx
        P7tlicclAyaQkQZhDTuJT+/PMtBYJsgb3PuS
X-Google-Smtp-Source: AK7set8MZyv3txIq/ENYk4BkBUDGhV5bNr1iH3W7hUHTiQidjYQLJtvbVpBEwPm1FSFTA+EE3D+I+g==
X-Received: by 2002:ac8:7f42:0:b0:3bd:16cf:2f37 with SMTP id g2-20020ac87f42000000b003bd16cf2f37mr1716790qtk.60.1678270276719;
        Wed, 08 Mar 2023 02:11:16 -0800 (PST)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com. [209.85.219.169])
        by smtp.gmail.com with ESMTPSA id m67-20020a375846000000b00741e27ecb37sm11132418qkb.74.2023.03.08.02.11.16
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Mar 2023 02:11:16 -0800 (PST)
Received: by mail-yb1-f169.google.com with SMTP id y144so14035657yby.12
        for <linux-renesas-soc@vger.kernel.org>; Wed, 08 Mar 2023 02:11:16 -0800 (PST)
X-Received: by 2002:a5b:ccf:0:b0:a6f:9156:5579 with SMTP id
 e15-20020a5b0ccf000000b00a6f91565579mr8689266ybr.12.1678270275847; Wed, 08
 Mar 2023 02:11:15 -0800 (PST)
MIME-Version: 1.0
References: <cover.1669036423.git.geert+renesas@glider.be>
In-Reply-To: <cover.1669036423.git.geert+renesas@glider.be>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 8 Mar 2023 11:11:04 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX+rq8CNqo1dtbcUe6bBtZ0JV-5ZmuzTrYrhFXuQCyRKA@mail.gmail.com>
Message-ID: <CAMuHMdX+rq8CNqo1dtbcUe6bBtZ0JV-5ZmuzTrYrhFXuQCyRKA@mail.gmail.com>
Subject: Re: [PATCH/RFC 0/4] pinctrl: renesas: r8a779g0: Miscellaneous fixes
To:     linux-renesas-soc@vger.kernel.org
Cc:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
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

On Mon, Nov 21, 2022 at 2:18 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
> This patch series contains miscellaneous fixes for the R-Car V4H pin
> control driver.  Any functional changes are based on R-Car V4H Series
> User’s Manual: Hardware Rev. 0.54.
>
> The last 3 patches are marked RFC, as the affected functionality could
> not be tested yet.
>
> Thanks for your comments!
>
> Geert Uytterhoeven (4):
>   pinctrl: renesas: r8a779g0: Fix alignment in GPSR[678]_* macros
>   pinctrl: renesas: r8a779g0: Fix Group 4/5 pin functions
>   pinctrl: renesas: r8a779g0: Fix Group 6/7 pin functions
>   pinctrl: renesas: r8a779g0: Fix ERROROUTC function names

As I have verified this against datasheet Rev. 0.70, I plan to queue
patches 2-4 in renesas-pinctrl-for-v6.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
