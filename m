Return-Path: <linux-renesas-soc+bounces-13193-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B4E5A37FEB
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Feb 2025 11:23:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B3F393B45D9
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Feb 2025 10:21:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 266F1216613;
	Mon, 17 Feb 2025 10:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="aGvnMvKd"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EFA42165E3
	for <linux-renesas-soc@vger.kernel.org>; Mon, 17 Feb 2025 10:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739787676; cv=none; b=cIgyAfwlsjtg+Qb+2b0emvTSkfeK19Q5uL9ejdofQbP/+YA5W3Q2VYhBiFqsowAVPjAYvauRdzhr52XVHX4GpL1tZAXxkikcza07c7+qtQ4ymjJEmfGEZRg1escZqE8LQElpHivCs7oawRTp+17Z9Na87xTP5t/5pQ77q49Y2Mo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739787676; c=relaxed/simple;
	bh=E+CdtpKw0Fr3itrO5nVQh5H7EozH9NUcxeLZlD3ZjzQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=gPuTdpOoiVjAJ7CUlZH1fP+DuwFRn1qcHhl/5NMJmVW7Vr+qwKPoecY989xW443/7OzUzje4nWKmslzAt6Ph1xj0mo/EiKb2OA4o70lTBf4v1H+55Rz53ldcDSnoyrqhtjYNpvo3zYnD0dep9Hzr6piPwDccKA10gDZbz9kkcB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=aGvnMvKd; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=eYtK3qE4kxyQG7
	30oBBirz5Orko/YiS6bjJszF5odok=; b=aGvnMvKdHKJkznFkVYxf23UY7Hl5yY
	qebIN/dO/Sn6GhtudAYmgqALnE5vafDGjykapmdPVrujfbhbCOg2ePEQfqJueIkB
	ovbXpsylHIa5enZAAnNvqh9f3Ajfd+xVQXXaAlB2rC0j6BjY+D+tMLQnFZLTVW+G
	wI2y/Mci0lF8Bgc3gymAtgPXyKDgmOdXXyzubduFx7a9cemo5DlsFwAWyZnzVwu0
	Mz+CaVpowuP9nKdXKaJsc3EmNViFR/dYJUVSyzpOPUfCSn/lmqSGPGF2PUqX7KS3
	jRERJ+L8mzQlHlakgvBevnRguwF4Gq17Sz4WpO7dvGTPnBp1DSPawH/g==
Received: (qmail 3250977 invoked from network); 17 Feb 2025 11:21:11 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 17 Feb 2025 11:21:11 +0100
X-UD-Smtp-Session: l3s3148p1@qH8g4lMuksgujnvP
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org,
	linux-i3c@lists.infradead.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH] MAINTAINERS: remove Conor Culhane for Silvaco I3C
Date: Mon, 17 Feb 2025 11:21:08 +0100
Message-Id: <20250217102108.6619-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The maintainer's email address bounced and he was never active publicly,
not a single tag in git history. Remove the entry.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 MAINTAINERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index efee40ea589f..cc4c4add6cce 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21707,7 +21707,6 @@ F:	drivers/video/fbdev/sm712*
 
 SILVACO I3C DUAL-ROLE MASTER
 M:	Miquel Raynal <miquel.raynal@bootlin.com>
-M:	Conor Culhane <conor.culhane@silvaco.com>
 L:	linux-i3c@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
 F:	Documentation/devicetree/bindings/i3c/silvaco,i3c-master.yaml
-- 
2.39.2


