Return-Path: <linux-renesas-soc+bounces-28791-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yKafBRlpqGl3uQAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28791-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 04 Mar 2026 18:17:13 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 797D620503D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 04 Mar 2026 18:17:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 685F63011A6D
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Mar 2026 17:11:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD33A379993;
	Wed,  4 Mar 2026 17:11:14 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9102B376BDC;
	Wed,  4 Mar 2026 17:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772644274; cv=none; b=EEbdLdRu0Bp1UuklB39bdcQ1cyeHwOTvqmSvJHtE0onUNgu3P4R/E0n5wfbaYdNZ5Mzbe7lApmKeOzYHClq88PoLwh8NTm0iHVMrVn1s5dUsTSlkZ50teenq4txxeBjS/rkRzP/hzUdF5OdRs27/afeHn4xVD51GzBESRejUsUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772644274; c=relaxed/simple;
	bh=2dGwUIt1PvOGIyPXmo+d9g+m8PfKnNrZSg2a6M+CDV4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=j5XFXRllVXJdlfwpWX2Y0uLQX9+gxZXrVEkdRFR/dniu9bPyjVPGOWA7eJOWuJDLdaVQ6a7sr08cpwAdmvT7sY0B5Yus+P+Fo3JlQDbUj8RzUlotpws9MiBqGuEug5XkCobCmv2C3ovtXcYAjlfzq0gC43OC6PPltDKPHX2dSLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD879C4CEF7;
	Wed,  4 Mar 2026 17:11:09 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Marc Zyngier <marc.zyngier@arm.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Thierry Reding <treding@nvidia.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/7] arm64: dts: Drop CPU masks from GICv3 PPI interrupts
Date: Wed,  4 Mar 2026 18:10:57 +0100
Message-ID: <cover.1772643434.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 797D620503D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[glider.be];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-28791-lists,linux-renesas-soc=lfdr.de,renesas];
	FREEMAIL_TO(0.00)[arm.com,linaro.org,baylibre.com,googlemail.com,samsung.com,nxp.com,pengutronix.de,gmail.com,kernel.org,nvidia.com];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FROM_NEQ_ENVFROM(0.00)[geert@glider.be,linux-renesas-soc@vger.kernel.org];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.869];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-m68k.org:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,glider.be:mid]
X-Rspamd-Action: no action

	Hi all,

Unlike older GIC variants, the GICv3 DT bindings do not support
specifying a CPU mask in PPI interrupt specifiers.  Hence this patch
series drop all such masks where they are still present.

This has been compile-tested only.  But note that all such masks were
removed before from Renesas SoCs in commit 8b6a006c914aac17 ("arm64:
dts: renesas: Drop specifying the GIC_CPU_MASK_SIMPLE() for GICv3
systems")).

A related question:
The GICv3 DT bindings also support only edge-triggered and
level-triggered PPI interrupts, without specifying polarity.
Apparently, even the common gic_configure_irq() just ignores the
polarity, also on pre-GICv3, so specifying IRQ_TYPE_LEVEL_LOW or
IRQ_TYPE_LEVEL_HIGH doesn't matter at all?
Actual SoC hardware docs (e.g. R-Car Gen4) does document that some
PPI interrupts are active-high, while others are active-low.

Thanks for your comments!

Geert Uytterhoeven (7):
  arm64: dts: amlogic: s6: Drop CPU masks from GICv3 PPI interrupts
  arm64: dts: exynos: gs101: Drop CPU masks from GICv3 PPI interrupts
  arm64: dts: fsl-ls1028a: Drop CPU masks from GICv3 PPI interrupts
  arm64: dts: freescale: imx: Drop CPU masks from GICv3 PPI interrupts
  arm64: dts: intel: agilex5: Drop CPU masks from GICv3 PPI interrupts
  arm64: tegra: Drop CPU masks from GICv3 PPI interrupts
  arm64: dts: qcom: Drop CPU masks from GICv3 PPI interrupts

 arch/arm64/boot/dts/amlogic/amlogic-s6.dtsi       | 10 +++++-----
 arch/arm64/boot/dts/exynos/google/gs101.dtsi      |  8 ++++----
 arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi    | 15 +++++----------
 arch/arm64/boot/dts/freescale/imx8mm.dtsi         | 11 +++++------
 arch/arm64/boot/dts/freescale/imx8mn.dtsi         | 11 +++++------
 arch/arm64/boot/dts/freescale/imx8mp.dtsi         | 11 +++++------
 arch/arm64/boot/dts/freescale/imx8ulp.dtsi        |  3 +--
 .../arm64/boot/dts/freescale/imx91_93_common.dtsi | 10 +++++-----
 arch/arm64/boot/dts/freescale/imx94.dtsi          | 10 +++++-----
 arch/arm64/boot/dts/freescale/imx95.dtsi          | 10 +++++-----
 arch/arm64/boot/dts/freescale/imx952.dtsi         | 10 +++++-----
 arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi    |  8 ++++----
 arch/arm64/boot/dts/nvidia/tegra234.dtsi          | 10 +++++-----
 arch/arm64/boot/dts/qcom/agatti.dtsi              |  8 ++++----
 arch/arm64/boot/dts/qcom/lemans.dtsi              |  8 ++++----
 arch/arm64/boot/dts/qcom/monaco.dtsi              |  8 ++++----
 arch/arm64/boot/dts/qcom/qdu1000.dtsi             | 10 +++++-----
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi            |  8 ++++----
 arch/arm64/boot/dts/qcom/sdm630.dtsi              |  8 ++++----
 arch/arm64/boot/dts/qcom/sdx75.dtsi               |  8 ++++----
 arch/arm64/boot/dts/qcom/sm4450.dtsi              |  8 ++++----
 arch/arm64/boot/dts/qcom/sm6115.dtsi              |  8 ++++----
 arch/arm64/boot/dts/qcom/sm6125.dtsi              |  8 ++++----
 arch/arm64/boot/dts/qcom/sm6350.dtsi              |  8 ++++----
 arch/arm64/boot/dts/qcom/sm6375.dtsi              |  8 ++++----
 arch/arm64/boot/dts/qcom/sm8250.dtsi              | 12 ++++--------
 arch/arm64/boot/dts/qcom/sm8350.dtsi              |  8 ++++----
 arch/arm64/boot/dts/qcom/sm8450.dtsi              |  8 ++++----
 arch/arm64/boot/dts/qcom/sm8550.dtsi              |  8 ++++----
 arch/arm64/boot/dts/qcom/talos.dtsi               |  8 ++++----
 30 files changed, 128 insertions(+), 141 deletions(-)

-- 
2.43.0

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

