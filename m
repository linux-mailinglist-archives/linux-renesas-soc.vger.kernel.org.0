Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 16AAB6EA6D4
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Apr 2023 11:23:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231529AbjDUJXI convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 21 Apr 2023 05:23:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231519AbjDUJXI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 21 Apr 2023 05:23:08 -0400
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D93E8691;
        Fri, 21 Apr 2023 02:23:07 -0700 (PDT)
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-b9582901279so1847835276.2;
        Fri, 21 Apr 2023 02:23:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682068986; x=1684660986;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PcG48aX7n/qye/9L0WzQrlMoKf9xb+nCixEC8GyL2AE=;
        b=HL0Hi+LGZo3FwRo1iHLCHjZEnDP6AzAQuoJ3MXmtk8MVA6SKjNHot7V/7cGmz33plU
         XLVKx3Yjd5oradcpLeEBQVRQCglmi/80D0Hm8bYk2KBtpvz/42yWLmSe9tuJhQRe2DTk
         K/mi9Dg9Y8Mi98LI7NyZYr8Xm4LdNAS3aBXN0Mk6dSNllpWACFvV45EKeAr6EK11GSK2
         jOCLMF6fMoObk3WWMqLMRPA4Cn+syHDxGFLRY6PxnBiDuDB/MI5k+VE6i/lFpp255m9d
         jm5uKY3MJV5nPSQWzbvlpsyVRsDRRvuSqPQNGSdoRSZBKWttTc4RDLdnDYvN2GCe/UP5
         c1zA==
X-Gm-Message-State: AAQBX9fTW7LB8ilMh1YotnDKrk29hpg1tazgzbZ7eGIuKInEqJdFcFQN
        RqGHOVXQZDdXMHxYl3seHfO3oZuSNcrJV35P
X-Google-Smtp-Source: AKy350afFVTfnk1lugz7FISd4PtykI16unfRAt22qXHCZB1ZeXKIZv3Z/Bg3pTf8/xWBnPUBh1NVQg==
X-Received: by 2002:a25:c014:0:b0:b8e:cdba:efbf with SMTP id c20-20020a25c014000000b00b8ecdbaefbfmr1460992ybf.48.1682068986085;
        Fri, 21 Apr 2023 02:23:06 -0700 (PDT)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com. [209.85.219.181])
        by smtp.gmail.com with ESMTPSA id c134-20020a814e8c000000b00555abba6ff7sm854857ywb.113.2023.04.21.02.23.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Apr 2023 02:23:05 -0700 (PDT)
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-b9582901279so1847812276.2;
        Fri, 21 Apr 2023 02:23:05 -0700 (PDT)
X-Received: by 2002:a0d:d98f:0:b0:541:7193:e136 with SMTP id
 b137-20020a0dd98f000000b005417193e136mr1358109ywe.23.1682068985415; Fri, 21
 Apr 2023 02:23:05 -0700 (PDT)
MIME-Version: 1.0
References: <20230412145053.114847-1-biju.das.jz@bp.renesas.com> <20230412145053.114847-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20230412145053.114847-3-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 21 Apr 2023 11:22:54 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXFUGfZTVAicJnaT7pLo8_AbmaXvVVz==Sqjma__bobgQ@mail.gmail.com>
Message-ID: <CAMuHMdXFUGfZTVAicJnaT7pLo8_AbmaXvVVz==Sqjma__bobgQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/5] tty: serial: sh-sci: Add RZ/G2L SCIFA DMA rx support
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        linux-serial@vger.kernel.org,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
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

On Wed, Apr 12, 2023 at 4:51 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> SCIFA IP on RZ/G2L SoC has the same signal for both interrupt
> and DMA transfer request. Setting DMARS register for DMA transfer
> makes the signal to work as a DMA transfer request signal and
> subsequent interrupt requests to the interrupt controller
> are masked. Similarly clearing DMARS register makes signal to work as
> interrupt signal and subsequent interrupt requests to the interrupt
> controller are unmasked.
>
> Add SCIFA DMA rx support for RZ/G2L alike SoCs by disabling RXI line
> interrupt and setting DMARS registers by DMA api for DMA transfer request.
>
> Apart from this, we must set FIFO trigger to 1 for the expected behavior
> of the receive transmission.
>
> While at it replace the parameter irq to s->irqs[SCIx_RXI_IRQ] in
> disable_irq_nosync() to match enable_irq() in sci_dma_rx_reenable_irq().
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v3->4:
>  * Updated commit description.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
