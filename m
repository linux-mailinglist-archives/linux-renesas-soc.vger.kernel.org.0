Return-Path: <linux-renesas-soc+bounces-22645-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EA744BB93A5
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 05 Oct 2025 05:04:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A896E3BA75B
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  5 Oct 2025 03:04:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DCB21917FB;
	Sun,  5 Oct 2025 03:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="opvjdKbI";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="VawxWEOo"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E4D1189B84
	for <linux-renesas-soc@vger.kernel.org>; Sun,  5 Oct 2025 03:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759633478; cv=none; b=RtbjzGscoUv8MXldlFWcE8VtG4iR/prwbeQrr3FcTNvKz+JNpP+f3FER3zSYKuD/y4l3gKWzDAWtjCVKDE2zn6a+xLNTq7iF7TxZ3zJeE7fIxY3NhIxQTrNjrM/UIMX95O37UNWhBglGDYTblUiKnimAWXicMvuREndRwFtQB48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759633478; c=relaxed/simple;
	bh=L1kMlO0mvXkV1cZ3SWh4YEHNjvSYVu45XeBmqVkJ+rs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nu90JydYhwzjUOcQ7IPJ4nofR+skKTXsYQBuHiWtTwM1ezeiamvTz4EhKBVejyd9ztxPMiKWWgR3Z72xx16mHD8RdK+qvaisFb/do3sV+iSVOS0bR68iIkL/C7NFTIG9J1yYrasaLBAPMiFOm88alkn3pDe/qF1313td9rih93c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=opvjdKbI; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=VawxWEOo; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4cfS185f53z9sq6;
	Sun,  5 Oct 2025 05:04:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1759633468;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zjkAFGuY+TeWUyTzvy9NaIPiyY++vsBbvoS4/XpMiCA=;
	b=opvjdKbIxTaiPT0kb9v55WJz7K4CuTP/OOfW0K79ng95da/YJGxZn+bKH23MsSx1XDNQgV
	h+2BImRPUWAprdYeUos/fP+Nnaqck3Vxj3QEHH8pmL6r2bBNh9QdBDuOvLmOna6OPaDgq1
	dFQRMB8MbuefwyFlGL29B0kLNjm8C/Hklc/gH37x9hj/BJX4QzGEeIE5n9eKIxgjci/LFj
	LN16YSrDX8g1MeM7gPJUeoAshZUtqedaXItqY7Trlq2z7teTgSvyxox1AtUMN1bekg5Z+0
	3s9UNpeNTlB65nxtEfs7W2LQPOhW3hPKSnNKbvgx0jUgKTzqo83+2dumS2YmEA==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1759633466;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zjkAFGuY+TeWUyTzvy9NaIPiyY++vsBbvoS4/XpMiCA=;
	b=VawxWEOoQETvDF75W+SRPuuCGUaGcK6YOY6Ni9v4idcs1Q5Ibm77B2juHYKxDt+ZYHBHlt
	ckPgRuuXr6PvDT1dlgi1MzwiNHlmd0XTlCXsHVAjBaCl+x3eJuQvj7DIyWatkoPWXJFGge
	78SEV4aA1h/ZQkC8z3/1VR2cNX0RJ4Iq82eQl+HBJM5Rv0512aO/TPKNm/IguBykOuxiS7
	TjhVhMceoXBrA6Rm/35YSGmd3vvyNbzgqliV5cvhMfIcBjOBml+FSCbZV0CRlLX1rqnvNE
	BK+lxoaNR1lLyIJvYp3WdOpI/RmixinHHnOIDA1vcy7Gm5YhGjegZ9vQbyQ6ZQ==
To: dri-devel@lists.freedesktop.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	David Airlie <airlied@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	Simona Vetter <simona@ffwll.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v3 02/11] drm/rcar-du: dsi: Document TXVMSETR PIXWDTH as bitfield
Date: Sun,  5 Oct 2025 05:02:49 +0200
Message-ID: <20251005030355.202242-3-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20251005030355.202242-1-marek.vasut+renesas@mailbox.org>
References: <20251005030355.202242-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: 5y7qxsmtwbg3kxtwfquhba6jtqtynfun
X-MBO-RS-ID: 851773026db280bc497

The register TXVMSETR bitfield PIXWDTH is not a single bit, but a
bitfield. Add a MASK macro and document that the only allowed value
that can ever be written into the bitfield is the current value, 1.
No functional change.

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: David Airlie <airlied@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org
---
V2: New patch
V3: No change
---
 drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h
index dd871e17dcf53..b8a719a13c006 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h
@@ -143,7 +143,8 @@
 #define TXVMSETR_SYNSEQ_PULSES		(0 << 16)
 #define TXVMSETR_SYNSEQ_EVENTS		(1 << 16)
 #define TXVMSETR_VSTPM			(1 << 15)
-#define TXVMSETR_PIXWDTH		(1 << 8)
+#define TXVMSETR_PIXWDTH_MASK		(7 << 8)
+#define TXVMSETR_PIXWDTH		(1 << 8) /* Only allowed value */
 #define TXVMSETR_VSEN_EN		(1 << 4)
 #define TXVMSETR_VSEN_DIS		(0 << 4)
 #define TXVMSETR_HFPBPEN_EN		(1 << 2)
-- 
2.51.0


