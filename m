Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0FB682A1DC7
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  1 Nov 2020 13:10:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726442AbgKAMKn (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 1 Nov 2020 07:10:43 -0500
Received: from mail.kernel.org ([198.145.29.99]:46134 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726347AbgKAMKf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 1 Nov 2020 07:10:35 -0500
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E9CFD20870;
        Sun,  1 Nov 2020 12:10:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604232635;
        bh=pdVWHPmd4uAe+FndPjmn2EeHjCnqsqezsPeF6IRcpHI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=jM+hx5F+dACiPf+stY33/c4R1RbxfpiZmRLl5ETIcdhq1ck3IjqpE5ib5dnMpfVqv
         XuZbpSCpRzgqRSKmpME9SWKp+kSFiJ8iDLbdzuqN9N3peEyigtCi5HKbpKsYXnxt6B
         qrnnMDK0GSgyN73Uu3PDhetD/t+/ZTy/yNuqkGAI=
Received: from 78.163-31-62.static.virginmediabusiness.co.uk ([62.31.163.78] helo=wait-a-minute.lan)
        by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94)
        (envelope-from <maz@kernel.org>)
        id 1kZCBt-006PeF-8R; Sun, 01 Nov 2020 12:10:33 +0000
From:   Marc Zyngier <maz@kernel.org>
To:     Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Greentime Hu <greentime.hu@sifive.com>, palmer@dabbelt.com,
        linux-kernel@vger.kernel.org, atish.patra@wdc.com,
        linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
        anup@brainfault.org
Cc:     Ulrich Hecht <uli+renesas@fpond.eu>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [RFC PATCH] irqchip/sifive-plic: Fix getting wrong chip_data when interrupt is hierarchy
Date:   Sun,  1 Nov 2020 12:10:27 +0000
Message-Id: <160423261831.76459.6853837344029171039.b4-ty@kernel.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201029023738.127472-1-greentime.hu@sifive.com>
References: <20201029023738.127472-1-greentime.hu@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 62.31.163.78
X-SA-Exim-Rcpt-To: tglx@linutronix.de, jason@lakedaemon.net, geert+renesas@glider.be, greentime.hu@sifive.com, palmer@dabbelt.com, linux-kernel@vger.kernel.org, atish.patra@wdc.com, linux-riscv@lists.infradead.org, paul.walmsley@sifive.com, anup@brainfault.org, uli+renesas@fpond.eu, linux-renesas-soc@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, 29 Oct 2020 10:37:38 +0800, Greentime Hu wrote:
> This oops is caused by a wrong chip_data and it is because plic_irq_unmask
> uses irq_get_chip_data(irq_data->irq) to get the chip_data. However it may
> get another irq_data with the same irq_data->irq if it is hierarchy.
> 
> In this case, it will get irq_data of sifive_gpio_irqchip instead of
> plic_chip so that it will get a wrong chip_data and then the wrong lmask
> of it to cause this oops.
> 
> [...]

Applied to irq/irqchip-next, thanks!

[1/1] irqchip/sifive-plic: Fix chip_data access within a hierarchy
      commit: f9ac7bbd6e4540dcc6df621b9c9b6eb2e26ded1d

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.


