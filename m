Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0DE8B793972
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 Sep 2023 12:04:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235088AbjIFKEt convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 6 Sep 2023 06:04:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238662AbjIFKEf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 6 Sep 2023 06:04:35 -0400
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B08E1737
        for <linux-renesas-soc@vger.kernel.org>; Wed,  6 Sep 2023 03:04:18 -0700 (PDT)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-594f8a7125cso35443947b3.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 06 Sep 2023 03:04:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693994657; x=1694599457;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zyzWCEin3x+EhbNaVLFFdZWqxuIQ53ywEYEIxkPUfzw=;
        b=YjIGZIeZ3ebsT76MVN30B5P+66+Toe4ub+oyCbYBFvPOZ5v73/1RFm4jZhd7lFiTgs
         ISwH8a3ZcVo9RVUI5pbnAGvZdvmE3lpRU74tJl0hvvmqh0hcAi9zlj0fXm3hVHc/a+cS
         VIt70QYExbDsU6OINo0bE4c5CqABG+vJToxEJJCcyrqkuiH9vO89dJ+OMzo7fwgS/UeZ
         +kyh+KlZvGmyiqT17eNC422o5I9YMfqwl3cWHv8cwUrsXgC3lQZ5bH7+Gc26dXpA10yO
         7rFsgAxSIwvWPLthNWP6WwCnzvPOzRxoLOWRyxZe266Pt10PRaONZ1YGhLZ1Ir/9h8hB
         ELwA==
X-Gm-Message-State: AOJu0Yzjt4nVlK7tzkniraTzU37ANkbcgj9D7sY9y95f875VbbU2EDdz
        PU0U2CdZGsS0QxB4EvS+gvSHQ12ukinplA==
X-Google-Smtp-Source: AGHT+IHYQKPb9EXLfSe9z02JWygNUmJjtETdtcw+k448jUzXdy/sN8VQo6OShNozuNe0SA2dTAduoA==
X-Received: by 2002:a81:6283:0:b0:56d:43cb:da98 with SMTP id w125-20020a816283000000b0056d43cbda98mr17263805ywb.29.1693994657466;
        Wed, 06 Sep 2023 03:04:17 -0700 (PDT)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com. [209.85.219.179])
        by smtp.gmail.com with ESMTPSA id b3-20020a0dc003000000b0054f9e7fed7asm3689022ywd.137.2023.09.06.03.04.17
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Sep 2023 03:04:17 -0700 (PDT)
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-d7e387c33f3so2749776276.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 06 Sep 2023 03:04:17 -0700 (PDT)
X-Received: by 2002:a25:ab8e:0:b0:d7e:891b:cde7 with SMTP id
 v14-20020a25ab8e000000b00d7e891bcde7mr13785322ybi.2.1693994656878; Wed, 06
 Sep 2023 03:04:16 -0700 (PDT)
MIME-Version: 1.0
References: <20230906094346.38759-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20230906094346.38759-1-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 6 Sep 2023 12:04:04 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVcLO2jOAzy5+Njm+0AvKFBoyxroehDL4_3HhU4HfPdaA@mail.gmail.com>
Message-ID: <CAMuHMdVcLO2jOAzy5+Njm+0AvKFBoyxroehDL4_3HhU4HfPdaA@mail.gmail.com>
Subject: Re: [PATCH] drm: renesas: rcar-du: rzg2l_mipi_dsi: Update the comment
 in rzg2l_mipi_dsi_start_video()
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Sam Ravnborg <sam@ravnborg.org>, Rob Herring <robh@kernel.org>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Biju Das <biju.das.au@gmail.com>, Pavel Machek <pavel@denx.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Sep 6, 2023 at 11:44 AM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Add missing space in the comment in rzg2l_mipi_dsi_start_video().
>
> Reported-by: Pavel Machek <pavel@denx.de>
> Closes: https://lore.kernel.org/all/ZPg7STHDn4LbLy7f@duo.ucw.cz/
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
