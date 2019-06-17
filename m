Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A3C9247E19
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Jun 2019 11:15:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728007AbfFQJPn (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 17 Jun 2019 05:15:43 -0400
Received: from mail-pg1-f170.google.com ([209.85.215.170]:42381 "EHLO
        mail-pg1-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726753AbfFQJPn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Jun 2019 05:15:43 -0400
Received: by mail-pg1-f170.google.com with SMTP id l19so5443310pgh.9
        for <linux-renesas-soc@vger.kernel.org>; Mon, 17 Jun 2019 02:15:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:date:message-id:in-reply-to:references:subject;
        bh=aQQhF4a5ODeRWKp5nHOWqVFeQNOqkE3OtPCAFw2UAdA=;
        b=WFk4hqZylfZzn0ybQoq7UJfH/jK5BdCuzSP6gyqKvVUxHkQ98SNzMauNN1i5n4dDrz
         oE6cJGCedRlzmhWa6plPM+eN+I9FpXvQFeoGMZ4mwyeDvs5SMc+goLN9OYcIOhAiwJ/g
         mk9sk6AdLhNLk/u8OPIYeFbJY3eKqiG5uen6BnfTTgYiLSifu2OPfxbBOjA7hfVVGjaU
         SObj7trMP5+9WN8ChTddYbcKRCm0XmktjyChUE9gV+69UOcxmhiNSl/rEMDUdbLTNffX
         5kuAhTNYGybi6nBUz6CIVTtfk+db5Yzx2LtGPHZRwrQqys2hNXDn/vpDvoT0ZorS5mvj
         3Kaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:date:message-id:in-reply-to
         :references:subject;
        bh=aQQhF4a5ODeRWKp5nHOWqVFeQNOqkE3OtPCAFw2UAdA=;
        b=V7bDP6qMhW8YQ7AbFqcFqmd8c3PGqIfMNANf/xq5E1S2Hs71xqNXYpjCzsXXVOEO9s
         iA+bZilzJ0HmdgdphWxzaH8adPvQ/ke8CXEEHLV5CEDNY23SETTcmZtHLRCfFo4TWPIa
         DOsraj/u6yAesp5idG6KNXUU14gNQJQ0VbtKMCenMgP2CEOtYl9tsGpjQa4uuu7ELMDb
         qJgrhj3QrLIaIYwliJ9MXPIM3EDMx08/x3GqTAWv4Hzf9/KZq/sqypsTVXAZ4r5SCzzd
         4WDXTiQh1VuMaaDagU6LZMP2J4cG+JJpoGWUajCF8x8+61u6ZJ+b5Jm009qxIrdUwmMK
         z1NQ==
X-Gm-Message-State: APjAAAXoehMM9teHpVCmbvYIg8VoDO7UaHHTRWZgeyr6Lv0qqxZss24I
        l8xUQGhe/AywKULm4DWUJzulCBnW
X-Google-Smtp-Source: APXvYqwex/mqXbhC9oOBhEA9UtsTHgshyHiaP1iDxyhOOkNO8Cj5mh6Du3UjGXYZ3a9yUqc/82ZJZg==
X-Received: by 2002:aa7:818c:: with SMTP id g12mr8324394pfi.170.1560762941956;
        Mon, 17 Jun 2019 02:15:41 -0700 (PDT)
Received: from [127.0.0.1] (l193216.ppp.asahi-net.or.jp. [218.219.193.216])
        by smtp.gmail.com with ESMTPSA id p65sm12696127pfp.58.2019.06.17.02.15.39
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 17 Jun 2019 02:15:40 -0700 (PDT)
From:   Magnus Damm <magnus.damm@gmail.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Magnus Damm <magnus.damm@gmail.com>
Date:   Mon, 17 Jun 2019 18:17:08 +0900
Message-Id: <156076302818.5827.976723043537886578.sendpatchset@octo>
In-Reply-To: <156076300266.5827.16345352064689583105.sendpatchset@octo>
References: <156076300266.5827.16345352064689583105.sendpatchset@octo>
Subject: [PATCH 3/3] ARM: dts: Add CMT0 and CMT1 to r8a7792
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Magnus Damm <damm+renesas@opensource.se>

Add CMT0 and CMT1 to the R-Car Gen2 V2H (r8a7792) SoC.

Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

 arch/arm/boot/dts/r8a7792.dtsi |   34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

--- 0001/arch/arm/boot/dts/r8a7792.dtsi
+++ work/arch/arm/boot/dts/r8a7792.dtsi	2019-06-17 14:28:36.306948031 +0900
@@ -875,6 +875,40 @@
 			compatible = "renesas,prr";
 			reg = <0 0xff000044 0 4>;
 		};
+
+		cmt0: timer@ffca0000 {
+			compatible = "renesas,r8a7792-cmt0",
+				     "renesas,rcar-gen2-cmt0";
+			reg = <0 0xffca0000 0 0x1004>;
+			interrupts = <GIC_SPI 142 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 124>;
+			clock-names = "fck";
+			power-domains = <&sysc R8A7792_PD_ALWAYS_ON>;
+			resets = <&cpg 124>;
+
+			status = "disabled";
+		};
+
+		cmt1: timer@e6130000 {
+			compatible = "renesas,r8a7792-cmt1",
+				     "renesas,rcar-gen2-cmt1";
+			reg = <0 0xe6130000 0 0x1004>;
+			interrupts = <GIC_SPI 120 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 122 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 124 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 125 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 126 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 127 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 329>;
+			clock-names = "fck";
+			power-domains = <&sysc R8A7792_PD_ALWAYS_ON>;
+			resets = <&cpg 329>;
+
+			status = "disabled";
+		};
 	};
 
 	timer {
