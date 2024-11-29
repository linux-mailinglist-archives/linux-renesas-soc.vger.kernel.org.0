Return-Path: <linux-renesas-soc+bounces-10659-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B48C9D5D15
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 Nov 2024 11:15:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 327951F2139B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 Nov 2024 10:15:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E75B11D8A08;
	Fri, 22 Nov 2024 10:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="eQenMALL"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61C6516FF3B
	for <linux-renesas-soc@vger.kernel.org>; Fri, 22 Nov 2024 10:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732270502; cv=none; b=Hbs0gZMrK1+KgBgeE2OkBxnrtvV83qzHqf19F+XQydvMGxzjsP3U1wxMnnVKsRkriIcsccp+bqcjFgB9sSvxSh6Nvk+pAHzL5eETEsQn+vGOp/cJGwJ9AT3j9/VaJtS90+fMosY+pfVcg2TnN3ESjq0ksYQCZSQBjvu0O8ZDFeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732270502; c=relaxed/simple;
	bh=SBxuV8+Q6BOyKXUVycK0CM6I8k7Z8Z1M9Y1t10ziPAo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=roCfaN1xsTB7nolYMVwFV90vmimPgvdAOwOnKCJbQ4O9tYliU65fLJKMa38ExGneMEv0mEx7PGElk2aGY99aR5cbwN7d6zF/NiqYCailT1BcwcbR5M1EheptwIAP8n8T92p1zoF03FJk3Gk8wI++NAffZ26Gme3I50hUSxpMQHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=eQenMALL; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=v45bDVdc8fZdmH
	TQYl6QPRKA213XAaSIKP2BT2g9Lbo=; b=eQenMALL03//ZhS1Kqb3JI4RB0JNa3
	SyY+7y/VvM6FApjRrbkp8flLHxRV4RibwaIgNJb98hy4o2zNfi29JoOd0QbEmSpI
	zaYSWx1o9/QW0HQO3qSDBiQh3WrsfxzI4XBfGraKTLkl/z0ZvvGT1p5brnXPcXG+
	5dXCuCbOaHUB18PjvgHY8uCYdnFb0isomcRVOty5jZ9LEnT65JmVupzoH2BpMq6a
	vL4PpULLLkvYrvYJOJtDkxJKo+b1JjzHnGL+Uo7IrQ43/aCH5YO9CkGld798oKNi
	IRrUSxKqh1ZdqTTuqKXO4VbS8QEDcFilJzPo5QBTin+eD25G7dR/KESg==
Received: (qmail 1554989 invoked from network); 22 Nov 2024 11:14:50 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 22 Nov 2024 11:14:50 +0100
X-UD-Smtp-Session: l3s3148p1@zJgyp30npocujntT
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-rtc@vger.kernel.org,
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [RFC PATCH 0/2] rtc: rzn1: simplify driver
Date: Fri, 22 Nov 2024 11:14:46 +0100
Message-Id: <20241122101448.4374-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Here are two patches to simplify the driver for RZ/N1D. They seem to
work well on my test board. I am still new to this subsystem, so I mark
the patches as RFC because my tests might have missed something.
Feedback from the maintainers would be much appreciated.

Thanks and happy hacking!


Wolfram Sang (2):
  rtc: rzn1: drop superfluous wday calculation
  rtc: rzn1: reduce register access

 drivers/rtc/rtc-rzn1.c | 86 +++++++++++++++---------------------------
 1 file changed, 31 insertions(+), 55 deletions(-)

-- 
2.39.2


