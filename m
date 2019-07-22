Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7F5AC706B4
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jul 2019 19:23:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731250AbfGVRXW (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 22 Jul 2019 13:23:22 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:36144 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728233AbfGVRXW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 22 Jul 2019 13:23:22 -0400
Received: by mail-pl1-f195.google.com with SMTP id k8so19485836plt.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Jul 2019 10:23:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=XQwtQTHjRb9vj1GeJWjUkZGMSIPHT5Z7N19ylCEpmq8=;
        b=nqtiOPPidG8GPpmdLwIzumCQceypKN2K3Yi/ZUy1MGZQirzwyGfMAjkIt0S4BA6NDx
         JwQG601+F++gn9HS9RDI4PbApsFZiCPRe+jfjiOsYxquoPyCwzgid+sQp4+pakB/BrkK
         Kqxc6Kc9YZ7t57qFqR4QSKuhIL5ki+G2E8blRSMtjXyC3cA3fPvXDP4ULI91JdLyFceh
         IUsMFbuECQVKTS603JtDkgtOKBwZKi0Ib0m8v98DehIEmqAUUnmw/GQn5SoZ1mI4zdVU
         b94NXw9j6oZmH4g0YSPw7h0WbslIRqsZHLmpEuBYyfE3x5VbU5e6JAfHp+M+YohxS02U
         cKRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=XQwtQTHjRb9vj1GeJWjUkZGMSIPHT5Z7N19ylCEpmq8=;
        b=bz/J9zDaNTeMw86cb6VLJhK0NFoh/BbBl+98XjySWTb5STXLrCnro2wP1jY0RNilQ6
         M8UNrFwQMNl9rOtQ9Wo9XQXnoYJsfvJinkjuLAjwqN0+qWY4bRZLC5F/qRP/yl8pqyjF
         LQK0cSCrKR8zxXpmrNyc4JLTAiwHgKaX0x/aNewqmT6Vmz4nUqcrTgXrZJgx0b1ANIet
         oe0vEl/ObXhICGo9ikirmebsWLUIhghX3gb4h/Eq9dKKQXcFDEvrB64ClmarcVNcrhLV
         bufd7ltPPlPoV7fYi5zGzBTHbl6e2l5A0f28Tzq4V6TAa6/svHKM/2HEKrYkAkVMwaKX
         YXgw==
X-Gm-Message-State: APjAAAUfkagRXBt4nj5yy0vWbQi6OqmQznHBEUjf2WW/OmJunWLrw8+a
        Aa1fHUI2OaTVKnRjvMLb+XmWEwsK
X-Google-Smtp-Source: APXvYqwBSa3U9CvXEgatiD97EyWYBlgP1RQEatz9tgqfQ/wuebsz1uwEcQxmpz7CfJ679Yfpx6/ikQ==
X-Received: by 2002:a17:902:29a7:: with SMTP id h36mr78323906plb.158.1563816201808;
        Mon, 22 Jul 2019 10:23:21 -0700 (PDT)
Received: from localhost.localdomain (KD118155013174.ppp-bb.dion.ne.jp. [118.155.13.174])
        by smtp.gmail.com with ESMTPSA id b26sm44319796pfo.129.2019.07.22.10.23.19
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Mon, 22 Jul 2019 10:23:21 -0700 (PDT)
From:   Yoshihiro Kaneko <ykaneko0929@gmail.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH] arm64: dts: renesas: r8a7795-salvator-xs: sort nodes
Date:   Tue, 23 Jul 2019 02:23:08 +0900
Message-Id: <1563816188-17922-1-git-send-email-ykaneko0929@gmail.com>
X-Mailer: git-send-email 1.9.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Sort nodes.

If node address is present
   * Sort by node address, grouping all nodes with the same compat string
     and sorting the group alphabetically.
Else
   * Sort alphabetically

This should not have any run-time effect.

Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>
---

This patch is based on the devel branch of Simon Horman's renesas tree.

 .../arm64/boot/dts/renesas/r8a7795-salvator-xs.dts | 82 +++++++++++-----------
 1 file changed, 41 insertions(+), 41 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a7795-salvator-xs.dts b/arch/arm64/boot/dts/renesas/r8a7795-salvator-xs.dts
index 42101fc..36667c8 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795-salvator-xs.dts
+++ b/arch/arm64/boot/dts/renesas/r8a7795-salvator-xs.dts
@@ -57,17 +57,6 @@
 	status = "okay";
 };
 
-&hsusb3 {
-	dr_mode = "otg";
-	status = "okay";
-};
-
-&sound_card {
-	dais = <&rsnd_port0	/* ak4613 */
-		&rsnd_port1	/* HDMI0  */
-		&rsnd_port2>;	/* HDMI1  */
-};
-
 &hdmi0 {
 	status = "okay";
 
@@ -114,6 +103,11 @@
 	remote-endpoint = <&rcar_dw_hdmi1_out>;
 };
 
+&hsusb3 {
+	dr_mode = "otg";
+	status = "okay";
+};
+
 &ohci2 {
 	status = "okay";
 };
@@ -123,36 +117,6 @@
 	status = "okay";
 };
 
-&rcar_sound {
-	ports {
-		/* rsnd_port0 is on salvator-common */
-		rsnd_port1: port@1 {
-			reg = <1>;
-			rsnd_endpoint1: endpoint {
-				remote-endpoint = <&dw_hdmi0_snd_in>;
-
-				dai-format = "i2s";
-				bitclock-master = <&rsnd_endpoint1>;
-				frame-master = <&rsnd_endpoint1>;
-
-				playback = <&ssi2>;
-			};
-		};
-		rsnd_port2: port@2 {
-			reg = <2>;
-			rsnd_endpoint2: endpoint {
-				remote-endpoint = <&dw_hdmi1_snd_in>;
-
-				dai-format = "i2s";
-				bitclock-master = <&rsnd_endpoint2>;
-				frame-master = <&rsnd_endpoint2>;
-
-				playback = <&ssi3>;
-			};
-		};
-	};
-};
-
 &pca9654 {
 	pcie_sata_switch {
 		gpio-hog;
@@ -186,11 +150,47 @@
 	};
 };
 
+&rcar_sound {
+	ports {
+		/* rsnd_port0 is on salvator-common */
+		rsnd_port1: port@1 {
+			reg = <1>;
+			rsnd_endpoint1: endpoint {
+				remote-endpoint = <&dw_hdmi0_snd_in>;
+
+				dai-format = "i2s";
+				bitclock-master = <&rsnd_endpoint1>;
+				frame-master = <&rsnd_endpoint1>;
+
+				playback = <&ssi2>;
+			};
+		};
+		rsnd_port2: port@2 {
+			reg = <2>;
+			rsnd_endpoint2: endpoint {
+				remote-endpoint = <&dw_hdmi1_snd_in>;
+
+				dai-format = "i2s";
+				bitclock-master = <&rsnd_endpoint2>;
+				frame-master = <&rsnd_endpoint2>;
+
+				playback = <&ssi3>;
+			};
+		};
+	};
+};
+
 /* SW12-7 must be set 'Off' (MD12 set to 1) which is not the default! */
 &sata {
 	status = "okay";
 };
 
+&sound_card {
+	dais = <&rsnd_port0	/* ak4613 */
+		&rsnd_port1	/* HDMI0  */
+		&rsnd_port2>;	/* HDMI1  */
+};
+
 &usb2_phy2 {
 	pinctrl-0 = <&usb2_pins>;
 	pinctrl-names = "default";
-- 
1.9.1

