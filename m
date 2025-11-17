Return-Path: <linux-renesas-soc+bounces-24682-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D8509C6314D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Nov 2025 10:14:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B441A4F150D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Nov 2025 09:10:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47A8A328617;
	Mon, 17 Nov 2025 09:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="bRRQepz3"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2AD23277B1
	for <linux-renesas-soc@vger.kernel.org>; Mon, 17 Nov 2025 09:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763370574; cv=none; b=SX70etsS3mEMc0bQbSs5V6pRC+HRIcN9H14lNqLpj6FUwKOCE7CKtxyowt5Y4pzsX2kGQ69FzqbX0P5uUr6YBHX+KQmgy1hPzmt+YvYtorlqfwHEm4gioPZn8eeVnHFJ5+abS4z9yj2X+TpGBJou2RzHzfp1Y+/uCM30zUuqxG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763370574; c=relaxed/simple;
	bh=Uc0m+u0MfzVGyhFoLK6/9eDa4VlgU+XOoqI+PI/Ba+4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=suTzwyGEhWytsOy5tUujgdFaHhDpgd+NEA7sCP7H1Bm8QpC8waStQSwWMHHjocGkMepHO3J6+KxyIVYk6fx3OloAzJrs9JxnqmXj7GecNi/e+vI3UVzJOyLqfwPLX8a7HbpnXhdXs0sJcFJO+gmhPRWvl/s94luXooCTGeaU+VI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=bRRQepz3; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-42b32900c8bso2243956f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 17 Nov 2025 01:09:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1763370571; x=1763975371; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8pjDugLKEkjAIimWBDbAyQf5qbHt8SfkOSPMTheV0Y0=;
        b=bRRQepz33UaVXEcFsMqvBSRlcw977qDw4RQpJDuuZmBxQqwcN60KUcK7f/xnAHApPx
         yHkKTusUigICyyev0WqoLpMCVLbGe6g80WJnvoWqKY27c9n84HpPMAn3lWG/iYNtZkhz
         VAtP2v5rx7tosaf6oHwrmtTybPsuaxXm2lfhu24dY2OoOSVyqZGQ9zzmLOgmb4xsHwjb
         ZFzccWdAa+6sgnx1uuSIQ2Q9rH7yDs7CjJU3nCWhMnHEjQOAaoiDKB5rCob2k2c5rbJg
         +5qYhATuVAGb9ad8gHCK5UuiwM2jyckb0s7wdyGg2YX3v2nztzO8kxFlcVJjbHYktQcT
         ckIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763370571; x=1763975371;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8pjDugLKEkjAIimWBDbAyQf5qbHt8SfkOSPMTheV0Y0=;
        b=mMyBldVKUMyEpZdjD0FUG9z7ghW2ZBIk3tGUUjkEZvvqEY2uE/sW/E9RVwoz7cGCD5
         orxf3YMC9NloHvMakCN4C+YshMc5kFuD0xHmsDbuL7iGBxL0/IvIQq6WxG3Vt2I6XTYB
         dmuaMlTYv2L0cW/zWfprwuCVLbcB7ieV3gqKegSd0v7ShlWcIcWgFDly7DEB28cx1CLK
         mbVOukkfldXh5VUPJ2/ns+COPsJeWW+Tile58puuYu87B+Qz1mVrhJ0C9vBD5wGX/kzk
         qEIDVSYv82ihwfyiIsPlPSIU9oMm64X5Gbuw9OJZVftuXPQa0c4WgpHDbVTlNDr2BWBd
         wKsA==
X-Forwarded-Encrypted: i=1; AJvYcCXSN7I5DVeMEjEwP3omFENyuWhhwmptSHBFWZ3NYc4nPr4069FZ1R8is3lfsO0aOnukiuW8rVDud5Uqrjs3Tilwnw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzMG3xcLxGCtfuQmizvvJCBWHVtNDK1+hFk17td+xHveUNdYSvh
	1MmbWDQ+kkMMdiXZukvXI0XT3hnjIjRWhEG6n1vjzd3YmJaxik/uVHclt7JpDOMsCQw=
X-Gm-Gg: ASbGncseD4lemNrDjXDaN21ABAkLuyHSqNremtgi3X7QjERatrtbZUy5bQysOjZ+cMj
	MKOBPAehaVaibTDTWKqhpRQvsbklkcZkJkbhqAOu6Cf9DaPOIiXwU1MuFvg7iIv8tFEMQrumTlO
	GffQXoFGv1o03CmJpzLQCQc5fstbbFEM7QY6ucMzohZNvZroGgaK8fCJW08hJ/fG0XV6nhR5WXb
	J3M1cpAbpHuN2Af92NMXo8riOW956mPK+jCGDWIKmgjaV6/SxKBGkpiRsdNAW6YzMzCFxXweHJW
	/PJqOIerK7KhcuYihPIwPH8V4i5EHfnYCxFU2GeRQ0UqwBz3FrLJTPVGzpnwksEK7uuexO3H+3O
	YyewtegKd1RDlTMPBkY6Kl+XYsjMn9LcImf4JxGsY/xMHBHSy6Yh7nJGbMKNFB74Vh0+zINPy6m
	4ChMRPO8cbruBijbqrThuPL285SM7K022imM8uabDC
X-Google-Smtp-Source: AGHT+IFgZYhCnic6U3YhRTVjNXH++Id/AtI5+oMJdQ8+Yorkl9uPjde2OHoNIXg0bcsWSzcUKJfixg==
X-Received: by 2002:a05:6000:2305:b0:3ec:db87:e5f4 with SMTP id ffacd0b85a97d-42b5932482dmr10896537f8f.7.1763370571069;
        Mon, 17 Nov 2025 01:09:31 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.134])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53f0b894sm25703786f8f.26.2025.11.17.01.09.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 01:09:30 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: bhelgaas@google.com,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	p.zabel@pengutronix.de
Cc: claudiu.beznea@tuxon.dev,
	linux-pci@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v7 4/6] arm64: dts: renesas: rzg3s-smarc-som: Add PCIe reference clock
Date: Mon, 17 Nov 2025 11:08:56 +0200
Message-ID: <20251117090859.3840888-5-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251117090859.3840888-1-claudiu.beznea.uj@bp.renesas.com>
References: <20251117090859.3840888-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Versa3 clock generator available on RZ/G3S SMARC Module provides the
reference clock for SoC PCIe interface. Update the device tree to reflect
this connection.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v7:
- none

Changes in v6:
- collected tags

Changes in v5:
- this patch is the result of dropping the updates to dma-ranges for
  secure area and keeping only the remaining bits

 arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
index 39845faec894..b196f57fd551 100644
--- a/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
@@ -172,6 +172,11 @@ a0 80 30 30 9c
 	};
 };
 
+&pcie_port0 {
+	clocks = <&versa3 5>;
+	clock-names = "ref";
+};
+
 #if SW_CONFIG2 == SW_ON
 /* SD0 slot */
 &sdhi0 {
-- 
2.43.0


