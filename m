Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4193C2A1DC2
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  1 Nov 2020 13:10:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726442AbgKAMKf (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 1 Nov 2020 07:10:35 -0500
Received: from mail.kernel.org ([198.145.29.99]:46124 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726159AbgKAMKf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 1 Nov 2020 07:10:35 -0500
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A81032085B;
        Sun,  1 Nov 2020 12:10:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604232634;
        bh=3EsZhbY3AzgmrAXDY6cs+5RMK8i/szh0FvpUYLjrlPE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=MHZTvPKTLhMgYqQjHKWCLFQh9FBFhdMMoMrH938JvIZMe25aEswDCK5IP1qa9Aj7/
         3s+bkn7vedlNL9YhBUBZhUc9jbHOUFQc3qWnsNcrBAQ/o2EHNsasiR7zS+F7mvsKad
         si6ww9g8JB6vVWuQp+5i2a2ePFE9cYIoKGfIg34Q=
Received: from 78.163-31-62.static.virginmediabusiness.co.uk ([62.31.163.78] helo=wait-a-minute.lan)
        by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94)
        (envelope-from <maz@kernel.org>)
        id 1kZCBs-006PeF-LZ; Sun, 01 Nov 2020 12:10:32 +0000
From:   Marc Zyngier <maz@kernel.org>
To:     Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Ulrich Hecht <uli+renesas@fpond.eu>, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] irqchip/renesas-intc-irqpin: Merge irlm_bit and needs_irlm
Date:   Sun,  1 Nov 2020 12:10:26 +0000
Message-Id: <160423261831.76459.10222300066609758930.b4-ty@kernel.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201028153955.1736767-1-geert+renesas@glider.be>
References: <20201028153955.1736767-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 62.31.163.78
X-SA-Exim-Rcpt-To: tglx@linutronix.de, jason@lakedaemon.net, geert+renesas@glider.be, uli+renesas@fpond.eu, linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, 28 Oct 2020 16:39:55 +0100, Geert Uytterhoeven wrote:
> Get rid of the separate flag to indicate if the IRLM bit is present in
> the INTC/Interrupt Control Register 0, by considering -1 an invalid
> irlm_bit value.

Applied to irq/irqchip-next, thanks!

[1/1] irqchip/renesas-intc-irqpin: Merge irlm_bit and needs_irlm
      commit: b388bdf2bac7aedac9bde5ab63eaf7646f29fc00

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.


