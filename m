Return-Path: <linux-renesas-soc+bounces-30519-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2EApJwYXx2mWSgUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30519-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 28 Mar 2026 00:47:18 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 09F4134C877
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 28 Mar 2026 00:47:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6808F30C6201
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Mar 2026 23:43:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2F43392C5A;
	Fri, 27 Mar 2026 23:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="hYxLEwow";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="fLvx8Es6"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCA603932DA;
	Fri, 27 Mar 2026 23:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774654997; cv=none; b=XFDrX6UlvE9BpE0Tg84QZiNtdDCCq6Ctk6lFi8S9qhMASP92tEVJgPjsdkHhXc75+LDdc680p4rZw6Mlm0kALWM0gdupSk9IBWL7482pYOY0hDuXu1JPSCk34ijCRqCtoXgZ5lE/DtzNROwvb7M/L2Imz6zrjYxmQWWpufIrXPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774654997; c=relaxed/simple;
	bh=IbqJlybPQ41SoSjvph940DQUuGCFknCAE+/lxY+Wh4s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k26mWCiaVMOA6dPu2/wKDRtz6WwxYFASnRYiztOnASXnl09UI/BcM2jjoG/AHOXWcZDKuQxbNT4TSRzv4acXFJsJIh4RTQrhXR+57v+q2TIIR8R/L4q/CxzDi3buc6VzjIBlNgvCHGyeep0vGgGANGuDViRuuwhD+7Y0E/1pT/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=hYxLEwow; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=fLvx8Es6; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4fjHJX1ZkHz9tcZ;
	Sat, 28 Mar 2026 00:43:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1774654988;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2bex1hO3WMYeSCxBiwiXbZfxoHtDMi+nquBUcT0rGf8=;
	b=hYxLEwowig8hDfdkmUVqZ1MFWBvzh4FdAYalK9wZGK7cCs7kO5LyTINCflFzggBGde9a/S
	Cti44lp1Ui6P9PrdM5k+ScaIivXk20z4vPhB8I3gY8aMNJVwlikUR3nocH+Syf7CFYCHsM
	7e36/fq5RwClRyxbQeeG5JrKN8l1Lp4XZsA7woovcGCr+AZ3oNM3L2tFOwaOOrw/3Inh9Y
	O8yNpVKHlrzrmVK8RQzGzQ4VId6dzlcQJR7NXNEsVQpO7k8lt+ONeEuhd0LY9bIB6z3Dp6
	I95euIFf4qv7/NmlqnljZtKfCWjNqoPJYltnDA2inuSFGvimK2HMDpDVWWbnVQ==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1774654986;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2bex1hO3WMYeSCxBiwiXbZfxoHtDMi+nquBUcT0rGf8=;
	b=fLvx8Es6HS5jyDv3GRC/YvU7sKLQ4NKMg7WubinyrDPUsRn0i0YIj3B1SE0nj6Zb/XkYd+
	VPBo3LuoL169iKI0rDtlPhlC1FWCLCLm1HouYVVAxt2+1xhrRIeRgKg/jOO9mm/aKfr5ZO
	frgrAkoQ8OGfPcMZmfl+JIobtq6tMCGxIlCqZnfvAsA9uGkx3l14pxQqf5I+hLVVsSIoiB
	Wf3RQ6A3Ju6xylekwFlS0U3BRTr6RhiiVYkvDh7Ebm/WUUw5H+VAjPHruL9bQYXMeTXQAp
	4quxBXhd2+NrMja1ZjSph7e3q7/wf+Q7MNownypWSDpmCTI9/bl+shcI1bOHzg==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 6/6] ARM: dts: renesas: rskrza1: Drop superfluous cells
Date: Sat, 28 Mar 2026 00:42:11 +0100
Message-ID: <20260327234244.91707-7-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260327234244.91707-1-marek.vasut+renesas@mailbox.org>
References: <20260327234244.91707-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: sab3p9wxckwoyiwimqizp6zzbfxu98oi
X-MBO-RS-ID: 0148749e24aab6b26ac
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[mailbox.org,kernel.org,glider.be,gmail.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30519-lists,linux-renesas-soc=lfdr.de,renesas];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[mailbox.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marek.vasut@mailbox.org,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 09F4134C877
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Drop superfluous address-cells and size-cells to fix DTC warning:
"
arch/arm/boot/dts/renesas/r7s72100-rskrza1.dts:32.17-72.4: Warning (avoid_unnecessary_addr_size): /flash@18000000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
"

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
---
 arch/arm/boot/dts/renesas/r7s72100-rskrza1.dts | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm/boot/dts/renesas/r7s72100-rskrza1.dts b/arch/arm/boot/dts/renesas/r7s72100-rskrza1.dts
index 91178fb9e7210..3306bc9b7bc37 100644
--- a/arch/arm/boot/dts/renesas/r7s72100-rskrza1.dts
+++ b/arch/arm/boot/dts/renesas/r7s72100-rskrza1.dts
@@ -36,8 +36,6 @@ flash@18000000 {
 		power-domains = <&cpg_clocks>;
 		bank-width = <4>;
 		device-width = <1>;
-		#address-cells = <1>;
-		#size-cells = <1>;
 
 		partitions {
 			compatible = "fixed-partitions";
-- 
2.53.0


