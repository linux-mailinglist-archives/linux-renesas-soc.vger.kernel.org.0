Return-Path: <linux-renesas-soc+bounces-24634-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id B301FC5C86A
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Nov 2025 11:20:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 86A9F343D30
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Nov 2025 10:14:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5BC830EF93;
	Fri, 14 Nov 2025 10:13:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nWs27VVx"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D84D530DD2A
	for <linux-renesas-soc@vger.kernel.org>; Fri, 14 Nov 2025 10:13:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763115237; cv=none; b=IvM+u/Nm5hS+u0aVDAo9/XDfy66HpIWvFIsGzwO09LXyAX6v2rX9gO+pIuAeLXk8UjM4pMf352hQr87rzkT52hHjhkFZ+8U6csqWafAPyLK4sU1KVPdFZBJ7wKJflNdVGE7OEQouedcnfeGT7N5NNlhcmlN+zeMgkx/VUVUhgcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763115237; c=relaxed/simple;
	bh=AGIsbm6krY8lqvi3hVw0dRTvjuba8EouWGVchQk3BBs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FOhZXYW0zqcE2spbIy23zGBP4I1yGYTRk0gpe7TTlV+lphQMjkaIFHhma24JDpzbmDc+mrpKYtZXgQ7sqVZo8rbKK2TmOkwrywOuKmt1r8pYWZpT5SRxsGgu3W0nxk4bONMAajgPRCLGE5Ba70cq6yNv9xhHuB0J8+e8rJdMe4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nWs27VVx; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-47777000dadso13221695e9.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 14 Nov 2025 02:13:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763115234; x=1763720034; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tN4gmTZEy2rCK8hipxGYmBSwbAeHP0MAgwlWW1zw7Jg=;
        b=nWs27VVx1n5J0TDnZc8bCV40I903n7S7iZ226nm04gw/sUw9RBwzJ91p1qvR5qWz/V
         3aOM5GIOWxIBGzpvQwaoUncN17pSZaD9rnyvoL/rTa15huyCA5CCg1FHjhrMB5NkQ8wy
         PZrHrwQFdDnqbF2dBCmmPeivCJmYqftgIIFQEvpwzBkRRe3TGd77dBNPoG7JBh9qKWkI
         1tD5EynRmDB4k1yRw30VagtogUrijQbHT103MYjgtNwkZvO+hRtL27vezKWnL2zGD5mT
         pP3W+J+kb4+qxTSxMR7rPwn1aQNWmwnRjCbpmYcm2LDF5HSDMoP+HKpjHXkBxjbU01JY
         JMfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763115234; x=1763720034;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tN4gmTZEy2rCK8hipxGYmBSwbAeHP0MAgwlWW1zw7Jg=;
        b=HkazbFSSkeD6mlyGc2qtm6iXvwbdxfBx1JX1wuxW7i9Be7xhsS0BIubcA8LIcjwhIn
         mPEe5Yp7ICrPGRK4n/iFZm2dc6fJKK+4HF9rhpYV1N8CYS/HNJjWsvjEpKXgMpSLJYrW
         ck9YoP7BrlJq8AtHqMr8KMpjjMQu5wq0lJnVXeVrSKIvQ/CQGj9M5iw0h11Kr84CGikR
         F5rgQ8zYxCiRDa68DEoa8NaAIXOKh5SeUDD9UmmYOV49pRJk3KjS1DhDIaAVAKqkrmCj
         UhK4jHZVWgZCLV9LKCnoVFum7lRYxH3Nyc45AdynxlFgm1BjohOHvIt1Y0Aq3gf6sSGh
         w/ag==
X-Forwarded-Encrypted: i=1; AJvYcCXodyLbQinYxzSBM977JBSeS7UY11L1cgoYELbYomN+H5UzTDVJHL5snCwYY6PO2q7rwmL1yvBx1EZDt8SXQ3qaqw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxAKf79vvluthndOg3Bypbbqdm3bVsgF4xUPUW1ipSUIqiLwsH4
	+0oyELopqRKFScedhfRw3IUPNOJkU/UQuW9zLAGUn7PWDk8TC2ECmNl1
X-Gm-Gg: ASbGncvLHjt230G2F29dTMWjcljJzQJAqxOKfsOGGTr/DqPFNajsurN7YOeoEBoUThp
	nDNEicNn2S/keB07vpVvDwqE2UUa9rwEsKWqfeeSZ8oMXzbPsixnMdjoNssgvUpbtSZDBxubnGu
	cLu4LLCZbaIWdwokQUbDZbUakmo1/x3d/YbvskcAEPiqwYEXqGW5zfSSI/OwqSWP5KywIzovS2J
	5bFfYMvxO+d3fWocbTL1/gOvbPVgYWA16CApwxpHU+Pt7OhDzq0GHdjh2G5GjeDcSwb3PcUax2Y
	ri19zAccBRKGwpYDNfaep91WveHiVtwKluknWmMZkc6IOUBVHfpU0m6a1CbpSMfM9Cuwse/Aeri
	aXcDUOiqT4xOywiidNnQkFk/MqRL2GOdtKYcRYiHEXeyx2+tDWgEEs4CVVNDv8oreY5JEH9ygWX
	jncKn8Sp62AZxvFMaZhNgtUYauZGETDhJ/qsvkPJxKzoE/gPW3H4YwkJYCQEK3mVh2tePoX4lfT
	JzROsR9YCJsDZsGhV+MxQhm3YU=
X-Google-Smtp-Source: AGHT+IFb5uJ3ADa7QhVVgmGsouQR2std3WNjH5imD1O4o8kNTuqzh+0zQ53GCgN1baLsa0AUm6yvXA==
X-Received: by 2002:a05:600c:8b4c:b0:477:7f4a:44ba with SMTP id 5b1f17b1804b1-4778fe60072mr20755635e9.4.1763115233940;
        Fri, 14 Nov 2025 02:13:53 -0800 (PST)
Received: from localhost.localdomain (host86-162-200-138.range86-162.btcentralplus.com. [86.162.200.138])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4778bae816bsm40685815e9.0.2025.11.14.02.13.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 02:13:53 -0800 (PST)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.au@gmail.com>,
	stable@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v3 1/2] dt-bindings: serial: rsci: Drop "uart-has-rtscts: false"
Date: Fri, 14 Nov 2025 10:13:46 +0000
Message-ID: <20251114101350.106699-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251114101350.106699-1-biju.das.jz@bp.renesas.com>
References: <20251114101350.106699-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Drop "uart-has-rtscts: false" from binding as the IP supports hardware
flow control on all SoCs.

Cc: stable@kernel.org
Fixes: 25422e8f46c1 ("dt-bindings: serial: Add compatible for Renesas RZ/T2H SoC in sci")
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2->v3:
 * Added Rb tag from Geert.
v1->v2:
 * Updated commit message to make it clear that hardware flow control
   supported on all SoC
 * Added Ack from Conor
 * Added fixes tag
---
 Documentation/devicetree/bindings/serial/renesas,rsci.yaml | 2 --
 1 file changed, 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/serial/renesas,rsci.yaml b/Documentation/devicetree/bindings/serial/renesas,rsci.yaml
index f50d8e02f476..6b1f827a335b 100644
--- a/Documentation/devicetree/bindings/serial/renesas,rsci.yaml
+++ b/Documentation/devicetree/bindings/serial/renesas,rsci.yaml
@@ -54,8 +54,6 @@ properties:
   power-domains:
     maxItems: 1
 
-  uart-has-rtscts: false
-
 required:
   - compatible
   - reg
-- 
2.43.0


