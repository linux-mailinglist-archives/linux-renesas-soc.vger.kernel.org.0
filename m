Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D58CF74831A
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Jul 2023 13:44:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229772AbjGELoC convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 5 Jul 2023 07:44:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229775AbjGELoB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 5 Jul 2023 07:44:01 -0400
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8A22E3
        for <linux-renesas-soc@vger.kernel.org>; Wed,  5 Jul 2023 04:44:00 -0700 (PDT)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-579e212668fso9253627b3.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 05 Jul 2023 04:44:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688557439; x=1691149439;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3EJaBFspVw/Gmx4xCPGEJd+b95sH8ceYrLggUSXiVHE=;
        b=iQKs13TDUpb3/x4tPZ4fqnI9uOF59Gesr6BCQDgsd4dvVWmbx02tWFkyidVQ/NQY29
         aCpT0Yubwa3KO8+dxtCZPeg4zXacK5oVH5z7VKJZJdaZNW4f66WuEXwt8bJe1GCbNmGo
         zmYhmJr564gsLgYdYIbrCq4FN2JSbdn6CyFq4ctY7q4HUAZAqh8d8wcHv6li9YzUvE93
         myatCyb1+2h8X3xZwqWwf4MQSX1QhKSKGKtydBPrffqf4EqDxKA6q45gIHbyYnItfDjB
         bYL4xM7gy58O68r1zCqJHszDh8fAMQHzn67zBITljj1c6B0ov4nJq90t8mX3Ebax1hRJ
         gb9A==
X-Gm-Message-State: ABy/qLabE9yXp5yw84HN6mLX81BmIyrPKY9zUnhjhCzR9FKUT0oZFqrA
        zx4IIJIcqlsM0j81+e98KTngn1sXKGHmkQ==
X-Google-Smtp-Source: APBJJlFkygL9w/yifhS5D+8YjaLvMt2MqAm3XfwQNLpxsru/LmAhNAAQTqnejL0gJFSCaAXuGJSH/Q==
X-Received: by 2002:a0d:d855:0:b0:56c:f547:e058 with SMTP id a82-20020a0dd855000000b0056cf547e058mr1387352ywe.18.1688557438785;
        Wed, 05 Jul 2023 04:43:58 -0700 (PDT)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com. [209.85.219.169])
        by smtp.gmail.com with ESMTPSA id r206-20020a0de8d7000000b0057060bb2874sm6182776ywe.37.2023.07.05.04.43.58
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Jul 2023 04:43:58 -0700 (PDT)
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-bad0c4f6f50so924976276.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 05 Jul 2023 04:43:58 -0700 (PDT)
X-Received: by 2002:a25:b30d:0:b0:c47:3430:bcb0 with SMTP id
 l13-20020a25b30d000000b00c473430bcb0mr1458299ybj.26.1688557437971; Wed, 05
 Jul 2023 04:43:57 -0700 (PDT)
MIME-Version: 1.0
References: <20230703132343.353878-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20230703132343.353878-1-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 5 Jul 2023 13:43:47 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWj1PTx3Fp=Wn0h+0hHRFRaTKCre=VMvCFCq=BE+HBE5Q@mail.gmail.com>
Message-ID: <CAMuHMdWj1PTx3Fp=Wn0h+0hHRFRaTKCre=VMvCFCq=BE+HBE5Q@mail.gmail.com>
Subject: Re: [PATCH] mfd: Add module build support for RZ/G2L MTU3a
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Lee Jones <lee@kernel.org>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Jul 3, 2023 at 3:23 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Modified Kconfig to enable module build support for RZ/G2L MTU3a driver.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

As drivers/mfd/rz-mtu3.c already has the needed MODULE_*() lines:

drivers/mfd/rz-mtu3.c:MODULE_DEVICE_TABLE(of, rz_mtu3_of_match);
drivers/mfd/rz-mtu3.c:MODULE_AUTHOR("Biju Das <biju.das.jz@bp.renesas.com>");
drivers/mfd/rz-mtu3.c:MODULE_DESCRIPTION("Renesas RZ/G2L MTU3a Core Driver");
drivers/mfd/rz-mtu3.c:MODULE_LICENSE("GPL");

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
