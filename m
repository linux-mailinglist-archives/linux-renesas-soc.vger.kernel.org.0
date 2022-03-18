Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2BEF04DDA47
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Mar 2022 14:14:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236575AbiCRNPh (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 18 Mar 2022 09:15:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236578AbiCRNPg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 Mar 2022 09:15:36 -0400
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FF44204AAB;
        Fri, 18 Mar 2022 06:14:17 -0700 (PDT)
Received: by mail-qk1-f176.google.com with SMTP id 85so6676077qkm.9;
        Fri, 18 Mar 2022 06:14:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JyaLSw4LKIUFqLhaxJ7qVFkRw6/W/xI9y413ExJG+IE=;
        b=KsYxjavkwAe6AR3QvtWMmdDYOgwpFLtbyThSoV7BbT97JKEkEG1NQ2pPRL+IQGRC5v
         UdUbNJ813ws5LwCyBZ0xs+jl8ZY8vh6zQ2AjZ/AUemdqBsKZ+PdDpieYVEJanSAmhqc9
         Ya6hUt9VoIArugHbfNZhCZEiAqAGow5DAv1x15/EGLLon/2sGXyU7DJys83x15+pnmSi
         yf0EW3fr/cyi4TPdaMTxkdL6WSbt6TTftZXhvr+7WfecUkVmr1K3+AIvGWYOwzWXa2bW
         h2obSBwDTalf002D7P7HLBEYQqVDEIj09qxtXtBBR7OUOkK65Eotgp7m2AF+6raKr6Te
         Frtw==
X-Gm-Message-State: AOAM532HaBgVi23raYRqxJ9p1E/RamM3mrQ2NRyIjCH8M0WNFy0C+pfa
        rQ8mmz5wbmmfYLRNBZ1Od0PrYucuKplLVxpp
X-Google-Smtp-Source: ABdhPJzdOndWG41OpuWWTNZjH9WepMJC7yas88wJv9okhhrIlFXH1cXfM914lMWsshBIg+MXEM0amA==
X-Received: by 2002:a05:620a:4450:b0:67c:258e:58d with SMTP id w16-20020a05620a445000b0067c258e058dmr5633147qkp.97.1647609255994;
        Fri, 18 Mar 2022 06:14:15 -0700 (PDT)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com. [209.85.219.180])
        by smtp.gmail.com with ESMTPSA id p13-20020a05622a048d00b002e1ce0c627csm5975370qtx.58.2022.03.18.06.14.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Mar 2022 06:14:15 -0700 (PDT)
Received: by mail-yb1-f180.google.com with SMTP id l2so15745506ybe.8;
        Fri, 18 Mar 2022 06:14:15 -0700 (PDT)
X-Received: by 2002:a25:4fc4:0:b0:633:25c8:7d9 with SMTP id
 d187-20020a254fc4000000b0063325c807d9mr10305411ybb.506.1647609255418; Fri, 18
 Mar 2022 06:14:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220307192436.13237-1-biju.das.jz@bp.renesas.com> <20220307192436.13237-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20220307192436.13237-3-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 18 Mar 2022 14:14:04 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU4P2cOWq1uA0t-QLiB7smF3HxOwPB-eJ5qVOpgzkEMFQ@mail.gmail.com>
Message-ID: <CAMuHMdU4P2cOWq1uA0t-QLiB7smF3HxOwPB-eJ5qVOpgzkEMFQ@mail.gmail.com>
Subject: Re: [PATCH 2/4] arm64: dts: renesas: rzg2lc-smarc-som: Enable OSTM
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

On Mon, Mar 7, 2022 at 8:24 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Enable OSTM{1, 2} interfaces on RZ/G2LC SMARC EVK.
> OSTM0 is reserved for TF-A.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.19.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
