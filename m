Return-Path: <linux-renesas-soc+bounces-10631-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BAC19D379F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Nov 2024 10:55:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DDA2F1F21CCE
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Nov 2024 09:55:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53A3119F46D;
	Wed, 20 Nov 2024 09:54:59 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [195.130.132.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6DAC19F424
	for <linux-renesas-soc@vger.kernel.org>; Wed, 20 Nov 2024 09:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732096499; cv=none; b=NeBbRMk8CsSmb9/lDmz8m+7JhrhZm2DH/AcL3sMdTGcM2667uJ/5fyj0jJKZPGZ6KbS7of9es7I02/nSr/Dj7JOQWl+fhwQ4kjkjz5JKhaFoRzifM3Tm/E/XkUvSSwbViYNYpUTcGSwjphqw5kMj4Xi2vH42R9h2HeKVY6CRpZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732096499; c=relaxed/simple;
	bh=tIQZK2V0VRP5uQPirf8gZmeYeQXZVoJs/DKnM31Xr4A=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=s3imLNH++buPbZjE1vGrftNtTFl9ndlkh37MAsQ7tqxdaGapfDcQefp31Hl3pv22VyB9MAo5COQKImUxk3xwdRLZeVv5gtH1FgkmaM4hxk3dE1afJcDHT1HYFY9xZYlknVuH76g9xRWwRmLb8NnJ8SyFvGCj2OMbO0dV6v1XQUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:35da:ab43:467b:7991])
	by xavier.telenet-ops.be with cmsmtp
	id exuu2D00R3gUftr01xuurF; Wed, 20 Nov 2024 10:54:55 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1tDhPr-007biR-9f;
	Wed, 20 Nov 2024 10:54:54 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1tDhQE-003eLT-Ix;
	Wed, 20 Nov 2024 10:54:54 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Russell King <linux@armlinux.org.uk>,
	Thomas Gleixner <tglx@linutronix.de>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] ARM: smp: Fix IPI alignment in /proc/interrupts
Date: Wed, 20 Nov 2024 10:54:53 +0100
Message-Id: <96f61cafee969c59796ac06c1410195fa0f1ba0b.1732096154.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On a system with less than 1000 interrupts, prec = 3, causing a
misalignment for the IPI interrupts.  E.g. on Koelsch (R-Car M2-W):

    200:          0          0  gpio-rcar   6 Edge      SW36
    IPI0:          0          0  CPU wakeup interrupts
    IPI1:          0          0  Timer broadcast interrupts
    IPI2:       1701       2844  Rescheduling interrupts
    IPI3:      10338      21181  Function call interrupts
    IPI4:          0          0  CPU stop interrupts
    IPI5:        651        825  IRQ work interrupts
    IPI6:          0          0  completion interrupts
    Err:          0

Fix this by adopting the same solution as used on arm64.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm/kernel/smp.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm/kernel/smp.c b/arch/arm/kernel/smp.c
index 3431c0553f45cdf5..50999886a8b5cbab 100644
--- a/arch/arm/kernel/smp.c
+++ b/arch/arm/kernel/smp.c
@@ -551,7 +551,8 @@ void show_ipi_list(struct seq_file *p, int prec)
 		if (!ipi_desc[i])
 			continue;
 
-		seq_printf(p, "%*s%u: ", prec - 1, "IPI", i);
+		seq_printf(p, "%*s%u:%s", prec - 1, "IPI", i,
+			   prec >= 4 ? " " : "");
 
 		for_each_online_cpu(cpu)
 			seq_printf(p, "%10u ", irq_desc_kstat_cpu(ipi_desc[i], cpu));
-- 
2.34.1


