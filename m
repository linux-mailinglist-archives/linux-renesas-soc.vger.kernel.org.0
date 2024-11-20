Return-Path: <linux-renesas-soc+bounces-10618-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 67EB69D357F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Nov 2024 09:34:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2B5ED2832B9
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Nov 2024 08:34:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D64217625C;
	Wed, 20 Nov 2024 08:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="SzAG57bH"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D292F15B547
	for <linux-renesas-soc@vger.kernel.org>; Wed, 20 Nov 2024 08:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732091651; cv=none; b=e3MIxRO/RQLZnexrKZRfPzwhQaV083CGTqRGmT0HhmhJwjn2Ey2v0O2ayEP33w4gAQXpdiXVCUaKmSCGN3swrL9rZABEmmsFS/w9lJ4kfR69BwAU4ujQCWQYHgO3/quZEasT0ZPPD8P9ovSo+ApZ7ayQmQTj1XRkL0AQdd+iSV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732091651; c=relaxed/simple;
	bh=WuCP0M1dHStcIFRNKwqkyFgGsOO3Du2JbcI1QHtgN4E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=plA5JRKGayn5XDmkEZMpjaB5agPBB9nzwz4GeCPHAHNBVM/8T2GUxIfsGI3BFkY4VRtlhTaNp2qXMr4hYNnyD5YHgNQ9Yz1RZqhupvCbDmvcpR3vAYCi7MKLaWVSCeJ4ZQKR8ZnX8WVXjmrKvaM5oH9IhosxhwVZ/fR9Pedvmpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=SzAG57bH; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=bSvA3Ft/1Xn2xU
	rvibm//aTPuGCDXkouCuQ6AQ+gaXI=; b=SzAG57bHtR3z9U/nr6KqxexFGuff+y
	GGYcRy54iDZMV5PT5LnlVDkvL2+W1IBgnUwYXHu7hkT6BNw0utOu0yXO++ocJX1+
	DfVaJTn/lkfy1TP2T4Onf3HtFXvvfWT5TlTt1zNUnJGT33HdYJAsctQZVVjKJwBN
	ToQK68Pcm8WLychsLtA9J3AtHR24h3ts1kJVR2wM7U76f92WuYQJ5AZmz1TL0M/A
	ZOgYqpdGr/+XbMRwCyUDow3N6VxJeS7d1JGFoU/XbemJQsLMBove7l7CawUSkown
	fo0PPK94tZyLPog6J2f63ii0LUpYZQdZ7EJCb8L3kzA1LzG7FyNw/QoQ==
Received: (qmail 832200 invoked from network); 20 Nov 2024 09:34:02 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 20 Nov 2024 09:34:02 +0100
X-UD-Smtp-Session: l3s3148p1@NN8UA1QnsLIgAwDPXxznANR4Jedc6XSv
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	=?UTF-8?q?Carsten=20Spie=C3=9F?= <mail@carsten-spiess.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Guenter Roeck <linux@roeck-us.net>,
	Jean Delvare <jdelvare@suse.com>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	Magnus Damm <magnus.damm@gmail.com>
Subject: [PATCH 0/3] hwmon: (isl28022) doc fixes and minor code cleanup
Date: Wed, 20 Nov 2024 09:33:49 +0100
Message-ID: <20241120083349.22226-5-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When enabling this new driver (Thanks!) for one of our boards, I found
some issues and came up with these patches. Let me know what you think.


Wolfram Sang (3):
  hwmon: (isl28022) use proper path for DT bindings
  hwmon: (isl28022) document shunt voltage channel
  hwmon: (isl28022) apply coding style to module init/exit

 Documentation/hwmon/isl28022.rst | 3 ++-
 drivers/hwmon/isl28022.c         | 9 +++------
 2 files changed, 5 insertions(+), 7 deletions(-)

-- 
2.45.2


