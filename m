Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ADBDF53F790
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Jun 2022 09:46:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231771AbiFGHqb (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 7 Jun 2022 03:46:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231281AbiFGHqa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 7 Jun 2022 03:46:30 -0400
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74291C17DB
        for <linux-renesas-soc@vger.kernel.org>; Tue,  7 Jun 2022 00:46:29 -0700 (PDT)
Received: by mail-qt1-f178.google.com with SMTP id j8so9295993qtn.13
        for <linux-renesas-soc@vger.kernel.org>; Tue, 07 Jun 2022 00:46:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=udkFYnrRhuaS0d9Hyr0bAb66t+eE1zu4fp1aOrvZzhc=;
        b=kJW1gd4MaPzlzE3erzPo1lKhwUssYRomvae6ihGEgKFz8J4tJyMW3GzQ8mvWYHX/vJ
         8BgfDmyIfEWEDEHy0xbMfVJqQziy/DRBsHnaXUq288iyIL7z1ePJ90jHsFLhxKAxTJYc
         1/+JXnumzuzNnzXX4RDOX2nguDxdSVLGgkHhGUYptSr57H6pCl4QGW+GVcyRLnTveUrR
         hZaFp8GOmhBAaCVnLACq2UE7Qo8iOxWkFMB6wTTXeK/JWXMjrvB2YKF3SmRO7BNaDYMF
         EOR8NVzU134bndLHgtuC83T+jt3dhi+am7j9qIomZK5Q1eVrMnfaU19HTFvafn2Fk72l
         cQ/g==
X-Gm-Message-State: AOAM532rG1SiM+O5k3Hop/Rmkefvaf1+P6GaABswc1WtU8NJ2qXG+Von
        922oWAMaZotm9481dIgQpEH0xUWkLJ4jvw==
X-Google-Smtp-Source: ABdhPJwVxrUrviGM5HGlN1nM662J6la2QQfh5SR4UQwWBknmf6Q1tPRhNirupG8gYaOiKaXPWPjveQ==
X-Received: by 2002:ac8:5896:0:b0:2f3:d231:58a9 with SMTP id t22-20020ac85896000000b002f3d23158a9mr21630925qta.131.1654587988456;
        Tue, 07 Jun 2022 00:46:28 -0700 (PDT)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com. [209.85.128.176])
        by smtp.gmail.com with ESMTPSA id d4-20020a376804000000b006a6b84c6cbdsm4666087qkc.30.2022.06.07.00.46.28
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jun 2022 00:46:28 -0700 (PDT)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-2ec42eae76bso166402937b3.10
        for <linux-renesas-soc@vger.kernel.org>; Tue, 07 Jun 2022 00:46:28 -0700 (PDT)
X-Received: by 2002:a81:4811:0:b0:30c:8021:4690 with SMTP id
 v17-20020a814811000000b0030c80214690mr30058815ywa.47.1654587987814; Tue, 07
 Jun 2022 00:46:27 -0700 (PDT)
MIME-Version: 1.0
References: <20220530024626.1870277-1-yoshihiro.shimoda.uh@renesas.com> <20220530024626.1870277-2-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <20220530024626.1870277-2-yoshihiro.shimoda.uh@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 7 Jun 2022 09:46:16 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWD9_j1pK7zdLk6rzTX4PuNfauGFBTKbKjpfCQ6uuPsCw@mail.gmail.com>
Message-ID: <CAMuHMdWD9_j1pK7zdLk6rzTX4PuNfauGFBTKbKjpfCQ6uuPsCw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] arm64: dts: renesas: r8a779f0: Add IPMMU nodes
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
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

On Mon, May 30, 2022 at 4:46 AM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> Add IPMMU nodes for r8a779f0.
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.20.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
