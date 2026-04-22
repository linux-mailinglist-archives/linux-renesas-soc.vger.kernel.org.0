Return-Path: <linux-renesas-soc+bounces-31517-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sAAqOe1b6WliYAIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31517-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Apr 2026 01:38:21 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 825A844BCC9
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Apr 2026 01:38:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 43198308F449
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Apr 2026 23:38:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFABB3A6B66;
	Wed, 22 Apr 2026 23:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="PdPRHJh1";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="bmm+Ru7o"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79F313A640A;
	Wed, 22 Apr 2026 23:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776901086; cv=none; b=UFslbbBoL9DG1snszq8N1C2qExfBD64t53Fit7Hqj1jwAgMDOvwdQ2GvU/JWz3b35WivYcpNcnHcfE1eh4QYuwzX/1hlqYD35o9PVg/LNQB2NgWzYjjLS17ahHotYw8ydZrRK3+UC2rPH9LPckl35LJnJ//Z5dOPyCH2NxKOteM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776901086; c=relaxed/simple;
	bh=w8pEaGmSpuEzff/lW3SICfLjZbltxMJ3GiDEQvrjiw0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dCpFHYkbmSeX2dCrEc0+JzBGAqlfhxr8J5AdOxGb1jmb9rezV+HrAzFQv27Qc1bHa0B5MXtTYLS5xRX2ORqBOkYQcXZ7v5Ey79jStIxafBNi6zjX+rwtQaS3UtLU9S3rE98QWsqPL7EDOAtnA8g/UEs/bQW7k9kcNfV+cZFZPbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=PdPRHJh1; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=bmm+Ru7o; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4g1Fyg5d2Hz9v66;
	Thu, 23 Apr 2026 01:38:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1776901083;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9eeYPRnU/QJypIfdTFPZeqTjC4sJbxZIBwyOo8+Te6Y=;
	b=PdPRHJh16kQFMIXqoaedSarcFE8fSjnTjSqyOYuPuUFGOyW/g2e02TsaY8s6OstGzXhWEs
	MpYX7C7o3kZeINGHramjZVmTQY1sihy9wjuTl6Gf+ZBXCMblK7QLk4tzrGtj+Zcnazib//
	kbdQBQSRhxrEesQQykLBm4hKsCA4r2Y5FjuIDaujgCO0KoJOT2hUlOWvoKkLjv//5iPD9X
	VP/73QzV9O0oAg+P3uvJN6IOhFB6w2dUTcp8QjN2A+DphngsMojZppx9lwVXs4sSb4evQ3
	SH+VTBbb+e/RQggLJdO/AMk7ph56e+hbqciG/czLi6yvgBEWXh50xy3F4uLAqw==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=bmm+Ru7o;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::202 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1776901082;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9eeYPRnU/QJypIfdTFPZeqTjC4sJbxZIBwyOo8+Te6Y=;
	b=bmm+Ru7o6N9v2YAgW/gLt34gDgdnEgVgZRQXXvx3CGl6yQzlg1+nqIWd1IepZuGyMD8yQ6
	UHVb4aCn1IuCO7sx+Pmyqai29SwFwa75Fwl2zkuDprtowlPqQzCmCqoIjp8TzmR+5Ncg8H
	Qc93NIYHJ+OsYIJy5xp55eMVTMUPQVeCisvCU0Xy/yMl+MNf48SWXgeb5mjwuQ3u10leCW
	8EB/Aiw5YvtzGYxxnQxUnpGjzbpqx5Th8WvtwVNJmlfpgKBTJlFMGJ78kSR4gGWGYRXtRD
	/T598fJ7BndTlftPbLYjlJfV1nQXZ2QC/X80hrt06r0AFbAGHzlemRZbXhWXKw==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v3 3/4] ARM: dts: renesas: r8a7740: Add ZT/ZTR trace clock on R-Mobile A1
Date: Thu, 23 Apr 2026 01:36:29 +0200
Message-ID: <20260422233744.149872-4-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260422233744.149872-1-marek.vasut+renesas@mailbox.org>
References: <20260422233744.149872-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 426a47f61ea95f5de91
X-MBO-RS-META: eruduow9rsrqtoaz9dnudiniyi1rdh81
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31517-lists,linux-renesas-soc=lfdr.de,renesas];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[mailbox.org,kernel.org,glider.be,gmail.com,baylibre.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marek.vasut@mailbox.org,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[mailbox.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,glider.be:email,mailbox.org:email,mailbox.org:dkim,mailbox.org:mid,baylibre.com:email,e6150000:email]
X-Rspamd-Queue-Id: 825A844BCC9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add ZT trace bus and ZTR trace clock on the R-Mobile A1.
These clock supply the coresight tracing modules, PTM, TPIU,
ETB and replicator. Without these clock, the coresight tracing
can not be operated.

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Rob Herring <robh@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-clk@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
---
V2: Add ztr/zt clock at the end of the list to match bindings
V3: Keep only the trace clock DT part here, extend the commit message.
---
 arch/arm/boot/dts/renesas/r8a7740.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/renesas/r8a7740.dtsi b/arch/arm/boot/dts/renesas/r8a7740.dtsi
index d13ab86c3ab47..f7136db7a2eae 100644
--- a/arch/arm/boot/dts/renesas/r8a7740.dtsi
+++ b/arch/arm/boot/dts/renesas/r8a7740.dtsi
@@ -553,7 +553,7 @@ cpg_clocks: cpg_clocks@e6150000 {
 					     "usb24s",
 					     "i", "zg", "b", "m1", "hp",
 					     "hpp", "usbp", "s", "zb", "m3",
-					     "cp";
+					     "cp", "ztr", "zt";
 		};
 
 		/* Variable factor clocks (DIV6) */
-- 
2.53.0


