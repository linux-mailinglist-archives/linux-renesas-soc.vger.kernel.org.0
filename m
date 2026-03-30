Return-Path: <linux-renesas-soc+bounces-30563-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +AL0EEBSymnQ7gUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30563-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Mar 2026 12:36:48 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A9769359743
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Mar 2026 12:36:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B6D4D302DE4C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Mar 2026 10:29:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B58103B4E9B;
	Mon, 30 Mar 2026 10:29:40 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from Atcsqr.andestech.com (exmail.andestech.com [60.248.187.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF0DC1FF5E3;
	Mon, 30 Mar 2026 10:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.248.187.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774866580; cv=none; b=dkKRe5UpuA7B2jiQBc6n7alV4zFWVXG5x6kQU86ogvuOhTNR5GK3Ixk29bDK8wqW/r7xKzY8Jpzf0trkTqOTK5WaW3jAUj/wS3kdxfV1Md+1rIOz7VftskvJBC5kdTTi1y8OaGR1Y1zcBP6iAgdWA1gmF7H9VkY6i3Pn5f+YQCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774866580; c=relaxed/simple;
	bh=xR4/eiW2jwE62sTUaUNq6rB16VdY5+2Jv/gBv7tkuoc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RLMpaQe2sUJlSgouvjnkA1MLycIVGcBC4SIZ6kheASP0C8c2U61+nkRLNpTYNWj6uyuhprn6lNK3JjPqU5t4TIBeyKxSMZVjEsIh+Bg7TmMl2B0SmJuKNuwCDPRFosdak9vtvE2msz9O9Ap8moRyZHvdPX8ao76LcA86+xtdaZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=permerror header.from=andestech.com; spf=pass smtp.mailfrom=andestech.com; arc=none smtp.client-ip=60.248.187.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=permerror header.from=andestech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=andestech.com
Received: from mail.andestech.com (ATCPCS34.andestech.com [10.0.1.134])
	by Atcsqr.andestech.com with ESMTP id 62UASI1F038289;
	Mon, 30 Mar 2026 18:28:18 +0800 (+08)
	(envelope-from minachou@andestech.com)
Received: from swlinux02.andestech.com (10.0.15.183) by ATCPCS34.andestech.com
 (10.0.1.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 30 Mar
 2026 18:28:18 +0800
From: Hui Min Mina Chou <minachou@andestech.com>
To: <pjw@kernel.org>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
        <alex@ghiti.fr>, <geert+renesas@glider.be>,
        <prabhakar.mahadev-lad.rj@bp.renesas.com>, <magnus.damm@gmail.com>,
        <ben717@andestech.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <jonathan.cameron@huawei.com>,
        <devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>
CC: <tim609@andestech.com>, <alex749@andestech.com>, <az70021@gmail.com>,
        "Hui
 Min Mina Chou" <minachou@andestech.com>
Subject: [PATCH 6/7] dts: riscv: update cache compatible strings to LLC
Date: Mon, 30 Mar 2026 18:27:23 +0800
Message-ID: <20260330102724.1012470-7-minachou@andestech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260330102724.1012470-1-minachou@andestech.com>
References: <20260330102724.1012470-1-minachou@andestech.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ATCPCS33.andestech.com (10.0.1.100) To
 ATCPCS34.andestech.com (10.0.1.134)
X-DKIM-Results: atcpcs34.andestech.com; dkim=none;
X-DNSRBL: 
X-SPAM-SOURCE-CHECK: pass
X-MAIL:Atcsqr.andestech.com 62UASI1F038289
X-Spamd-Result: default: False [3.54 / 15.00];
	DMARC_POLICY_REJECT(2.00)[andestech.com : SPF not aligned (relaxed), No valid DKIM,reject];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_PROHIBIT(0.00)[0.1.134.160:email];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30563-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,dabbelt.com,eecs.berkeley.edu,ghiti.fr,glider.be,bp.renesas.com,gmail.com,andestech.com,huawei.com,vger.kernel.org,lists.infradead.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.3.13.64:email,12c00000:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,0.204.119.192:email];
	FREEMAIL_CC(0.00)[andestech.com,gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[minachou@andestech.com,linux-renesas-soc@vger.kernel.org];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	PRECEDENCE_BULK(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: A9769359743
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Update the cache driver compatible strings from ax45mp-cache to llcache
for both Qilai and RZ/Five platforms.
This follows the Andes cache driver refactoring to use more generic
Last Level Cache (LLC) naming.

Signed-off-by: Hui Min Mina Chou <minachou@andestech.com>
---
 arch/riscv/boot/dts/andes/qilai.dtsi        | 4 ++--
 arch/riscv/boot/dts/renesas/r9a07g043f.dtsi | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/boot/dts/andes/qilai.dtsi b/arch/riscv/boot/dts/andes/qilai.dtsi
index de3de32f8c39..a7436cbf6f69 100644
--- a/arch/riscv/boot/dts/andes/qilai.dtsi
+++ b/arch/riscv/boot/dts/andes/qilai.dtsi
@@ -137,8 +137,8 @@ plmt: timer@100000 {
 		};
 
 		l2_cache: cache-controller@200000 {
-			compatible = "andestech,qilai-ax45mp-cache",
-				     "andestech,ax45mp-cache", "cache";
+			compatible = "andestech,qilai-llcache",
+				     "andestech,llcache", "cache";
 			reg = <0x0 0x00200000 0x0 0x100000>;
 			interrupts = <16 IRQ_TYPE_LEVEL_HIGH>;
 			cache-line-size = <64>;
diff --git a/arch/riscv/boot/dts/renesas/r9a07g043f.dtsi b/arch/riscv/boot/dts/renesas/r9a07g043f.dtsi
index 571de3cafa82..83a5d4d41f8e 100644
--- a/arch/riscv/boot/dts/renesas/r9a07g043f.dtsi
+++ b/arch/riscv/boot/dts/renesas/r9a07g043f.dtsi
@@ -144,7 +144,7 @@ plic: interrupt-controller@12c00000 {
 	};
 
 	l2cache: cache-controller@13400000 {
-		compatible = "renesas,r9a07g043f-ax45mp-cache", "andestech,ax45mp-cache",
+		compatible = "renesas,r9a07g043f-llcache", "andestech,llcache",
 			     "cache";
 		reg = <0x0 0x13400000 0x0 0x100000>;
 		interrupts = <SOC_PERIPHERAL_IRQ(476) IRQ_TYPE_LEVEL_HIGH>;
-- 
2.34.1


