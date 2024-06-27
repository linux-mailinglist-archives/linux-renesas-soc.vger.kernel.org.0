Return-Path: <linux-renesas-soc+bounces-6825-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C8DF91A4D1
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Jun 2024 13:15:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7CBE5B21C0A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Jun 2024 11:15:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC443149E1D;
	Thu, 27 Jun 2024 11:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Xar/gbqN"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 487BD13A40D
	for <linux-renesas-soc@vger.kernel.org>; Thu, 27 Jun 2024 11:15:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719486914; cv=none; b=KWLRFMs/lrkyI1xEBo3sLaCXtLbugeEgLiYByXe4kaLwhcJd7YclGhxNmQJtG7zCfXmoFoXbhrm0xyfMzNyhEU+5QOHrkWAWK9Mv2y7x8QRdYUUHD/31uBmS8wdG6bqq0+ZxJxWYBPYh+1/tqO6dvt8UEhDtGXrevqif/2OMgBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719486914; c=relaxed/simple;
	bh=bk+H8Rpkkhpijzc1vwBauyCgZmSOLEWrrF0oAWG1QGs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dUSGZkHsLoQEFG2SblyPgoPqWrBHIf8jH5gfFgqCJ3Z4ipRnKTPAaNVP1p+Ak6YFk/S66gFNqTAFUDXkbTpicskZc8i8cqAy9YFR9AlnkeRcVQueQTpDs/3FJEcMKXVPq59J84wQ7vPeJ1UEfHVB0tWEnDPq7S7MBcYYdkcOpfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Xar/gbqN; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=CSRYkVgyCcc5JW
	HwuNOk0tBmd4Q89cKqk3ITCIhZgIg=; b=Xar/gbqNBFfslbXf3vmNl+HJnrsOkf
	zTeC1Vy3fvs0J6J4BRp9fBbJOQeC5TVk4YEgt0ktjd//bZLtTn/Gz2eEvyJ1yhDe
	SxCQuv/3PzQu/Pd86IvurEvJya0qAQihQIF4LgypEnq+WNhRoZJG6Amf2ZbLIpsp
	7axon86TM9wjlULbrdq9rAmr9ThPu9JTlNJX/rlLCubdEgHmQAGy6JG//eCzeFBk
	4VSvghBoeW7hGJp4RviHo6xNjs7/ZCrHsl0mff9ZPDcBoTxnsj9F+0vDXDskpqwX
	2lADY7gdnGbj1oJ3fn6kX/5FPTGJJ1hT+ZyWSBKuGqsOPeCNbwYjjwTg==
Received: (qmail 884542 invoked from network); 27 Jun 2024 13:15:01 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 27 Jun 2024 13:15:01 +0200
X-UD-Smtp-Session: l3s3148p1@MHbuPd0b2MMgAwDPXys0AFWnEn9dr4bp
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] i2c: testunit: regression fixes
Date: Thu, 27 Jun 2024 13:14:46 +0200
Message-ID: <20240627111445.29751-4-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

My bad, when adding SMBUS_PROC_CALL support to the testunit, I didn't
check the old commands :( Consequently, two regressions were introduced
which get fixed by this series.


Wolfram Sang (2):
  i2c: testunit: don't erase registers after STOP
  i2c: testunit: discard write requests while old command is running

 drivers/i2c/i2c-slave-testunit.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

-- 
2.43.0


