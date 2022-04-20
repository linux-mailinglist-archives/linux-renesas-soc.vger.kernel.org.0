Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 076AA508BBE
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Apr 2022 17:10:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1380061AbiDTPNV (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 20 Apr 2022 11:13:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1380167AbiDTPNI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 20 Apr 2022 11:13:08 -0400
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B25AC3EA8F;
        Wed, 20 Apr 2022 08:10:22 -0700 (PDT)
Received: by mail-qt1-f169.google.com with SMTP id d14so1161278qtw.5;
        Wed, 20 Apr 2022 08:10:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=l+RWWBZOVEKfmV/oGt1L+poKBhUz7tLCiXooyBi48K4=;
        b=udbD8gwY2EoU78amG3MPfSDMg4GXkosBmk3jK3w5yrdy+JUNihK8A3VnGoxmnlZjcr
         NV8UYaE0cD0BLekxy/kGfvNvg30Pxy/xdX4noScPQSDciEMzOruyySIsPjTGRPqv3xNI
         52r2HaQsDUdGIhCGj7nQfdokew0iWU1Ot/sGF8UZ0/OCGMmM1IhxtzCTZmOLmkrbN8si
         teWliRDj2p14iIlf/E4+Jz9cB/fPSTPcCLgz6eqz3BddxVNwRMM92fJkEDWocOJWtqtz
         Xin45YVxAi7SkMQ13vwNCD8E5B567mW5DukVdohs29gwNeKCkt+FSwi6UNLejAKX75Mo
         nGjQ==
X-Gm-Message-State: AOAM530QyMl8lVMvOfqN9WzTF2k98LgcPITq2qk7QnHwScihC+be087L
        AuHSbmYjT3B6XFRlogfFo6qfZieiMC7fUw==
X-Google-Smtp-Source: ABdhPJzNK74rkFuSs90yl5EniJQrBBa+bdsbJA2aQ4f6XiRICTEH+IWl31wjalGgDe2UzKWBCFMI1w==
X-Received: by 2002:a05:622a:15cc:b0:2f1:fe0b:b3c2 with SMTP id d12-20020a05622a15cc00b002f1fe0bb3c2mr10496753qty.83.1650467421543;
        Wed, 20 Apr 2022 08:10:21 -0700 (PDT)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com. [209.85.219.174])
        by smtp.gmail.com with ESMTPSA id a63-20020ae9e842000000b0069e6722632bsm1671234qkg.39.2022.04.20.08.10.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Apr 2022 08:10:21 -0700 (PDT)
Received: by mail-yb1-f174.google.com with SMTP id g14so68448ybj.12;
        Wed, 20 Apr 2022 08:10:21 -0700 (PDT)
X-Received: by 2002:a5b:984:0:b0:63f:8c38:676c with SMTP id
 c4-20020a5b0984000000b0063f8c38676cmr20864015ybq.393.1650467421064; Wed, 20
 Apr 2022 08:10:21 -0700 (PDT)
MIME-Version: 1.0
References: <20220411124932.3765571-1-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <20220411124932.3765571-1-yoshihiro.shimoda.uh@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 20 Apr 2022 17:10:09 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW-dP80qOhioeq1NkMzeMTCRfxj1J+CuCuKoiC=+6fCfQ@mail.gmail.com>
Message-ID: <CAMuHMdW-dP80qOhioeq1NkMzeMTCRfxj1J+CuCuKoiC=+6fCfQ@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: r8a779f0: Add UFS clock
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     linux-clk <linux-clk@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Apr 11, 2022 at 2:49 PM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> Add the module clock used by the UFS host controller on the Renesas
> R-Car S4-8 (R8A779F0) SoC.
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk-for-v5.19.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
