Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3A0D33C9E9
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Jun 2019 13:23:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389330AbfFKLXG (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 11 Jun 2019 07:23:06 -0400
Received: from foss.arm.com ([217.140.110.172]:58912 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389200AbfFKLXG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 11 Jun 2019 07:23:06 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7E64F344;
        Tue, 11 Jun 2019 04:23:05 -0700 (PDT)
Received: from [10.1.197.61] (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C3EDD3F557;
        Tue, 11 Jun 2019 04:24:46 -0700 (PDT)
Subject: Re: [PATCH 0/4] irqchip: renesas: Use proper irq_chip name and parent
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20190607095858.10028-1-geert+renesas@glider.be>
From:   Marc Zyngier <marc.zyngier@arm.com>
Openpgp: preference=signencrypt
Autocrypt: addr=marc.zyngier@arm.com; prefer-encrypt=mutual; keydata=
 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
 Z46HaNmN2hZS/oJ69c1DI5Rcww==
Organization: ARM Ltd
Message-ID: <b1720fb0-b638-32d1-7f48-c1f24b64e83f@arm.com>
Date:   Tue, 11 Jun 2019 12:23:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190607095858.10028-1-geert+renesas@glider.be>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 07/06/2019 10:58, Geert Uytterhoeven wrote:
> 	Hi all,
> 
> Recently, Marc pointed out some common misconceptions w.r.t. the .name
> and .parent_device fields in struct irq_chip.  This patch series fixes
> them in the Renesas interrupt controller drivers.
> 
> The first two patches are destined for the irqchip tree, the last two
> for the GPIO tree.
> 
> Thanks!
> 
> Geert Uytterhoeven (4):
>   irqchip/renesas-intc-irqpin: Use proper irq_chip name and parent
>   irqchip/renesas-irqc: Use proper irq_chip name and parent
>   gpio: em: Use proper irq_chip name
>   gpio: rcar: Use proper irq_chip name
> 
>  drivers/gpio/gpio-em.c                    | 2 +-
>  drivers/gpio/gpio-rcar.c                  | 2 +-
>  drivers/irqchip/irq-renesas-intc-irqpin.c | 3 ++-
>  drivers/irqchip/irq-renesas-irqc.c        | 3 ++-
>  4 files changed, 6 insertions(+), 4 deletions(-)
> 

I've applied patches 1 and2 to the irqchip tree.

Thanks,

	M.
-- 
Jazz is not dead. It just smells funny...
