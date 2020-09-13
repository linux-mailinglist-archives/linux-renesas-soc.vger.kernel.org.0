Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0FD0B268073
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 13 Sep 2020 19:07:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725963AbgIMRHY (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 13 Sep 2020 13:07:24 -0400
Received: from mail.kernel.org ([198.145.29.99]:45214 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725938AbgIMRHW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 13 Sep 2020 13:07:22 -0400
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C92F6206C3;
        Sun, 13 Sep 2020 17:07:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600016841;
        bh=M/85VTwrOWN6+XcLUiut1LpRMdDhH1DT4crRdQrqqvg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Nm1OIuGKbIXj9ZE7Sg6RoBQLL9+UTEBm4/sGjbY0MDJQzwvJHpSocao20P89GCzBR
         vOjQfKoyHFXHN20eEQZsN9tqT3j6q5BkEicNmJ/wKsbduRBEwW532zmKLfqD3WS7+p
         XguyLGRtHlpGP9CqYJMugCbZddh1IcOOs6lK7PKU=
Received: from 78.163-31-62.static.virginmediabusiness.co.uk ([62.31.163.78] helo=wait-a-minute.lan)
        by disco-boy.misterjones.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <maz@kernel.org>)
        id 1kHVTD-00BTTZ-Qm; Sun, 13 Sep 2020 18:07:20 +0100
From:   Marc Zyngier <maz@kernel.org>
To:     Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Prabhakar <prabhakar.csengg@gmail.com>,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] irqchip: Kconfig: Update description for RENESAS_IRQC config
Date:   Sun, 13 Sep 2020 18:07:16 +0100
Message-Id: <160001682652.7310.4827295990459252918.b4-ty@kernel.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200911100439.19878-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20200911100439.19878-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 62.31.163.78
X-SA-Exim-Rcpt-To: tglx@linutronix.de, jason@lakedaemon.net, geert+renesas@glider.be, prabhakar.mahadev-lad.rj@bp.renesas.com, prabhakar.csengg@gmail.com, linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, 11 Sep 2020 11:04:39 +0100, Lad Prabhakar wrote:
> irq-renesas-irqc driver is also used on Renesas RZ/G{1,2} SoC's, update
> the same to reflect the description for RENESAS_IRQC config.

Applied to irq/irqchip-next, thanks!

[1/1] irqchip: Kconfig: Update description for RENESAS_IRQC config
      commit: 72d44c0cbc4369cc028429b85f4697957226282c

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.


