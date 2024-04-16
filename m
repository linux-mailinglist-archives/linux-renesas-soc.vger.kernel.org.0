Return-Path: <linux-renesas-soc+bounces-4658-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 239608A6F67
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Apr 2024 17:12:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CE3181F2217B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Apr 2024 15:11:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5811013049C;
	Tue, 16 Apr 2024 15:11:55 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from michel.telenet-ops.be (michel.telenet-ops.be [195.130.137.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70BF512F5BE
	for <linux-renesas-soc@vger.kernel.org>; Tue, 16 Apr 2024 15:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713280315; cv=none; b=V48yJe+Uh/9k1ma8S86pZsnzXJG0CFcRPDoP2OLmk2VdL5gKmZC2bS2wBdfWCMICdeR8xtjIP7DktKcGwAyV69tck4cYE+44BtQhjdw8YCDz28AAho9QQ9ZtggkMpbQ8wyTLAYi1MxU1i/PrmPveIyIBXRmlpbhShKWclVBX8BQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713280315; c=relaxed/simple;
	bh=4i9DUqbUmi5G2UyjqfPTTv3swrA0F4CllH4pCopYeRg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=UvQ7baRBvd4UGMiyLvJbqGHRKGYsgi2wK724YK/SUdXQursHY16tuNBOeTItnT56AsM43DCaaxQpQv1lgWaiUI5yyf9Ox8FFYoAbb/O1QvdVCbNuagQ75bpJOWFS0QjhZswT4KXswunAgbNrH6JPe0VCMb7/alozxsOJLZwQBD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:76d0:2bff:fec8:549])
	by michel.telenet-ops.be with bizsmtp
	id BrBq2C00Q0SSLxL06rBqVq; Tue, 16 Apr 2024 17:11:50 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rwkSo-008EY4-VG;
	Tue, 16 Apr 2024 17:11:50 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rwkTO-00EbHw-Cx;
	Tue, 16 Apr 2024 17:11:50 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH dt-bindings] spi: renesas,sh-msiof: Add r8a779h0 support
Date: Tue, 16 Apr 2024 17:11:48 +0200
Message-Id: <68a4d8ad8638c1133e21d0eef87e8982ddea3dd8.1713279687.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document support for the Clock-Synchronized Serial Interface with FIFO
(MSIOF) in the Renesas R-Car V4M (R8A779H0) SoC.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 Documentation/devicetree/bindings/spi/renesas,sh-msiof.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/spi/renesas,sh-msiof.yaml b/Documentation/devicetree/bindings/spi/renesas,sh-msiof.yaml
index 00acbbb0f65dcf57..49649fc3f95af971 100644
--- a/Documentation/devicetree/bindings/spi/renesas,sh-msiof.yaml
+++ b/Documentation/devicetree/bindings/spi/renesas,sh-msiof.yaml
@@ -54,6 +54,7 @@ properties:
               - renesas,msiof-r8a779a0      # R-Car V3U
               - renesas,msiof-r8a779f0      # R-Car S4-8
               - renesas,msiof-r8a779g0      # R-Car V4H
+              - renesas,msiof-r8a779h0      # R-Car V4M
           - const: renesas,rcar-gen4-msiof  # generic R-Car Gen4
                                             # compatible device
       - items:
-- 
2.34.1


