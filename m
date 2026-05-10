Return-Path: <linux-renesas-soc+bounces-32315-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YBCzBJRFAGqmFgEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32315-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 10 May 2026 10:45:08 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A3A38503293
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 10 May 2026 10:45:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 53CCC302675F
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 10 May 2026 08:43:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF41236B07E;
	Sun, 10 May 2026 08:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VSMlH0LC"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D87636A033
	for <linux-renesas-soc@vger.kernel.org>; Sun, 10 May 2026 08:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778402633; cv=none; b=SzdfxEenjswVCMup+J5n0gbVlq7SNUmBxFfD5D18DD/T4iJH99TmmTaQxRebLxpMfTh4nnpPTleALxJCg3b+VUQvjK+mVyzD+C5GZbivk5QKsGc2cmb4jtOtpiFXhHJ0kFQo/grWUeT6fpvGNUr/2i3cO2akSxa9+EvOQqSq1Hw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778402633; c=relaxed/simple;
	bh=DTF/btmt/0REEac1VNTgRyM88bPMcPEL04SwiJzjaGQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jheI/3Pt7EIsmV2dhHroubKIGSVZmFqnCCz9Vl8/O0CfaPnv93p6u0D7otD53ffYDGiOKSpadIOyzGtURF1XAi9W0pgONrY04dxElWFfK/K7AHOzBEunBiykaY4O3gVR6d73hBOk7zU2Qa/+aV8Yzrywhae+kPli324SCcR31PI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VSMlH0LC; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2ad9f316d68so15002275ad.2
        for <linux-renesas-soc@vger.kernel.org>; Sun, 10 May 2026 01:43:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778402632; x=1779007432; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RUQuLqpOBSAJcHe1LC1qE0yMZ0cjnVVQWqbr1WChTYw=;
        b=VSMlH0LChQ0K87Cs1v3Fvm5/AoklouohVNi5bndBp7bSqq6np6ERoN9kp8rgtw7Jkx
         NKePUwr0K+2SmdO+uck+EEsSAYOZYsWSyOPh+Z64SfZBIg2kq436y8hhvExT9fTOvLyq
         l1fw9Kkyzkdr9feQff+EWOnoXtdcsdyETbFA6wYN1mmiS9ZBxEJM3uWo4pt08fIlBH5f
         w7VAQeitAkbJebSjBVya+pUZjVdffbchK74cUBRhEvX7e3sxRMYZB0FQx/7aIGGAsOWo
         wNz8QYW57k6Q8y5U9wXb9tx7TkQRX7HkEl2XPkiRZ9Dr27cIPfmqzTSSTcS3rRrQXIbj
         aGDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778402632; x=1779007432;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RUQuLqpOBSAJcHe1LC1qE0yMZ0cjnVVQWqbr1WChTYw=;
        b=Vvh27nRoEOTNydufxtXNOEuDNg3Gk+dKlc4dyA0OGyGKsvKlXlQvYcmYL8MBShRr5+
         y7b1ZNv+/b/O3rkl+5MuTPhYxniBvOw74dcDuOumbaTscPrzsuV4PI3wUkCFLm0mjXkv
         X6CAszc1lzDfHbBt8pUKPnCaGpyDpqKjDA2GFjYTzOfvQ+6de73R03/9b/EaJjw/FRmv
         UZ7dgyoq+a6WZDzGFj8MNbFprTa2n0BhI5sink17lWWqK152+zwCL3mRpUmeXRA4ZuMX
         wvB9miu0Va9dxAo61rPr5UNr6iA+mcxwOmToUwJRZrRTuu94OjbZiOcu5jKTlNms1fEH
         7P+Q==
X-Forwarded-Encrypted: i=1; AFNElJ+RGj6ZhGmhW1CHI5ZPqFBA4cRxqMa6e6w5Eu1E46du3jZuG/6tmFReoWrtdRaa4CvMxVj5kA4dOGKI/yOQv2Xs6A==@vger.kernel.org
X-Gm-Message-State: AOJu0YymV1oeZDKw+WPbANjnmqyHtEhk9YRLLx4DTrAJfxy1f1nEmSPT
	TJYMrqoodbDuu/PRy04WKCnqINlH1IsJiF9fcD+mScGfKuS1Z5wrcHAIQYSQig==
X-Gm-Gg: Acq92OGnXtFPRGaoWEzpHd9YECD1vIKvb9FRcduuN8Bf0C+ynwyLVZssdgCow0t+D5L
	UfnC53gWgkyL0L1cdUxAZCTDEaJIiccEKXXzn8oWLT3575aG6kI3FbqcdHkm3JrAR2pL4ahOGOZ
	29htm89THR0VGAPhvUULFUL0flqxGwPjRacLZu08/aHrtZwDNeDH7oKCsHjyCTnT+vIs82bAUEN
	OzgillnwYGZUQ2fb7PV9TTfcV1jqvO4H84ZY1m07BS3uDfrUQs5Ft4090ST8eCtenYYBcxzyt00
	JTB+U8MZPwUdoQMjTSyXOtufzfplaOwgGaK3Mp4LhnwJ77BzEQr2tJtMkDJMKvtaXVOjdOoHl8/
	OacVON9biw1kD4TifYoV6mLpJMRQYURZwSzTFJs6MMOjAnveZqYi9iIe1cs/NKYoltjlneTz9tc
	DH8aQ0Zs6oXMczca9r841fV9gmb+psBBNY5LQVD2AJiXYYhWQRVXnAXvMHRQ==
X-Received: by 2002:a17:903:38cd:b0:2ba:be5f:cab3 with SMTP id d9443c01a7336-2babe5fccc8mr136653355ad.3.1778402631615;
        Sun, 10 May 2026 01:43:51 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1d3ffa0sm70471005ad.25.2026.05.10.01.43.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 01:43:51 -0700 (PDT)
From: phucduc.bui@gmail.com
To: kuninori.morimoto.gx@renesas.com
Cc: broonie@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	geert+renesas@glider.be,
	krzk+dt@kernel.org,
	lgirdwood@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-sound@vger.kernel.org,
	magnus.damm@gmail.com,
	perex@perex.cz,
	robh@kernel.org,
	tiwai@suse.com,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v3 02/10] arm: dts: renesas: r8a7740: Add clocks for FSI
Date: Sun, 10 May 2026 15:42:55 +0700
Message-ID: <20260510084303.122426-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260510084303.122426-1-phucduc.bui@gmail.com>
References: <20260510084303.122426-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: A3A38503293
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,glider.be,gmail.com,perex.cz,suse.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-32315-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FROM_NO_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[phucducbui@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.995];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[fe1f0000:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,e6150088:email,e6150090:email,e615009c:email]
X-Rspamd-Action: no action

From: bui duc phuc <phucduc.bui@gmail.com>

Add the SPU clock to the FSI node to ensure it is enabled before register
access, preventing potential system hangs.
Add missing clocks for FSI (icka/b, xcka/b).

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 arch/arm/boot/dts/renesas/r8a7740.dtsi | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/renesas/r8a7740.dtsi b/arch/arm/boot/dts/renesas/r8a7740.dtsi
index d13ab86c3ab4..6f9d9bbfd159 100644
--- a/arch/arm/boot/dts/renesas/r8a7740.dtsi
+++ b/arch/arm/boot/dts/renesas/r8a7740.dtsi
@@ -393,7 +393,11 @@ sh_fsi2: sound@fe1f0000 {
 		compatible = "renesas,fsi2-r8a7740", "renesas,sh_fsi2";
 		reg = <0xfe1f0000 0x400>;
 		interrupts = <GIC_SPI 9 0x4>;
-		clocks = <&mstp3_clks R8A7740_CLK_FSI>;
+		clocks = <&mstp3_clks R8A7740_CLK_FSI>, <&spu_clk>,
+			<&fsia_clk>, <&fsib_clk>, <&fsiack_clk>,
+			<&fsibck_clk>;
+		clock-names = "fck", "spu", "icka", "ickb", "xcka",
+				"xckb";
 		power-domains = <&pd_a4mp>;
 		status = "disabled";
 	};
@@ -614,6 +618,12 @@ vou_clk: vou@e6150088 {
 				 <0>;
 			#clock-cells = <0>;
 		};
+		fsib_clk: fsib@e6150090 {
+			compatible = "renesas,r8a7740-div6-clock", "renesas,cpg-div6-clock";
+			reg = <0xe6150090 4>;
+			clocks = <&pllc1_div2_clk>, <&fsibck_clk>, <0>, <0>;
+			#clock-cells = <0>;
+		};
 		stpro_clk: stpro@e615009c {
 			compatible = "renesas,r8a7740-div6-clock", "renesas,cpg-div6-clock";
 			reg = <0xe615009c 4>;
-- 
2.43.0


