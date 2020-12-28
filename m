Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 19B462E36DB
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 28 Dec 2020 13:03:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727482AbgL1MCj (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 28 Dec 2020 07:02:39 -0500
Received: from www.zeus03.de ([194.117.254.33]:54412 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727450AbgL1MCj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 28 Dec 2020 07:02:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:mime-version:content-type
        :content-transfer-encoding; s=k1; bh=x8d6E7LhLcE7mqb0dlHuGYcSOVz
        ajGK8Q+Yq7j5pGYI=; b=B5mZjNCFkkXC+qrganeTi20gN9XuJDLKo98vGiE0pVC
        6plplB1jc3VviNIs5WjFsJYpdLGRBRQSrj/dUEpnFxdkRsRakiVS0ZZ4EYu0IkdS
        DCPP9Jj2hHMXa4MOtRU3Gdu/lzjB+qjeccX4QGiZ9hVakX/PGL/D21dthzG7+vqU
        =
Received: (qmail 1747085 invoked from network); 28 Dec 2020 13:01:57 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 28 Dec 2020 13:01:57 +0100
X-UD-Smtp-Session: l3s3148p1@PvdqCoW3DJUgAwDPXwIpAOUwDQytQs2L
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-arm-kernel@lists.infradead.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        linux-kernel@vger.kernel.org
Subject: [PATCH] arm: smp: remove unused variable
Date:   Mon, 28 Dec 2020 13:01:47 +0100
Message-Id: <20201228120147.59387-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Not used anymore after refactoring:

arch/arm/kernel/smp.c: In function ‘show_ipi_list’:
arch/arm/kernel/smp.c:543:16: warning: variable ‘irq’ set but not used [-Wunused-but-set-variable]
  543 |   unsigned int irq;

Fixes: 88c637748e31 ("ARM: smp: Use irq_desc_kstat_cpu() in show_ipi_list()")
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Marc Zyngier <maz@kernel.org>
---
 arch/arm/kernel/smp.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/arm/kernel/smp.c b/arch/arm/kernel/smp.c
index 5c48eb4fd0e5..74679240a9d8 100644
--- a/arch/arm/kernel/smp.c
+++ b/arch/arm/kernel/smp.c
@@ -540,12 +540,9 @@ void show_ipi_list(struct seq_file *p, int prec)
 	unsigned int cpu, i;
 
 	for (i = 0; i < NR_IPI; i++) {
-		unsigned int irq;
-
 		if (!ipi_desc[i])
 			continue;
 
-		irq = irq_desc_get_irq(ipi_desc[i]);
 		seq_printf(p, "%*s%u: ", prec - 1, "IPI", i);
 
 		for_each_online_cpu(cpu)
-- 
2.29.2

