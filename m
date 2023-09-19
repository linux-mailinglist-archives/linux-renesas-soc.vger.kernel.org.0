Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5FB347A692B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Sep 2023 18:49:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231208AbjISQta (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 19 Sep 2023 12:49:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230137AbjISQta (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 19 Sep 2023 12:49:30 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECC4B90;
        Tue, 19 Sep 2023 09:49:24 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94112C433C7;
        Tue, 19 Sep 2023 16:49:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1695142164;
        bh=ix7NOUm3+eMPDOcgR7Tg1AbDPuVYYYf9na74R7V99Do=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=gFJhk1wj9bKUuYo9oybfEXZQNnW+UttL8Ib6gxL5hhwwkJt2dErjogiymdaSIUXds
         HTT9Jymbar8Vv8ejvj7UTkDByIOmbHaQcpcnhbpJ9rG36xWUAcrRq1P/s4kPF3KBLj
         tiwsc4Q512JGN4LDT1YYC8In3/CEtHsR7I0RUiYFR6JKLG/bCiQVnnNEw3ImBvgsdy
         7+RwISYBO3YuphmVI1m6sqMiYz2KoieAfI8J1KcjWyymsViWUGCvbBp+zkfrfBZsQ6
         iDPbutdGmoQjw8fyffEn0DNFT02PSTBkvkI57KKCrJb80bCLjRvaFXDsC4KIjPqrlt
         hUpXVLb2tZrkw==
Received: from [104.132.45.96] (helo=wait-a-minute.misterjones.org)
        by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.95)
        (envelope-from <maz@kernel.org>)
        id 1qiduc-00EOUg-CB;
        Tue, 19 Sep 2023 17:49:22 +0100
Date:   Tue, 19 Sep 2023 17:49:21 +0100
Message-ID: <87a5ti3y7i.wl-maz@kernel.org>
From:   Marc Zyngier <maz@kernel.org>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Biju Das <biju.das.au@gmail.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH 3/3] irqchip: renesas-rzg2l: Fix irq storm with edge trigger detection for TINT
In-Reply-To: <OS0PR01MB59228AD24951D49F3E639BFF86FAA@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230918122411.237635-1-biju.das.jz@bp.renesas.com>
        <20230918122411.237635-4-biju.das.jz@bp.renesas.com>
        <86y1h2cjpb.wl-maz@kernel.org>
        <OS0PR01MB5922748F489467BE2539AA1886FAA@OS0PR01MB5922.jpnprd01.prod.outlook.com>
        <87cyye3zly.wl-maz@kernel.org>
        <OS0PR01MB59228AD24951D49F3E639BFF86FAA@OS0PR01MB5922.jpnprd01.prod.outlook.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI-EPG/1.14.7 (Harue)
 FLIM-LB/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL-LB/10.8 EasyPG/1.0.0 Emacs/28.2
 (x86_64-pc-linux-gnu) MULE/6.0 (HANACHIRUSATO)
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-SA-Exim-Connect-IP: 104.132.45.96
X-SA-Exim-Rcpt-To: biju.das.jz@bp.renesas.com, tglx@linutronix.de, prabhakar.mahadev-lad.rj@bp.renesas.com, claudiu.beznea.uj@bp.renesas.com, geert+renesas@glider.be, biju.das.au@gmail.com, linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, 19 Sep 2023 17:32:05 +0100,
Biju Das <biju.das.jz@bp.renesas.com> wrote:

[...]

> > So you mean that you *already* lose interrupts across a disable followed by
> > an enable? I'm slightly puzzled...
> 
> There is no interrupt lost at all. 
> 
> Currently this patch addresses 2 issues.
> 
> Scenario 1: Extra interrupt when we select TINT source on enable_irq()
> 
> Getting an extra interrupt, when client drivers calls enable_irq()
> during probe()/resume(). In this case, the irq handler on the Client
> driver just clear the interrupt status bit.
>
> Issue 2: IRQ storm when we select TINT source on enable_irq()
> 
> Here as well, we are getting an extra interrupt, when client drivers
> calls enable_irq() during probe() and this Interrupts getting
> generated infinitely, when the client driver calls disable_irq() in
> irq handler and in in work queue calling enable_irq().

How do you know this is a spurious interrupt? For all you can tell,
you are just consuming an edge. I absolutely don't buy this
workaround, because you have no context that allows you to
discriminate between a real spurious interrupt and a normal interrupt
that lands while the interrupt line was masked.

> Currently we are not loosing interrupts, but we are getting additional
> Interrupt(phantom) which is causing the issue.

If you get an interrupt at probe time in the endpoint driver, that's
probably because the device is not in a quiescent state when the
interrupt is requested. And it is probably this that needs addressing.

	M.

-- 
Without deviation from the norm, progress is not possible.
