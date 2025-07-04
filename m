Return-Path: <linux-renesas-soc+bounces-19256-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 380DBAF9BC3
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Jul 2025 22:45:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C5FB51C8705D
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Jul 2025 20:45:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 029B12E36EF;
	Fri,  4 Jul 2025 20:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Ujz4EXF7"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3655F2E36EE
	for <linux-renesas-soc@vger.kernel.org>; Fri,  4 Jul 2025 20:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751661931; cv=none; b=C9Lka/cJBfkgXViNsnY0vfubw26f5GM3M+ObGlLt0RsqWz8NgBJc3rYl6n7qCtZm+lfTDtjfZbpJvJ35RORRcfDoU4U1mZoINRCnkfuVI77tKCPANp5cX9P7PZ4qvW1chjeRbPybYNZuO4yr65sQ2+SWSbi94wOBL5axI3CjIMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751661931; c=relaxed/simple;
	bh=VAsy+1ic81ebTt50+6G/IMNjFMVnulEWralVvaFLfcg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PvXasLKU5zWg4mMezfXVDLNjybykvODEDjZgZRkIufe4xmD9uH+xMwHC/mxjoMcnnnLgbkkKlZVTPsIuKmUzxur9qFzi0gOHjXbh5jjb/bY2C5Gr2b93WxazkfIspk7ZsH5iaZPh/Sl4wNcuGn9psAdFb0nysM2Yg1LG2qFfcjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Ujz4EXF7; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=a4IMrFGuflzsCi
	L4fRNFfdfAnrYJH3pRPbOcnAIC7s4=; b=Ujz4EXF7H00IRVlREAJRDjIDuivgRo
	1tR1FTc41lCy4mNDsSh4SFpjJPR/eyx1+SUJL1IEi/RHIUGwLWFiXwn04HPrxxif
	Rgw7L3sKUz+wJc8bqMT++REJ9906fNhvgEA3yYcAlYDR0GOljiV6JJWpAOLuFM7f
	SzaB2muEqFCWWAbPsWJ9VUAwvX1QasUAamRU8gHt6tKKEFoY1pJ/FcbFswm5Y0jJ
	vctG2CPJ00tDQtKRcFeQukGnTSildUGTKUaTsp863FotDjQG+6NDKpVCHzmPpPtL
	5fYbOU7jSOCH1sRsUtEimBaNM3mxXivb0MlY7G5q2uZd7gIAfTTQqeYg==
Received: (qmail 265717 invoked from network); 4 Jul 2025 22:45:27 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 4 Jul 2025 22:45:27 +0200
X-UD-Smtp-Session: l3s3148p1@DtbpkiA5JrAujnsj
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	linux-i3c@lists.infradead.org
Subject: [PATCH v2] i3c: don't fail if GETHDRCAP is unsupported
Date: Fri,  4 Jul 2025 22:44:32 +0200
Message-ID: <20250704204524.6124-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

'I3C_BCR_HDR_CAP' is still spec v1.0 and has been renamed to 'advanced
capabilities' in v1.1 onwards. The ST pressure sensor LPS22DF does not
have HDR, but has the 'advanced cap' bit set. The core still wants to
get additional information using the CCC 'GETHDRCAP' (or GETCAPS in v1.1
onwards). Not all controllers support this CCC and will notify the upper
layers about it. For instantiating the device, we can ignore this
unsupported CCC as standard communication will work. Without this patch,
the device will not be instantiated at all.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Changes since v1:
* updated commit message

Please note that Joshua Yeong was also in favor of this patch. Sadly, he
did not send an official Acked-by yet.

 drivers/i3c/master.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index fd81871609d9..e53c69d24873 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -1439,7 +1439,7 @@ static int i3c_master_retrieve_dev_info(struct i3c_dev_desc *dev)
 
 	if (dev->info.bcr & I3C_BCR_HDR_CAP) {
 		ret = i3c_master_gethdrcap_locked(master, &dev->info);
-		if (ret)
+		if (ret && ret != -ENOTSUPP)
 			return ret;
 	}
 
-- 
2.47.2


