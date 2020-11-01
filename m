Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E687D2A1FA7
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  1 Nov 2020 17:52:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726791AbgKAQwJ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 1 Nov 2020 11:52:09 -0500
Received: from Galois.linutronix.de ([193.142.43.55]:53772 "EHLO
        galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726730AbgKAQwJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 1 Nov 2020 11:52:09 -0500
From:   Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1604249527;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=aZtASmEsd/FB84mTk1oOXBBdXFIzwqjrsRZ2JdtHEOE=;
        b=rzDR+2zh3P3kB8f1ohciGFUAFS+loOaeUt2q6n+LOzyF4K4yooUpVDBHzkjigj34c6vZLQ
        vrvDKB5XdW0fIBBgZNY/URJ6cHHqkJQzt0FX0pSWkuU1FT4s9f81w9+dKe2AbWgzkNHliQ
        WEWfqgjaz2BqPJ13NO1FiHuCIyQK/GWVyYCeUbeM3CIo0tGZyMMpedMm4yKqzCvWJd9XTs
        vYaMLpMOdqNnCcwtRQ/En1fcjzz9KZvOEgEVUgMHKQWmj0omn6vTryH+f/LBbM9x152oa2
        xR8nHmo2XoZ0fZuTZXFyedM5ftUQCJXpk2SjJpBYqzM84HNzfVzLvbTXEaFjXw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1604249527;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=aZtASmEsd/FB84mTk1oOXBBdXFIzwqjrsRZ2JdtHEOE=;
        b=YXEIzcJmXyl4S9UEy4PEjHt1tgehLjQfzOBdlUK4WLqdODsHxp/XnNQqoIf76chRfQSQ40
        ocMuF+0sU1IUJTCA==
To:     Marc Zyngier <maz@kernel.org>, Jason Cooper <jason@lakedaemon.net>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Greentime Hu <greentime.hu@sifive.com>, palmer@dabbelt.com,
        linux-kernel@vger.kernel.org, atish.patra@wdc.com,
        linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
        anup@brainfault.org
Cc:     Ulrich Hecht <uli+renesas@fpond.eu>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [RFC PATCH] irqchip/sifive-plic: Fix getting wrong chip_data when interrupt is hierarchy
In-Reply-To: <160423261831.76459.6853837344029171039.b4-ty@kernel.org>
References: <20201029023738.127472-1-greentime.hu@sifive.com> <160423261831.76459.6853837344029171039.b4-ty@kernel.org>
Date:   Sun, 01 Nov 2020 17:52:06 +0100
Message-ID: <87y2jl81ft.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Sun, Nov 01 2020 at 12:10, Marc Zyngier wrote:

> On Thu, 29 Oct 2020 10:37:38 +0800, Greentime Hu wrote:
>> This oops is caused by a wrong chip_data and it is because plic_irq_unmask
>> uses irq_get_chip_data(irq_data->irq) to get the chip_data. However it may
>> get another irq_data with the same irq_data->irq if it is hierarchy.
>> 
>> In this case, it will get irq_data of sifive_gpio_irqchip instead of
>> plic_chip so that it will get a wrong chip_data and then the wrong lmask
>> of it to cause this oops.
>> 
>> [...]
>
> Applied to irq/irqchip-next, thanks!

That should go into urgent, the offending commit is in Linus tree already

Thanks,

        tglx
