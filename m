Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DAF37692591
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Feb 2023 19:44:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233017AbjBJSn7 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 10 Feb 2023 13:43:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232616AbjBJSn6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 10 Feb 2023 13:43:58 -0500
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3034C2CFCB;
        Fri, 10 Feb 2023 10:43:43 -0800 (PST)
Received: by mail-qt1-f179.google.com with SMTP id g8so6814839qtq.13;
        Fri, 10 Feb 2023 10:43:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l6d5G6T5AsnuA8VHKXHNQd/P4qQ8UiIvgO4UrJudu4s=;
        b=fbhzzY6eOhaVTkb75G/yjL8qbphGuApRWIwg86aM1anOhm6nnoJsNsB8LE45dzQYCp
         TyykADFPqi9TbawjnBLlCVhDLfE/olIrM00m5/vm14pXZ12v8vNfnQtGd/5tKeiOfI2j
         9fTfNGJ5z0N4R6Ik1Z4QQbwBWxRN8IMpouaoKbHcwdWd4b0IkoGojFegJfjVcAW4rx9U
         //2VdqUwMNOAOajFhuFfq99UzGWLuZcZwS5TFAUhXZXxIdJiFQSnZHbu6Gs5GuVuNtDf
         qvZJRxCzGPfnhaD8B4dnPfWOsMw9qeMDmQDsSAasCswBpGhV05Z5KYRVokWFf7Tuy802
         JFag==
X-Gm-Message-State: AO0yUKWyl1miDFFMyb0VK2roMOwrCfSqb488TcoKnDxCWM9omSu34IN2
        AhP19Qr6rtV+srcFYyHdx15LEZ62bLBuIQ==
X-Google-Smtp-Source: AK7set+9jpgVGgutC5pDxNsLsYlz6qnpE7T2mdb6oZWgy2EIvhu9uTDABN0aktLPA21H8zgrQf11CQ==
X-Received: by 2002:ac8:580f:0:b0:3b8:4b00:575e with SMTP id g15-20020ac8580f000000b003b84b00575emr26668702qtg.35.1676054621900;
        Fri, 10 Feb 2023 10:43:41 -0800 (PST)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com. [209.85.219.179])
        by smtp.gmail.com with ESMTPSA id r18-20020ac87ef2000000b003b86b088755sm3825053qtc.15.2023.02.10.10.43.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Feb 2023 10:43:41 -0800 (PST)
Received: by mail-yb1-f179.google.com with SMTP id o66so1541548ybc.0;
        Fri, 10 Feb 2023 10:43:41 -0800 (PST)
X-Received: by 2002:a25:f202:0:b0:880:3ca9:736b with SMTP id
 i2-20020a25f202000000b008803ca9736bmr2118281ybe.464.1676054621188; Fri, 10
 Feb 2023 10:43:41 -0800 (PST)
MIME-Version: 1.0
References: <20230210154140.338352-1-biju.das.jz@bp.renesas.com>
 <20230210154140.338352-4-biju.das.jz@bp.renesas.com> <954bb490-b516-6624-5bb9-e82434fc95f0@linux.intel.com>
 <OS0PR01MB592222F997B7CB5976B7618186DE9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
In-Reply-To: <OS0PR01MB592222F997B7CB5976B7618186DE9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 10 Feb 2023 19:43:30 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVMiMhNXRUDDS1XsKVF--p7F42t1LXNokJi0sDhvpeSig@mail.gmail.com>
Message-ID: <CAMuHMdVMiMhNXRUDDS1XsKVF--p7F42t1LXNokJi0sDhvpeSig@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] serial: 8250_em: Add serial_out() to struct serial8250_em_hw_info
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        linux-serial <linux-serial@vger.kernel.org>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
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

Hi Biju,

On Fri, Feb 10, 2023 at 5:01 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > On Fri, 10 Feb 2023, Biju Das wrote:
> > > As per HW manual section 40.6.1, we need to perform FIFO reset + SW
> > > reset before updating the below registers.
> > >
> > > FCR[7:5], FCR[3:0], LCR[7][5:0], MCR[6:4], DLL[7:0], DLM[7:0] and
> > > HCR0[6:5][3:2].
> > >
> > > This patch adds serial_out() to struct serial8250_em_hw_info to handle
> > > this difference between emma mobile and rz/v2m.
> > >
> > > DLL/DLM register can be updated only by setting LCR[7]. So the
> > > updation of LCR[7] will perform reset for DLL/DLM register changes.
> > >
> > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

> > > --- a/drivers/tty/serial/8250/8250_em.c
> > > +++ b/drivers/tty/serial/8250/8250_em.c
> > > @@ -31,6 +35,40 @@ struct serial8250_em_priv {
> > >     const struct serial8250_em_hw_info *info;  };
> > >
> > > +static void serial8250_rzv2m_reg_update(struct uart_port *p, int off,
> > > +int value) {
> > > +   unsigned int ier, fcr, lcr, mcr, hcr0;
> > > +
> > > +   ier = readl(p->membase + (UART_IER << 2));
> > > +   hcr0 = readl(p->membase + (UART_HCR0 << 2));
> > > +   fcr = readl(p->membase + ((UART_FCR + 1) << 2));
> > > +   lcr = readl(p->membase + ((UART_LCR + 1) << 2));
> > > +   mcr = readl(p->membase + ((UART_MCR + 1) << 2));
> > > +
> > > +   writel(fcr | UART_FCR_CLEAR_RCVR | UART_FCR_CLEAR_XMIT,
> > > +          p->membase + ((UART_FCR + 1) << 2));
> > > +   writel(hcr0 | UART_HCR0_SW_RESET, p->membase + (UART_HCR0 << 2));
> > > +   writel(hcr0 & ~UART_HCR0_SW_RESET, p->membase + (UART_HCR0 << 2));
> > > +
> > > +   switch (off) {
> > > +   case UART_FCR:
> > > +           fcr = value;
> > > +           break;
> > > +   case UART_LCR:
> > > +           lcr = value;
> > > +           break;
> > > +   case UART_MCR:
> > > +           mcr = value;
> > > +           break;
> > > +   }
> > > +
> > > +   writel(ier, p->membase + (UART_IER << 2));
> > > +   writel(fcr, p->membase + ((UART_FCR + 1) << 2));
> > > +   writel(mcr, p->membase + ((UART_MCR + 1) << 2));
> > > +   writel(lcr, p->membase + ((UART_LCR + 1) << 2));
> > > +   writel(hcr0, p->membase + (UART_HCR0 << 2));
> >
> > Perhaps it would make sense to instead of using readl/writel() directly to
> > call serial8250_em_serial_in/out() so all the offset trickery wouldn't need
> > to be duplicated inside this function?
>
> HCR0 register is not available for emma mobile. Is it ok if I just do readl/writel for
> that register and rest will use serial8250_em_serial_in/out()??

According to R19UH0040EJ0400 Rev.4.00 it is available on EMEV2,
and the layout looks identical to RZ/V2M.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
