Return-Path: <linux-renesas-soc+bounces-21610-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C7DCB4A5D3
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Sep 2025 10:47:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 131494E16E9
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Sep 2025 08:47:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BE352737EE;
	Tue,  9 Sep 2025 08:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="loI9oRMa"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66CB32566DF
	for <linux-renesas-soc@vger.kernel.org>; Tue,  9 Sep 2025 08:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757407613; cv=none; b=Nf7aTC1tiGfp2lQWIKg1kVe4c1FiS9YRtdPGqi5XmM3406R0qA4rCb8V4xeWUqID8cjDGUadcjEJS/plIiTLnM/UnlKWdXErQRZOMnHXRGAMJPzPfCOLMUdSHYnGoAgGYJZcQ5zuiirRufBmy/Y2JFIdGPwHhYST57MK2yp0QbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757407613; c=relaxed/simple;
	bh=/genD7LxqR/DBi8rUgeAyGz5n4UEmZFcTQiBeAR0Fnc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=k9miEC8AtaKbp0oc1yhcB4qP7xsMCWmUbdZ8uDaFOzYWR7i4vNiYrDKP6xoSnJvj68sLyo2zdGS9gINP6uXrY/HUzfFzla2oAXmDwHNlNJqt91fMmqPvkAPAob/60+Pin4TcbfBwWGEsPy8UFJ7PplnF03NiqTdgCoWqFB9DV0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=loI9oRMa; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=yFw9RU/YPsd7qE
	/Ddh9OitDEnIZHa9Su4BJR1shgcI0=; b=loI9oRMaXl9WYZS/eprxS5hsFb5wVr
	fXoxrzUp6re+r12v+/VQjznv2ScWh0iflVjcMZFw/qG8j4KzpTx4Pa2qffcVu5Nm
	XTWZ2r8sNniWuZS2RYRlU89GhcGi/uVtUA1Zc6W73ZBPJ/c7j/6R8E6jhBsDftRa
	UpgQQZdoCDrvQIi8yROTgNyejsdxhDnQ3K2Rrs9aRDxKZJd1BrAA+NPi/VWCqw9H
	IIPMgHGNksCddKV7qjNI3kOgdOPYIiA6RoO3/7BgCzfpExLB3WBZ6Fl8f/1nEWRX
	XjC9KOpIUwpf9T+mnMo2okUidoTaP6NYgw5US7YUlX24u+iNo3nqdb6Q==
Received: (qmail 172270 invoked from network); 9 Sep 2025 10:46:39 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 9 Sep 2025 10:46:39 +0200
X-UD-Smtp-Session: l3s3148p1@iAqtV1o+UOwgAwDPXyerAKQ7QDbxBzog
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Marek Vasut <marek.vasut@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-pm@vger.kernel.org,
	Lukasz Luba <lukasz.luba@arm.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>
Subject: [RFC PATCH 0/2] thermal/drivers/rcar_gen3: improve Gen4 handling
Date: Tue,  9 Sep 2025 10:46:18 +0200
Message-ID: <20250909084618.23082-4-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Here are some patches to discuss the findings we had yesterday during a
collaborative effort. Details are in the patches. Let's discuss!

Wolfram Sang (2):
  thermal/drivers/rcar_gen3: fix mapping SoCs to generic Gen4 entry
  thermal/drivers/rcar_gen3: use approved default values

 drivers/thermal/renesas/rcar_gen3_thermal.c | 24 ++++++++++-----------
 1 file changed, 12 insertions(+), 12 deletions(-)

-- 
2.47.2


