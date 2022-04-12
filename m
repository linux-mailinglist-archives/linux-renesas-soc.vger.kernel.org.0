Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C7A144FDB8E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Apr 2022 12:58:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238289AbiDLKE7 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 12 Apr 2022 06:04:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349491AbiDLJk3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 12 Apr 2022 05:40:29 -0400
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1E9668FBD;
        Tue, 12 Apr 2022 01:45:53 -0700 (PDT)
Received: by mail-qt1-f181.google.com with SMTP id z16so2536921qtq.6;
        Tue, 12 Apr 2022 01:45:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NtJgxMX7kuge/OzsJhgIVePckDKGAXzPV+JSxJ4S3Qk=;
        b=X3ee2v9pdymvznXSFZGy4RIDzTKmh2khVEjVWQVmersA9tb24ElBJsmJrPJ63BEGhI
         dl+qzJL4vbdmRCVX1274qKVsFjKjQyU104l5e/o0W6LsaMMf1KEeWPwAkW4uaUh61QOx
         98WTQgIMlV+OzovFlLgd1+G2fmtnrBaqIfRwn5pFxBa+WIxAd1+jl6ZX+HKgF55DxF4O
         bEoSQFV/9CgRAiGSyDOez2hdwYV15ooMhxAL3OsspWLJijTd6E+cKTZqaWuZ4UJkJpHo
         bVJzYnsq5MycXC9ykdYy4WA/TIoCfWNtsrKZow2S2woJC3MdF8fmK5Bwlf9mgdmB23fA
         n0KA==
X-Gm-Message-State: AOAM5309mmD+s0QpTynU3Sdj4gTWZ3o4xSfgxA0xLGjEOv987kxmFBlc
        F9W4mVAjU8Gf3bIiSdxE1LJOj97S98NBl3Gz
X-Google-Smtp-Source: ABdhPJxtF+BeUpkIbM9hgnn0rlERtXoFR9YhuH/gRyZVKB8vihT8ka7eBFVz9hTLn+9ipv+Pec/ZzA==
X-Received: by 2002:a05:622a:408c:b0:2f0:7b56:e798 with SMTP id cg12-20020a05622a408c00b002f07b56e798mr1402461qtb.504.1649753152829;
        Tue, 12 Apr 2022 01:45:52 -0700 (PDT)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com. [209.85.219.172])
        by smtp.gmail.com with ESMTPSA id g28-20020a05620a109c00b0069c25d4fee4sm3066687qkk.32.2022.04.12.01.45.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Apr 2022 01:45:52 -0700 (PDT)
Received: by mail-yb1-f172.google.com with SMTP id f38so31907636ybi.3;
        Tue, 12 Apr 2022 01:45:52 -0700 (PDT)
X-Received: by 2002:a5b:984:0:b0:63f:8c38:676c with SMTP id
 c4-20020a5b0984000000b0063f8c38676cmr15153985ybq.393.1649753152317; Tue, 12
 Apr 2022 01:45:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220322095512.4707-1-wsa+renesas@sang-engineering.com> <20220322095512.4707-3-wsa+renesas@sang-engineering.com>
In-Reply-To: <20220322095512.4707-3-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 12 Apr 2022 10:45:41 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXJdjv9HV+5tGRhisu4JJHznta_u1JDFbop762RZAweEA@mail.gmail.com>
Message-ID: <CAMuHMdXJdjv9HV+5tGRhisu4JJHznta_u1JDFbop762RZAweEA@mail.gmail.com>
Subject: Re: [PATCH 2/5] ARM: dts: rzg1: add interrupt property to the
 watchdog node
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
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

On Tue, Mar 22, 2022 at 11:02 AM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Driver doesn't use it yet, but let's describe the HW properly.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.19.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
