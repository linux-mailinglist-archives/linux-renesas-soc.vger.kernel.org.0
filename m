Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 51797706AD
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jul 2019 19:23:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731251AbfGVRXC (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 22 Jul 2019 13:23:02 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:37143 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728233AbfGVRXC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 22 Jul 2019 13:23:02 -0400
Received: by mail-pl1-f195.google.com with SMTP id b3so19473615plr.4
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Jul 2019 10:23:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=ZslVBL5Mz0HAfC+qBA5LaRiPngbPOV8Dc92uhilmqCM=;
        b=d8LF67x78l0sp6WDJIB8JzLbflFtuRLMrlbk1uNxoU9nPiTpGIgyAAi4EyDKddo8Lc
         q8wLkXejXjdlxrBJWmoP8MlzMhOzNNiwGFPA100TibuXQgiqU9Kohs4NV0leuIEha09Q
         PoPcqHiEghRpCMScXHW0hEKGVPt7SKnS5yPcX9birgxL5smRB2PIWLD2agzMab+S4HRO
         1Q9lAMvcsLNkxwIp7/aFYhCIMJf3TFBlZOiWHXVa94mT4OhsIBnIbe4VLGDYlCFAZgF9
         i7l/SN6aaJaYgjTknIkDkjAvzmyqQKimxjSAV5Y0nBoaH5dXOUgjIVHD/k0rLqSuLecK
         QAHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=ZslVBL5Mz0HAfC+qBA5LaRiPngbPOV8Dc92uhilmqCM=;
        b=tIfmJbdL7gf76NLHkrqXwOQrMAKWxwx6xsiCuSoWR8FCofnnrwdfeV2D8rPsnmotoh
         z1BluCdvQ7pwnzt6PALNQtjFjuKUYn9KmrLY5vkvVNc/98QdIErma+/O64usk3RCqQf3
         bE59kK/NBdbYwoDSVFxk9Odw6MLdfn2PcqJ08IoxOX7HNtnsP9t22xIGnfAWVYZfmyh3
         6h5EHO9PjAvqITgcwQSVF0kf/G3X+JFbLvUUEq554RELmgka1VnO2YFqNk0SfwjSlM2X
         9vrMJSgF+Rq0WUf0NFc/BF/nZoUPwafAsTLXbVSuQ7LI1Qtpe33miuiH53ES7DEdj0bz
         k7ag==
X-Gm-Message-State: APjAAAVeDo9FCEaKJVRD1drxWQE4Tl34nwgS+CCyDWR/LfRQ7S5PtX0I
        0JrXrUlA0KS3p+DVtbrBjYfb/5BA
X-Google-Smtp-Source: APXvYqzjEpkVGeir2fkcTas5pOeWNGXshv6wZ/PHE8TfIFsE5r4i2xyUk0D5OLsEvhlzRU6g9BRULw==
X-Received: by 2002:a17:902:e306:: with SMTP id cg6mr76378459plb.263.1563816181685;
        Mon, 22 Jul 2019 10:23:01 -0700 (PDT)
Received: from localhost.localdomain (KD118155013174.ppp-bb.dion.ne.jp. [118.155.13.174])
        by smtp.gmail.com with ESMTPSA id o95sm35001252pjb.4.2019.07.22.10.22.59
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Mon, 22 Jul 2019 10:23:01 -0700 (PDT)
From:   Yoshihiro Kaneko <ykaneko0929@gmail.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH] arm64: dts: renesas: r8a7795-salvator-x: sort nodes
Date:   Tue, 23 Jul 2019 02:22:52 +0900
Message-Id: <1563816172-17864-1-git-send-email-ykaneko0929@gmail.com>
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

 arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts | 28 ++++++++++++----------
 1 file changed, 15 insertions(+), 13 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts b/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts
index d2d48b3..cf151f3 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts
+++ b/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts
@@ -52,12 +52,6 @@
 	status = "okay";
 };
 
-&sound_card {
-	dais = <&rsnd_port0	/* ak4613 */
-		&rsnd_port1	/* HDMI0  */
-		&rsnd_port2>;	/* HDMI1  */
-};
-
 &hdmi0 {
 	status = "okay";
 
@@ -108,6 +102,14 @@
 	status = "okay";
 };
 
+
+&pfc {
+	usb2_pins: usb2 {
+		groups = "usb2";
+		function = "usb2";
+	};
+};
+
 &rcar_sound {
 	ports {
 		/* rsnd_port0 is on salvator-common */
@@ -138,17 +140,17 @@
 	};
 };
 
-&pfc {
-	usb2_pins: usb2 {
-		groups = "usb2";
-		function = "usb2";
-	};
-};
-
 &sata {
 	status = "okay";
 };
 
+
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

