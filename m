Return-Path: <linux-renesas-soc+bounces-24073-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 50757C3122C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 04 Nov 2025 14:10:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 92CB318C070C
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  4 Nov 2025 13:10:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E92892F6560;
	Tue,  4 Nov 2025 13:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="ruj8tv7u"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FC842F6175
	for <linux-renesas-soc@vger.kernel.org>; Tue,  4 Nov 2025 13:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762261759; cv=none; b=TGtWQXvcexwWdinPeQZI9k1EcNtCzjvfwSwjdIwYNyii+behq9I0Ibq8FVlqh9T5T3vi9YMEQ1YVrLyhIDMx5opDFm2XFiXBT1/F+gbxfVBQMoBijPbVs5174QfzLU29f3NQ08K7qdi1kGXyWT/DJGYWL06La55JTyAfP4Af2T0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762261759; c=relaxed/simple;
	bh=yY8w0En7ifAOHnUc2TsFrwM8BU5vXAiE+eQSw5KxyCk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FnD1u9Oz2Ij0S8/nTzqa21rLNKnJhiEQmzHoYX4+j4vqv3VXGFCdCCWbAzCDg5tCp/saxO+xgYfZBwjMjUAuYbEhctkA7XG+7FKmmk9IgTfp5c4p20AKs9kciVOu0z/iR3VTV4M+Zlal7dz4QfwTi7qGMFShSCf0cOK79n66+Zg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=ruj8tv7u; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-429b9b6ce96so3655092f8f.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 04 Nov 2025 05:09:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1762261755; x=1762866555; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y+bD9XMSY/PxNEVtej7SYELNOHLIlDJsCB53kL01eGk=;
        b=ruj8tv7u/Ec9qvRFG0vGLJgjrek20XxBe2shKzhC4gB4HyjwHNT0zKlJpMobbh8mKj
         lKWZj2MyJkp0kI2amfMjsYM2dbqTqdpfHXo+tBeSiG3iwssz+7TisCyNa71lN0Oh/WZA
         lVnNWk3k6YrtJ8TSi9B6H2p1k/C4EPWmTV81nCH9ETaY6DxvrlNLB8reYJ68X6kknFBC
         u6OsTGurh1PzS9Yy2d3zk4IpTyP0bFxm3RFxYcIHpkpHerXVJGlbWNciPPnEDZ0gKdY0
         FTA1XuqbCw23QFtP+Pkk1h+Er4DKkUy1no380eqcCsZrUrN/SKKdeL+J5chx2TMJtUcO
         q3DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762261755; x=1762866555;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y+bD9XMSY/PxNEVtej7SYELNOHLIlDJsCB53kL01eGk=;
        b=VQZ8jQTpXOEmTzPRfFf4MzIC6sDdDY4j6FKm8MPzRp5z9DHs/YpL8Jsh6uDr42+4RG
         Wwecl1gyPZ725LvQAdmE0vJMT7T+me3KV8YqsRJr/I4eyLVYPk1Qnqu8e04XOGpFczyB
         HDGeJ46EMnKF1RikhAY0me6y9qukz5VmFgNnhFJd85GBZVy695QNXhHzNKj4XwFbyuU6
         E80oIQJZ7GZMWMruJbKhTNyy6BK8QIOSQ6gNamoy0k7J/p8PjrWNmTQ2xPIvI7DG4oR6
         17CRSchBPB/KzgD6kNRg54VkOVc+7ReN+tGINiSR3lU4lA/BTeSYUTS48DhNCZMKNT/Z
         55Dg==
X-Forwarded-Encrypted: i=1; AJvYcCViErn2M1OpsCIZN7HAbPbHZ4d321bh4Dl15509CNBkV8ShjtZx2f/4PDcYeIiHkZNqfrn0Mh0m4AbYCznR9Xehcw==@vger.kernel.org
X-Gm-Message-State: AOJu0YweCJLluXFGWMX2wQQAHtIE6TQNwrd89Z8j3XGk1UDfqgSRj+r3
	RjhFKysTWO8SrIegcNOHus+1FAaMA8JwHNTq8QqYyEFHBljPO4RUIZ637jNqlj4HSlc=
X-Gm-Gg: ASbGncsegHOHLSHpMlZJ0cD6bcKfJDQRDMhMLJA8cEMezPnsISSq13pIRqbLKRY9Rjs
	KCNb7HRKGifjFuwkUHd/fTpSTq1TpCTTWvmEB6ozqn87oPKtC8ktcs/9m2wtNvONttfgnF1CxjE
	kzEN8cwXPA9GVa1tovPjY8QL+YQsHCCMxpeJ3xy5RNhfN59CHBItj6DaD8fhfhLkvLUzd+Kq9wd
	xDv200zM5JfZ0vvOHvo7ZPpBhwAxXMOkQcOC/X3XUr9fn/MWqyIzExaGmmcLKsKTj0srQ5NjQ9E
	eWUXoj5e8THYXbsPIzh6YAofbi0QdO9tXUt6GHJCEevtcsheqH551kJifMPLlUhRQLxPfwOkvZk
	wgBUmgkmVlNBbFsbfxHEWy7yUop8u1/zoTW7RgQ7/TzmKeUCieAfv3DcRgnffvEQL9jwGRPTS5E
	j6f89L
X-Google-Smtp-Source: AGHT+IE9zk6mUyeMrPCGURPH5oFLkbzGYKtQvQUpX+mRV+CSiZEUcYKWUiZRVDA25BouoHB69mkSLQ==
X-Received: by 2002:a5d:5d0a:0:b0:429:d742:87f4 with SMTP id ffacd0b85a97d-429d7428a5dmr6172167f8f.11.1762261755321;
        Tue, 04 Nov 2025 05:09:15 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:9ea1:7ab7:4748:cae3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429dc18efd3sm4554431f8f.5.2025.11.04.05.09.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 05:09:13 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 04 Nov 2025 14:08:54 +0100
Subject: [PATCH v4 3/8] net: stmmac: qcom-ethqos: improve typing in devres
 callback
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251104-qcom-sa8255p-emac-v4-3-f76660087cea@linaro.org>
References: <20251104-qcom-sa8255p-emac-v4-0-f76660087cea@linaro.org>
In-Reply-To: <20251104-qcom-sa8255p-emac-v4-0-f76660087cea@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Richard Cochran <richardcochran@gmail.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Vinod Koul <vkoul@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
 Jose Abreu <joabreu@synopsys.com>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Matthew Gerlach <matthew.gerlach@altera.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Keguang Zhang <keguang.zhang@gmail.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Jan Petrous <jan.petrous@oss.nxp.com>, 
 s32@nxp.com, Romain Gantois <romain.gantois@bootlin.com>, 
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
 Heiko Stuebner <heiko@sntech.de>, Chen Wang <unicorn_wang@outlook.com>, 
 Inochi Amaoto <inochiama@gmail.com>, Emil Renner Berthing <kernel@esmil.dk>, 
 Minda Chen <minda.chen@starfivetech.com>, Drew Fustini <fustini@kernel.org>, 
 Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
 Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>, 
 Shuang Liang <liangshuang@eswincomputing.com>, 
 Zhi Li <lizhi2@eswincomputing.com>, 
 Shangjuan Wei <weishangjuan@eswincomputing.com>, 
 "G. Jaya Kumaran" <vineetha.g.jaya.kumaran@intel.com>, 
 Clark Wang <xiaoning.wang@nxp.com>, Linux Team <linux-imx@nxp.com>, 
 Frank Li <Frank.Li@nxp.com>, David Wu <david.wu@rock-chips.com>, 
 Samin Guo <samin.guo@starfivetech.com>, 
 Christophe Roullier <christophe.roullier@foss.st.com>, 
 Swathi K S <swathi.ks@samsung.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, 
 Drew Fustini <dfustini@tenstorrent.com>, linux-sunxi@lists.linux.dev, 
 linux-amlogic@lists.infradead.org, linux-mips@vger.kernel.org, 
 imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, sophgo@lists.linux.dev, 
 linux-riscv@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1037;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=/4v1a8QAtlU1YFnwlRQMWe0GMJqjCY4EA0FHsr43o1A=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBpCfrtQQMHHYMvRDKmcuOzena2zyxcsRk8Cq4Li
 n8c+fyXskKJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaQn67QAKCRARpy6gFHHX
 cu+sD/9xqcE1M8JRojXs6tNYxWwtB8fmuax3h76PbWJVTattQarQZMV+C6Dw0VjQrSSv0tEQhEJ
 GUsV70G8JQ7xE4b6MVOmV3Sgzx9hOs4BQCaLek8iBxlwKJ5vo3rbHJMR5K+2Uj+UgUOP2nskA6Z
 wd3yen9nsBOVyMs7ac9WQzSOPcgeNfxQedMUSvgTbyBR0GcS2CIy89UjHn+zj7Gx2ijsVuLffPd
 LlxsS8x/QR7QsISJ1ZeyK2515q0yW6X3TBOoKytSgJ8SroZZDX1i1hb+Z6+KhzUbWFSA67ONvkP
 DsVx1s/4rwloM3QXDV5SG+jc8DQBfeMiSh7tK8l8Ac7DTitkG3s4mmpz9X0dVr73UxVhMMJSYOA
 LT6fUEV/zpijp7Jj8GXy5EVwpRWGkVm3wj+KOKGoNoDyHDGVfPaMnaAwVaS4WzAl+hjuEgwhhYa
 ZYRh8qU/FZ3xHQN5JSspjIfCcrBVGbeA06m9w6MrkiOkHbh/o4PxhTGNyHcYf5DYBo56XPyVpkJ
 LIKcRLbinjavRjNPsp3TsIa872kJloDivMLAPXL08r7gnxp3Ndwyh8zIqDY6sbPG1/0rHrGcvJs
 IyCz8vr671iiry6UrE2hD3ISMBOM9TDY55vysMSVanhHHypdlq69f60xwNgklQfxHUAVO75i58L
 BqRbsnIAl52oHoQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

It's bad practice to just directly pass void pointers to functions which
expect concrete types. Make it more clear what type ethqos_clks_config()
expects.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 8578a2df8cf0d1d8808bcf7e7b57c93eb14c87db..8493131ca32f5c6ca7e1654da0bbf4ffa1eefa4e 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -726,7 +726,9 @@ static int ethqos_clks_config(void *priv, bool enabled)
 
 static void ethqos_clks_disable(void *data)
 {
-	ethqos_clks_config(data, false);
+	struct qcom_ethqos *ethqos = data;
+
+	ethqos_clks_config(ethqos, false);
 }
 
 static void ethqos_ptp_clk_freq_config(struct stmmac_priv *priv)

-- 
2.51.0


