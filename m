Return-Path: <linux-renesas-soc+bounces-28739-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qA2oENFvp2kEhgAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28739-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 04 Mar 2026 00:33:37 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DF7EC1F8654
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 04 Mar 2026 00:33:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 785813072F01
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Mar 2026 23:33:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEDD735F18A;
	Tue,  3 Mar 2026 23:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dNFN5vMu"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 544F7356A37
	for <linux-renesas-soc@vger.kernel.org>; Tue,  3 Mar 2026 23:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772580806; cv=none; b=hOPutMk7Mm76O866fIcRrwsIuvhPmp2WzZ2TSdrPi1BImpIlLOe0Y81/CdAyxmzi4tkucjA3UTVB0CvoZ45D0CrHFLx0mVuNG1Mqnv1QT/E1whW4L+GVc1dUZ1KLG8YKd/JgTAJoUsCLHTy2Vw1d1oL531eyaJPmxAI7DaLCJFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772580806; c=relaxed/simple;
	bh=DVxyLgT1c/qaw7wr26tCEWN2Hw7Qwy3ie2oqtBAYrMc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RciwMW0UDK+pKbB/spHmHdvzhuha23s34EsOG+ZPCYrbitjrXvopMRdaRa1u25be2wccu2WeZ+8QVjm9HM+VrpMfbQb1t1vVEHu+r2w7PTIQ/AEoVKzkx9UqsBylIcTI2/F7efryQnzR9pooyTeSaMbMuwF9F77fgm4SUKWNFYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dNFN5vMu; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4806cc07ce7so70534185e9.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 03 Mar 2026 15:33:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772580804; x=1773185604; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YS6NtC7nzXx1gPxu+nMjons5ksbseO96oSa6YbAgoHQ=;
        b=dNFN5vMu+1jHMVz8y83Mt1ecCMp27xOmp9hNXZuzd3DSZxBm25JSgS4CJ2HPEHrwnp
         oX2kYSLQ9x8nuW73Bgu+oXnNLFUoP02YtYhk8vP+QvdYHX0ITP64JfjFg2dnN5t3F/Ci
         tLyJAX8COioiceFnljC8qSGZ8XT63fwocr1rSyEJeXMUCPaSAusyMUBGyrIqEiA08Yq3
         k5me4IOT6r69C1cfvPBcmET3cQHR34J1Tczpw+7dKcvlNR00xNhaLNc92Z1jlWBkGakX
         7xl4uG6v8s/7ju9PMLy4Y3xgdAHmKuahzdIqWV88iau8tpGvcNaOHoHt3zODDj6OVzQs
         Y9Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772580804; x=1773185604;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YS6NtC7nzXx1gPxu+nMjons5ksbseO96oSa6YbAgoHQ=;
        b=OSxvilVDb0O/EWuF0uwrZaSwIx+TQ3Eed+1l/kt8A2bDJf9leaZlyRNo4yGKRuu4LW
         8AiUmW8TlyCueBp2d7VR0htK4hqRx/JahdHPGPph5l5531IFJc0fW7yKb0N1O41T9DcO
         CwC6opMQcAjuo1sB0vLVz+qHs5y1M+Lr4RDt2ympBie5LDFcZPnhvD9WzgypqBQy08K3
         YbIVY31hVuieLu1PEA9yOMR/qXblnMqE1skTOHPSGs41HGEt+jGujSFkWsY0fOXlS4rz
         ss9vbN2Av5SHh8MYPGxG/L8IGa9wtd8Hc6cltCWRhWgmVH1QhQdBo0kcWCVO69vVWyuX
         1eUw==
X-Gm-Message-State: AOJu0YxVb6p7p917F7KhxrstccvCFv3s0Ys4qvpapwtoioZIjix+fdvy
	ZUGTKJFSjj+nqn0DlhdDaRzrahQ60tWXD/QuxlYRLt71aIlbdq3zqb4X
X-Gm-Gg: ATEYQzwTUZ3hnGhoTCd4O4xJMyN2WBlmisCfD1bn0RpYT/VqAediY6nys0Ndna+Cpbf
	EbuXCttO6GYFS7LP3LbRLk+0YWEulpdYwEcRggNdnoVPv8wwF45A/ID8yTuQ/5c/zQLMNT0ezuw
	hVczEe99C+aA38P1UIA6bDfpAujAXdPVcxxvp1amjcQq0x1GdSx9jHG/zkLHIkyQHBHgXfwQbSC
	loVe7SVO1Lk5LTb/Ui/O5Brs5M+yKF3W3nJyvDoAZ/k87+uAZLvDelHcVrCRNBG+URgCFABKkIP
	1G0N3yFqU/DbDMmRn5KjPvXBinHvKcCCFTD21q5rcf6NbQ99xHRH3CuQjusqKqXKOccFJdLOt9m
	mMJ0jOsLTHzhBtOkGUc1RcjudMH/wTlGw7V61Ijd5cqZtFW7vlNGVOhO0RLWfKXyaPKbbzHRvSg
	qEifGEv04PztoL7qBDrwIzKAXoXkPV4gP+C/qC7vlZ26GPaJOkA/eElFGfO2V5se7fxdednGFJE
	aCRraNyjB1vx/IXnQZTAnUgJyqWF1ugNeBiUVtaFZuyY4Io
X-Received: by 2002:a05:600c:8b6a:b0:480:3a72:524a with SMTP id 5b1f17b1804b1-48519888807mr811375e9.19.1772580803675;
        Tue, 03 Mar 2026 15:33:23 -0800 (PST)
Received: from iku.Home ([2a06:5906:61b:2d00:30fa:3523:429c:2894])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-485126705e5sm26188185e9.5.2026.03.03.15.33.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 15:33:22 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 2/2] arm64: dts: renesas: r9a09g057: Add DMA support for RSPI channels
Date: Tue,  3 Mar 2026 23:33:14 +0000
Message-ID: <20260303233314.2928711-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260303233314.2928711-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260303233314.2928711-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: DF7EC1F8654
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-28739-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[glider.be,gmail.com,kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com,renesas.com];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,0.195.81.144:email,0.195.80.0:email,0.195.83.32:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,renesas.com:email]
X-Rspamd-Action: no action

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Enable DMA support for RSPI channels.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2:
- Added all the possible DMA channels
---
 arch/arm64/boot/dts/renesas/r9a09g057.dtsi | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
index 02ec79a556f0..7be228f267fb 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
@@ -765,6 +765,13 @@ rspi0: spi@12800000 {
 			clock-names = "pclk", "pclk_sfr", "tclk";
 			resets = <&cpg 0x7b>, <&cpg 0x7c>;
 			reset-names = "presetn", "tresetn";
+			dmas = <&dmac0 0x448c>, <&dmac0 0x448d>,
+			       <&dmac1 0x448c>, <&dmac1 0x448d>,
+			       <&dmac2 0x448c>, <&dmac2 0x448d>,
+			       <&dmac3 0x448c>, <&dmac3 0x448d>,
+			       <&dmac4 0x448c>, <&dmac4 0x448d>;
+			dma-names = "rx", "tx", "rx", "tx", "rx",
+				    "tx", "rx", "tx", "rx", "tx";
 			power-domains = <&cpg>;
 			#address-cells = <1>;
 			#size-cells = <0>;
@@ -786,6 +793,13 @@ rspi1: spi@12800400 {
 			clock-names = "pclk", "pclk_sfr", "tclk";
 			resets = <&cpg 0x7d>, <&cpg 0x7e>;
 			reset-names = "presetn", "tresetn";
+			dmas = <&dmac0 0x448e>, <&dmac0 0x448f>,
+			       <&dmac1 0x448e>, <&dmac1 0x448f>,
+			       <&dmac2 0x448e>, <&dmac2 0x448f>,
+			       <&dmac3 0x448e>, <&dmac3 0x448f>,
+			       <&dmac4 0x448e>, <&dmac4 0x448f>;
+			dma-names = "rx", "tx", "rx", "tx", "rx",
+				    "tx", "rx", "tx", "rx", "tx";
 			power-domains = <&cpg>;
 			#address-cells = <1>;
 			#size-cells = <0>;
@@ -807,6 +821,13 @@ rspi2: spi@12800800 {
 			clock-names = "pclk", "pclk_sfr", "tclk";
 			resets = <&cpg 0x7f>, <&cpg 0x80>;
 			reset-names = "presetn", "tresetn";
+			dmas = <&dmac0 0x4490>, <&dmac0 0x4491>,
+			       <&dmac1 0x4490>, <&dmac1 0x4491>,
+			       <&dmac2 0x4490>, <&dmac2 0x4491>,
+			       <&dmac3 0x4490>, <&dmac3 0x4491>,
+			       <&dmac4 0x4490>, <&dmac4 0x4491>;
+			dma-names = "rx", "tx", "rx", "tx", "rx",
+				    "tx", "rx", "tx", "rx", "tx";
 			power-domains = <&cpg>;
 			#address-cells = <1>;
 			#size-cells = <0>;
-- 
2.53.0


