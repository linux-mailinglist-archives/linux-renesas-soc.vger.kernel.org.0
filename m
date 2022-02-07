Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 964DE4AC1D2
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Feb 2022 15:49:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378996AbiBGOqQ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 7 Feb 2022 09:46:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241651AbiBGO0o (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 7 Feb 2022 09:26:44 -0500
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA425C0401C1;
        Mon,  7 Feb 2022 06:26:41 -0800 (PST)
Received: by mail-ua1-f51.google.com with SMTP id w18so19756437uar.8;
        Mon, 07 Feb 2022 06:26:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qJ6gtmWsE0qbWiYsJQ66pdtMsX/wOuo4autMcLLjsHk=;
        b=yLfC5NMkkPnrn3ke6WnCheLPiGtqEgDey5acbXD/5UeLT4r3RNfKSyBGetR9525ymJ
         bySJullSgquaDjjIbcQoN81RAoZZq1IbxzttjU4wzlQ9+mcXXZWbtzOoSTXoEAJcTb19
         uGB79oZi9cBnVU53IQL5VCiWDLiirY7xyaQojjMxdkVhhTM5mh4z8HCsHmYyY6dXTM29
         oj3WGG47xwN9OueUhqFGna7YiyC8hhDNrFXyQP7nQg5oHboMXdQkAz+xCvmZbKDfPRbh
         /axmiYOXhTlTajR2Kil+QQcdVDQckiKjGllLxfidt5yrzLrbGdFVyfp9gELpmhKuBERL
         aPhQ==
X-Gm-Message-State: AOAM530DNhMsKq8APxGPrKYbz0Z0fZ0Os7nltMYaLo6y8CArQ46U4jSD
        HDEpdk6KNUGaDam6AHyeWTNLGFjwSS2PEw==
X-Google-Smtp-Source: ABdhPJwx2uSYqpA1T+lFsVoZefQiRIY0h3cX4jsDIjidhJcyB/GDZsgfWGPWf9KxAMV0oXfw+YG3Og==
X-Received: by 2002:ab0:1d03:: with SMTP id j3mr2219952uak.100.1644244000925;
        Mon, 07 Feb 2022 06:26:40 -0800 (PST)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com. [209.85.222.43])
        by smtp.gmail.com with ESMTPSA id d19sm2163794vsh.18.2022.02.07.06.26.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Feb 2022 06:26:40 -0800 (PST)
Received: by mail-ua1-f43.google.com with SMTP id c36so23009964uae.13;
        Mon, 07 Feb 2022 06:26:40 -0800 (PST)
X-Received: by 2002:a67:fd63:: with SMTP id h3mr4173263vsa.77.1644244000192;
 Mon, 07 Feb 2022 06:26:40 -0800 (PST)
MIME-Version: 1.0
References: <20220204125653.1194249-1-yoshihiro.shimoda.uh@renesas.com> <20220204125653.1194249-2-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <20220204125653.1194249-2-yoshihiro.shimoda.uh@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 7 Feb 2022 15:26:29 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUc_VmwR43CgYhwKZ+t_GCXzj9+9vaEBZR-2-ui1PC-1Q@mail.gmail.com>
Message-ID: <CAMuHMdUc_VmwR43CgYhwKZ+t_GCXzj9+9vaEBZR-2-ui1PC-1Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: iommu: renesas,ipmmu-vmsa: add
 r8a779f0 support
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

On Fri, Feb 4, 2022 at 2:54 PM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> Document the compatible values for the IPMMU-VMSA blocks in
> the Renesas R-Car S4-8 (R8A779F0) SoC and R-Car Gen4.
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> 3fbefb9570325500dbf3faff80ded6d0d46f48b2

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
