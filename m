Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 48DB2766568
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Jul 2023 09:34:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233546AbjG1HeI convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 28 Jul 2023 03:34:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231910AbjG1HeH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 28 Jul 2023 03:34:07 -0400
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02E7EB6
        for <linux-renesas-soc@vger.kernel.org>; Fri, 28 Jul 2023 00:34:06 -0700 (PDT)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-583f837054eso19307587b3.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 28 Jul 2023 00:34:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690529645; x=1691134445;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LjZ+2lMyWd1yujiMboXAmmUAYWYVQiLkKfCWB6zgCK8=;
        b=WFFdAoazJX2VTnoZSQyDdNQLsg7nNFK9GXLrpfk7jmxz1UOeiEowlzmZiWF3jYxepk
         Ov6cB1vMlqPXoPZkC7fl184Fbp8HB3xRRihk3pyFeK5yIFT6L+x41fkRTFJ+Lx5DRadC
         1ojNdGbJjHLXV87BM/UPfjVqYDNucrZLJ04P/tG3oos4ATUOtDdnmDY8sbSWIkZyfDbh
         1eQ/wlgk6ZRibQKw30SNjwZvkCeYAMHIVHNBDX6OtzUtlf7J7+fbFP5KKSkoeOrTHnfu
         CyCjpx8GIrSC8e69ap91NbPpxhPMKVUqcxQ9zPAJhsGnKo9uhkqvSHVMRGmv81aCLfQO
         xnWw==
X-Gm-Message-State: ABy/qLYX7j6v+DnqTxi0JbvOw40eK9q5rOTKE7HGqsnhD2J1zRYDH8Jb
        q1a6/mcSBZMoX4QcieL8qrU3ZIxHYES/lQ==
X-Google-Smtp-Source: APBJJlFY/HPSxBcU9W9LUJa0EVWFjV8b1ye18j963H9x1a8jPQFth9Ic+zv6A2bhLYtNrAKaJQyc8w==
X-Received: by 2002:a0d:d443:0:b0:57a:8ecb:11ad with SMTP id w64-20020a0dd443000000b0057a8ecb11admr1161580ywd.43.1690529644896;
        Fri, 28 Jul 2023 00:34:04 -0700 (PDT)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com. [209.85.219.173])
        by smtp.gmail.com with ESMTPSA id v186-20020a0dd3c3000000b0055a373a7e5asm908725ywd.131.2023.07.28.00.34.04
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Jul 2023 00:34:04 -0700 (PDT)
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-cfd4ea89978so1627716276.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 28 Jul 2023 00:34:04 -0700 (PDT)
X-Received: by 2002:a25:514:0:b0:d06:f0ab:e17b with SMTP id
 20-20020a250514000000b00d06f0abe17bmr984545ybf.55.1690529644412; Fri, 28 Jul
 2023 00:34:04 -0700 (PDT)
MIME-Version: 1.0
References: <20230728014659.411751-1-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <20230728014659.411751-1-yoshihiro.shimoda.uh@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 28 Jul 2023 09:33:53 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXzWE7NrtPi0hW_APo+Dg-skDMeyAEjVxmUXy9M0jKn_Q@mail.gmail.com>
Message-ID: <CAMuHMdXzWE7NrtPi0hW_APo+Dg-skDMeyAEjVxmUXy9M0jKn_Q@mail.gmail.com>
Subject: Re: [PATCH v4] iommu/ipmmu-vmsa: Allow PCIe devices
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     joro@8bytes.org, will@kernel.org, robin.murphy@arm.com,
        iommu@lists.linux.dev, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Jul 28, 2023 at 4:40 AM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> IPMMU hardware on R-Car Gen3 and RZ/G2 is simple. Each bus-master
> device like eMMC host and PCIe controllers has a micro-TLB of
> The IPMMU, and after enabled it, all transactions of the device are
> under the IPMMU.
>
>  eMMC host ---(micro-TLB of eMMC)--- IPMMU cache --- IPMMU main
>  PCIe --------(micro-TLB of PCIe)--- IPMMU cache --- IPMMU main
>
> Now this IPMMU driver allows eMMC host, and it is safe to use
> the IPMMU. So, we can assume that it is safe to use the IPMMU
> from PCIe devices too, because all PCIe devices transactions will
> go to the micro-TLB of PCIe. So, add a new condition whether
> the device is a PCIe device or not in the ipmmu_device_is_allowed()
> which will be called if the PCIe host controller has iommu-map
> property.
>
> This can improve CPU load because the PCIe controllers only have
> a capability for lower 32-bit memory area so that this can avoid
> using swiotlb.
>
> Note that IPMMU on R-Car Gen4 is different than R-Car Gen3 and
> RZ/G2's one, especially OS-ID. But, for now, the IPMMU driver
> takes care of OS-ID 0 only. In other words, all PCIe devices will
> go to the micro-TLB of PCIe.
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
> Changes from v3:
> https://lore.kernel.org/all/20230529063928.1030014-1-yoshihiro.shimoda.uh@renesas.com/
>  - Rebase the latest iommu/next branch.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
