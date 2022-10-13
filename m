Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 809665FD980
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Oct 2022 14:48:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229684AbiJMMsL (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 13 Oct 2022 08:48:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229573AbiJMMsJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 13 Oct 2022 08:48:09 -0400
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1B93FFFB7
        for <linux-renesas-soc@vger.kernel.org>; Thu, 13 Oct 2022 05:48:08 -0700 (PDT)
Received: by mail-qv1-f52.google.com with SMTP id z18so1174734qvn.6
        for <linux-renesas-soc@vger.kernel.org>; Thu, 13 Oct 2022 05:48:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FnbAa4sldby0DiQOoeAv4iihF562v2LLurmTkZ3gF1s=;
        b=bkqMtusknI2hiiUqpHR1jnQUjJrq7Kee3KzTJNcmxxLH4vIsrTwzdx5YgP4NdrtJEn
         P2er0WUI7HcG8cMxW1mNvDy47ONqw3IN+CBIk5Wm0RQIYPMDk/BAeXTPJpVHgMc6t16Y
         i48gVnqwoa3XOx+dor/GoYNbd9vI56DiPK1nrtiVCD7c0O8JImlQxhhTPgxo6OqViIAP
         GU4w5DxalRiiF1Q2bz8qw9nv4ygmSXpKL0zOCh8Hd+15KuF8FG47EsQe6RoeoHeNszhM
         0tLQFBQZg74zmwSuLVQkNO3sMOCkanszMNbiIDZYdIdnYzyEpRaP+tV/DduYtbVHIqH/
         jWew==
X-Gm-Message-State: ACrzQf0/tHUc1ddnpGqmN7LRTOBPuCoW5NmR+Eg8cVvXazS9kjafj7e6
        SJPiZezOTkwowCHO8f16jqfv6971MToK/g==
X-Google-Smtp-Source: AMsMyM4XwVf55fB1/5Z/v4eTNhC0G2OEB357gZO9XETzSKLTLds7d9gqRPN/KwFnjwYUatn9T7BOhA==
X-Received: by 2002:a05:6214:4101:b0:4af:8cdc:20c4 with SMTP id kc1-20020a056214410100b004af8cdc20c4mr27757784qvb.6.1665665287703;
        Thu, 13 Oct 2022 05:48:07 -0700 (PDT)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com. [209.85.219.182])
        by smtp.gmail.com with ESMTPSA id q22-20020a05620a0d9600b006c479acd82fsm18789564qkl.7.2022.10.13.05.48.06
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Oct 2022 05:48:06 -0700 (PDT)
Received: by mail-yb1-f182.google.com with SMTP id k3so1883099ybk.9
        for <linux-renesas-soc@vger.kernel.org>; Thu, 13 Oct 2022 05:48:06 -0700 (PDT)
X-Received: by 2002:a05:6902:563:b0:6be:5f26:b9b7 with SMTP id
 a3-20020a056902056300b006be5f26b9b7mr33432054ybt.36.1665665285758; Thu, 13
 Oct 2022 05:48:05 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1665583435.git.geert+renesas@glider.be> <c3a01a8de924d6a3fcdb1ee0284544ad2ea5c8ec.1665583435.git.geert+renesas@glider.be>
 <Y0gCT0wFaT/OubiV@shikoro>
In-Reply-To: <Y0gCT0wFaT/OubiV@shikoro>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 13 Oct 2022 14:47:53 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUFZsk94fYbV9LN4b15s4Snc_327YixsK9xOU_erpjC7A@mail.gmail.com>
Message-ID: <CAMuHMdUFZsk94fYbV9LN4b15s4Snc_327YixsK9xOU_erpjC7A@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: renesas: white-hawk-cpu: Add QSPI FLASH support
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Hai Pham <hai.pham.ud@renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram,

On Thu, Oct 13, 2022 at 2:19 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> On Wed, Oct 12, 2022 at 04:06:51PM +0200, Geert Uytterhoeven wrote:
> > From: Hai Pham <hai.pham.ud@renesas.com>
> >
> > Describe the QSPI FLASH on the White Hawk CPU board.
> >
> > Signed-off-by: Hai Pham <hai.pham.ud@renesas.com>
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> Looks good, but I can't really review the partition sizes. However,

Actually I just kept the partition sizes from the BSP.
As the second partition on my board is still empty, all I could verify
is that the first partition is sufficiently large to hold the boot
loader (ca. 9 MiB).  Note that the boot partition on Falcon is smaller.

> Geert is very good and careful with hex values :)

"i" (from iprint) is your friend...

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
