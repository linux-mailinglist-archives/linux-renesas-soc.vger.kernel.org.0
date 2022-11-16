Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 06D9862B534
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Nov 2022 09:28:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238834AbiKPI2m (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 16 Nov 2022 03:28:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238841AbiKPI2B (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 16 Nov 2022 03:28:01 -0500
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7831A6172
        for <linux-renesas-soc@vger.kernel.org>; Wed, 16 Nov 2022 00:25:49 -0800 (PST)
Received: by mail-qk1-f176.google.com with SMTP id k2so11158608qkk.7
        for <linux-renesas-soc@vger.kernel.org>; Wed, 16 Nov 2022 00:25:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FC/8BugfsOPmsz5dWnsOjVFCG99JOsl/6slNWb+96lE=;
        b=X5bw/B2z3xthAjFrdQk3qJ0nxe4PWQMi0QdVkNWuZ/rjMylDoHZ9WP64yE+H/XVyEM
         tLUr43v4KJMVIDxWRmMUT33/PMbBC4UtFa9YOAXP1+65ibAe5Qsr0ANx4FNPN0SDvaSn
         w7ZfnbHzDD3D6i9b7pj4W6T3piahQ0/qaILcU7efA9NnPyK8IM72wRqGK39WicMR5rMe
         6NC5zhEQaHPaeMbFpaujYFg0qyQfpSzVetKBrw0ekl3Pe33jD81TNkWoXbFKk4z0yCG6
         L9Yj1u/DjsBrPQ3Lli3/HebkmiZAm2i097qQjqdSebmbvNAYdZNcJTWGMNs7L139Lnet
         lhRA==
X-Gm-Message-State: ANoB5pkazbbRXSBqSuk/B5aYLxrsINTbBNMEFx/8Pqk2/r+YnNa7gBj3
        K130N6LGxVHh+PGefVdKe2urmt4MqW00ZQ==
X-Google-Smtp-Source: AA0mqf4HzlB8gL+/Xe21jk7nhg1d+D9b5L0HH7lKVO7zgHGF1frtuExuw3VJKIxzDrQ8jlWv+LZtGA==
X-Received: by 2002:a37:95c2:0:b0:6fa:2aec:52b0 with SMTP id x185-20020a3795c2000000b006fa2aec52b0mr18288638qkd.740.1668587148494;
        Wed, 16 Nov 2022 00:25:48 -0800 (PST)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com. [209.85.128.174])
        by smtp.gmail.com with ESMTPSA id fp1-20020a05622a508100b0039ee562799csm8377752qtb.59.2022.11.16.00.25.48
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Nov 2022 00:25:48 -0800 (PST)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-381662c78a9so79955117b3.7
        for <linux-renesas-soc@vger.kernel.org>; Wed, 16 Nov 2022 00:25:48 -0800 (PST)
X-Received: by 2002:a81:4ed2:0:b0:370:202b:f085 with SMTP id
 c201-20020a814ed2000000b00370202bf085mr20900992ywb.502.1668587147868; Wed, 16
 Nov 2022 00:25:47 -0800 (PST)
MIME-Version: 1.0
References: <20221115123827.736141-1-biju.das.jz@bp.renesas.com> <20221115123827.736141-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20221115123827.736141-3-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 16 Nov 2022 09:25:36 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVihOZG+4gRXBVO1XAJgqY=kaT1=tnCGTDrE2P=v2UWUA@mail.gmail.com>
Message-ID: <CAMuHMdVihOZG+4gRXBVO1XAJgqY=kaT1=tnCGTDrE2P=v2UWUA@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] soc: renesas: Identify RZ/V2M SoC
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Phil Edworthy <phil.edworthy@renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org,
        Chris Paterson <chris.paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Nov 15, 2022 at 1:38 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> From: Phil Edworthy <phil.edworthy@renesas.com>
>
> Add support for identifying the RZ/V2M (R9A09G011) SoC.
> Note that the SoC does not have a identification register.
>
> Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
> [biju: removed config changes ]
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v2->v3:
>  * No change.
> v1->v2:
>  * Removed KConfig changes as SoC config already present
>  * Fixed an extra space before 'else if' statement.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
