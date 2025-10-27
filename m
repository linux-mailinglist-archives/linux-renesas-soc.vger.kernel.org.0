Return-Path: <linux-renesas-soc+bounces-23663-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DE8FC0F261
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Oct 2025 17:04:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DBEE2465EC9
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Oct 2025 15:53:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09CC131D73E;
	Mon, 27 Oct 2025 15:47:06 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BEF631327F;
	Mon, 27 Oct 2025 15:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761580025; cv=none; b=KYIjDlI9k4craE/aKpqxJRxFJNkbwTDw8IlMKX4oxjSJlZQPpWAzJQJ9EoiGhB0l7XEFZFyOUlIYBoeJu8A7DkSlVH2Pa6O5d4TQcblovpeecr+JT2Mo1TPgBoiVf599gXM7eBCdrx94KvKsp2gho0Ufc4jV5wWeNz24np1eGjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761580025; c=relaxed/simple;
	bh=TmTtQW4ERp85Ma0MqBVY4jX9tpiC0lXn4HgB6wUcJAg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=f0dY+2Kqd6/Yu+y8n66XQLjMrfi8Waa+dxhE4YuVG9AHoAFQF0vg3u6r2Vpz4Pe/y2RD/l8NSt+iNeddjcQnFAES8TXq5BM+4fjZWM3GDenX2pYfj1/+7p7LybUjiyvnRxsb8dPxod0Z8euugylhjtQpyQ3lDPw5M8ck314Rtqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: q/+qx0iHSzCfQGmu9nZyZw==
X-CSE-MsgGUID: S4u4Ss2fRViG3ay9MLkUJA==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 28 Oct 2025 00:47:02 +0900
Received: from localhost.localdomain (unknown [10.226.93.103])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 528F74003EA1;
	Tue, 28 Oct 2025 00:46:59 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Nam Cao <namcao@linutronix.de>,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 10/19] serial: sh-sci: Add RSCI_PORT_{SCI,SCIF} port IDs
Date: Mon, 27 Oct 2025 15:45:57 +0000
Message-ID: <20251027154615.115759-11-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251027154615.115759-1-biju.das.jz@bp.renesas.com>
References: <20251027154615.115759-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

RZ/G3E RSCI tx/rx supports both FIFO and non-FIFO mode. It has 32-stage
FIFO. Add RSCI_PORT_SCI port ID for non-FIFO mode and RSCI_PORT_SCIF port
ID for FIFO mode. Update the rx_trigger for both these modes.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/tty/serial/sh-sci-common.h | 2 ++
 drivers/tty/serial/sh-sci.c        | 3 +++
 2 files changed, 5 insertions(+)

diff --git a/drivers/tty/serial/sh-sci-common.h b/drivers/tty/serial/sh-sci-common.h
index bcdb41ddc15d..ef1d94ae8b5c 100644
--- a/drivers/tty/serial/sh-sci-common.h
+++ b/drivers/tty/serial/sh-sci-common.h
@@ -8,6 +8,8 @@
 /* Private port IDs */
 enum SCI_PORT_TYPE {
 	SCI_PORT_RSCI = BIT(7) | 0,
+	RSCI_PORT_SCI = BIT(7) | 1,
+	RSCI_PORT_SCIF = BIT(7) | 2,
 };
 
 enum SCI_CLKS {
diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
index 4bcd886de75d..77ccf5677561 100644
--- a/drivers/tty/serial/sh-sci.c
+++ b/drivers/tty/serial/sh-sci.c
@@ -3153,6 +3153,9 @@ static int sci_init_single(struct platform_device *dev,
 	case SCI_PORT_RSCI:
 		sci_port->rx_trigger = 15;
 		break;
+	case RSCI_PORT_SCIF:
+		sci_port->rx_trigger = 32;
+		break;
 	default:
 		sci_port->rx_trigger = 1;
 		break;
-- 
2.43.0


