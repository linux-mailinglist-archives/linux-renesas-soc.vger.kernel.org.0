Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 42A3D7157DA
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 May 2023 10:02:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229854AbjE3ICk convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 30 May 2023 04:02:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229939AbjE3IC1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 30 May 2023 04:02:27 -0400
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CA38106
        for <linux-renesas-soc@vger.kernel.org>; Tue, 30 May 2023 01:02:25 -0700 (PDT)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-565a63087e9so54820537b3.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 30 May 2023 01:02:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685433744; x=1688025744;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nOFXWXeaDpg8hLzCn9B6nFySEWKbyQFw0D/99tzVyO8=;
        b=hZ8/jIs7rWJSVrxTUAMCTsUjhiynuP/KwckLGd54Wx9YAlFhcaaPFhTnfGvaFyxPdw
         ZTg/xL4vJ1qVoxLyeppPb0b7Cj/7yZcu5+sDy89VM2ajFsOUqZOAkWo4OEa3YW1aRkcR
         83gLtOc+ggrJUHO75Bq8tNyoxV6yOj3LvAOzynP034r7x1tWUEpfLtVioI8eTt5FyuKj
         /VBkC0lOK0cBK5GM0HFwYsS5u49VcdsXfqRuYVIU0XVnXOw24/Eajwm34elUWUBKtnjg
         nmVMYunwYQHQP2V6gMS4GbY5o3DCnfks/xTazvzGMjvN7Vg9hMEQzwL3oKQQs9lJT5dz
         Ul1A==
X-Gm-Message-State: AC+VfDzlt8IgdUMoWUrwgvJSI+3D4zKov+gTpZhYM6in0k3fauI2+/2s
        LwwN3Pw4yBqPev7X+9WE6SXvLtVS+kepLQ==
X-Google-Smtp-Source: ACHHUZ5R2gBHAgqEu2qXg84fen74q+IMKp4R2XpLBwV3hmmdtFeKJNynl5N8ikoeaobGgxJU9FlxBQ==
X-Received: by 2002:a0d:dd8b:0:b0:568:98b8:9c25 with SMTP id g133-20020a0ddd8b000000b0056898b89c25mr1805295ywe.50.1685433744070;
        Tue, 30 May 2023 01:02:24 -0700 (PDT)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com. [209.85.219.176])
        by smtp.gmail.com with ESMTPSA id y134-20020a81a18c000000b00545dc7c4a9esm1311120ywg.111.2023.05.30.01.02.23
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 May 2023 01:02:23 -0700 (PDT)
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-ba81f71dfefso5796136276.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 30 May 2023 01:02:23 -0700 (PDT)
X-Received: by 2002:a81:4e8b:0:b0:561:d6dd:bc84 with SMTP id
 c133-20020a814e8b000000b00561d6ddbc84mr1667444ywb.48.1685433743618; Tue, 30
 May 2023 01:02:23 -0700 (PDT)
MIME-Version: 1.0
References: <20230510090358.261266-1-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <20230510090358.261266-1-yoshihiro.shimoda.uh@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 30 May 2023 10:02:11 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUTfGsqfWX7m4kaZvP1XBqPmQZ1fmRwLvGJ=a3OiBZM7g@mail.gmail.com>
Message-ID: <CAMuHMdUTfGsqfWX7m4kaZvP1XBqPmQZ1fmRwLvGJ=a3OiBZM7g@mail.gmail.com>
Subject: Re: [PATCH v3] arm64: dts: renesas: Add IOMMU related properties into
 PCIe host nodes
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     magnus.damm@gmail.com, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, May 10, 2023 at 11:04 AM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> Add iommu-map and iommu-map-mask properties into PCIe host nodes.
> Note that iommu-map-mask should be zero because the IPMMU assigns
> one micro TLB ID only, to the PCIe host.
>
> Also change dma-ranges arguments for IOMMU. Notes that the dma-ranges
> can be used if IOMMU is disabled.
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
> Changes from v2:
> https://lore.kernel.org/all/20230426082812.3621678-1-yoshihiro.shimoda.uh@renesas.com/
>  - Revise the commit description.
>  - Change the fourth argument of iommu-map.
>  - Add IOMMU related propreties into r8a77980 and r8a774{a1,b1,c0,e1}.dtsi.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.5.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
