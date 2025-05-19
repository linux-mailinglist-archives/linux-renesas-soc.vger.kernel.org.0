Return-Path: <linux-renesas-soc+bounces-17201-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BF2D7ABBF43
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 May 2025 15:34:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 29EA23B9DB3
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 May 2025 13:34:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7D862798F1;
	Mon, 19 May 2025 13:34:31 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 284C6198845;
	Mon, 19 May 2025 13:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747661671; cv=none; b=CYEeOkVGz8C8miek4KPPupiLtr1hfmWSEdRoOi9ABbOyE6xsFpPRYv62wwetz8iHlaCLENBrxo39oU2Em/l4Cw3B3w/v2AIJqHxmX2vj29ToG54ZU5TBAwaHOUlX7uTG8wM+bIqxX3ZeOnktScHWEyouIKo/PAR4MwO5b0AUkS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747661671; c=relaxed/simple;
	bh=n/9A2G/oHDSTF9Zj/vCc5RLl1lY8WVggwR4DunaeIvA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=gFXWgN+0AJtMRVh/ur4iHNHhc584TG4FNhVcNIf0m8xI5+GSXMPDmTEcTzNfBJE8iP1HFPDB87uUwT//ZIinIjOj3wROanxpraTiEKaL7iTrLNaL7bAyR4fYws9g3vvH5Rvz1BTLlpl2A01/foy7BJnFhkeZ70zR0slK20NUtCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: mrwcX8wBS7uvk6TIOkQe1w==
X-CSE-MsgGUID: W8IhL62/S1SCzO44BXBuZQ==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 19 May 2025 22:34:22 +0900
Received: from rz-ub2404.betafive.net (unknown [10.226.93.44])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 4CCE2427BD1A;
	Mon, 19 May 2025 22:34:15 +0900 (JST)
From: Paul Barker <paul.barker.ct@bp.renesas.com>
To: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Paul Barker <paul.barker.ct@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Sergey Shtylyov <s.shtylyov@omp.ru>,
	Paul Barker <paul@pbarker.dev>,
	netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] MAINTAINERS: Drop myself to reviewer for ravb driver
Date: Mon, 19 May 2025 13:33:51 +0000
Message-ID: <20250519133354.6564-1-paul.barker.ct@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Maintenance of the ravb driver will be handled by Niklas for now. I
still intend to review patches, and will be using my own email address
going forward.

Signed-off-by: Paul Barker <paul.barker.ct@bp.renesas.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 20e07e61a148..9d64b1fc5180 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20908,8 +20908,8 @@ F:	Documentation/devicetree/bindings/i2c/renesas,iic-emev2.yaml
 F:	drivers/i2c/busses/i2c-emev2.c
 
 RENESAS ETHERNET AVB DRIVER
-M:	Paul Barker <paul.barker.ct@bp.renesas.com>
 M:	Niklas Söderlund <niklas.soderlund@ragnatech.se>
+R:	Paul Barker <paul@pbarker.dev>
 L:	netdev@vger.kernel.org
 L:	linux-renesas-soc@vger.kernel.org
 S:	Maintained
-- 
2.43.0


