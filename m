Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D74DA4FDC6A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Apr 2022 13:05:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1380276AbiDLK0T (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 12 Apr 2022 06:26:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1379745AbiDLKTq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 12 Apr 2022 06:19:46 -0400
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD391BFA;
        Tue, 12 Apr 2022 02:23:12 -0700 (PDT)
Received: by mail-qv1-f53.google.com with SMTP id kl29so15674000qvb.2;
        Tue, 12 Apr 2022 02:23:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/xFq3TalGXTAEX7MoZBabt4i2+T5YfvEcGLfK8vF3nI=;
        b=TBKZUNXrqv9JAiDVcwDPX/PUJzYhW4I2YVWxfgblEjAGYCcTlEZOD92WbkYRPf768b
         f1jWRjgyyn63rhibW8bhK+SJQNEF0m1Rqedx15f/+x2p6m209NPd5TA5X+U19ujiRVg9
         Hm/9D6uPqmOI3MLnFW7QBB5RUR/gxcTAx81uIGYEL2IlwDEMf7qEFURVZGucTeaJVH4g
         1eJJH9tZXjGYVyVn+YdeYUhgmmRT3CQ8o9g3LQNuh73tdSgFVHdkcBX3fuRdsVLwrKXE
         +IlRhSeBKz4fAa6UQ0g/NcfYbfrfkfXDeGtNXbpsDo2M4/A0NRyhArRVvF92VqIdDilv
         oFWA==
X-Gm-Message-State: AOAM5333nW6DKspj8CGcDmzIIMeshgtXQD3xJSQBP13NloXWaOk3xJ8U
        nry+SMshXXlaDFo0lUo/QgqXTGbTGoXWpPNg
X-Google-Smtp-Source: ABdhPJxEGpTzWd13Pq3jMcVmWjsbTuPBpqfJ+vCQkkou7dvKfe3WZY5TOX58uuCbLaUG3k6cqGXHag==
X-Received: by 2002:a0c:8d07:0:b0:443:a6be:7774 with SMTP id r7-20020a0c8d07000000b00443a6be7774mr30129715qvb.51.1649755391450;
        Tue, 12 Apr 2022 02:23:11 -0700 (PDT)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com. [209.85.128.175])
        by smtp.gmail.com with ESMTPSA id d6-20020ac85d86000000b002f0eddf163fsm355080qtx.47.2022.04.12.02.23.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Apr 2022 02:23:11 -0700 (PDT)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-2edbd522c21so33642507b3.13;
        Tue, 12 Apr 2022 02:23:11 -0700 (PDT)
X-Received: by 2002:a81:5210:0:b0:2ef:21e3:54dd with SMTP id
 g16-20020a815210000000b002ef21e354ddmr2919382ywb.438.1649755390817; Tue, 12
 Apr 2022 02:23:10 -0700 (PDT)
MIME-Version: 1.0
References: <20220401145702.17954-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20220401145702.17954-1-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 12 Apr 2022 11:22:59 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW9cfiy-1koCUTuK40WXrikKtyEyh3qBJcAeDtP98sRRw@mail.gmail.com>
Message-ID: <CAMuHMdW9cfiy-1koCUTuK40WXrikKtyEyh3qBJcAeDtP98sRRw@mail.gmail.com>
Subject: Re: [PATCH v3] arm64: dts: renesas: rzg2lc-smarc: Enable RSPI1 on
 carrier board
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
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

On Fri, Apr 1, 2022 at 4:57 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> RSPI1 (SPI1) interface is available on PMOD0 connector (J1) on the
> carrier board.  This patch adds pinmux and spi1 nodes to the carrier
> board dtsi file and drops deleting pinctl* properties from DTS file.
>
> RSPI1 interface is tested by setting the macro SW_RSPI_CAN to 0.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v2->v3:
>  * Removed redundant spi1 node, as it is already enabled in common.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.19.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
