Return-Path: <linux-renesas-soc+bounces-25666-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EE8ECADAA4
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 08 Dec 2025 16:53:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 445C43035C1E
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Dec 2025 15:50:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 100F82DEA75;
	Mon,  8 Dec 2025 15:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gXvnbqKy"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41156280324
	for <linux-renesas-soc@vger.kernel.org>; Mon,  8 Dec 2025 15:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765209030; cv=none; b=Ns9uCkBUAWIfFNrweou21PZk9M5eZxQEpDyKpxnjyO9uqVbcLs0gjt6atk55bUOY7wzmnla4ZL552UOcKvRbw/6ZfFPIgpkPZUAywicKwarwO4TDbkaNDb6X34eO0uoQ5Gx3BcW1TA/9VLC/m1mdB0mB5BKFHow47P8nPShpY7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765209030; c=relaxed/simple;
	bh=tlOo9dyRdPpU5qGbPx+r7yc55urEIGakEuFBzxg6tNY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tDVnGS17NHIGEoQyEjW11C6KE0+M4ua6TJPh36nAwEFTw8JDFzXE7MC8I0b+48JLRjJvNW9QaFDStjPBu4+ZrQLztVYIpeQWGzmZf7AXI894s2CMbLgDQOUe1jQstLlqhRaXW6QI7aPbYIoipXGEZKUVKPx3JKA22iQZlg+3vhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gXvnbqKy; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-477b198f4bcso40224065e9.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 08 Dec 2025 07:50:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765209027; x=1765813827; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0DkeTPkNVXLcIqrE0+vJuuPcS/1UnLmUfSY7lOiFDo8=;
        b=gXvnbqKyUgjEfClf2bKPQCLEvgkqIa1gDIGeQVGkrimnD2w3f+YAYfHVwcI2Gf4ynW
         bkVzN0qjPpn2ugDxKbXNWdG2vuvMIDAx8JkixwkeL6EZBAjceyrFsojuK/atAcOq2v97
         zYHMAIlQORMbubnjnHl+gI8cR4aZKoo3rzO8YA+291NXbEOb6CIYIL9mLFF5Pc8wLHzE
         TATeA87HItsHbXyP/bfx3B3UrfmuXLDc/XzATlVri3OYbcT7uAzV9My7IMWFQjm/wFwv
         6LzDgX7ap1rBsaGYo92ZxmGpvLE21Wc7qLhbNMZqdikIOkeTuS8PeeiCCl29aWtk9V/X
         EEQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765209027; x=1765813827;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0DkeTPkNVXLcIqrE0+vJuuPcS/1UnLmUfSY7lOiFDo8=;
        b=twFr/OOGYEDwLZl7Y6xSPhTZaqCw2I3LB8misZL1C71Ni1qby6ZactY7J9toYiCc+d
         NXsR3PdE/HDdez8xW6mgz9IelKzjtn/UlBbbnoCG8aWwSv4Lwafzs3a+YYk/vR5yT39l
         Rssix8p+09wbtMCfR+vB4dSk8rqjIlBDmkLpYoEZseSFhi5R/0kxTQM6l3ipryCGNoHq
         qE+AD5rBVqD14x01WZJF2BH3RWZrtziF3goUfFJJdiAeIN+M80dibsfqq+cisH4M4xVj
         t9GWcJ/slLTgP23aFwsOO3n5vpVpks4J1ki39Zl3J8le+dg1L1iwF53MdjrOqvRAIqEg
         xx+Q==
X-Forwarded-Encrypted: i=1; AJvYcCWrfvjAElK5pfA4qMYE4wpqLMYpzF45silZKO4HHAQT6TmzGYc48/W78VqlpU+GHuzdvaB8MTxsQ/59RrY3y9s4uw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzk5h7Esqtc5jFmwf1XxPKEsC/VJpd5kQxiAzB/785ofyoPs2Iw
	Nzos8MSQf3J+PJAIzbQgjR6+N8hPSrwc5u7K7pzyhXR9ReOglTOlsoWh
X-Gm-Gg: ASbGncvqPYQaW0euVm38TvIXsVtomLgzM+sVCFBRcMu/rMIbyhsqYxyLemzm/jPe8Ge
	DqBKBKL9NQUCgYBBU8d9C2Uh4cK3JHIDoVPwratXJ2EB5txtoVuMulQuSysqPEjclfsnI4CnMHP
	astfUa9s8Ei5R+SlzXy7+hYiNujSax5M3bW5WCx4Dg+r6bLsl8mClcm57JyAdCvovo/G7SOjEJj
	0tt8VY5b9mmlNkZSawbWG4cuPudcelLOu53W//Y8oQRXqM6WByIAQoM0PC88tM4NWT5bvZ+xPqY
	NTDeQeEeRpxfoZexUZGUbiGFCgqQjdIYTkQC2VakjXa0lZah94x36DxVnfKVyRLyfxTjhyz7Vvj
	PiG2u6UAfJxawHBGgAA7ystdTuPRrPhQtQvqnKQxbtdHSL+xaAjxOXo4LZdchgZFqwh9YEafegc
	KOKeb9yeIi+JUPVCUDJprMvZvaFjAc35iITw==
X-Google-Smtp-Source: AGHT+IGcN/kfIKnH8UEIcRMeENYQps70OLTJ0JNHqdRe30a1VCk8EhGuR6GFWFzu2Ojxaxr9I9XRIQ==
X-Received: by 2002:a05:600c:468a:b0:477:9f34:17b8 with SMTP id 5b1f17b1804b1-47939df129emr76804815e9.1.1765209027313;
        Mon, 08 Dec 2025 07:50:27 -0800 (PST)
Received: from iku.Home ([2a06:5906:61b:2d00:9aa6:8a23:82c5:2b7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4792b150878sm147717845e9.3.2025.12.08.07.50.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Dec 2025 07:50:26 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Marc Kleine-Budde <mkl@pengutronix.de>,
	Vincent Mailhol <mailhol@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Aswath Govindraju <a-govindraju@ti.com>
Cc: linux-can@vger.kernel.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 0/2] Add support for TI TCAN1046 CAN transceiver
Date: Mon,  8 Dec 2025 15:50:17 +0000
Message-ID: <20251208155019.136076-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi All,

This patch series adds support for the TI TCAN1046 automotive CAN
transceiver. The TCAN1046 provides dual high-speed CAN channels and
includes STB1/2 control lines.

Cheers,
Prabhakar

Lad Prabhakar (2):
  dt-bindings: phy: ti,tcan104x-can: Document TI TCAN1046
  phy: phy-can-transceiver: Add support for TI TCAN1046

 Documentation/devicetree/bindings/phy/ti,tcan104x-can.yaml | 5 ++++-
 drivers/phy/phy-can-transceiver.c                          | 4 ++++
 2 files changed, 8 insertions(+), 1 deletion(-)

-- 
2.52.0


