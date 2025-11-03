Return-Path: <linux-renesas-soc+bounces-24052-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id CEC3BC2E007
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 03 Nov 2025 21:09:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E3D944F2231
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  3 Nov 2025 20:08:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 504DF299AB4;
	Mon,  3 Nov 2025 20:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="ocSImfaj";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="ZIG2rQkx"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68E3C29AAF8;
	Mon,  3 Nov 2025 20:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762200515; cv=none; b=fD0IGpIEC4hkmcYR+SflZf0N36nXqVRn/IsYCfLBpqdahpRXxs5zA/TySUSZB2juEP70IS5+2surpskKV7l4nFD/rpRY0jj8Qjjk72ssyfmP6Xby+ubYmQt2/Lzu3fty0Qqi9kVNPJWsts5r5T2LDAYOQsuSAPprs5VyqSdeWqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762200515; c=relaxed/simple;
	bh=LA2az8JRExiPjg51IaLhLUIYa+b5KWnjDgm+dhWo35s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nSkxd6LuBOHmZMOU8Sn1JLwVwtF+XbG+qYS3lsYDyCONZzz/gtPbxiWk6ROjkH4KMMevPVwR+5+Loz4DzW1nXtea0I/RExJl4L7tTfIARs6soxRxIWZIfH+uzDOL5sWBemaWoK5xkle2/KQCfN3cqeIgysHymmjDlmPVnZglRNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=ocSImfaj; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=ZIG2rQkx; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4d0jMG1mQ1z9tnv;
	Mon,  3 Nov 2025 21:08:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1762200506;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=D1UGhyuVKrdCv+eXNOryeajBu7PyQpDfmqjFM3c0rY8=;
	b=ocSImfajas+yqNhMn0ZrHsbnseS6yG/WfhoB2ZbBgDbUpUiRqVWzDjUpBEWQHhQEv+fQXu
	OOGqcg7dtAg5Zm0OlyTJhdueI/rU6TgDt88DrqYM5MD5tne8EroNGDL7vWFClApAZYnxpP
	ppDWZtdchzsHnuZMpgKVkzmOF8WLg4iYTo9QoHKWnn7G7JVjGvGfNl9TqlGYFlbrdPl5vz
	F5geJ8GRzE+fGLKhwxqqQ2vvFx05369RLGEeQmUtF6kFmuA9MzbH3D5/Uahhtf890XctK+
	oDncXQHPXL4dNtjRzSSwW44+NF+XALiI5XEg6kIkojexLYYn6waHZfQ06ahBwg==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=ZIG2rQkx;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::2 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1762200504;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=D1UGhyuVKrdCv+eXNOryeajBu7PyQpDfmqjFM3c0rY8=;
	b=ZIG2rQkx7zbkb5oC0psPkP97/4jCfqo7iw7n5rjZnnOsNWchnHNZE0yb7nk8liu1W56ji5
	CNlZRu0G2c1Y0BAZYUxQ2yh66kEzvcIlRFvQWVYxkpxH6mW0OpkwGOco545g3tGlEjzmKh
	UIfSzp2Vxjw4+0a8yke2PzaKi/9xX13KzU3gWzUDfGz+ZNJd+Bs1QzPn6N2V2WrBbedxpo
	35fG33mPxoQhMbQmKVffj7A1DTyYufW7rBjjZatGo4oYb+q5Vn58psqRsPts+S5Z5i0JfE
	SVtKNeHLsIGi5htO5w8TYbomEpoPopUXqJm8PzhPYgH9I90/ajR7TdDUaKlcvg==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Frank Binns <frank.binns@imgtec.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Matt Coster <matt.coster@imgtec.com>,
	Maxime Ripard <mripard@kernel.org>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Rob Herring <robh@kernel.org>,
	Simona Vetter <simona@ffwll.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 2/2] arm64: dts: renesas: r8a77965: Add GE7800 GPU node
Date: Mon,  3 Nov 2025 21:07:36 +0100
Message-ID: <20251103200800.173440-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20251103200800.173440-1-marek.vasut+renesas@mailbox.org>
References: <20251103200800.173440-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: ed9673057399781eee0
X-MBO-RS-META: tmak9nw4q9m9tsmcjdznujh7n18zs63g
X-Rspamd-Queue-Id: 4d0jMG1mQ1z9tnv

Describe Imagination Technologies PowerVR Rogue GE7800 BNVC 15.5.1.64
present in Renesas R-Car R8A77965 M3-N SoC.

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: David Airlie <airlied@gmail.com>
Cc: Frank Binns <frank.binns@imgtec.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: Matt Coster <matt.coster@imgtec.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: "Niklas Söderlund" <niklas.soderlund@ragnatech.se>
Cc: Rob Herring <robh@kernel.org>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: devicetree@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org
---
 arch/arm64/boot/dts/renesas/r8a77965.dtsi | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a77965.dtsi b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
index 0868b136883c..4e730144e5fd 100644
--- a/arch/arm64/boot/dts/renesas/r8a77965.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
@@ -2450,6 +2450,23 @@ gic: interrupt-controller@f1010000 {
 			resets = <&cpg 408>;
 		};
 
+		gpu: gpu@fd000000 {
+			compatible = "renesas,r8a77965-gpu",
+				     "img,img-ge7800",
+				     "img,img-rogue";
+			reg = <0 0xfd000000 0 0x40000>;
+			interrupts = <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_CORE R8A77965_CLK_ZG>,
+				 <&cpg CPG_CORE R8A77965_CLK_S2D1>,
+				 <&cpg CPG_MOD 112>;
+			clock-names = "core", "mem", "sys";
+			power-domains = <&sysc R8A77965_PD_3DG_A>,
+					<&sysc R8A77965_PD_3DG_B>;
+			power-domain-names = "a", "b";
+			resets = <&cpg 112>;
+			status = "disabled";
+		};
+
 		pciec0: pcie@fe000000 {
 			compatible = "renesas,pcie-r8a77965",
 				     "renesas,pcie-rcar-gen3";
-- 
2.51.0


