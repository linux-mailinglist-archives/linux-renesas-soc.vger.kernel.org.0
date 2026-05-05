Return-Path: <linux-renesas-soc+bounces-32071-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cJJ8HJzc+WkwEwMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32071-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 05 May 2026 14:03:40 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 26D0F4CD2C9
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 05 May 2026 14:03:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2A4E5302DF88
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 May 2026 12:02:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12E6D425CDF;
	Tue,  5 May 2026 12:02:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aTeD/7FO"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 372814218BD
	for <linux-renesas-soc@vger.kernel.org>; Tue,  5 May 2026 12:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777982542; cv=none; b=fAv89ju+8cxxDwMHaFtCJcKjlfANdZi1fhha1rXGfbZKd/pzJy6p7HUhDPlSqt5KmjIeWsnFvzPYdIms+bPszxvMN9eIp0ilEBOb5uIthGQjxWinliS7yDthOfIc9hht9YqkTVvefNorNrE4dJlf5g5lubnqUFG3qNtayYkaAIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777982542; c=relaxed/simple;
	bh=nyDAkXQ297bC2hhhcyANjebrHdsEJhyDOOdv90RCoCQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=R8KnEe0OXBnhCnyZAxXVI+rdjrPF8pGv4nEcNnNbTcRjPOtKGuHe/R2s/kFtDKvqOf9ilPlEBaaDPDfuCCVCD8lqvAg2UQqDSM3l+pRkn+Zin6nJYz0F4uKhJnV/5BSqPZzo+IpCGQVoLPyKdBze5cPjdgsUhX91zpnwzPiORjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aTeD/7FO; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5a40502e63bso5244293e87.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 05 May 2026 05:02:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777982538; x=1778587338; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aaJj/oLXLFqOqhgdWNSv4aF1pZo4Id+fK6SJZ89dQWA=;
        b=aTeD/7FOVF8hvdh2HqJ1tZfzz1oXRgcJsqOxFMWLDWjiJfWeOesPy42uD2Z3RzfBTM
         vaadz+4/ntzpu6CELRodNp8Glt5xdwcpk5EaduA9VPVrwOA0UL33RZCSTwH/sRgYCFNy
         ssjtCelNgcAitgl1bsS4jAcilwxyvdX5wT3FjZEoL/BqkxyRBI3/JkVQKNUaMh/Fp1HP
         7/c1eSVE5LHVvbSlx8Gaxko7EXP2huUZTCfVlNGBY1d+KCuTMMA3+SlcSPzNU7bSby/A
         23W18lJc0DFTl/D36mKPD7mE1fw2VbsIuiublNA416WtcA1AsmuLYxBSJ9pskyqwxfS1
         X9dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777982538; x=1778587338;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aaJj/oLXLFqOqhgdWNSv4aF1pZo4Id+fK6SJZ89dQWA=;
        b=VdFpfsqz4nZfVUrXasd9BtUAh1vnNIlZuE7XNrZ7TLk+aPKT1+ORJWR0p44mo1l5Ds
         aHZEu/0930H9KtwG6GVHIdmBC8jmbdDXBJ3iuYdMXBmEVozIdgSVRi4bXIRJ+fTKTIj+
         tbxI7yhKJkHbi3LGkt/w2Eo5lFns6f8WUNEt9qAAMyIyZLtueLSs/fc1kYpoAEGpu3Lt
         6S6XltpTJ2WAx8ZF8TCn9bAa3G/qkP+SKFhsng8NFTuwvcC6MYrND/ifJdqRn2Dk5X8L
         HfGeE8VI05ecvb5IMeBumEWBrefs7eUpDFI0ACEFrYec9zbjev/di58Gac/XWg3kH2Io
         B0pg==
X-Gm-Message-State: AOJu0YyQ44A5vlKejp0skfITH0zhJtGYgwKt27D4kng4Nt5wvUNbypF8
	/G8WnrMitSmU8WfvP1uSTnIBKJtkGFbkYSSaZUlWF25NEvmD5P2KLDlj
X-Gm-Gg: AeBDiev8/Yf5w/yNDrOhxxgdDJdnUyI0WCPQvs4VpxRHhIazWp4L8b5D0mwbjv8LnXP
	jlHHJE98AoLObrpNhXwvtBJ2kgMj+jO8RhWSmZbhymwUjgWrHMmwMUIN4SPyAHiU2S7ys/FiRyS
	S56/tq5rlPt7PWI2C2f3dT/nncD63d1nGnNTVt3txx/hKNz1Wc+6wkizMPwxqjN4lGqn3RJ6rmg
	CPR/1ImbL/47lgrqY8BaZ9bYbQO2WtvWvUnK0ClWE2Kz+c8fvRa+tXjDO9GEPRDy1CBY02/dKKR
	FQy7T1f7RT1ODNFSOSQpWhpMzi0RYYSxdemKzrpK+wSJ7xSQzqgHl6OnDVgnsn3VEwy8ePBjFmK
	sx2VBnW7huLBsePrU59Ms8Rysvcd3fcS3kYVJcVKIE6616iP+91CLh7SUSCnWJgCk2WD7rSPUsI
	DE2zWxdESQH1XabvQNARtbxRArMIm7UraoGAAuIPI/CbEmuxwpK9cIX5boqjWBZ/4C4BckEzxrN
	pR6Jswvlr1+oH2Y8vIG8x0OSKT/e7O3cvyKjPcCReD/OdPB96XDetKTszLnuhASVb+2
X-Received: by 2002:a05:6512:3e20:b0:5a8:73c3:f277 with SMTP id 2adb3069b0e04-5a873c3f37fmr3001152e87.12.1777982533511;
        Tue, 05 May 2026 05:02:13 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:7d2a:9b5b:a191:3b81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45054b03e04sm4386398f8f.21.2026.05.05.05.02.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 05:02:12 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 1/3] arm64: dts: renesas: r9a09g077: Add xSPI nodes
Date: Tue,  5 May 2026 13:01:51 +0100
Message-ID: <20260505120153.680979-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260505120153.680979-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260505120153.680979-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 26D0F4CD2C9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32071-lists,linux-renesas-soc=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.999];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[801c1000:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,4.200.249.192:email,renesas.com:email,bp.renesas.com:mid,0.0.0.3:email,801c0000:email]

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add xSPI (Expanded SPI) device nodes to the RZ/T2H (R9A09G077) SoC DTSI.
The RZ/T2H integrates two xSPI interfaces.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a09g077.dtsi | 38 ++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g077.dtsi b/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
index 3761551c9647..a5b570ae82c0 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
@@ -1006,6 +1006,44 @@ mii_conv3: mii-conv@3 {
 			};
 		};
 
+		xspi0: spi@801c0000 {
+			compatible = "renesas,r9a09g077-xspi", "renesas,r9a09g047-xspi";
+			reg = <0 0x801c0000 0 0x1000>,
+			      <0 0x40000000 0 0x10000000>;
+			reg-names = "regs", "dirmap";
+			interrupts = <GIC_SPI 654 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 655 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "pulse", "err_pulse";
+			clocks = <&cpg CPG_MOD 4>,
+				 <&cpg CPG_CORE R9A09G077_XSPI_CLK0>;
+			clock-names = "ahb", "spi";
+			resets = <&cpg 0x4>;
+			reset-names = "hresetn";
+			power-domains = <&cpg>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		xspi1: spi@801c1000 {
+			compatible = "renesas,r9a09g077-xspi", "renesas,r9a09g047-xspi";
+			reg = <0 0x801c1000 0 0x1000>,
+			      <0 0x50000000 0 0x10000000>;
+			reg-names = "regs", "dirmap";
+			interrupts = <GIC_SPI 656 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 657 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "pulse", "err_pulse";
+			clocks = <&cpg CPG_MOD 5>,
+				 <&cpg CPG_CORE R9A09G077_XSPI_CLK1>;
+			clock-names = "ahb", "spi";
+			resets = <&cpg 5>;
+			reset-names = "hresetn";
+			power-domains = <&cpg>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		cpg: clock-controller@80280000 {
 			compatible = "renesas,r9a09g077-cpg-mssr";
 			reg = <0 0x80280000 0 0x10000>,
-- 
2.54.0


