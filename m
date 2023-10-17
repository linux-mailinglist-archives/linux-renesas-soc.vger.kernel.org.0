Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B31957CBCF2
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Oct 2023 09:59:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234734AbjJQH7W convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 17 Oct 2023 03:59:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234726AbjJQH7V (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 17 Oct 2023 03:59:21 -0400
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD872F3;
        Tue, 17 Oct 2023 00:59:17 -0700 (PDT)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-5a822f96aedso47252277b3.2;
        Tue, 17 Oct 2023 00:59:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697529557; x=1698134357;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R9M3vO8TKvpu7sLT3D9MNM+ZNPQeT7q9+/iFi4wqDgU=;
        b=PaODHez6am+VoWawHt7q7KnqcXlnU5YTJ29N/WlaoYJfHYKXLePp9IZcIjZeGNHrbl
         lMmNlOQBHylVpUirrOVf6pfTd+gtqMDgcIyWdSFT0lBh4aDyiZcNH0XRSILm+2abJ7aL
         f7NntfMsZ1N+7IfNQzLL8wEO8LBlFrSdglu3xAUz5gggoLcs2o3dbVMTe4eZ/IrDsoXP
         HaF74mgZm+xB6JwtG/IIBjFiLpxOJI2za9tr/tEc6wA88Npb/U01R/De6JD+X/b5iVWl
         dT1Mb+kG1PmqlZBXVuwkbnhN4pps8W7uo+g8dlKnjgKzfUbIRa91qnsvUlSFYUrhh26r
         VSOQ==
X-Gm-Message-State: AOJu0YydBsrLJxTO2Mi7KvpQLaXnpljPFuD+/XREY7ZtQRpWomoSqW1C
        4aCimhYCb9J125F5sO8Ku+rI2viLt04ofA==
X-Google-Smtp-Source: AGHT+IFivF7kiCdUjLmOEYgcF61SO/2Yz9muD3w24YmcRVaiOl0zr8gBDqhunQbDydK5Hum1e/zusA==
X-Received: by 2002:a81:a214:0:b0:5a7:a81b:d9af with SMTP id w20-20020a81a214000000b005a7a81bd9afmr1714590ywg.7.1697529556783;
        Tue, 17 Oct 2023 00:59:16 -0700 (PDT)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com. [209.85.128.170])
        by smtp.gmail.com with ESMTPSA id v194-20020a8148cb000000b0057a918d6644sm412006ywa.128.2023.10.17.00.59.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Oct 2023 00:59:16 -0700 (PDT)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-579de633419so66270177b3.3;
        Tue, 17 Oct 2023 00:59:16 -0700 (PDT)
X-Received: by 2002:a0d:e9c2:0:b0:59b:c6a4:15c7 with SMTP id
 s185-20020a0de9c2000000b0059bc6a415c7mr1352703ywe.46.1697529555871; Tue, 17
 Oct 2023 00:59:15 -0700 (PDT)
MIME-Version: 1.0
References: <20231016054755.915155-1-hch@lst.de> <20231016054755.915155-4-hch@lst.de>
In-Reply-To: <20231016054755.915155-4-hch@lst.de>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 17 Oct 2023 09:59:03 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXO94MVoNVh+=meozYXRwpV8jPTBivLJfDHVTvJn7nW4g@mail.gmail.com>
Message-ID: <CAMuHMdXO94MVoNVh+=meozYXRwpV8jPTBivLJfDHVTvJn7nW4g@mail.gmail.com>
Subject: Re: [PATCH 03/12] soc: renesas: ARCH_R9A07G043 depends on !RISCV_ISA_ZICBOM
To:     Christoph Hellwig <hch@lst.de>
Cc:     Greg Ungerer <gerg@linux-m68k.org>, iommu@lists.linux.dev,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Conor Dooley <conor@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Wei Fang <wei.fang@nxp.com>,
        Shenwei Wang <shenwei.wang@nxp.com>,
        Clark Wang <xiaoning.wang@nxp.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-m68k@lists.linux-m68k.org, netdev@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
        Jim Quinlan <james.quinlan@broadcom.com>
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

On Mon, Oct 16, 2023 at 7:48 AM Christoph Hellwig <hch@lst.de> wrote:
> ARCH_R9A07G043 has it's own non-standard global pool based DMA coherent

its

> allocator, which conflicts with the remap based RISCV_ISA_ZICBOM version.
> Add a proper dependency.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
