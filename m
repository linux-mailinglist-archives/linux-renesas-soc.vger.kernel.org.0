Return-Path: <linux-renesas-soc+bounces-5998-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 32A84902094
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Jun 2024 13:46:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D89A71F21637
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Jun 2024 11:46:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 932087581D;
	Mon, 10 Jun 2024 11:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Fotbkjmh"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 989BC15B3
	for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Jun 2024 11:46:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718019974; cv=none; b=jcMRNfQ+X2KlfHzlJ4VOfW13g13xsMo+uhF4NDR/YnvL0th8dT4SF76cM6zKFm9qJapFhO3GWLISQdrpHljietiiSZTHl+E+l0psFLNpwqBxC5yVSfs9Y0QtkLSo0KMSHTg3LCvq+HSRTvIFhdbnjHNLl2b90oq8lkB3duuo1f0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718019974; c=relaxed/simple;
	bh=AVa9aJVyYPVIN3+Lbd2nxMFtmQj2U5mcJ+zieE5pC5M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=d6Pz0wAADx3pIliQh8gOUJ+kGmBRdKHkd0XKARzgRLTUh9OPkn0DQ1JfDQiJYBsBcjfIgSX8lu0JX7QIoAmKaDaDFEhDFDhDB5pJls/hbPxdsgXUyvd3dowJLtp4XHtcx2lGf7IPKElQOauocDoffkrYQIDmHbDRkmfyHvLFCUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Fotbkjmh; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=mNoofsJiO+PmbY
	Y+eEjfWy65/WFXdwvEfNTjB5dDO2k=; b=FotbkjmhldpOcZK6TXXgoT7J9b6/e7
	hfqlk07ntzpW+/U6JWCy60Gh4vrBTZgP+9yNFN4DOmtu1cOPh2NPbLYer4zot0AQ
	YXdPpE/jUhv4aULfnVGbL6/kPrMmneyoUThWO2TZKmjCH/tg4CC92dtv3Nwe5/zN
	jrIrvM95vxcFaiUnpEWrkx+Gr4Sx1rGx+DQDhMQczEvtVvSV4wNO9uduvD9D7UGD
	FCl7pqc1379ae93WGZRN1tfW7B9h9BJ/gTevjOXiB/7Z9sdSc0yJ4cJ2vh9y712b
	QTUU92BPY2IB0qJD9Y0l6WTPpdEaSHD1M20dKxo/vzdynvShJG8e8ZMg==
Received: (qmail 62165 invoked from network); 10 Jun 2024 13:46:10 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 10 Jun 2024 13:46:10 +0200
X-UD-Smtp-Session: l3s3148p1@ZuMLsocaWuwgAwDPXymAAHMyzy0c7Kdl
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andy Whitcroft <apw@canonical.com>,
	Joe Perches <joe@perches.com>,
	Dwaipayan Ray <dwaipayanray1@gmail.com>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] checkpatch: really skip LONG_LINE_* when LONG_LINE is ignored
Date: Mon, 10 Jun 2024 13:45:55 +0200
Message-ID: <20240610114554.82496-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For this to happen, all types must be set to "show". So, AND is needed
for the flags, not OR.

Fixes: 47e0c88b37a5 ("checkpatch: categorize some long line length checks")
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 scripts/checkpatch.pl | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 2b812210b412..f81c046a22a1 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -3858,7 +3858,7 @@ sub process {
 			}
 
 			if ($msg_type ne "" &&
-			    (show_type("LONG_LINE") || show_type($msg_type))) {
+			    (show_type("LONG_LINE") && show_type($msg_type))) {
 				my $msg_level = \&WARN;
 				$msg_level = \&CHK if ($file);
 				&{$msg_level}($msg_type,
-- 
2.43.0


