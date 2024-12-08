Return-Path: <linux-renesas-soc+bounces-11054-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D48E9E846E
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  8 Dec 2024 10:50:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 95C84164254
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  8 Dec 2024 09:50:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3DE713C689;
	Sun,  8 Dec 2024 09:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20230601.gappssmtp.com header.i=@cogentembedded-com.20230601.gappssmtp.com header.b="ukUsVD3Z"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D072D18E1F
	for <linux-renesas-soc@vger.kernel.org>; Sun,  8 Dec 2024 09:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733651413; cv=none; b=ST29POVNVxgYkexVjbq8wHjJB/zAdoaiLthW4MKgA8g0ufh2zAp4YDXFqtbdJzmNf573Q5J1WKbaQhkjcOADc0QLKAcetZ8p2QFLm6ErBn43oapbuLJkk00EtFZEblA9MnlaMDD2ERe8+O0iCtVOlafvPnyEBzve3E0qNDzAWek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733651413; c=relaxed/simple;
	bh=4VphnPQb+6q7qtjsx4nt5xZ/a0VCfHj4tzIsDx7BG8k=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=K+dhX/uE0QBTF7jP5H30Wccz0Lm83DfKhH6pUzjR45pKk5I4Z9LlmRxBsmg22TRXCpo+X42YykiUwnODC0buDeLuIZn5V8RqqLnwB+hN50j8fNjwtj3XlnHelhOXN2xIFI7W7ScsTwnp7Pi0JuOIqTbLvFMXDzaB/sCfEu/L38Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com; spf=pass smtp.mailfrom=cogentembedded.com; dkim=pass (2048-bit key) header.d=cogentembedded-com.20230601.gappssmtp.com header.i=@cogentembedded-com.20230601.gappssmtp.com header.b=ukUsVD3Z; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cogentembedded.com
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2ffdbc0c103so31428001fa.3
        for <linux-renesas-soc@vger.kernel.org>; Sun, 08 Dec 2024 01:50:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20230601.gappssmtp.com; s=20230601; t=1733651410; x=1734256210; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Kmsak1Ku2aVkAx8thMEta/V4E+yKJNfIXiujSGDstyk=;
        b=ukUsVD3ZXEfzDHR5yKoHG1bjTWV6RlMf3dw7ATgXlCKF7cZqqKu2ZXBC9ZDq5x6nJb
         ngE+H1cbq5j8HBCx9UsJaEpg6RQ/YaofTw84SK8tgiFL0qWi1xNbf1lEJQ155pAt79de
         fcz7jds4ZqNucd599GsDNqduTTf8WmCgMyox/TZ0YJT7XWomA6BBQbq9Gwu8oEUO1FUx
         1wXMbpLCa4v+Vdk61hpHe7geNcPl5rGgOHFjvzJpfTRHtctj0wClorwMtadY8HbcP/24
         1KK8w+Zzt2AkdDCTHRG1EuHSSbwjjn5Yn+h/dJYiLh9z3FN5hGA6zQiw3bnXWzjJ/LM/
         yfhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733651410; x=1734256210;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Kmsak1Ku2aVkAx8thMEta/V4E+yKJNfIXiujSGDstyk=;
        b=aMCFuKoxs2sj/gbNko/9ahMynSyo8KSZzz0z89x45UyFNhcyfg+iiznLl70i91Ehrb
         ZJq4oEZvOEspFHbx2dhyXujNxE3UJ53yWn/ilfgeUGdJTgw29hi0KUUcydKRjUfOR6+W
         flKEu0LMbw87eL7wQ7OOyeeBCBYEcNZJgvKdHvHhfz2NYpS7W2azk4BmGqc+xexo4/M3
         +KTFPdxWiFmWWcUZ2EU2rLHca2kZxfedzI22sHatBUplyhHym4UBq6GNBSm7Vtti/vfL
         AB4ymEhu/y93H9cTzwzUvRDWFe1yr7620YRiiIp3EDlL5kU1Gf3sMx/zeFWlXTfE2sy8
         Ex/g==
X-Forwarded-Encrypted: i=1; AJvYcCUwjFD3bYQsgBYhVkrqhfnsu5luyEJSiCJ6UD14Ec33y39mlWPH/58QpFykmgZ0nQK8oR4vhSGKPCAXjW6t/74jPA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz21FIFHHqou/8t28yZS1hi6RybJjI3yfsUCynD39jnjyk46Ogz
	X8vkSyFrbDohvpFr7H/mWFvG92HjkWuTSz//YFxFkpOlk9bCxpbRRRFbWYDyrNc=
X-Gm-Gg: ASbGnctic+2cYaK2WvOq/JStHUsM6Xcg/yw0hv2BGVG651H4BVmq+1vyE8/UbpCIVGM
	0m42NjzIz0pjexI1VIRsjh1oR3li0hIUmfT1wmoSV/JBdeNV7n+W7sR9g2Jn9DDPcEKlcR4pfjO
	gweeCALOzyULoSr+1801wR1CbhT1vkv00TH62pmM5AJ7B6BEoxituTj+ZNXfO2Hmzezk+NyKLzh
	AI71Zg2Lkl35PFB9MFQA5M+55fS268KJXzgF727ur/Y+GYYUYEVwNqj0v9pR99s
X-Google-Smtp-Source: AGHT+IE6074+O76DqP9gNjbyHYu1uvrO8N9MNpuHLhOBhgZMLbN1rXyI1oimwgf6csuc4BR7wvP0oA==
X-Received: by 2002:a2e:bc26:0:b0:301:2d8d:a3ba with SMTP id 38308e7fff4ca-3012d8da433mr10577291fa.23.1733651409856;
        Sun, 08 Dec 2024 01:50:09 -0800 (PST)
Received: from cobook.home ([91.198.101.25])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30031b80e7fsm6645311fa.120.2024.12.08.01.50.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Dec 2024 01:50:09 -0800 (PST)
From: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Andrew Lunn <andrew@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Michael Dege <michael.dege@renesas.com>,
	Christian Mardmoeller <christian.mardmoeller@renesas.com>,
	Dennis Ostermann <dennis.ostermann@renesas.com>,
	Nikita Yushchenko <nikita.yoush@cogentembedded.com>
Subject: [PATCH net v2 resend 0/4] net: renesas: rswitch: several fixes
Date: Sun,  8 Dec 2024 14:50:00 +0500
Message-Id: <20241208095004.69468-1-nikita.yoush@cogentembedded.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series fixes several glitches found in the rswitch driver.

This repost fixes a mistake in the previous post at
https://lore.kernel.org/netdev/20241206190015.4194153-1-nikita.yoush@cogentembedded.com/

Nikita Yushchenko (4):
  net: renesas: rswitch: fix possible early skb release
  net: renesas: rswitch: fix race window between tx start and complete
  net: renesas: rswitch: fix leaked pointer on error path
  net: renesas: rswitch: avoid use-after-put for a device tree node

 drivers/net/ethernet/renesas/rswitch.c | 25 ++++++++++++++-----------
 1 file changed, 14 insertions(+), 11 deletions(-)
---
v1: https://lore.kernel.org/lkml/20241202134904.3882317-1-nikita.yoush@cogentembedded.com/

Changes since v1:
- changed target tree to net,
- do not include patches that shall go via net-next,
- added a new patch that fixes a race.

-- 
2.39.5


