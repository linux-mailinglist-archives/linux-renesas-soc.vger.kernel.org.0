Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B26563A581
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  9 Jun 2019 14:43:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728388AbfFIMnf (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 9 Jun 2019 08:43:35 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:39424 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728319AbfFIMne (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 9 Jun 2019 08:43:34 -0400
Received: by mail-pf1-f194.google.com with SMTP id j2so3716417pfe.6
        for <linux-renesas-soc@vger.kernel.org>; Sun, 09 Jun 2019 05:43:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=1epTJdne8mHMwBaPl2INMRTP7snEO6mPlFUapdOKIVY=;
        b=Ifm490hbTdmPeaNfGx8NmUrmsr0394njEzuU4gtuyPXoBab4Cp5RZCpYh0/HEeB/eE
         AS5Nk9QFp8bJIcmE4n95YIqkSHgsqGvzmgyRGQhOFcMywx9ccpCOUEDEQG5tYCd/cbZs
         aJoZhyZI56KW2e3WbQNlhKjvKxWIpcg6389G84tAmb8DcUgZR/8Wuy4ZI780YXf98kA1
         QKfJYozOKqlTAER9VMJY2DnHhgNavhvuRn8ZVTJsESjFr5AouVlz64Q7+w7CMuc57BVa
         LIcacQApThHZqWPSk4wmyfr19bKtwSWF+CTAUsgmabj1Bgr/d4DOXuMpJq4c5Iezs81K
         EMGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=1epTJdne8mHMwBaPl2INMRTP7snEO6mPlFUapdOKIVY=;
        b=ClGI01bYzalp2y5iHTJBO7bmTp1jEx3Prneag+rlTLADmr7rL7GQLnRda1I44GNXoK
         AFr2JDm2ZdiFohGP8aeuxDA/hefzQTc7WkHv34gKjcGJcJPrW6orpHHRhMVlParL+uqa
         vBn06yQDv1Wl0hhLus59EBPwdNoqTcXlspIO9oHagbFISsqZnrI0AsZZvE2bJvt9hpMg
         fJfEVvYk/RjSVe9WtV9Lqynz1CQbSMLT0cu2oeL4Z9FfiTDgjz229QeZkOkASJ4PvLix
         oUVnD/xxi1MEUAfwLEHphwE8RgGOVcBAX/G+St0mikgH8T737xeSeKsk315BQZvLDvNr
         UPeA==
X-Gm-Message-State: APjAAAX3B1lZNnXQHovxyOLrnZnHY4H/GnHCn/+hUaL8EaoqYsZ6QQu9
        aIWnxSKdxkNXnWtBWHLZR5WFFR0B
X-Google-Smtp-Source: APXvYqzcFSwqth+ZM2HKw3qaFd9fYTnaedU1xkNcga9EUnL1AdkjHtGVoW9ReYlJbC1aoCtwmBSXiA==
X-Received: by 2002:a17:90a:cb09:: with SMTP id z9mr16145579pjt.87.1560084213710;
        Sun, 09 Jun 2019 05:43:33 -0700 (PDT)
Received: from localhost.localdomain (p7131200-ipngn32701marunouchi.tokyo.ocn.ne.jp. [118.0.21.200])
        by smtp.gmail.com with ESMTPSA id u20sm7583138pfm.145.2019.06.09.05.43.31
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Sun, 09 Jun 2019 05:43:33 -0700 (PDT)
From:   Yoshihiro Kaneko <ykaneko0929@gmail.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH/RFT] arm64: dts: renesas: r8a77990: Fix register range of display node
Date:   Sun,  9 Jun 2019 21:43:18 +0900
Message-Id: <1560084198-2930-1-git-send-email-ykaneko0929@gmail.com>
X-Mailer: git-send-email 1.9.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Takeshi Kihara <takeshi.kihara.df@renesas.com>

Since the R8A77990 SoC uses DU{0,1}, the range from the base address to
the 0x4000 address is used.
This patch fixed it.

Fixes: 13ee2bfc5444 ("arm64: dts: renesas: r8a77990: Add display output support")
Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>
---

This patch is based on the devel branch of Simon Horman's renesas tree.

 arch/arm64/boot/dts/renesas/r8a77990.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a77990.dtsi b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
index 547e970..9b15da1 100644
--- a/arch/arm64/boot/dts/renesas/r8a77990.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
@@ -1760,7 +1760,7 @@
 
 		du: display@feb00000 {
 			compatible = "renesas,du-r8a77990";
-			reg = <0 0xfeb00000 0 0x80000>;
+			reg = <0 0xfeb00000 0 0x40000>;
 			interrupts = <GIC_SPI 256 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 268 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 724>,
-- 
1.9.1

