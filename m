Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5F1F24FDE7E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Apr 2022 13:54:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236843AbiDLLuI (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 12 Apr 2022 07:50:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350733AbiDLLrw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 12 Apr 2022 07:47:52 -0400
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8627857B18;
        Tue, 12 Apr 2022 03:28:34 -0700 (PDT)
Received: by mail-qv1-f51.google.com with SMTP id kl29so15773509qvb.2;
        Tue, 12 Apr 2022 03:28:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UIsiI6nAuLSTs00L7fFaZKGAhz5k0aDEXaH8Oo6l32U=;
        b=EqkrHvnA56r9L3jPf5JuvfzMLS6ty1cmWcxDqwZ7ieIZK0SAk3L78RZyY7SA2CZdFt
         wW2jkH02BnPvXT3FS8IMvT53GgWytwWDW+vXRy4V1SUbceJg5sxt9+yhAZ6BWuZ2Yq/y
         t0bnIm5zIt5fPordz/i+nzbElFigkBtgJVD7VwOqRFDLOIindlfnS0El9ZuSVMweyIm5
         IdVeQJDeQN0UiRnRoJ/37xyEqWjQ0LSRmYXFzAc57sLRmwUNnOvJR7wNKbBeBo84uPd+
         sUY9W/6MVfNHHXWUJVWEnWHGtuHIhDc1bkrUMXycPQgsH+ChiXEyoD696N1a1Kt2MD5d
         0rWg==
X-Gm-Message-State: AOAM530Xw2N+pgkagnX2yOM5We7TbXa2WElA+jx8WNDZoicP1ogZzyQs
        nm50rf1yskj7SMwY4FemhrZDj6t/BA6OBA==
X-Google-Smtp-Source: ABdhPJy7nWw9Ik9et+AaRczYspMx19HI7CNka7i6evXXwIT1hdRmAXW+M9NdOqdNtDf0KFJkHRWnEw==
X-Received: by 2002:a05:6214:1bce:b0:441:2d37:1fd1 with SMTP id m14-20020a0562141bce00b004412d371fd1mr30216046qvc.10.1649759313599;
        Tue, 12 Apr 2022 03:28:33 -0700 (PDT)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com. [209.85.128.172])
        by smtp.gmail.com with ESMTPSA id u5-20020a05622a198500b002ee933faf83sm4217533qtc.73.2022.04.12.03.28.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Apr 2022 03:28:33 -0700 (PDT)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-2eafabbc80aso195442197b3.11;
        Tue, 12 Apr 2022 03:28:32 -0700 (PDT)
X-Received: by 2002:a81:413:0:b0:2ec:31d7:7e60 with SMTP id
 19-20020a810413000000b002ec31d77e60mr6899514ywe.62.1649759312631; Tue, 12 Apr
 2022 03:28:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220402073234.24625-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20220402073234.24625-1-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 12 Apr 2022 12:28:21 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW0_u7ffY7YQOvXz1VW1=DRhUukNaTOn1qKWmuGKb0T0w@mail.gmail.com>
Message-ID: <CAMuHMdW0_u7ffY7YQOvXz1VW1=DRhUukNaTOn1qKWmuGKb0T0w@mail.gmail.com>
Subject: Re: [PATCH v4 1/5] dt-bindings: arm: renesas: Document Renesas
 RZ/G2UL SMARC EVK
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

On Sat, Apr 2, 2022 at 9:32 AM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Document the Renesas SMARC EVK board which is based on the Renesas
> RZ/G2UL Type-1 (R9A07G043U11) SoC.  The SMARC EVK consists of an
> RZ/G2UL Type-1 SoM module and a SMARC carrier board.  The SoM module
> sits on top of the carrier board.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.19.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
