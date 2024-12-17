Return-Path: <linux-renesas-soc+bounces-11463-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 44C4D9F4A87
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Dec 2024 13:03:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 118F418821C0
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Dec 2024 12:03:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 742B71F03DF;
	Tue, 17 Dec 2024 12:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="KyutQ2SJ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 909731DF992
	for <linux-renesas-soc@vger.kernel.org>; Tue, 17 Dec 2024 12:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734436995; cv=none; b=D8E30YO1jguq0uIAuSQsH6eNDAs39P1gBkYwL9TAh8/TI5MWCw/QzzwklEy6u6dqyCVifi71CP3IAwhAxMJDG/DeqUqcGobX1TfLc+Wl7oA5arzCSfBchbZntt0l2uPdm486E4D1hRzooW6ROdXYB0x4SvpELrHMTPaPZ5WySQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734436995; c=relaxed/simple;
	bh=HkrSbm7kUlMNddDrvxBJPF0cvxt1KsH3xRO6bgQ6Jm0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=K9Z5sVbFNjfhsOG2bhVyds11pBo6I4rcHiidB2efMzHfkYEKE85MzB7YTUm/7wPWBiqWmVQBlXAzt0A2R9xVbVL3N/NhSh4hYsB1pZoZ7Z45fkw87XP/IE3bg6Zkm1eY12OHxYVYFbCEGXFY4K4iZ973X+NCXQtGlnn153b2Fd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=KyutQ2SJ; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=Qr4wQmZxBRIjXd
	0EQ5hYYFE+imRebWgseKj22z9Akdo=; b=KyutQ2SJvDuUhiXN/gqEKxnFob/wwg
	xaueRaWuXioLj6vq+vTNwtTzP216idcXgVU67+hzS4PKmxnm5u9+2rl7VvnW1+DV
	YYT27n52whJz+ctrBkbJCJyylWsBJunZ9OfMCy47wKb7XxOY6wNf7EbmUrsaD3av
	gpziTEMq5Wnvt+OrN0gNrTxygkWQ1NNkw6nZuF7TRVLJj8UwU/t5qezx22Q84qvF
	0dHfdeLnb8uj1dRogfQa9v7kuU+Gd/+wig1CXKwOOQwbFR1TUFcu5njuBlWGKvY5
	HUbpaXW7M2pHt53PmDZP6oXDAXB13/h0pTeEzuYBernny4zrYp13D7yg==
Received: (qmail 4062858 invoked from network); 17 Dec 2024 13:03:08 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 17 Dec 2024 13:03:08 +0100
X-UD-Smtp-Session: l3s3148p1@OGOYFHYpVuQgAwDPXwAQAA/MfjDm1Sk8
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Guenter Roeck <linux@roeck-us.net>,
	Jean Delvare <jdelvare@suse.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-doc@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	Rob Herring <robh@kernel.org>
Subject: [PATCH 0/2] hwmon: (lm75) Add NXP P3T1755 support
Date: Tue, 17 Dec 2024 13:03:04 +0100
Message-ID: <20241217120304.32950-4-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This small series adds support for the above temp sensor. Ultimately, I
want to support it via I3C. But for now, start simple and add I2C
support, so we have something to compare against.


Wolfram Sang (2):
  dt-bindings: hwmon: lm75: Add NXP P3T1755 sensor
  hwmon: (lm75) Add NXP P3T1755 support

 Documentation/devicetree/bindings/hwmon/lm75.yaml |  1 +
 Documentation/hwmon/lm75.rst                      |  6 ++++--
 drivers/hwmon/lm75.c                              | 13 +++++++++++++
 3 files changed, 18 insertions(+), 2 deletions(-)

-- 
2.45.2


