Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1850467C608
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Jan 2023 09:40:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236302AbjAZIkU (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 26 Jan 2023 03:40:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236598AbjAZIj7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 26 Jan 2023 03:39:59 -0500
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A4166A339
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Jan 2023 00:39:54 -0800 (PST)
Received: by mail-qt1-f173.google.com with SMTP id d3so741727qte.8
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Jan 2023 00:39:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CCa7qfJHy1/qNXflHeit9pPTyF8STU18rbr+TjIaUQ8=;
        b=8Bd0Q5gdqGue7UxhuTzJEgsHn3uaf/6ExrJ3L6jkcolYYQQvFRlHEugkUysNcUw3S4
         Q8Fo7QkC6BLYUyOtCoLUGHUmlnTMYYB6eOFUK5gER4UJ1uZkIeJOCkHAarG+YcSfpkob
         e+2U3j7LfNIZNkr2afSCZByJdP1pfZRtTGfOHXJwjTL7Y1clfJMvcIpjTdyxUfZFbBQ9
         /QfLYa/OF/AkgknuTogeS5ZwyQX5TGajMJCcga7xYdZEHKl3+CHu13qD6EtOxAnL80D0
         DODw7XvX3Oj6y5OAwfVb/U2rUGldnGUIjqqszupym2DTTvTO2p86FeNBYyruzs9grYPB
         DZRw==
X-Gm-Message-State: AFqh2kqN0k8vgKcA8E9P3p+9JZVPHVHmE2kgoPZ8ZzrjPkc38Kp9BdfG
        VxZwlrqDFWf4saysjp6T7nwsqwUNbK1OtQ==
X-Google-Smtp-Source: AMrXdXtnddZXnfR8DAmGkGN7ohmfstoioJONJJAVBLZLNf3KpbkzSIVKBgdNQU35bplaSyxxILNgcg==
X-Received: by 2002:a05:622a:5917:b0:3a8:175a:fd48 with SMTP id ga23-20020a05622a591700b003a8175afd48mr55875599qtb.64.1674722393480;
        Thu, 26 Jan 2023 00:39:53 -0800 (PST)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com. [209.85.219.169])
        by smtp.gmail.com with ESMTPSA id br9-20020a05622a1e0900b003b62e8b77e7sm358814qtb.68.2023.01.26.00.39.53
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Jan 2023 00:39:53 -0800 (PST)
Received: by mail-yb1-f169.google.com with SMTP id c124so1123839ybb.13
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Jan 2023 00:39:53 -0800 (PST)
X-Received: by 2002:a25:ab30:0:b0:80b:8247:e8b1 with SMTP id
 u45-20020a25ab30000000b0080b8247e8b1mr717982ybi.604.1674722392885; Thu, 26
 Jan 2023 00:39:52 -0800 (PST)
MIME-Version: 1.0
References: <87tu0nz3xr.wl-kuninori.morimoto.gx@renesas.com>
 <CAMuHMdUTrtpHzPzPNMWc1GQL_7kYOX1x72OzDiNy80ujsvFRWw@mail.gmail.com> <875ycuutli.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <875ycuutli.wl-kuninori.morimoto.gx@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 26 Jan 2023 09:39:41 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXPxkcT1UVh6Ee0BxPM6VgpJJcHag09PPKfpdQdVWdj-Q@mail.gmail.com>
Message-ID: <CAMuHMdXPxkcT1UVh6Ee0BxPM6VgpJJcHag09PPKfpdQdVWdj-Q@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: r8a779a0: tidyup DMAC name on SYS-DMAC
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc:     linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Morimoto-san,

On Wed, Jan 25, 2023 at 11:39 PM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> > > +       DEF_MOD("sys-dmac0",    709,    R8A779A0_CLK_S1D2),
> > > +       DEF_MOD("sys-dmac1",    710,    R8A779A0_CLK_S1D2),
> >
> > Actually Rev 0.5 of the documentation does call the channels "SYS-DMAC1"
> > and "SYS-DMAC2".
> > Shall we use that numbering?
> > We also have labels "dmac1" and "dmac2" in DTS.
>
> OK, I see.
>
> I'm happy if you can modify it.
> Of course I'm happy to post v2 patch.

Thanks, no need for that, I will fix while applying.
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v6.3.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
