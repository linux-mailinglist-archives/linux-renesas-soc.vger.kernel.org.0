Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B40C061A557
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  5 Nov 2022 00:07:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229591AbiKDXHR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 4 Nov 2022 19:07:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229542AbiKDXHQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 4 Nov 2022 19:07:16 -0400
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 427E7D7F
        for <linux-renesas-soc@vger.kernel.org>; Fri,  4 Nov 2022 16:07:12 -0700 (PDT)
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=diego.localnet)
        by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <heiko@sntech.de>)
        id 1or5m9-00020w-A4; Sat, 05 Nov 2022 00:07:01 +0100
From:   Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To:     Palmer Dabbelt <palmer@dabbelt.com>,
        Conor Dooley <Conor.Dooley@microchip.com>,
        "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        "Lad, Prabhakar" <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-riscv <linux-riscv@lists.infradead.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [QUERY]: RZ/Five (AX45MP) non-coherent DMA
Date:   Sat, 05 Nov 2022 00:07:00 +0100
Message-ID: <13365637.uLZWGnKmhe@diego>
In-Reply-To: <CA+V-a8u_u9Q6Hb8kOZVKFjGyPsc2HQt88c4y2Nh8dzx0XSebeA@mail.gmail.com>
References: <CA+V-a8u_u9Q6Hb8kOZVKFjGyPsc2HQt88c4y2Nh8dzx0XSebeA@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_PASS,
        T_SPF_HELO_TEMPERROR autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Prabhakar,

Am Freitag, 4. November 2022, 23:09:15 CET schrieb Lad, Prabhakar:
> When trying to add non coherent DMA support for the RZ/Five SoC, I was
> suggested to use the ALTERNATIVE() macro [0].
> 
> My initial intention was to implement the alternative_call_x()
> something like what x86 has and from there call the C function, So
> while doing some experiments I realized that using the asm "call
> <func>" would cause adding the whole lot of registers in the clobbers
> list.
> 
> As per my understanding the only correct approach to
> alternative_call_x() is if the function itself is inline assembly then
> we know the exact registers being used and then we could add them
> appropriately in the clobbers list.

I'm working in a quite similar area right now and I've Cc'ed you on a
RFC series when I'm also worked on makeing call work in alternatives.

As you noted, using assembler for the call'ed function makes things
way easier to handle.

> The problem with the above approach being we have quite a lot of C
> code [1] for the CMO and it also requires some register writes of the
> l2 cache controller, converting this to assembly would be a pain.
> 
> * Is my understanding correct?
> * Is there any other approach I am missing?
> * Is there no way out apart from implementing inline asm?

In the inline-asm part that will form the alternative, can you
not just save and restore the registers manually around the
actual call?

ALTERNATIVE(
[1] ... nops ...,
[2] ... CMO ...,
[3] ... THEAD ...,
[4] save registers to stack
    call ax45mp dma-func
    restore registers from stack

That way you would no incur many penalties to the other alternatives
I think.


Heiko

> [0] https://patchwork.kernel.org/project/linux-riscv/cover/20221019220242.4746-1-prabhakar.mahadev-lad.rj@bp.renesas.com/
> [1] https://patchwork.kernel.org/project/linux-riscv/patch/20221019220242.4746-3-prabhakar.mahadev-lad.rj@bp.renesas.com/
> 
> Cheers,
> Prabhakar




