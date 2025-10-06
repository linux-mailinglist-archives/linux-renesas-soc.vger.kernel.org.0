Return-Path: <linux-renesas-soc+bounces-22690-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 74426BBD596
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 06 Oct 2025 10:29:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 341293B74DE
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 Oct 2025 08:29:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 135922620E5;
	Mon,  6 Oct 2025 08:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="lz/1Wjek"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14C1125EFBE
	for <linux-renesas-soc@vger.kernel.org>; Mon,  6 Oct 2025 08:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759739355; cv=none; b=BjUgKX+ol/C50w98SSQpPBDDCZTBo52bxYq6fVpkQJb1ibZVLr0LXz2LjGqvrW6ACfH+9B5srfDcVoKH7LZr5EHvmSgiYfRJYOjkClvBwCcm+mf4yv6VJ4dGbkYEzOSUwjVDEMmBZ6ciXWiiyak8XK5c/i61gjK+q5hOEwZjs80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759739355; c=relaxed/simple;
	bh=b0xILOK4hBdwbO229IFUNezmOCEWtoz4SLNRt+mQ4u8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ed8Aymf8561IeeGpmWIjFIwgxAL5w+ziM6SjS4UQHGqehIKIZX+F/VK1Kkedb1+IIgAFa3bM+bIOedL+mVjcn9DfwlVrcogp6uit94Z8Qe5RH3jMJBMFiQCtvBa81+lFvL70uWGe9S5db8lHf9Yv8YxNC2bXerjLdbP8Sg6W4qw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=lz/1Wjek; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=u7bMFKj68yRZquuVcsUCIO48VF3pIxO4q+l5hWfjRQQ=; b=lz/1Wj
	ekPZbHYLoE7UbPsEhvk26TDByDaXKTEeIB0DGwgRhEfkW0bjxw0PL+Qm5mjnjD9Z
	/0phVWT9PQm+wvAQWYlaUXlJP31mnj3/bWlFCx0XgZ769KXgHQJIv6DnonEoegcc
	OuNfPWUzXLNLJtSojuH7hi4igRFwG+8EiV5KUMypP/daYe1u/Dvx3BUH+6WgVsUq
	1bFkdSNCz5QMR3mqoEdSa70G9U2ZlSl0n1hLMdRL2iJdZUXuXwDlrSKLcXg/gPlw
	bZ09Cbgd2JhSnm5XDrc424qL+PVsTmXf9D6+TG/4y2+Fs889o+EkZQyUs+Pf/eHl
	VcLRlxFfkzL9g8ng==
Received: (qmail 1690006 invoked from network); 6 Oct 2025 10:29:09 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 6 Oct 2025 10:29:09 +0200
X-UD-Smtp-Session: l3s3148p1@mCrJPnlAmOwgAwDPXwQHAL/S9V79e5yL
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH 8/9] arm64: dts: renesas: r8a779h0: add SWDT node
Date: Mon,  6 Oct 2025 10:25:26 +0200
Message-ID: <20251006082520.10570-19-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20251006082520.10570-11-wsa+renesas@sang-engineering.com>
References: <20251006082520.10570-11-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 arch/arm64/boot/dts/renesas/r8a779h0.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779h0.dtsi b/arch/arm64/boot/dts/renesas/r8a779h0.dtsi
index 0f20a2d23983..c8c1db0514d2 100644
--- a/arch/arm64/boot/dts/renesas/r8a779h0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779h0.dtsi
@@ -199,6 +199,16 @@ rwdt: watchdog@e6020000 {
 			status = "disabled";
 		};
 
+		swdt: watchdog@e6030000 {
+			compatible = "renesas,r8a779h0-wdt", "renesas,rcar-gen4-wdt";
+			reg = <0 0xe6030000 0 0x0c>;
+			interrupts = <GIC_SPI 331 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_CORE R8A779H0_CLK_OSC>;
+			power-domains = <&sysc R8A779H0_PD_ALWAYS_ON>;
+			resets = <&cpg 1128>;
+			status = "disabled";
+		};
+
 		pfc: pinctrl@e6050000 {
 			compatible = "renesas,pfc-r8a779h0";
 			reg = <0 0xe6050000 0 0x16c>, <0 0xe6050800 0 0x16c>,
-- 
2.47.2


