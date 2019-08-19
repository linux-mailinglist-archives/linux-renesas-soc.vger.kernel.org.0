Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C934B923EE
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Aug 2019 14:55:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727308AbfHSMzw (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 19 Aug 2019 08:55:52 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:40477 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727128AbfHSMzw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 19 Aug 2019 08:55:52 -0400
Received: by mail-pg1-f196.google.com with SMTP id w10so1179826pgj.7
        for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Aug 2019 05:55:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=v5qVhsj1Sh0huonK/swWihX+DCDDmRO1aGyC58oJV4s=;
        b=Ic5eSyZyZrVLzC/MLRQ83pEC+DBw04beNBU7MbyhOl4si0cNUiosvpb2Bedm62EKdq
         yxCSNGsTNI3CWUGDrUMVTsvjEe0hnhg6deXIURViDKnaCW98sG1DvE1SFUsD1Zby6sEV
         MYbFYTVm1+G53k/BJ8WdTyNyY2fwUGuzz6YwYNQwUhlga0C+YqfNHymHPIM8xoIgPo4Z
         xATeGD7jSnvwB/8fwz++/fy7ZeaSaRqhsGcWvDPldJSlHr677Olta1LZRHB3oJnV2IQL
         gOjiRhzKHW1aSiZb/ZlG9sFYTCA4EPYTwKTcwEW9u4gIgNb3a1JenRYQEGI2VqwtxjNr
         fOwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=v5qVhsj1Sh0huonK/swWihX+DCDDmRO1aGyC58oJV4s=;
        b=mV3x9LxoTEV3heaQqvXE+ixYiVffR3Yp2BF9Jj/fTlMkDYCSyQZG6wPcYGK9TwgsSn
         8A7oet6Y3HW+UfvhFR8/TTYqoZsfaeBWeSXGJmkfhmsoU5jYoc7k1DYSYGrQmPmUBrZu
         6BW0sst1icDIl06yiPXf/MqlxTwsc3ta517Rc9Ye/+FO65UX+pke0VZwvmHGoXhUvM69
         l6+wyN2OalqqiWsK5Qu1/QGpMCfUB4wFU6rp0kzWivaG7mSCp8E7nLfgShYY1fo60p9J
         Atk/JTsLqi2cFit81DpWGA6XLgkmAQo0sILiDkf/pXMtKhC0E0q/VSPRPt6VHDiGH9Ew
         Hi+Q==
X-Gm-Message-State: APjAAAVq28Vk9cGkECC6gDjcqNpKjMyqE3P7G9u5wQ+VHlUESgZKBO+E
        GFHvukzHfg59H3acgF2HOns/aRUx
X-Google-Smtp-Source: APXvYqzjZ55GlzrZenjUQbO/L8WqYRgNiYv2ZUlFlqICGOE+HpVHDfzLW0WkM0hfQGIjsQKapBL9ew==
X-Received: by 2002:a63:101b:: with SMTP id f27mr19040919pgl.291.1566219351382;
        Mon, 19 Aug 2019 05:55:51 -0700 (PDT)
Received: from localhost.localdomain (p6796086-ipngn28101marunouchi.tokyo.ocn.ne.jp. [114.165.92.86])
        by smtp.gmail.com with ESMTPSA id t9sm13215113pji.18.2019.08.19.05.55.49
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Mon, 19 Aug 2019 05:55:50 -0700 (PDT)
From:   Yoshihiro Kaneko <ykaneko0929@gmail.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH] arm64: dts: renesas: r8a774c0-cat874: sort nodes
Date:   Mon, 19 Aug 2019 21:55:41 +0900
Message-Id: <1566219341-23048-1-git-send-email-ykaneko0929@gmail.com>
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

This patch is based on the master branch of Geert Uytterhoeven's renesas-devel
tree.

 arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts b/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts
index 651383c..aaa37158 100644
--- a/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts
+++ b/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts
@@ -82,13 +82,13 @@
 		simple-audio-card,bitclock-master = <&sndcpu>;
 		simple-audio-card,frame-master = <&sndcpu>;
 
-		sndcpu: simple-audio-card,cpu {
-			sound-dai = <&rcar_sound>;
-		};
-
 		sndcodec: simple-audio-card,codec {
 			sound-dai = <&tda19988>;
 		};
+
+		sndcpu: simple-audio-card,cpu {
+			sound-dai = <&rcar_sound>;
+		};
 	};
 
 	vcc_sdhi0: regulator-vcc-sdhi0 {
@@ -313,16 +313,16 @@
 		power-source = <1800>;
 	};
 
-	sound_pins: sound {
-		groups = "ssi01239_ctrl", "ssi0_data";
-		function = "ssi";
-	};
-
 	sound_clk_pins: sound_clk {
 		groups = "audio_clkout1_a";
 		function = "audio_clk";
 	};
 
+	sound_pins: sound {
+		groups = "ssi01239_ctrl", "ssi0_data";
+		function = "ssi";
+	};
+
 	usb30_pins: usb30 {
 		groups = "usb30", "usb30_id";
 		function = "usb30";
-- 
1.9.1

