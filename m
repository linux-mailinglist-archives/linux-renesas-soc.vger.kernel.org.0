Return-Path: <linux-renesas-soc+bounces-27518-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gLN3Hfv0eWnT1AEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27518-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Jan 2026 12:37:31 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 17861A0926
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Jan 2026 12:37:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 38D3F302683A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Jan 2026 11:32:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3DD435295C;
	Wed, 28 Jan 2026 11:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XFT0kK+4"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com [209.85.218.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50F90350288
	for <linux-renesas-soc@vger.kernel.org>; Wed, 28 Jan 2026 11:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769599848; cv=none; b=MNL4R6iDfl+WIrCGyE1c0zBbpuzob21IntVw/qvP7R8f4By8oeYr48UKyC+RVXw1aNga34vHjt92jLDmfYlMtySWT/3/821/B5nIASwf0q6PKObG8xUa2i/n0iRRpXZnaa+4gBVJevOj3Rte/HOvKgneRmV023iitEqjM96wfV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769599848; c=relaxed/simple;
	bh=Wv8iBQh9BhPWMxxUkybXy7B9Wi0QfwnJCF9mYOUGzq8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Tcv8yW2+QYaQs08IasMaS7//stnU8la43OUqPxQK2ynKWSvUTN0jxXNnwz3ngNFFtKTaPzwCzPmH84xPOpEnGP7BIU0fFNATJD9P/930NS0Ogik6wVViyrIJTTSknjkl0iV482DfYf3LH+qq1gnoUaveF+wT2E4Z3uEnb13r3qo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XFT0kK+4; arc=none smtp.client-ip=209.85.218.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f66.google.com with SMTP id a640c23a62f3a-b8710c9cddbso809310766b.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 28 Jan 2026 03:30:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769599843; x=1770204643; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TYnWxJV7wO+oC9V9UGDmvqoLF/l/Si8kYGh6iersI0Y=;
        b=XFT0kK+4AhBCLYnPyhUAHLL7wg1JkJenkkoA8uAsAMkNAxla8ez/xx0hxT5GJEf8df
         ZODlMrYpmfZYyFlvdMRf6TTucQcGmutZNje7yJfXa7ipCxhfh+1o79I4VcQNsnEba1vF
         kSRRgrIHkaURSAB8fBqZjQIzV+JM6sUcGGKHr4s/fCL5FhiSTtIq/J+WtYbpJVgeoGaJ
         efjV4G/U5Q7T9IrxZa/RjlQCJoBPI+LLno6A0NhPCHK4p2zvp4GiH4jO6jLlr55bSgRR
         2dLD587oNdOCKWPU+VhpVP7DVIdVHMXDQnd3UumgB81ngnFOJUczIx8Ugx4X+hVLpWXL
         Ixkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769599843; x=1770204643;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TYnWxJV7wO+oC9V9UGDmvqoLF/l/Si8kYGh6iersI0Y=;
        b=ocqQArOpn+bkpJYeJW3rM3NUpGGP8CboJYCl2tQoze7ANqu+78OY+gJ2O/Bput/wVW
         ZF8BDL6txsZchHQ5VJWJL28314UPtFNH+D9d7Iv+2Zqjf/yCciPQol/W4kRu4k322l2U
         5N1eIO+GLaSbVkMbASAjDB2hkV0E+poyrh7Q2h7DGuEIGxHGWwWArS8Qrdp0I28Mxj8C
         DXyG+XcFEtGEL3c0uWwnrDx9Sm1tmrcuVx/XkSmBaEJVFZ7ZuwvjmJOCGBtZ06rrDvLx
         mibwZOgsXSvBOG1b971U9Pg8tVnr6UHBoW9f5MnJHDA7GnpuC0QOCtpFIwppo5ItFAJZ
         srCw==
X-Forwarded-Encrypted: i=1; AJvYcCVHbPRtRb8TZTu45ZlLbdirAKn3Ct4RTd1WQphv6PPc419UwJV1j4FCLqvmqYgGGf3AAkVtucH38bGrTZXBB/bS3A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwUMrZIiyZ3xRNE2cGA0s/gBGPeudtPWQ3LXdFFEAcm1J+6n6lR
	B3UfT5thwCL37keBveJ/oj99PO19WjMRkJWFP/9vDgEe9K5Fib9HXCiN
X-Gm-Gg: AZuq6aKaLSM1/+Ob2J3IUi4IU5NlZANlSaP7lPL++kwSCYe6Vs5pWGP02x6hXUpVQ1S
	yE7POhdsjYy71aK5pAz1Xhihnz1K50o9UOLB9Fq9FWnGZi2XGnos8TdmY5bHnXkE3serrf3WBAq
	TNCN02h3CTlZNLaNmOI5be3CVstWh6gvVsaL6nGGhIxphEY1cNV7fd6R0QPAak119DlQRNbXNW1
	bFE2OX4b6WcVmkxtW84ZxagB+eFYUATiUgZGjoOAmPFMR4pXyr8swozZ+iHfSuK8iYY6geViMXT
	wdAKW7yyJkzr13yZmYeELsDSh3x/qZ6LmjQ5UCixXQTEz4CYGlUSLaBRpmIV+zec4CQPrbVnAkL
	dN3VQAAoLmpg+fqrpdQFWWEB6dhTsVfubwMRVRaFMpXqVkQpRlj5L0+V8ZzWA8b56jjhJSFi3pf
	i7i+Kew7gVBuXTk1+5a9SnTmQ8I8sxvLIYMc0=
X-Received: by 2002:a17:906:9f85:b0:b86:f495:5e4c with SMTP id a640c23a62f3a-b8dab3cf38dmr352676266b.55.1769599842557;
        Wed, 28 Jan 2026 03:30:42 -0800 (PST)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:e29d:6e0e:72c1:d15d])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8dbf1baa42sm114400366b.46.2026.01.28.03.30.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 03:30:42 -0800 (PST)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v2 09/10] arm64: dts: renesas: renesas-smarc2: Move usb3 nodes to board DTS
Date: Wed, 28 Jan 2026 11:30:28 +0000
Message-ID: <20260128113032.337231-10-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260128113032.337231-1-biju.das.jz@bp.renesas.com>
References: <20260128113032.337231-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-27518-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,gmail.com];
	FREEMAIL_TO(0.00)[glider.be,gmail.com,kernel.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,renesas.com:email]
X-Rspamd-Queue-Id: 17861A0926
X-Rspamd-Action: no action

From: Biju Das <biju.das.jz@bp.renesas.com>

SMARC2 board dtsi is common for multiple SoCs. So move usb3 nodes
to board DTS as some SOCs (eg: RZ/G3{S,L}) does not support USB3.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * No change
---
 arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts | 6 ++++++
 arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi    | 8 --------
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts b/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
index 696903dc7a63..cc75f6fdf7f5 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
@@ -248,7 +248,13 @@ &sdhi1 {
 	vqmmc-supply = <&vqmmc_sd1_pvdd>;
 };
 
+&usb3_phy {
+	status = "okay";
+};
+
 &xhci {
 	pinctrl-0 = <&usb3_pins>;
 	pinctrl-names = "default";
+
+	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi b/arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi
index b607b5d6c259..69c0101ff7f5 100644
--- a/arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi
+++ b/arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi
@@ -107,11 +107,3 @@ &sdhi1 {
 
 	status = "okay";
 };
-
-&usb3_phy {
-	status = "okay";
-};
-
-&xhci {
-	status = "okay";
-};
-- 
2.43.0


