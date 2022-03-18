Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7093C4DD5D0
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Mar 2022 09:07:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231196AbiCRIJM (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 18 Mar 2022 04:09:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231319AbiCRIJM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 Mar 2022 04:09:12 -0400
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8695626E2;
        Fri, 18 Mar 2022 01:07:53 -0700 (PDT)
Received: by mail-qt1-f182.google.com with SMTP id s11so6331170qtc.3;
        Fri, 18 Mar 2022 01:07:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SJi7Hh8g7svJsq4PVTRTwuQvQyQFmwO96mMMVXAxkKc=;
        b=UdHhrmQL4I9WAif6MNhl5vCrOsHqji4j3tn/dKpEEn1v5ivt4P8OW+P7j1ut+BWLPO
         ZUJp3eanmRDi8QyDn8oC2mEFgNH+igLD2SUKBaiwvABgO9vhnTPHJlcJ3zVicnhCsZwn
         sOmAW3ocGLqGLFPkUN3385Gz6kLI6EYTKzOlPcRaTm4Fj4AxfZaSHWneo+czJTKuTKFL
         Zy2vnZVdUtC4Ak+DyN9obzt8h2nGf3ikc6N+YDSt8xjjDtn21ezsQY4LBbhBLIG0Nh6v
         c0cW5vcUB5u9z7LMTn79zGWkPUJfENLgpVPn7JbqCubevwb8ao0sA+4+1H84HLHrVcWE
         G5FA==
X-Gm-Message-State: AOAM530S3PQ1ktO+B8nuEn7Ntn12sly5KPy2cBK7pU4/tO705g3DlPF/
        +mu0/QLjJbxpUnzGNfAvFeRgGcDPY/Kq0XxZ
X-Google-Smtp-Source: ABdhPJy08kN2jGnzmmFY28kYRbWNylfqMxcPkPgVU1YmnIlDpEATy3BGwN5cIL0VEzzGmjWwbd4K5g==
X-Received: by 2002:a05:622a:1447:b0:2e1:c405:b05b with SMTP id v7-20020a05622a144700b002e1c405b05bmr6958533qtx.626.1647590872230;
        Fri, 18 Mar 2022 01:07:52 -0700 (PDT)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com. [209.85.219.181])
        by smtp.gmail.com with ESMTPSA id y24-20020a37e318000000b0067d43d76184sm3549619qki.97.2022.03.18.01.07.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Mar 2022 01:07:51 -0700 (PDT)
Received: by mail-yb1-f181.google.com with SMTP id o5so14573010ybe.2;
        Fri, 18 Mar 2022 01:07:51 -0700 (PDT)
X-Received: by 2002:a25:4fc4:0:b0:633:25c8:7d9 with SMTP id
 d187-20020a254fc4000000b0063325c807d9mr9234354ybb.506.1647590870725; Fri, 18
 Mar 2022 01:07:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220317174627.360815-1-miquel.raynal@bootlin.com> <20220317174627.360815-4-miquel.raynal@bootlin.com>
In-Reply-To: <20220317174627.360815-4-miquel.raynal@bootlin.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 18 Mar 2022 09:07:39 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV+7MszquFgRUo=7yPORPuQzqkKr2ZqRkSy-rYqs7rwkw@mail.gmail.com>
Message-ID: <CAMuHMdV+7MszquFgRUo=7yPORPuQzqkKr2ZqRkSy-rYqs7rwkw@mail.gmail.com>
Subject: Re: [PATCH v2 03/10] serial: 8250: dw: Create a more generic platform
 data structure
To:     Miquel Raynal <miquel.raynal@bootlin.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Gareth Williams <gareth.williams.jx@renesas.com>,
        Phil Edworthy <phil.edworthy@renesas.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Milan Stevanovic <milan.stevanovic@se.com>,
        Jimmy Lalande <jimmy.lalande@se.com>,
        Pascal Eberhard <pascal.eberhard@se.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Herve Codina <herve.codina@bootlin.com>,
        Clement Leger <clement.leger@bootlin.com>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        Emil Renner Berthing <kernel@esmil.dk>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Mar 17, 2022 at 6:46 PM Miquel Raynal <miquel.raynal@bootlin.com> wrote:
> Before adding more platform data information, let's turn the quirks
> information as being a member of a wider structure. More fields will be
> added later.
>
> Cc: Emil Renner Berthing <kernel@esmil.dk>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
