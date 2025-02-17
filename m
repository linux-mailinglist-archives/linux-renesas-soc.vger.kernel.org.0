Return-Path: <linux-renesas-soc+bounces-13200-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A752A380DA
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Feb 2025 11:56:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4D4D13A84F2
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Feb 2025 10:55:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42B54218AA2;
	Mon, 17 Feb 2025 10:55:00 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6931C21773D;
	Mon, 17 Feb 2025 10:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739789700; cv=none; b=J6Jmw+grzFqqM/n2rtpRVrJEVC39bHDqNEjPzwQGTB0uwOob2KkcZMeTiViYKwMaUOr/0c4rj1nApJXF2LsOTCl7hIq451sESp1hSjBIcVqySc9bvkus4rA6iVeAooMPZMUcj1lDWZkK/I/f7qd9bi4kXXTMHIdT2pyXlQoeAkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739789700; c=relaxed/simple;
	bh=eyzxctzsAXX5DOcsPKM2Kz2wUgfX1sTc7jPIwbVF+po=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uTFvWnUthMY+MdrLDiZ0kFacJD2f5k1CyxFowwlRobVg/1sycwMvn7uHL/t0BxRkOhQEq39hMRraVJv3DCUoLMw6M/gCUZWnSXP6fOeU71S1hislxfOySClzE7xZ3qHeze4+FHd2RVRlIFCxJiYfD35mYqcqzrQiowYvNMiSbHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: 9j6OGQOaTT2cNSuUEtGE1w==
X-CSE-MsgGUID: fyGYRnS+QF+31qBpaBjKSg==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 17 Feb 2025 19:54:58 +0900
Received: from superbuilder.administration.lan (unknown [10.226.93.254])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 9AD28404B0EC;
	Mon, 17 Feb 2025 19:54:55 +0900 (JST)
From: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
To: thierry.bultel@linatsea.fr,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	Thierry Bultel <thierry.bultel.yh@bp.renesas.com>,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org
Subject: [PATCH v2 07/13] serial: sh-sci: Fix a comment about SCIFA
Date: Mon, 17 Feb 2025 11:52:08 +0100
Message-ID: <20250217105354.551788-8-thierry.bultel.yh@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250217105354.551788-1-thierry.bultel.yh@bp.renesas.com>
References: <20250217105354.551788-1-thierry.bultel.yh@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The comment was correct when it was added, at that time RZ/T1 was
the only SoC in the RZ/T line. Since then, further SoCs have been
added with RZ/T names which do not use the same SCIFA register
layout and so the comment is now misleading.

So we update the comment to explicitly reference only RZ/T1 SoCs.

Signed-off-by: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
---
 drivers/tty/serial/sh-sci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
index 924b803af440..b8f9034f891a 100644
--- a/drivers/tty/serial/sh-sci.c
+++ b/drivers/tty/serial/sh-sci.c
@@ -291,7 +291,7 @@ static const struct sci_port_params sci_port_params[SCIx_NR_REGTYPES] = {
 	},
 
 	/*
-	 * The "SCIFA" that is in RZ/A2, RZ/G2L and RZ/T.
+	 * The "SCIFA" that is in RZ/A2, RZ/G2L and RZ/T1.
 	 * It looks like a normal SCIF with FIFO data, but with a
 	 * compressed address space. Also, the break out of interrupts
 	 * are different: ERI/BRI, RXI, TXI, TEI, DRI.
-- 
2.43.0


