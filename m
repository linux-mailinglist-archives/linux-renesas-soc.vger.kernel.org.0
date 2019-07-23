Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 16DF471E97
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Jul 2019 20:04:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727994AbfGWSCZ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 23 Jul 2019 14:02:25 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:41574 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726000AbfGWSCZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 23 Jul 2019 14:02:25 -0400
Received: by mail-pf1-f194.google.com with SMTP id m30so19535316pff.8
        for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Jul 2019 11:02:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=tF8TgWL4DJzE35U5Q29Egtl3/WZUXHlu9H5bcFtB+v8=;
        b=qgpZq1OwEaHuQpz8h4B2Dm8ZguMKgkDFf6oqw1nfNDThHvoYnWaGFS0h6RnY9s3RvW
         Gyij/a8F0pLMg2WSAV+Ox7SSOH7aQmLUF+TpcYe3RuBAlLwpQUMleRZdqeA44zkZ+8T5
         99iialPYd24SGmtLL3KUAucm56OPykpZY24Cs3fj1wImp2Qht4cXgsnIL+ud03Ue3rJ0
         CGbLTLVRKZWbd+xiD8LiXvoH/2FU4av/HicxPly9LFBloIfqxccdgF0WcZrJi8L2cDWF
         X6aiJFAMivze1mTqGBt3JTSVx1Pyq0EYDdoOdBa1E5i6wOPs4tEPZTDLT5QeggyEi5wM
         dJmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=tF8TgWL4DJzE35U5Q29Egtl3/WZUXHlu9H5bcFtB+v8=;
        b=a98EENgyQGnDfw0dg3oC27b3Y35EeMqSQtb77YWCrX4Ex2bzAXaTGHe+6RzoQ1Z8fU
         wU36twTCpd+k8vbKiJU1qOfWwmiVb5azkq3QLjnfzJiD2D0R+sfRVlXQpnH/vST5D1Cu
         rYbqdDsRaUzZ78pCM/D2tCA27n//hHNgMXGvNo7DNao3oDgS1vFDxhS4XVE30Jqjv9As
         hJP6kLxCZdWSQ/XwQVc+5Evd8RW2WRbda5inYb/p+UObyGBvKQz0BzpDbn4t2nJgirIo
         iVPz7JBUG9hVVN/eN4UlUc8INaAsPtae0gMtcxJfHStDv/EHkyl34l7/uUVkWmqizgfi
         Jj2A==
X-Gm-Message-State: APjAAAW3QuoZWPWko6MwcXumDLY7q1oUocLaDA9DkdtyO60x13cHzcDt
        0FQEVUkjjG3ppMwfi9odbxxtph9b
X-Google-Smtp-Source: APXvYqy/0/GoX/jLLuQsxuVf2cI/YqgN1Wsb6QYTGkfv5TY4NxUc6JtVaCmlwsSkkuuh3KA8klMLuQ==
X-Received: by 2002:a17:90a:bb0c:: with SMTP id u12mr84804822pjr.132.1563904944517;
        Tue, 23 Jul 2019 11:02:24 -0700 (PDT)
Received: from localhost.localdomain (KD118155013174.ppp-bb.dion.ne.jp. [118.155.13.174])
        by smtp.gmail.com with ESMTPSA id u69sm49758940pgu.77.2019.07.23.11.02.22
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Tue, 23 Jul 2019 11:02:23 -0700 (PDT)
From:   Yoshihiro Kaneko <ykaneko0929@gmail.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH] arm64: dts: renesas: r8a7796-salvator-x: sort nodes
Date:   Wed, 24 Jul 2019 03:02:08 +0900
Message-Id: <1563904928-2797-1-git-send-email-ykaneko0929@gmail.com>
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

 arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts b/arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts
index 2aefa53..de37e91 100644
--- a/arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts
+++ b/arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts
@@ -36,11 +36,6 @@
 		      "dclkin.0", "dclkin.1", "dclkin.2";
 };
 
-&sound_card {
-	dais = <&rsnd_port0	/* ak4613 */
-		&rsnd_port1>;	/* HDMI0  */
-};
-
 &hdmi0 {
 	status = "okay";
 
@@ -81,3 +76,8 @@
 		};
 	};
 };
+
+&sound_card {
+	dais = <&rsnd_port0	/* ak4613 */
+		&rsnd_port1>;	/* HDMI0  */
+};
-- 
1.9.1

