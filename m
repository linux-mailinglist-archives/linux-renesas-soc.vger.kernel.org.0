Return-Path: <linux-renesas-soc+bounces-23828-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C2CCCC1913E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Oct 2025 09:36:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id CFD1B5655DD
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Oct 2025 08:29:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D47D31812F;
	Wed, 29 Oct 2025 08:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GHp/1Kca"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DF08313260
	for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Oct 2025 08:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761726070; cv=none; b=Djt/6yuoulyH76ZJmuFi5JagwBkWbHzi/lIvhq/e0QQr/3T2T7Oq/Ly/gmyIqq3l+kJOG+31VJKzSOcQn/laCAr8+cokczOekoA6tsF8cP0w69h9Y2oCjLMAUf6SDS3yfTfRCPFs/yYI0nU23c7aqSP7TNP/ZgNk5xbrM7mhhRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761726070; c=relaxed/simple;
	bh=YvpqraNS2DmQtSqvMgvUzfp+mnUD4shcDi4PHRgBkBc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZunHsco7ULoFNTR3jCtaSMNviA0QoG53mAzfEfTvR2bDl6drQu1HsFFG09C7DR1qBtndO1FEmqo74GQdnjNPDBGCuCosSkQCPO9uIpBCUdulpP0WMBpOutOqSWdABNA5Z8xqbUjijJ1Q3z3cXFAkJJXyyDBEifN65SAA3bZqkYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GHp/1Kca; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-427015003eeso6072278f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Oct 2025 01:21:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761726065; x=1762330865; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wW6IRdIBhUetAuPh0pBdlfNENv4jvRassCxbHPsKnSI=;
        b=GHp/1Kca+8QVrQvvY5v+eC3dCBGNkHN8H1RbyNEhKFsYhMYpYxTstLVWH7kUp+FTF0
         XeDzseGBieUYbEZROaqeGscVcras6JAAEmX3Jqtepcuq31WkAs60QOs1+AQZ2NzmpDsA
         MTjlfRTtUvwN2GBOHrL2mS6VwY1ltydUDy/4VVFVo8/iH0GMImRfiBeFlueu1mRuICjI
         wMNqvcnZXgfYfWzUusIc+M8iNWnBrx0i8tYmbgz6RERf1te9mWw+GREstNC6TsjP9GiC
         i67cpxBMfgvEik/SxgpY4CuXVKCgsjj0ui2oXhsoAZC//7jaFBYtDE5z6skQTNB7CUab
         QGKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761726065; x=1762330865;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wW6IRdIBhUetAuPh0pBdlfNENv4jvRassCxbHPsKnSI=;
        b=uj0jataIbgrfpQRsRjIEi1s7LLl+ZFuhB5vL+GCSHHhinCUnY4/ZtZwtuqPUPtSUtZ
         Ou9kMUjR8rUg2WUEdresFgAtH0+hDq0T5u0DFcCb1S/L5qY64Xbkm/w2F519p4m6jLST
         HTDdX/QsBpH2LRRJcFFkt4TUaujI7prDMxBpueBYzldOz3yNL+lT6oB79cuACrM7Bw/i
         VSADEyRPGz/x7ANPA8++nrobsWW3s2ME0vzZhgDjgIEK4cXz6qxJwxvv+WwpTHPFOMs8
         vN7KMVPAcRQalE/a3LCcBKAb7bSE6P/9dYnrZSSzsfIc58bO+ZZPRUATPh7+GYwpkWz+
         eDWg==
X-Forwarded-Encrypted: i=1; AJvYcCVYjLsVFMjAHKhd9N3lBWgsrdosDIlXpwRMQqFVFEe31wHX71cUr+8o/WyAn8Cwofgo/5FBNXzfS0fwb4TRES6u7A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwQb52CoX8vkmrRhQQFtEHvKvF0E+6ztNQGG53JvgfngqZo5ei4
	x1r2LnE1q/FaltkhRCxQjVElVoNd2zkAncgP5xNx2870Z8bLqyF11HVa
X-Gm-Gg: ASbGnctTYBcdKKc5m2Y7byjHa6Tjf/RMkeM6qUEBkEta+JefxpJ4OR8FmCe0UQBx/+t
	FJHJQjC/3tcwkXBzPZuHziPJKItIemDXuoBi6lMyfhn2kpEIhjE/y+DneUIK6adF9RhAqXSpczg
	AP2MTEIrudZgxE1lQdjEUs+w27hWkutg9tUjYETx11nc9iB05EU0BcMClnkkpBZwO6BEn2JiL9l
	kA3EOnlH9sUtimwGZzvGSFEyYVK/dmkyyQozDqsRspCHR0zbVWuECz9jU7KLzcl0sGnw7FIdkR8
	WV3pezZ8BEaEhknIlPGGa8T1b9H5d9uItaGeBAgwl+5qALysfGQvB3IyXLS9iX0R2s/JlZddvsK
	HvGIs1VSVDkKCJYtE5XgYHy7YhanuDoLW+xQlKQHs0bZ0vGg4nQBrioB1FAd1M64VWJNqktgbKZ
	G2cHjSnRVWcIM7gPdb4vaS44EDPyGd9DkWr/fKFP336wzDtbKj6uBSC0N+InfH
X-Google-Smtp-Source: AGHT+IFe0RPTgcm6P2nkvsmiEiNCMG16kADfs4KIy98NqJ2br7YI+TqzdQIPzDxNgFJX1lZZcKgPQw==
X-Received: by 2002:a05:6000:26d1:b0:429:8b47:2f35 with SMTP id ffacd0b85a97d-429aef80db3mr1787632f8f.26.1761726064580;
        Wed, 29 Oct 2025 01:21:04 -0700 (PDT)
Received: from biju.lan (host86-162-200-138.range86-162.btcentralplus.com. [86.162.200.138])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4771e196a22sm35191915e9.5.2025.10.29.01.21.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 01:21:04 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Nam Cao <namcao@linutronix.de>,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org,
	stable@kernel.org
Subject: [PATCH v2 2/2] serial: sh-sci: Fix deadlock during RSCI FIFO overrun error
Date: Wed, 29 Oct 2025 08:20:57 +0000
Message-ID: <20251029082101.92156-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251029082101.92156-1-biju.das.jz@bp.renesas.com>
References: <20251029082101.92156-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

On RSCI IP, a deadlock occurs during a FIFO overrun error, as it uses a
different register to clear the FIFO overrun error status.

Cc: stable@kernel.org
Fixes: 0666e3fe95ab ("serial: sh-sci: Add support for RZ/T2H SCI")
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * Split the fixes patches from original series.
---
 drivers/tty/serial/rsci.c          | 1 +
 drivers/tty/serial/sh-sci-common.h | 1 +
 drivers/tty/serial/sh-sci.c        | 8 ++++++--
 3 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/serial/rsci.c b/drivers/tty/serial/rsci.c
index b3c48dc1e07d..3e1f4b3c4e59 100644
--- a/drivers/tty/serial/rsci.c
+++ b/drivers/tty/serial/rsci.c
@@ -414,6 +414,7 @@ static const struct sci_port_params_bits rsci_port_param_bits = {
 	.rxtx_enable = CCR0_RE | CCR0_TE,
 	.te_clear = CCR0_TE | CCR0_TEIE,
 	.poll_sent_bits = CSR_TDRE | CSR_TEND,
+	.overrun_clr = CFCLR_ORERC,
 };
 
 static const struct sci_port_params rsci_port_params = {
diff --git a/drivers/tty/serial/sh-sci-common.h b/drivers/tty/serial/sh-sci-common.h
index e3c028df14f1..bcdb41ddc15d 100644
--- a/drivers/tty/serial/sh-sci-common.h
+++ b/drivers/tty/serial/sh-sci-common.h
@@ -51,6 +51,7 @@ struct sci_port_params_bits {
 	unsigned int rxtx_enable;
 	unsigned int te_clear;
 	unsigned int poll_sent_bits;
+	unsigned int overrun_clr;
 };
 
 struct sci_common_regs {
diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
index 62bb62b82cbe..b33894d0273b 100644
--- a/drivers/tty/serial/sh-sci.c
+++ b/drivers/tty/serial/sh-sci.c
@@ -1024,8 +1024,12 @@ static int sci_handle_fifo_overrun(struct uart_port *port)
 
 	status = s->ops->read_reg(port, s->params->overrun_reg);
 	if (status & s->params->overrun_mask) {
-		status &= ~s->params->overrun_mask;
-		s->ops->write_reg(port, s->params->overrun_reg, status);
+		if (s->type == SCI_PORT_RSCI) {
+			s->ops->clear_SCxSR(port, s->params->param_bits->overrun_clr);
+		} else {
+			status &= ~s->params->overrun_mask;
+			s->ops->write_reg(port, s->params->overrun_reg, status);
+		}
 
 		port->icount.overrun++;
 
-- 
2.43.0


