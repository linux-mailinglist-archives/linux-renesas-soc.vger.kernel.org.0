Return-Path: <linux-renesas-soc+bounces-16579-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EAF33AA5E7C
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  1 May 2025 14:37:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A4F1B983276
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  1 May 2025 12:37:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D015D2248BD;
	Thu,  1 May 2025 12:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VP1mbERa"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27DCD22257F;
	Thu,  1 May 2025 12:37:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746103040; cv=none; b=G9Z+R5ox7pKfPERr7cxIRvB4gL3B258bwuqVay985mf/G71Mt2pB55jY8pwJ/0Qi7Jz884q6ZKZPLDzbSuRBBzIuqTTmA6cugi2ZsvEqh1fufSOxsLcMO5f9hSB8V24YaPuGKf0LfAMDpWJCB6VKTzJYmwGrwekTquxnF51BrRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746103040; c=relaxed/simple;
	bh=29FlQfhbevjp7gxKb5wYK67y5ySKsfFKuKobY1p0vbc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HCUAiY796nkO/aPI1p67JeYS/deH14BiSHw8jEDa47XNQvDFqWBs8EW9icNXDzBXNaAemw0d8V+4bb9MVlFP5jTLM40GOGoyXxZoN6jLNnm9rSa1Tf6ogcrYf2IiQpMmWRmLUhDvKXq3cKxlus0pWrzoIkWt96nS6x/9U1oYLVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VP1mbERa; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4394a823036so7957625e9.0;
        Thu, 01 May 2025 05:37:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746103037; x=1746707837; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QarYVaH0v20mTotvxQdSp+TNmjgBdUC/EhjLO8cfUNQ=;
        b=VP1mbERay6LRBAxCRiUDbX1LlKRGMKdajD73MlWG5Wk332wdkMAK7Y96Y1BYLS1oUZ
         E51coo7eeImRF7P3mPS7k/Qvym7IYw2H4VmefWVscWghacJ4uL5sCsJy6mTiju4nesih
         ED+I4QoP4VuA46HjFz9MlICSbr6uyu0FmeYmuMdDD+iLZ9zMQD/ABzlFbATVCv3ytFs3
         rwkV3yi/5bEEF1u3ByzXCMdYAEQXWWI3PQO/vzByVcL2J93RFdqF0WE1S+Oq1BDY3WQe
         w/KeWaKzRuuENfpLrZvYNt8uWmU6xh6kP1RxfTCo7QqrMqxlhXr2OKQcE9pn9Vt2uqkX
         STLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746103037; x=1746707837;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QarYVaH0v20mTotvxQdSp+TNmjgBdUC/EhjLO8cfUNQ=;
        b=NsZMMRoLDeDJIgvy2cgXlXWKT8CSA/LMOIQa4PhcdHCyacAZ/D4gMvbBKOeB0PwiPO
         pVzd/kMLInjfhDeO6znJCt/bFBlfWDOQQhXxsI1NjegfIRuCN691fvqccnaN7dKyRf4+
         v6RhyIS33vGtfQSmyXcZHIRZf9MeJ+aHuYS4Qqxu8J3CMh97DbU++T5iJnmZQYHEvBYE
         aQiHXIuqnfs5ITcTbQoHNZdiSI/4XxibUwnV3+4sJ55o0OehkInDswhhcXzRazvAYIt1
         Rf5yqFAawajlaLNNbuGOy7zhLMWTgYj6ytu+SEiZzh9Z/UefBI+iV4slaMXgdt/2fx0K
         LOYg==
X-Forwarded-Encrypted: i=1; AJvYcCVuPehXh690WagrcTBjMT7Nt6EA9rtNr887elPllezz+uQbozCXs6pwKk7XsbXlyfD8qW2CbT1DskU0@vger.kernel.org, AJvYcCWmJQ3xeC/LaF94ZaTGvjAg1R7KUm+e4uMvQr3pTOakAciOpuyiuAeD5si0s89i4D020ZzSe/3abEi/QGn6GGIYj7Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YykhpqcPO+75ke0vow1mGmIkTIf7UKPbvw5P8jrnf2YL5pfirVR
	O0Af3McncVq8W8Qgw1dCqdGmnKfczW9y8tVwOiXtRhN28SjgIl3M
X-Gm-Gg: ASbGnctyRb/4xDj8h7mjfuU0xyjfdihiNmraKaSSYu5ZA+XD8/djpw646aBOIYg0/F/
	SFlyLJVsthsTMsqL73M+vwWjrIpk9hckVwiadTJQE+lqg5PIfVtcxE4vS8nGfbovAhGFXEW/al4
	cNWzP/AIjZXOSstHKVuXycAYslAslJctZ+O/Mci/PqpzA4P3bB8DjY07+IDm7Cqf4Up615sYH8n
	v9lLUL7stpwWNfGfXZ2OCAWpRCN0e3fs/WMCWKnxxjCyFBTgZxrY8IQd1nDSsvb257LW/xzOx94
	3Ss64IPmbtI0SiyCV3uSrk202UqJyw7uJ2QFbDmb/WY7uyTCGK2WNtjZyTw9a32E
X-Google-Smtp-Source: AGHT+IG8jggn8A7KlYdw5KvTYjXV5NzOswZFTlK/eHsc27wVMfwBj6SLLMeFwc//UR9osY5bfEFJpQ==
X-Received: by 2002:a05:600c:3b0c:b0:43d:745a:5a50 with SMTP id 5b1f17b1804b1-441b1f388famr64205075e9.19.1746103037104;
        Thu, 01 May 2025 05:37:17 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:f0e:4490:d947:2c92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b89cc469sm11144765e9.6.2025.05.01.05.37.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 May 2025 05:37:16 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Chris Brandt <chris.brandt@renesas.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 0/2] Add support for Renesas OSTM on RZ/V2N SoC
Date: Thu,  1 May 2025 13:37:07 +0100
Message-ID: <20250501123709.56513-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi all,

This patch series adds support for the Renesas OS Timer (OSTM) found on
the Renesas RZ/V2N (R9A09G056) SoC. The OSTM IP on RZ/V2N is identical to
that on other RZ families.

Cheers,
Prabhakar

Lad Prabhakar (2):
  dt-bindings: timer: renesas,ostm: Document RZ/V2N (R9A09G056) support
  clocksource/drivers/renesas-ostm: Enable OSTM reprobe for RZ/V2N SoC

 Documentation/devicetree/bindings/timer/renesas,ostm.yaml | 2 ++
 drivers/clocksource/renesas-ostm.c                        | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

-- 
2.49.0


