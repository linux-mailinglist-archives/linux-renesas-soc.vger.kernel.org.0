Return-Path: <linux-renesas-soc+bounces-22996-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id EAE9DBD8CD8
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Oct 2025 12:46:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D05394F049C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Oct 2025 10:46:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D23DC2F9D86;
	Tue, 14 Oct 2025 10:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="kF0vJiJD";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="OYLagKI8"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98ADA2D8DAF;
	Tue, 14 Oct 2025 10:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760438811; cv=none; b=FVxmkOuq3HSJLnOADiHvtr1F2q/HJDUhpv7uzSup0PPTyyMd40qHP+RyZvJaPzyUV2OYt1ohR0erCjUqyPrWnykdCl4hismgwe5VSTlrMIl5z2OVviiyDx/1cozwmc8ktFLlXJU66/MRxsZeyabNAKa+7lAbxG47q3f5YM5cenk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760438811; c=relaxed/simple;
	bh=J5cGKQ7ib6j+foxfpPAYFC5BN5rwa+rlmWWDA+c+YNo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=plCG/LQ05fVwt/T7LIOA4qezAvri3WH8OfWl2DWmgbPMrkffGEplQqy/wZNmPmtwfGy37LbHClke83LRBtaBW3KYV3wd6L3zn0Fqt79Nig+m0EEg1VKrv9B4XLO2g/FkajC59bQAYWl9D+5gjueN/cphd9cpRHF4GPKwWGLnalo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=kF0vJiJD; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=OYLagKI8; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4cm9rR3KXhz9tSq;
	Tue, 14 Oct 2025 12:46:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1760438807;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=SWWrsBpR7aC/HdPqmhuSETjy0DLiu2RVjUmznP1EZ3g=;
	b=kF0vJiJDcogCNv0cFOdvVpENtqcMPoNYg7j0M6RLIhIoslGj8vRCssoyBtR5d/0gQ0/RDF
	pcx/qqSQcQR8mbPICIt3akYSahBxsk79iqhs6TssIgti3SkDllbDViikMUbKwD7Tt2Q02K
	FiYQrvOwAq8hPvo9dBdqwt0lRpSPFcCy3NTitTvRZdLpVd/cuBvr/IZ5bLjHfm3mGk5d70
	EIb8fSsjXHOsIYy8ggnXflGDsJlSkRNjPcheIyImLUZxQ32nqFkEjIc04jRPJX1ajaaWUB
	6EpzKJ32ElcgJ1rM3/TlQg02OJcjo/Kb+afhXXasc/7TKHzDwedncjC42uJJyA==
From: Marek Vasut <marek.vasut@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1760438805;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=SWWrsBpR7aC/HdPqmhuSETjy0DLiu2RVjUmznP1EZ3g=;
	b=OYLagKI835qdAPt0LeDDDPypVvLtva5oIsZ2dN7fq6EYxTnXx//ww9kfnotHojaQPpG3DZ
	nnyJbOlp7w86QT8+r4pDht3mRFNNgf+8EM9rHy1xZlijHRYf5YDcaBNRrZYyExEFdxtNsj
	LX47wmSskHe/aPmU+kZKGsnroDNppEJBZCitZUExfCK52uyliAOJojk7KrP94nZ+Hyr9xX
	GQhU4wjwVnAik6jiaBZEquo3UZT9o1u7+Qhzlo9Hf2VWPx8a1s2K4vkOc4stkssmXQ3hQ1
	gcYFA2xACN38Q7j5+KDsCpzOeYPPRgxhexDLG5+Ay16kVJctlXA/DzhwsI8AGg==
To: linux-clk@vger.kernel.org
Cc: Marek Vasut <marek.vasut@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH] dt-bindings: clk: rs9: Fix DIF pattern match
Date: Tue, 14 Oct 2025 12:46:03 +0200
Message-ID: <20251014104626.10682-1-marek.vasut@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 7e34b1579a2a1b96ac5
X-MBO-RS-META: s6uxqg19jh1au34je3g8qwdwc9oxoxzm

The pattern match [0-19] is incorrect and does not cover range of 0..19,
use pattern 1?[0-9] to cover range 0..19 instead. Update the example to
validate all parts of the pattern match and prevent such failures in the
future.

Fixes: 26c1bc67aa2f ("dt-bindings: clk: rs9: Add Renesas 9-series I2C PCIe clock generator")
Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Rob Herring <robh@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-clk@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
---
 .../devicetree/bindings/clock/renesas,9series.yaml    | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/renesas,9series.yaml b/Documentation/devicetree/bindings/clock/renesas,9series.yaml
index af6319697b1c0..a85f78ce29702 100644
--- a/Documentation/devicetree/bindings/clock/renesas,9series.yaml
+++ b/Documentation/devicetree/bindings/clock/renesas,9series.yaml
@@ -62,7 +62,7 @@ properties:
     description: Output clock down spread in pcm (1/1000 of percent)
 
 patternProperties:
-  "^DIF[0-19]$":
+  "^DIF1?[0-9]$":
     type: object
     description:
       Description of one of the outputs (DIF0..DIF19).
@@ -107,6 +107,15 @@ examples:
             DIF0 {
                 renesas,slew-rate = <3000000>;
             };
+
+            /* Not present on 9FGV0241, used for DT validation only */
+            DIF2 {
+                renesas,slew-rate = <2000000>;
+            };
+
+            DIF19 {
+                renesas,slew-rate = <3000000>;
+            };
         };
     };
 
-- 
2.51.0


