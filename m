Return-Path: <linux-renesas-soc+bounces-22319-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E074BB99D55
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Sep 2025 14:29:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A40E23AB77C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Sep 2025 12:29:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B284303CA4;
	Wed, 24 Sep 2025 12:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Af/+e12n"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05EEF302756
	for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Sep 2025 12:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758716944; cv=none; b=Xnny/fbUNqXwMzf8P78hH+57kMFzD+Evk/Bb/VKWO3pxc8dxtp5twvC2uQzg4Xt/8W1DB9X+ueu899jXP63WsoVdXf+3LvnFVjyiW5uxu+L50IMC0xnV7UWLm674oiSy/4q+Ds7OsaZGqxM6y4jIrMc7pTaBJbT3mkWsQb54SDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758716944; c=relaxed/simple;
	bh=YB1a54MMJXi5nKTH9gbuafJV6b8bO8PW9GeT78qICUA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HQ06U2kC2Oxpq7ZRtzsTVJYVHfRfWtC+2ZSp26SH35k3JfsCAhUaqMSUbZDbFIrXtzHRj/ZvgZ6YKZwHsP1ov0wsZvZ4E8sAnrPG0n7D99P1iAiXtuAS6jQ8hOMCxUqBOGP5y8koRhx24x/Dlqn+WFGWZnkC2xFbkTJa4CKjejo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Af/+e12n; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-76e2ea933b7so986857b3a.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Sep 2025 05:29:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758716941; x=1759321741; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I7ZUVg/Nr4pBk2YqBecru/L6TvemL+I2eAgpr8B6DmM=;
        b=Af/+e12nKf7pIAhAmZfFQkWWCG5W6CcrDtIjlGLhY9jhfq/RXLFAeZbeQ6YHQPRpND
         a6YBSbM8XkVdhFn9vheLzjfnD2soDIPzjo5sYNI8iU3JWOOEB3aDs2oWOkCKsMwnjMsY
         3ertZ5JOXq1/omMFtVugAA91R7Y7O5hjSallfr63MrmAgUk+LC/3nOsrGmNcSt2vJ/ZT
         GYm2V7yPAE0gooCmLUIpUjQp0SQKrnqbsWzM6ywy3HIB2AZqxGHF2nAAsjH0iqrpWEpm
         oI4KdIZrUX3/2uo46lMdhDXkh7F625OarqG+IZPbO52etdpquv3FF81HaJUHJH0L+EVd
         w6Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758716941; x=1759321741;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I7ZUVg/Nr4pBk2YqBecru/L6TvemL+I2eAgpr8B6DmM=;
        b=NDX/9P+1BwLn/PGaKupZpwyFtiPQT8jtL1xYV9nsHz75YJzI1g371YoNqtJX4UMovW
         IkH2RN+Ve3thH7TKOWwEAvHb5ebnRfejGRl+vbQo0TwfnWMLafehJSqbLp4aaCJwLI0D
         tYTNT3DqQM6PFEQDlS4Y5a+zhT8FP0uGGPNr6erP8Ob+TrRJAgrbix70A7tO0NzMTc6B
         6gysQ2Z9BVRUhGdC84YiIw8HTZYBi3RaJLLlj60wAZkzr419vkx5OHKaNb2pj/NIvgLF
         TBG0Z7pQ+NYu/Bs4ud5N9EcXco/dH6PQC3K0n/5sJFNNGJfFWwVswRSYisubJTN5Gtrz
         e84g==
X-Forwarded-Encrypted: i=1; AJvYcCV9SPmw0SY1ZM7NK9EWnTkJueOuy90Cclg7g0WNphdb5Jo8HjSk8xmALDpz9yR1lsL++2FUX1CA8KCAMRuT6QOf/A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzO29/GgY4Qd1Q9fKtJMLk/5wKtabj6RKFEugefJfnot1bv50zY
	ONyx2083v+TBfHr6nI0kD6RdmYoTDp4ckF4ch+6nYj8C90qJTBI5fNwY
X-Gm-Gg: ASbGncscBAXSAADio891zOW224t+S+1ukTpgEjI61cZIIcZqh1BIbvK96SVTr2TsxQO
	0IjrFm4FRMSkp4I/RtSNxCjlPM5p8EvHhvnjiufy8y0WEPhvt2v81OzyInclOlNSx7ywXfuOxZH
	TMbw3TnsMo9KB/6eKWM5FzNh0avATtWJsR/I0QG60kNIaqtBJFPHijNJ6SF/Q2+KcTvEkbjCopc
	Rrne/TLI7yUCvNYP/i/udY/T9/0tzmTFc2Df+O2/JRqmanJPP1hEyrzBC1ZndcAj54mhT58IoU1
	Fi3NdDWrhtQe9sGwGhOOuIJIx79ol1aMI8SZu0Pm+Vak/F8mVcH9oiDkccFwSkUfTU8yQPxJjA9
	2h495D9EFOR7hQYK3099KyEX58FHuR1LdVC560hs7AvPZM9EpHjMaf0JRZyDW8jq1Swq0monP8l
	lfHfzXqSs/rbe6zvhMAUBwMfZ39uGbfYTb7RZH4P+DicFqmRxgyAEWrTtah718Y1PyjfOBzkPF2
	ASoyObZjrTJcseAEn1MRQU=
X-Google-Smtp-Source: AGHT+IH06rBToc1Of5UN6Ch+ySAAkAq1UnVhWSHME11cpwxSnnZRbpfNLzn2Dr2TU8ADryfYeNx7XA==
X-Received: by 2002:a05:6a00:4f94:b0:770:4753:b984 with SMTP id d2e1a72fcca58-77f6984f9b0mr3074239b3a.16.1758716941404;
        Wed, 24 Sep 2025 05:29:01 -0700 (PDT)
Received: from 2001-b400-e384-7809-32b4-db27-121a-a0aa.emome-ip6.hinet.net (2001-b400-e384-7809-50d7-4f66-57aa-588c.emome-ip6.hinet.net. [2001:b400:e384:7809:50d7:4f66:57aa:588c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77f254f8f68sm11058495b3a.56.2025.09.24.05.28.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 05:29:00 -0700 (PDT)
From: Kevin Tung <kevin.tung.openbmc@gmail.com>
Date: Wed, 24 Sep 2025 20:28:50 +0800
Subject: [PATCH v2 1/2] dt-bindings: arm: aspeed: add Meta Yosemite5 board
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250924-yv5_add_dts-v2-1-39a4a8e3c9e6@gmail.com>
References: <20250924-yv5_add_dts-v2-0-39a4a8e3c9e6@gmail.com>
In-Reply-To: <20250924-yv5_add_dts-v2-0-39a4a8e3c9e6@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, Amithash Prasasd <amithash@meta.com>, 
 Kevin Tung <Kevin.Tung@quantatw.com>, Ken Chen <Ken.Chen@quantatw.com>, 
 Leo Yang <Leo-Yang@quantatw.com>, Kevin Tung <kevin.tung.openbmc@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758716933; l=886;
 i=kevin.tung.openbmc@gmail.com; s=20250924; h=from:subject:message-id;
 bh=YB1a54MMJXi5nKTH9gbuafJV6b8bO8PW9GeT78qICUA=;
 b=niNRJVGxu/G3iuEdL49yqUkGn3N0ZSiWXbUk1WNZzk0EayhrlvQV4FUn6veJSMmD9Z72xEqo8
 RLa9pscBXnjBtD5vl3CExk+zp4wJKthnmKhKAmJe/yDHYmpwL2Tw5fS
X-Developer-Key: i=kevin.tung.openbmc@gmail.com; a=ed25519;
 pk=PjAss0agA0hiuLfIBlA9j/qBmJaPCDP+jmQIUB6SE7g=

Document the new compatibles used on Meta Yosemite5.

Signed-off-by: Kevin Tung <kevin.tung.openbmc@gmail.com>
---
 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
index 456dbf7b5ec8f4442be815284e1ad085287dc443..6f2b12f96bd6ce31b4175e109a78d931dffdfe28 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
@@ -89,6 +89,7 @@ properties:
               - facebook,minerva-cmc
               - facebook,santabarbara-bmc
               - facebook,yosemite4-bmc
+              - facebook,yosemite5-bmc
               - ibm,blueridge-bmc
               - ibm,everest-bmc
               - ibm,fuji-bmc

-- 
2.51.0


