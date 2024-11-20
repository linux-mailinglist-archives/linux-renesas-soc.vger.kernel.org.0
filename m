Return-Path: <linux-renesas-soc+bounces-10617-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0411D9D3583
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Nov 2024 09:34:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 87FE9B21D0D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Nov 2024 08:34:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEB83170A1A;
	Wed, 20 Nov 2024 08:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Xvp8s0I+"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2AEB17108A
	for <linux-renesas-soc@vger.kernel.org>; Wed, 20 Nov 2024 08:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732091650; cv=none; b=SLk3ZXZv0Qn4PnHp7COR0q2RBkBXSLiNznJ468z1IXLHbDtv9tLdqMEF4t6EGA6M7VP1gSLfq6xnHkxM0Sb/L8OKu7Am630Y3pfGyes2LdamdDXqNe+2+Y1153A6j6vnUBdGwYmmFBCSILFM//MsQ2k2aXAcLLWak3UYX+jqWBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732091650; c=relaxed/simple;
	bh=8dDSC2Cj8KTxntQZ48l0qLtV4B5umxyboaTusTTTNtE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HCTHEDGz2JaLe+qe9zggIVaGMMG2Q2UD9KTZKeAqeI+W2+GRCopOhzofWgHXr38TEE78Veg/mkG+Dka+xwPgD0GlwhjlGTjNP14zonGLaU3EEueA4+ynOGcHv1mcKD6f4EWVwXC0nFW3qZJIJtCfD3HcF4BnLweXchoDEN3wiW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Xvp8s0I+; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=ELhM8SRHVwZjXbSVs7yXoFyzmHbryTxv7XCEG2ec0WQ=; b=Xvp8s0
	I+8Zp4BTIiV7SkcanoqWna268X07qxKZ8wXB1Gfg6asuk4bNKZ2l0057rxKQuk10
	7PXxwOtBOzqw99QaEXr5+z3xWDobtmosq+lNbKRqntT20t/XTXRkctyF7JC60N00
	x/Xy2gU49rUq4IfZDUW0br0Gtl8eIDbNMP8RmBwzvk3Vj+qmvzTGEwR04yStgQF/
	P/IIOHwCbcJlLJ4Ut9WknCuyx66FFYVeA4G8zmdnlJ6lXcYcVNR/LqPol7OP3F7f
	/EBffbQLjxAJK5fw7z60K4a8iYJsroFg4oQ1XMzUwEjF9BdZdDSANyIL4dHaM4Xl
	Fq8CGgsTTrUtHpgg==
Received: (qmail 832249 invoked from network); 20 Nov 2024 09:34:03 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 20 Nov 2024 09:34:03 +0100
X-UD-Smtp-Session: l3s3148p1@xGMhA1QnwLIgAwDPXxznANR4Jedc6XSv
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	=?UTF-8?q?Carsten=20Spie=C3=9F?= <mail@carsten-spiess.de>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH 1/3] hwmon: (isl28022) use proper path for DT bindings
Date: Wed, 20 Nov 2024 09:33:50 +0100
Message-ID: <20241120083349.22226-6-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241120083349.22226-5-wsa+renesas@sang-engineering.com>
References: <20241120083349.22226-5-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Vendor is "Renesas" not "ISL".

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 Documentation/hwmon/isl28022.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/hwmon/isl28022.rst b/Documentation/hwmon/isl28022.rst
index 8d4422a2dacd..a7920a884b9f 100644
--- a/Documentation/hwmon/isl28022.rst
+++ b/Documentation/hwmon/isl28022.rst
@@ -33,7 +33,7 @@ details.
 
 The shunt value in micro-ohms, shunt voltage range and averaging can be set
 with device properties.
-Please refer to the Documentation/devicetree/bindings/hwmon/isl,isl28022.yaml
+Please refer to the Documentation/devicetree/bindings/hwmon/renesas,isl28022.yaml
 for bindings if the device tree is used.
 
 The driver supports only shunt and bus continuous ADC mode at 15bit resolution.
-- 
2.45.2


