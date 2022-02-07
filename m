Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 04CE94AC1D9
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Feb 2022 15:49:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1441910AbiBGOq1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 7 Feb 2022 09:46:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1392302AbiBGO1R (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 7 Feb 2022 09:27:17 -0500
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5188C0401C2;
        Mon,  7 Feb 2022 06:27:16 -0800 (PST)
Received: by mail-vk1-f176.google.com with SMTP id v192so7914484vkv.4;
        Mon, 07 Feb 2022 06:27:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cjodH+zCyALNPMiBPcK9ULdaejBlXthJyh10D4W5H+s=;
        b=EbUwSmYFvCtuMoAYBKb2JmNIAewpH6wpfwLzCk0WtvhgjZSLU98Dej1DqbKDauI0OL
         F09j6drPMHHOXh9bmRjrmDNpxoZAMchEZ4p81UdlMVhh4QIqdlIyPiuziNi9w55HwUTQ
         +WT1g68kYn3n2xpKw/UOQBxy8BfINJypVEVY4bhLIsQNaZ0m5JZYUt7SmJw2gahSV87L
         KInJq8RvpW2sybfVl3ex8hXqaNO5lh/rLGhSfqsPmJCXJZJ2h48DDdmzSKykTCwlTwPG
         XhZhpiDHPh63dpshPgCKONGW1jVOd+S98HOnNREOJH4ioSBgOvsvWrmpEAdcgfB/khQm
         qABQ==
X-Gm-Message-State: AOAM532x2pLqdeb3Ct8PGGV8VYUGihOHxPLVRkPJ2Phfbgs6p1gHprG3
        ziK2IkRCbf9hUvJ52WEn7XCdTS4HAouWbg==
X-Google-Smtp-Source: ABdhPJxjzlMFKp+AB697Yl9V7tjMIKQZFdvARTj3tr+Gyp0C7v/ezPCntVf43izyDpJC7NBDSUvWGQ==
X-Received: by 2002:a05:6122:d0b:: with SMTP id az11mr4987562vkb.41.1644244035885;
        Mon, 07 Feb 2022 06:27:15 -0800 (PST)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com. [209.85.222.45])
        by smtp.gmail.com with ESMTPSA id 143sm4737vkw.11.2022.02.07.06.27.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Feb 2022 06:27:15 -0800 (PST)
Received: by mail-ua1-f45.google.com with SMTP id w18so19759509uar.8;
        Mon, 07 Feb 2022 06:27:15 -0800 (PST)
X-Received: by 2002:a67:c198:: with SMTP id h24mr4669413vsj.5.1644244035167;
 Mon, 07 Feb 2022 06:27:15 -0800 (PST)
MIME-Version: 1.0
References: <20220204125653.1194249-1-yoshihiro.shimoda.uh@renesas.com> <20220204125653.1194249-3-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <20220204125653.1194249-3-yoshihiro.shimoda.uh@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 7 Feb 2022 15:27:04 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXmcbv2Foo8njcCv2hrbG=09uff=WduVa3VDRn331LQSw@mail.gmail.com>
Message-ID: <CAMuHMdXmcbv2Foo8njcCv2hrbG=09uff=WduVa3VDRn331LQSw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] iommu/ipmmu-vmsa: Add support for R-Car Gen4
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Linux IOMMU <iommu@lists.linux-foundation.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
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

On Fri, Feb 4, 2022 at 4:49 PM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> Add support for R-Car Gen4 like r8a779f0 (R-Car S4-8). The IPMMU
> hardware design of r8a779f0 is the same as r8a779a0. So, rename
> "r8a779a0" to "rcar_gen4".
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
