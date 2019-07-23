Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7DFCF71EA0
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Jul 2019 20:04:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728651AbfGWSEQ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 23 Jul 2019 14:04:16 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:35393 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728108AbfGWSEQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 23 Jul 2019 14:04:16 -0400
Received: by mail-pl1-f194.google.com with SMTP id w24so20912948plp.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Jul 2019 11:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=W22Qq2bPY3qrM64kZukyezJ6opmW1nSg9IDH0KHGjYY=;
        b=ieN7ALrGo+qukTiJ/0EDWZHC53LrpEzPtPUHgnrXVw3cSaF4EVZii6FL0TMaWI2CPH
         Tfyra7HyWVwGECnEgcZm5dDio8qphNQRWa6OWYl7Wp7oyaDNYCivmh4fo8HP0D0PdAo+
         koemJFrRft8VH2Drz9dTjoXrZ8Rzqz6/5DjS7q+v0D0y5JHJbySlAoZ9LJlVOAvDjxeO
         afuE7lVNL+pygmGm3Pk92/4WvKBZHs9tFgHu/OMfZKYjAxeuF8EwEL9CrjQqOljsQL0K
         j/Ac/UVShhLcTIO5bq70LWzctW2wLgAa8IDwLekvWsCHsO7VdjVhKFr4pxEwf6w0f5k4
         uTVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=W22Qq2bPY3qrM64kZukyezJ6opmW1nSg9IDH0KHGjYY=;
        b=jXfcRqxQKGMBEPxtdZpTTfl+71tnkdRX2jgi7oBj3vL5Ihm3suz7G1ikM+bu1m88xy
         dmg5iNnmLDpvszJ6H3Z6c+LGO1dqOvN9oyLRIylKEA3Vq5S/O1W7AUOHaY20/st/eX9n
         k4cWZFisBkM/PXp0mSuZ6kU4pzQu4ZX4Mb8dzJk0p3AjE9y+WVxpNASTDuAhnSTDiewj
         MMhqzFfy3Qo8CpncrZRPhG6yAXqtzSY0OmILwSJdlQnHSeifQ/rA2w91KrdaMxb8IFI1
         Gec+jevHOd2kL1g5ARi2s2Nr6MvwtJyWXLR+RraAm0hrhtlGYO7yJXlIaaUpgCqTwS8Z
         Pb5Q==
X-Gm-Message-State: APjAAAXQatqDmXn3/KqlsXCLuXWMS/9CiQptGr4a5SpwrdvqIzZyna1O
        2W/9czgCNAcKGs1GQnrGYuw1G6e2
X-Google-Smtp-Source: APXvYqxFJUFqh/Uy3EEHrNPHKWBcFAHt3Ygo6+oWiO3WjUv0GOJiHS5n1FH6HYyPPOXHnu81GdhUdA==
X-Received: by 2002:a17:902:7887:: with SMTP id q7mr82839519pll.129.1563905055358;
        Tue, 23 Jul 2019 11:04:15 -0700 (PDT)
Received: from localhost.localdomain (KD118155013174.ppp-bb.dion.ne.jp. [118.155.13.174])
        by smtp.gmail.com with ESMTPSA id cx22sm36324333pjb.25.2019.07.23.11.04.13
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Tue, 23 Jul 2019 11:04:14 -0700 (PDT)
From:   Yoshihiro Kaneko <ykaneko0929@gmail.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH] arm64: dts: renesas: ulcb: sort nodes
Date:   Wed, 24 Jul 2019 03:04:06 +0900
Message-Id: <1563905046-2949-1-git-send-email-ykaneko0929@gmail.com>
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

 arch/arm64/boot/dts/renesas/ulcb.dtsi | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/ulcb.dtsi b/arch/arm64/boot/dts/renesas/ulcb.dtsi
index 7e498b4..3ef8917 100644
--- a/arch/arm64/boot/dts/renesas/ulcb.dtsi
+++ b/arch/arm64/boot/dts/renesas/ulcb.dtsi
@@ -428,6 +428,11 @@
 	};
 };
 
+&rwdt {
+	timeout-sec = <60>;
+	status = "okay";
+};
+
 &scif2 {
 	pinctrl-0 = <&scif2_pins>;
 	pinctrl-names = "default";
@@ -478,8 +483,3 @@
 
 	status = "okay";
 };
-
-&rwdt {
-	timeout-sec = <60>;
-	status = "okay";
-};
-- 
1.9.1

