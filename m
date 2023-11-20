Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 332517F0C34
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Nov 2023 08:01:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232033AbjKTHBq (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 20 Nov 2023 02:01:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232089AbjKTHBZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 20 Nov 2023 02:01:25 -0500
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4A3410D0
        for <linux-renesas-soc@vger.kernel.org>; Sun, 19 Nov 2023 23:01:16 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-5079f6efd64so5148265e87.2
        for <linux-renesas-soc@vger.kernel.org>; Sun, 19 Nov 2023 23:01:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1700463674; x=1701068474; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6Xy2p6wKX+cRsudc9CGrTgEJFgRUbbi06MpJ65zqOIE=;
        b=TV8bB9PIs97wzp5p6VsXfUiIpK9KGU8LevBv5E5YdzXuLvmQQeHtIZKHvWMDX2csI+
         Auz/u3U8jHg3gAxmhpzwT3cz1IvgnWUkRrodSXtCbZK6G0o3NnOrObHsyvdKJXXJAId/
         nzwcEDNbrWrbwzbephDlsQn0+Jf1KqktnmufRRSU9YkAvYJJzviZgUXRdm/ezXH3I7p9
         WKNHRfX7xAKzu6MamoVis94GjVdPviwe3zcj2dv0ODVm7sotHqCZ8GGYZ0lI9PrY2R/T
         ooy5BxzPaAuh3lgdVe9xBWI0jbwMruFEGgTqjyRPuv0faOW0oUQIaA58b2BxT0tDOX73
         b1lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700463674; x=1701068474;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6Xy2p6wKX+cRsudc9CGrTgEJFgRUbbi06MpJ65zqOIE=;
        b=qi2PbEWeQJ2GnHOAV/SXJueUsRZ36MmPXiQokH1XwYseXkcF6cWRUUcofuHzyyRKnw
         gtUilOyQbw4g+ypsAnilwpWHk5ETaeMwAIpWhwaLFAJx6OmvcrUMyKjZ1yQSJcSkwx3f
         W01KiAlcXuwas4c3kyCVqj8uhbi3yoHmK9Hx6T6rNLGMFc+kpUTUNys2c4vWKpbMxXv4
         i2yHdKOY10OS4zyWwlnfQn4Fom9jqjIIsquWdNU+OdpzfCYMDsPUanV3yNCwrKuK1nBl
         ls6YxEZGuTUdGa6qWNL8JnLn8UYSR8pIni1xUn4l5zO2R+S5lwbT4cZmciGaUndoL25Q
         BgRA==
X-Gm-Message-State: AOJu0YwYNhYvlbAi52NqRxPRRKZhVoAy1JXL4DXiRCTFI/Jx/y9veuqu
        vwP66YOktckzpwI4c3LCqa38PA==
X-Google-Smtp-Source: AGHT+IGfGm8OEGn2UQQ//iKUEdt+02S9t97oQMZwU4ZLbFpMApxh8gOBKXhhM8jTFK7zquiEVoqJ2A==
X-Received: by 2002:ac2:5639:0:b0:509:d962:3c67 with SMTP id b25-20020ac25639000000b00509d9623c67mr4876972lff.20.1700463674488;
        Sun, 19 Nov 2023 23:01:14 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.183])
        by smtp.gmail.com with ESMTPSA id p2-20020a5d4582000000b003316d1a3b05sm8777667wrq.78.2023.11.19.23.01.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Nov 2023 23:01:13 -0800 (PST)
From:   Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To:     s.shtylyov@omp.ru, davem@davemloft.net, edumazet@google.com,
        kuba@kernel.org, pabeni@redhat.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        linux@armlinux.org.uk, geert+renesas@glider.be,
        magnus.damm@gmail.com, mturquette@baylibre.com, sboyd@kernel.org,
        linus.walleij@linaro.org, p.zabel@pengutronix.de, arnd@arndb.de,
        m.szyprowski@samsung.com, alexandre.torgue@foss.st.com, afd@ti.com,
        broonie@kernel.org, alexander.stein@ew.tq-group.com,
        eugen.hristev@collabora.com, sergei.shtylyov@gmail.com,
        prabhakar.mahadev-lad.rj@bp.renesas.com, biju.das.jz@bp.renesas.com
Cc:     linux-renesas-soc@vger.kernel.org, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, claudiu.beznea@tuxon.dev,
        Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 06/14] pinctrl: renesas: rzg2l: Add pin configuration support for pinmux groups
Date:   Mon, 20 Nov 2023 09:00:16 +0200
Message-Id: <20231120070024.4079344-7-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231120070024.4079344-1-claudiu.beznea.uj@bp.renesas.com>
References: <20231120070024.4079344-1-claudiu.beznea.uj@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

On RZ/G3S different Ethernet pins needs to be configured with different
settings (e.g. power-source need to be set, RGMII TXC, TX_CTL pins need
output-enable). Commit adjust driver to allow specifying pin configuration
for pinmux groups. With this DT settings like the following are taken
into account by driver:

eth0_pins: eth0 {
	tx_ctl {
		pinmux = <RZG2L_PORT_PINMUX(1, 1, 1)>;  /* ET0_TX_CTL */
		power-source = <1800>;
		output-enable;
		drive-strength-microamp = <5200>;
	};
};

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
index 21ee628363fa..819698dacef0 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
@@ -376,8 +376,11 @@ static int rzg2l_dt_subnode_to_map(struct pinctrl_dev *pctldev,
 		goto done;
 	}
 
-	if (num_pinmux)
+	if (num_pinmux) {
 		nmaps += 1;
+		if (num_configs)
+			nmaps += 1;
+	}
 
 	if (num_pins)
 		nmaps += num_pins;
@@ -462,6 +465,16 @@ static int rzg2l_dt_subnode_to_map(struct pinctrl_dev *pctldev,
 	maps[idx].data.mux.function = name;
 	idx++;
 
+	if (num_configs) {
+		ret = rzg2l_map_add_config(&maps[idx], name,
+					   PIN_MAP_TYPE_CONFIGS_GROUP,
+					   configs, num_configs);
+		if (ret < 0)
+			goto remove_group;
+
+		idx++;
+	};
+
 	dev_dbg(pctrl->dev, "Parsed %pOF with %d pins\n", np, num_pinmux);
 	ret = 0;
 	goto done;
-- 
2.39.2

