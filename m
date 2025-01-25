Return-Path: <linux-renesas-soc+bounces-12489-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E75AA1C33A
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 25 Jan 2025 13:40:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8F25A1888AA8
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 25 Jan 2025 12:40:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2BB82080E6;
	Sat, 25 Jan 2025 12:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="XdW9QhGP"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3A392080CC
	for <linux-renesas-soc@vger.kernel.org>; Sat, 25 Jan 2025 12:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737808819; cv=none; b=hQQfWGZ3WlBhoiMcPkR8lA5xtgfzBe+EY/k3IdDXRoQ1/WRrtjucD+VsJvbkYwzA7gbjnKzZj05PSZENOBN/jen9mh3f9vCzS7nZZcD0kVmLybXXLfzVqffqGaQYA/yI5/Gm8OYrWwCkle/rAW3PhjgRoT+KMaO2qj0ltM6V4/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737808819; c=relaxed/simple;
	bh=+tSpK9Ew8Zy/NfgVcc421SUrbcGyGk1bLqBeUafffk8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BcmgPhieb5eYVOSBGLNvgOb0PsaxNjj6vQZ0za1diEl6p4N3nhi+UI6CiTHUa5A+uE/glsjEn7EHKCeYwE0jlhkNx/1f/OtJOTiKqURKgUIp5ijGRB5LZZxzsp3SgbZsqNT4fT6ZrI17eAGVP/u1Nm5PTnUS/efVcbS0pObmzms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=XdW9QhGP; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=BUiDItMTatdmhY
	M0QAH0NcfmW2Yq+hNBMKGBB2C2ejk=; b=XdW9QhGPTWAZo743KEYVW71RWFLPBR
	umfEF3pkuJNLYi0BF4DgCc8gSemkd8My38pmhQ8LpUDd3iV4OU1gEQJRcEYqWkDk
	qeQtg24H0SuL4g1eW4rZjN3YJjuy1wsKphXbKreJ0QpbnoEvTbZs+DOpAQcqxp4K
	Kw9QTvXTz7g/25G4JVCtNPaEp6HxydaJ98VFAPTigVugW0TVywfizn6qOCjw0QqA
	CIALxwz7k5vKhvqUfVH0LFMrBrKJAnik0rP1ghAfa4ddSgaMynAzdoG+fCCqucEi
	WOi4aZotR5fbuka9PTi6rSOkuHdBL0O/bW76HLQHUmBDdckTgMmTZ5cw==
Received: (qmail 3871085 invoked from network); 25 Jan 2025 13:40:07 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 25 Jan 2025 13:40:07 +0100
X-UD-Smtp-Session: l3s3148p1@EyZjJIcsTOEujnvm
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Cosmo Chou <cosmo.chou@quantatw.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Jean Delvare <jdelvare@suse.com>,
	linux-hwmon@vger.kernel.org,
	Luka Perkov <luka.perkov@sartura.hr>,
	Nuno Sa <nuno.sa@analog.com>,
	Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH RFT 0/6] hwmon: Use per-client debugfs entry
Date: Sat, 25 Jan 2025 13:39:40 +0100
Message-ID: <20250125123941.36729-8-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The I2C core now offers a debugfs-directory per client. Use it and
remove the custom handling in hwmon drivers. I don't have the hardware,
so I hope I can find people willing to test here. Build bots are happy.

Wolfram Sang (6):
  hwmon: (ina3221) Use per-client debugfs entry
  hwmon: (ltc4282) Use per-client debugfs entry
  hwmon: (pt5161l) Use per-client debugfs entry
  hwmon: (sg2042) Use per-client debugfs entry
  hwmon: (sht3x) Use per-client debugfs entry
  hwmon: (tps23861) Use per-client debugfs entry

 drivers/hwmon/ina3221.c    |  9 +-----
 drivers/hwmon/ltc4282.c    | 44 ++++++----------------------
 drivers/hwmon/pt5161l.c    | 59 ++++++++------------------------------
 drivers/hwmon/sg2042-mcu.c | 44 +++++-----------------------
 drivers/hwmon/sht3x.c      | 57 ++++++------------------------------
 drivers/hwmon/tps23861.c   | 31 ++------------------
 6 files changed, 38 insertions(+), 206 deletions(-)

-- 
2.45.2


