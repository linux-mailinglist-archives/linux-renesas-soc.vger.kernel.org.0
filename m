Return-Path: <linux-renesas-soc+bounces-30276-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WOS7OdI2xGkAxQQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30276-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2026 20:26:10 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F28B932B300
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2026 20:26:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 070A83020998
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2026 19:25:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA1783A16B0;
	Wed, 25 Mar 2026 19:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="suf2NZff"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5405635B65F
	for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Mar 2026 19:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774466700; cv=none; b=WMZhm2yeesZVBhOY6D7BBq6OaUnIWXFIuDljPDc3v8dc00TcIVsYOUcvIXkpUFw0PczOuuIRgY9NEjYcoJz/mqSzGNZ0EkYxpw6BR17XhlC5L5Zpnc/L4d7ES5YnzPP4dwjFrhUMu0jNZv5xCjitPLcyt5WKCd64MRbdCKNhHyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774466700; c=relaxed/simple;
	bh=9Z/FEUEI7IKD3/xYNJ+3r3mkZ4auHrIx0kRdou6eG4Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OuufymNksgy6zXyMfEkwXK+zvMVHzs/WiWIjTaY0d4Ao9d+qaHNDNsBhjIi4D0hcu+jKanbXhpSQIHDFU21KAMTK1uUs0Vtnk2g0ZR8Nx2j7+onk98hD13ZrBo6FsVuEU2LmUzI8P6oWP2KYDFR8rJKiwCM2afAPHdP+INMMup4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=suf2NZff; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-43b5bded412so119071f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Mar 2026 12:24:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774466698; x=1775071498; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=snoY62jIXeVqVt7nk7FlqUp1jDOYYTaVPX97GLGeLEo=;
        b=suf2NZffSaryaFoytZOhmCd3a+9K9t+ebRt4IAlEuCJAybkBj9KcOzLh9S8R/sK800
         +8IBh2RlF0IIJnUIKF7rGpkCiy2JDzpUsVIpAy4dB/fvcDhgL/X0BjiWOVSHcKi+0sFH
         Q2i6RHLo0/PQnx+Bu/vnuan3gGcrSyLKPBntqsSfdnMZl7FcFJeZKcfyMY5rfZz0NLWs
         +hl+JePPGXq/PVET0F+ZOWMdsP1iX2ifVGO47AGFkQOR7aD0VOPzUFSEDhYUaGwPV+1m
         pBc1axctaqBQzfV88h7f852bUUC5h1oPcv5uUYeo5/0YUXzHhMo7irm3uyM10nO/NPVu
         fZsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774466698; x=1775071498;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=snoY62jIXeVqVt7nk7FlqUp1jDOYYTaVPX97GLGeLEo=;
        b=CkXMFrfC1RBrWnx5jnM7yAI4YcY7TydGrROlPsUFqjBfDytKvBDd5JtH4qoQZtsELc
         5XrnuWSCa6ceuoqy4tF9TN8sMvv3I/Y23Vrkt8W4gB8Uj4oGk/xKQJuCGXnQWP448JWn
         LhHMMQss8KaiPcFAKNyR+9QPFnVrXbpirDvvXe7rLzshmcZECXoiSiydCmoB6+M6m0w5
         4Yq3dorxG8r8MjZjJ3OnoN5OXg6DUL9UnI0F09aqKgUnnUIX0gyVtVJah/OC37R445SS
         ZVKKR62haUVByI+aZ6BAJSPFtrQ31BS1Xl1h/FEBqgR2RznPeD2HVhLU7WMKx4olj+R0
         GnTw==
X-Forwarded-Encrypted: i=1; AJvYcCXi1Ig2w2Z3yN9qbX/OJk4+AQNEWoxpAbTLI2ZQheXZbhNIizw+Az6mMJXdRNHEJ/3vhAYbiulo8RTaDO0SJmv+Nw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxCbQ9Yj4p0vrtgNECPCmWph0K4KyHL3CX/UJxIBIiBTJ2/csYs
	eekP0yeVLa9NIIFNR0bF5lWHceeF4iAZzOvDMwbvDKAoXTI9xjUptj2k
X-Gm-Gg: ATEYQzw6GlQQr891HkZHhkTYxcWB+DzcXLYtt4Xkr8rsrBTiiBWW7ktJRF3wx362tcm
	3pBB243FkV1p72oS5xKojhGZjaRLskLXeAJi1InEHBMXH0RR4/eK7Eutk7sjk6EaWguh8YONaxI
	8cEu1tPj204hAEYG81EAMx7+rw1yqQt4tziX646F5Mi61q94X26dghlZUOPrzBTr2I5vsHdsWqb
	K56p1GfQ716xAKaxdQTRdckGiQC+ZMSqg+z3U69zVvYjOxGe9aDD0xzmzHiyGOzQCQo/50a0P23
	ueqUrirb6pel5ZRearzaeeBKv5sluX+xyIl8wsufuwhFOXYYGsxDiBRUNdMjQN7wgdPSQmYH1EX
	qfd8BuguL1C3Z/g5Tjpcd5j2I9CDuDIhEd+/KkH3cd+uYewyFDRALV3on/UmBNUSBzJjJyewoi/
	ASjQYEg7cMEp7F+VUhux546hW8GQWoOCQmtuREbNxdybPSLiQh
X-Received: by 2002:a5d:5f47:0:b0:43b:851c:4479 with SMTP id ffacd0b85a97d-43b88991cbbmr7251231f8f.2.1774466697550;
        Wed, 25 Mar 2026 12:24:57 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:8138:17e4:88b1:468c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b9192e533sm2464485f8f.2.2026.03.25.12.24.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 12:24:57 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v7 04/16] irqchip/renesas-rzg2l: Drop redundant IRQC_TINT_START check in rzg2l_irqc_alloc()
Date: Wed, 25 Mar 2026 19:24:19 +0000
Message-ID: <20260325192451.172562-5-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260325192451.172562-1-biju.das.jz@bp.renesas.com>
References: <20260325192451.172562-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30276-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,glider.be,gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: F28B932B300
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Biju Das <biju.das.jz@bp.renesas.com>

The check `hwirq < IRQC_TINT_START` in rzg2l_irqc_alloc() is unnecessary
as the condition is already guaranteed to be false at that point in the
code. The outer `if (hwirq > IRQC_IRQ_COUNT)` block ensures that hwirq
is always above IRQC_IRQ_COUNT before reaching this check, and since
IRQC_TINT_START <= IRQC_IRQ_COUNT, the guard can never trigger.

Remove the dead code to simplify the allocation path.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v6->v7:
 * No change.
v5->v6:
 * No change.
v5:
 * New patch.
---
 drivers/irqchip/irq-renesas-rzg2l.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/irqchip/irq-renesas-rzg2l.c b/drivers/irqchip/irq-renesas-rzg2l.c
index eb01d4c5aca7..8587d4c5f110 100644
--- a/drivers/irqchip/irq-renesas-rzg2l.c
+++ b/drivers/irqchip/irq-renesas-rzg2l.c
@@ -491,9 +491,6 @@ static int rzg2l_irqc_alloc(struct irq_domain *domain, unsigned int virq,
 	if (hwirq > IRQC_IRQ_COUNT) {
 		tint = TINT_EXTRACT_GPIOINT(hwirq);
 		hwirq = TINT_EXTRACT_HWIRQ(hwirq);
-
-		if (hwirq < IRQC_TINT_START)
-			return -EINVAL;
 	}
 
 	if (hwirq > (IRQC_NUM_IRQ - 1))
-- 
2.43.0


