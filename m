Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8D81A785B8E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Aug 2023 17:10:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236215AbjHWPKk convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 23 Aug 2023 11:10:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235333AbjHWPKj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 23 Aug 2023 11:10:39 -0400
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98B34FB;
        Wed, 23 Aug 2023 08:10:37 -0700 (PDT)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-58cd9d9dbf5so77857937b3.0;
        Wed, 23 Aug 2023 08:10:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692803436; x=1693408236;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MA4LbXlxPSyZzisnlsc1WHEiNGHhDyD75Tt9AmmGDm0=;
        b=AywcfYic3oAt3v/2qy4DpgUVgyL8HCir1nBiCTRAZxFwsOJ/O09fts5hyc+R1XIJqg
         +39oTQRGh7ooUlrYdO4YoTkupLOmyUIjDH8rNo8Oei/iAi6njhTbAs8yJddghr90eerk
         7DpGf/Pq567G6aXhtfZO6n6R/Jd8ewzzQdp9qI2suaNNpZvOfpuET1Trgyumtgwrsd/S
         IeWsdQ9MxgCCNvUHT6wKt7epbSJ3LZf/tQflJ8q4KozidXSNJ9gPB4nRWUqDInDdYPlI
         +xio3+SN1Vst37HX278uhQtCpMXkuSldoZcOt5HBD8sSXICKv2KCBZk6qnlD2jm5xHmx
         J5SA==
X-Gm-Message-State: AOJu0YwiU9/ProLI8UWutpPAlyqYMQZz+A83SO41z1CaOXaj9ucAjRoE
        4Y0gaCfj4NOfGNo9TTk61lHi93vMxTpCdQ==
X-Google-Smtp-Source: AGHT+IEgLvRAdUzfVyyGKS2aeh9drKBQSVi15BMO6y+oUyQvw4NddguwXvcf4H9xehwqSJbilB/ATA==
X-Received: by 2002:a0d:ea85:0:b0:58c:9bf3:e19d with SMTP id t127-20020a0dea85000000b0058c9bf3e19dmr12632351ywe.24.1692803436576;
        Wed, 23 Aug 2023 08:10:36 -0700 (PDT)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com. [209.85.219.169])
        by smtp.gmail.com with ESMTPSA id j195-20020a8192cc000000b00576c727498dsm3369434ywg.92.2023.08.23.08.10.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Aug 2023 08:10:35 -0700 (PDT)
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-d74a012e613so4939941276.1;
        Wed, 23 Aug 2023 08:10:35 -0700 (PDT)
X-Received: by 2002:a25:d650:0:b0:d05:2616:3363 with SMTP id
 n77-20020a25d650000000b00d0526163363mr12642782ybg.26.1692803435492; Wed, 23
 Aug 2023 08:10:35 -0700 (PDT)
MIME-Version: 1.0
References: <20230820184402.102486-3-biju.das.jz@bp.renesas.com>
 <ZONgzqlS8bGP0umn@smile.fi.intel.com> <CAMuHMdVY6VNFhMMzub9RrXd1zo=_7brQVtoBtogNuVfhbkg_tA@mail.gmail.com>
 <ZOOBw/3fqdinIwCh@smile.fi.intel.com> <CAMuHMdW8mqtceDxuZ4Ccq0Wrg8ySfFzVC3OBB0AqvfSR-54KYA@mail.gmail.com>
 <ZOOaFioDSpasda82@smile.fi.intel.com> <CAMuHMdU_4Mg==Jh14K0ecVXfLCDt-RbNia5gCwLPjPj3tBQbsA@mail.gmail.com>
 <ZOSfrHUDpaax1FS4@smile.fi.intel.com> <CAMuHMdVwy72utSLBFro7emgG5Hx6xzD8MHwXczAyJJvBpVDgYg@mail.gmail.com>
 <ZOSlRhLiYoZmcDfT@smile.fi.intel.com> <20230823144905.mep6w6fctwcxxrhz@intel.intel>
In-Reply-To: <20230823144905.mep6w6fctwcxxrhz@intel.intel>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 23 Aug 2023 17:10:22 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWW_3Wmq-XFd6HCmHhE2RScWMEUas7O7XuSniXPb3k4Dg@mail.gmail.com>
Message-ID: <CAMuHMdWW_3Wmq-XFd6HCmHhE2RScWMEUas7O7XuSniXPb3k4Dg@mail.gmail.com>
Subject: Re: [PATCH 2/4] usb: typec: tcpci_rt1711h: Convert enum->pointer for
 data in the match tables
To:     Andi Shyti <andi.shyti@kernel.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-renesas-soc@vger.kernel.org,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>
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

Hi Andi,

On Wed, Aug 23, 2023 at 4:49 PM Andi Shyti <andi.shyti@kernel.org> wrote:
> I would rather prefer to store pointers in u64 variables rather
> than integers in a pointer.

"u64" is overkill, as it is too large on 32-bit platforms.
"uintptr_t" (or ("unsigned long") in legacy code) is the correct integer type.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
