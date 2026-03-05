Return-Path: <linux-renesas-soc+bounces-28869-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0CUuNupXqWkh5wAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28869-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 05 Mar 2026 11:16:10 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7466520F8AF
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 05 Mar 2026 11:16:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A440F301051E
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Mar 2026 10:15:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 697323793A7;
	Thu,  5 Mar 2026 10:15:32 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50A1230C60E
	for <linux-renesas-soc@vger.kernel.org>; Thu,  5 Mar 2026 10:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772705732; cv=none; b=lOTUsrDi1LaiEYnNGVEdZw8RMp0UiLVn8ZAsMB/kDpS8m1gs3SNN7V53IErCGM35dbVixm5W6PfAFyjHrIMeVYRh23UeMQX4UdVdLRrDURugr56Ah78PNaGpzjkHWCDlv5z031XNGJWadMgaKGfgFd8IFOnadJFSza9rlkeDpEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772705732; c=relaxed/simple;
	bh=SHgJNv0OmMogUnHRmFjbJRm7UQdoyy+xzb1e6HAHXtM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uxZ+ISq26IXqzY2hWz0WY78xCijHxRTAQJpL7YrtKhehE1CfE1bQjTlWmR0xvHDFF7MaZ4dSNFqbhWugb2786pytdsrrrGln0xM36jL44Y7WFBcx0kh4Up3SXSYVGKpqT77DXnOgHUQqgiokOqBvY96PGq8iPSVRx4ayg3jUz5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BB08C116C6;
	Thu,  5 Mar 2026 10:15:30 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Biju Das <biju.das.jz@bp.renesas.com>
Cc: linux-phy@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] phy: renesas: rzg3e-usb3: Convert to FIELD_MODIFY()
Date: Thu,  5 Mar 2026 11:15:28 +0100
Message-ID: <a52020ba597e2e213b161eee21239f10e6057d9d.1772705690.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 7466520F8AF
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-28869-lists,linux-renesas-soc=lfdr.de,renesas];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[glider.be];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@glider.be,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.998];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[glider.be:mid,glider.be:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

Use the FIELD_MODIFY() helper instead of open-coding the same operation.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
No changes in generated code.
---
 drivers/phy/renesas/phy-rzg3e-usb3.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/phy/renesas/phy-rzg3e-usb3.c b/drivers/phy/renesas/phy-rzg3e-usb3.c
index 6b3453ea0004cf59..7f809ef1bb5135ec 100644
--- a/drivers/phy/renesas/phy-rzg3e-usb3.c
+++ b/drivers/phy/renesas/phy-rzg3e-usb3.c
@@ -78,13 +78,11 @@ static void rzg3e_phy_usb2test_phy_init(void __iomem *base)
 	writel(val, base + USB3_TEST_UTMICTRL2);
 
 	val = readl(base + USB3_TEST_PRMCTRL5_R);
-	val &= ~USB3_TEST_PRMCTRL5_R_TXPREEMPAMPTUNE0_MASK;
-	val |= FIELD_PREP(USB3_TEST_PRMCTRL5_R_TXPREEMPAMPTUNE0_MASK, 2);
+	FIELD_MODIFY(USB3_TEST_PRMCTRL5_R_TXPREEMPAMPTUNE0_MASK, &val, 2);
 	writel(val, base + USB3_TEST_PRMCTRL5_R);
 
 	val = readl(base + USB3_TEST_PRMCTRL6_R);
-	val &= ~USB3_TEST_PRMCTRL6_R_OTGTUNE0_MASK;
-	val |= FIELD_PREP(USB3_TEST_PRMCTRL6_R_OTGTUNE0_MASK, 7);
+	FIELD_MODIFY(USB3_TEST_PRMCTRL6_R_OTGTUNE0_MASK, &val, 7);
 	writel(val, base + USB3_TEST_PRMCTRL6_R);
 
 	val = readl(base + USB3_TEST_RESET);
-- 
2.43.0


