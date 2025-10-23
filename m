Return-Path: <linux-renesas-soc+bounces-23501-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id BF862C012A9
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Oct 2025 14:37:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 7F0524E72F3
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Oct 2025 12:37:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61992313E11;
	Thu, 23 Oct 2025 12:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="f7S/AOfU";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="Wn5Nl7G6"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A737B2F1FE6;
	Thu, 23 Oct 2025 12:37:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761223035; cv=none; b=ib6U5TaFNCScCNKYKh/z5KWIydnvJwh7cKOklF6VkvYIkYrDS+oNAUwBD8nBhxB0rouV8vL3qppmMHcmLTJeGysDg//3gmVlanrRSgIZgkxoRdFW9312oHnz0c+ss2zxGmOQxFmUBgSCvmHe8jqcDflrROYAe5yxR/6zHv5NhtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761223035; c=relaxed/simple;
	bh=0sUfSSI7p/RnLWbtiSW3BgdQi/kAat/k6I+2C86hC6Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TNYvYuPNI0B9yp6zMmNYoZhW5XclMlkNi1YCE87wcE75BXI4mDVXBwp2UC7VvHZ0AwCOBCiYlnuBHYWnkUl+oGk34YeLeqYE8ijrkMduiPmaU929IvsGMTooLr2g7LAGbweORJTcBH2Zi720qmYHrLlNQtGjmsktxrhODWlgm7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=f7S/AOfU; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=Wn5Nl7G6; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4cslsY3Nthz9sqg;
	Thu, 23 Oct 2025 14:37:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1761223025;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=6WkBUEsZXrdSrWtDBY0p0szZixzCZ3r/xfDV1TsjmXc=;
	b=f7S/AOfUym2WSQJD+wd5aCNm4AcP9LB01v9Bhh58ON7xu620sLvUk5ROwnxbwmbLhN1Z2+
	uBKqjPaqP6E/0fLu5zEEqrzO1NTJL9dQCffwu6oeCeKaT7B5aflKzAVxujWNjk/vLa3d6N
	JvSp20fGFIlPFVwuj4qeenp8qfF7l8Xp4YfTI0DIQ1swq/yyQPf+wR54F/h7zrE7CLLvMH
	GseK5unRSS1qw1gy1npHN7x9ojq1YT1pjYTJduGGBJ4VBhIdpdOVXqIhFyoUZ4t3inBk8M
	WVTxFLE4zcZTaIaEcO4TcEZXZBPwHw2v1W0DgJDZpMB3IxqYPjTi1uLyACnrhA==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1761223023;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=6WkBUEsZXrdSrWtDBY0p0szZixzCZ3r/xfDV1TsjmXc=;
	b=Wn5Nl7G6hP6vmCoD+qRaXIEZCLFqbYiHMmh50h/DCfCsq0FFf77PcNErjp1nsPCPWtK0bD
	60bl5kL+31jADa0JwZOhQJNr3xg/aw0oBdNPn8eUocT2IPmjsw+3XuzxJ2In4m9AqpIqsc
	DxAITUnhaly7YVw9rEQELxPUWmtYChtKxEW7sHbtjWO7cO9mnYARLYsQEKFWtII/hHLab9
	0L5bF7OrZ3XjrGmTbLVTyrlHVXvYx1C1FlzAQeMOZ020fOuhz2iZwyroE8FiA7cm6HhdAB
	hnApM0vnLoHJulQXoP/lP3Z9mQgTPLqBQ/XFfBQIxx33WLjNAD1/Mn+qzbAz4g==
To: arm-scmi@vger.kernel.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: firmware: arm,scmi: Document arm,poll-transport property
Date: Thu, 23 Oct 2025 14:35:57 +0200
Message-ID: <20251023123644.8730-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: ur38htuptdf9d77rhncyiu8mnbh67gm1
X-MBO-RS-ID: 946e3c1781cf93a3546

Document new property arm,poll-transport, which sets all SCMI operation into
poll mode. This is meant to work around uncooperative SCP implementations,
which do not generate completion interrupts. This applies primarily on mbox
based implementations, but does also cover SMC and VirtIO ones.

With this property set, such implementations which do not generate interrupts
can be interacted with, until they are fixed to generate interrupts properly.

Note that, because the original base protocol exchange also requires some
sort of completion mechanism, it is not possible to query SCMI itself for
this property and it must be described in DT. While this does look a bit
like policy, the SCMI provider is part of the hardware, hence DT.

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Cristian Marussi <cristian.marussi@arm.com>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Rob Herring <robh@kernel.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>
Cc: arm-scmi@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-renesas-soc@vger.kernel.org
---
 Documentation/devicetree/bindings/firmware/arm,scmi.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/firmware/arm,scmi.yaml b/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
index be817fd9cc34b..b53754a318ea1 100644
--- a/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
+++ b/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
@@ -146,6 +146,13 @@ properties:
       this platform. If set, the value should be non-zero.
     minimum: 1
 
+  arm,poll-transport:
+    type: boolean
+    description:
+      An optional property which unconditionally forces polling in all transports.
+      This is mainly mean to work around uncooperative SCP, which does not generate
+      completion interrupts.
+
   arm,smc-id:
     $ref: /schemas/types.yaml#/definitions/uint32
     description:
-- 
2.51.0


