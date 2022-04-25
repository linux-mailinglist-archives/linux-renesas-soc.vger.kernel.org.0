Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CB04D50DCF7
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 Apr 2022 11:40:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237531AbiDYJnE (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 25 Apr 2022 05:43:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241633AbiDYJmn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 25 Apr 2022 05:42:43 -0400
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF9242DA95
        for <linux-renesas-soc@vger.kernel.org>; Mon, 25 Apr 2022 02:39:34 -0700 (PDT)
Received: by mail-qv1-f43.google.com with SMTP id jt15so5361593qvb.13
        for <linux-renesas-soc@vger.kernel.org>; Mon, 25 Apr 2022 02:39:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2tRy3X+G6F9AMLfmEd/AYKFbsJoOv/Jn2GeWGmxIUWo=;
        b=GGC4giXLZbfq0cDL5R+5s1Z2vaJ6ooLx2Td3zWMftFFjJww1vDe7SZ+uTxA2Agd4+b
         KG906fbkwbcTbYMQg4yA7uuZeQaW8NdJqefVvZpPFNpRqY/QjeNaL5Pd7tjzuJ6eGKOC
         xIVEKfWfpAaizF0IYjBtvjv/4/cgLeoJDf/HQfXfg0LMWbtWQYJzXHg4cTAHt6pH045+
         FnQgS2THqtzIbqJ87zgDY9S9Cam0IVzTHZoIrdX83nuuklFxOrTp1lCDviz/MyBy1lts
         jROOy9beYiwKtoZJaTG+DOhDjMPyKJoMex0KkkId8fqmvZnfz8eJD/z+0TTLDaBy65MO
         v+Lw==
X-Gm-Message-State: AOAM532W4CR0J6D4hN0fJn4PgPSTjh/XODChakTnmf1Yc9nE7zz8qM8F
        k4CRfOr3QG93R/VIJbD8eUfyIVhWPm+msg==
X-Google-Smtp-Source: ABdhPJynaQ5TaylL68m1G9pH1qHKeEnmOca0yLzhCOwzY0OU8GqU1dZTFX30XnNevXdYRxIxsjKZow==
X-Received: by 2002:a0c:a942:0:b0:443:a395:cc1f with SMTP id z2-20020a0ca942000000b00443a395cc1fmr12089602qva.68.1650879573916;
        Mon, 25 Apr 2022 02:39:33 -0700 (PDT)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com. [209.85.219.175])
        by smtp.gmail.com with ESMTPSA id f28-20020a05620a20dc00b0069d98e6bff9sm4719610qka.32.2022.04.25.02.39.33
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Apr 2022 02:39:33 -0700 (PDT)
Received: by mail-yb1-f175.google.com with SMTP id u33so1593272ybd.11
        for <linux-renesas-soc@vger.kernel.org>; Mon, 25 Apr 2022 02:39:33 -0700 (PDT)
X-Received: by 2002:a25:3492:0:b0:645:6f78:b3b4 with SMTP id
 b140-20020a253492000000b006456f78b3b4mr15527731yba.546.1650879573436; Mon, 25
 Apr 2022 02:39:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220424214550.19463-1-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20220424214550.19463-1-laurent.pinchart+renesas@ideasonboard.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 25 Apr 2022 11:39:21 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXWqvwrNBCBtjOHs6+Dn-+OSKw94Reug5ggt_TzhE9y7Q@mail.gmail.com>
Message-ID: <CAMuHMdXWqvwrNBCBtjOHs6+Dn-+OSKw94Reug5ggt_TzhE9y7Q@mail.gmail.com>
Subject: Re: [PATCH] drm: rcar-du: Drop file name from comment header blocks
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc:     DRI Development <dri-devel@lists.freedesktop.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Sun, Apr 24, 2022 at 11:46 PM Laurent Pinchart
<laurent.pinchart+renesas@ideasonboard.com> wrote:
> The comment blocks at the beginning of each file have a one-line
> summary description of the file that includes the file name. While the
> description is useful, the file name only creates opportunities for
> mistakes (as seen in rcar_du_vsp.c) without any added value. Drop it.
>
> Reported-by: Biju Das <biju.das.jz@bp.renesas.com>
> Suggested-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
