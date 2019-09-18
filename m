Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8E01DB596F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Sep 2019 03:53:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726480AbfIRBxJ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 17 Sep 2019 21:53:09 -0400
Received: from mail-pg1-f179.google.com ([209.85.215.179]:44565 "EHLO
        mail-pg1-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725884AbfIRBxJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 17 Sep 2019 21:53:09 -0400
Received: by mail-pg1-f179.google.com with SMTP id i18so3018413pgl.11
        for <linux-renesas-soc@vger.kernel.org>; Tue, 17 Sep 2019 18:53:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:date:message-id:subject;
        bh=ommSpd/ZCJEeB6RtjwF29efxOErjEovqOUaR19kbcg4=;
        b=E55y84WBmGl/XxgoLgobnUsIcYI3iyEEpdjUZBy1FB2r9+FE31mzAQ6Z6ucXzrCO09
         pkN/LniBkmajsbugeVvri+egAcEQjUXhshZ++oQy9zKZ7R8mR2J1onKEcc6o+b2Ob2K5
         CNe6YQo/uaEldZTOj57Jpv3rP4+bINHog1nI8c6B/kI3zVxSGtG6Wn2gteeIIcf4OFeG
         G/lY+Wipd5WZwkk7riKkapCfmPg89j+0h5MDcy2HvRuiSVwY6IiXPzApeWiFMP6q8im7
         aIRY3uprhcozzpQq81Z0OxZ5wO1qOOLHN5WbM+GwXLNQHBuZak07eLfc+B/j6HADPIPZ
         HELA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:date:message-id:subject;
        bh=ommSpd/ZCJEeB6RtjwF29efxOErjEovqOUaR19kbcg4=;
        b=N928Pw4XlC/D7RNaqN91DmQJ06fKNm/znAGM6iGx4oJao8V9hSQwLqhhTFGu7kMPi1
         3DKZ6Vus1NRMiMSnDYEe59DHs88QZS7rpKDTQ8h9ulOz51KxSKmYXW05PGL/Qdy0k+bN
         uwzjXmFFnvm80/3Q6qJIPvbDeKtU15T6fAKY1/u18e0L7RVKH1mukhemlVKXOjtsBfSz
         YbQ9qhRhYZEW3iLbF2THmQqibbVEitQV4IK9S+dMC470PPB8bRhAebcBFgTBQjpl6C3z
         9gLQsJtoVQc7+T35sjg6XIKCnO/zvn6BbWz285xHX9iLWTlircHkGii0UWhiSkNO4X3D
         8eYw==
X-Gm-Message-State: APjAAAW0L3G8X1mBzBQ+8ofm/ab4Cl699Vcv5MTBzdZVD50QBQ7/Zw78
        /EC0BlQhGtrcRIU8MKsIbzUYOOih
X-Google-Smtp-Source: APXvYqy7oq9BneYViYMS9C7tFfP4C7VwcMtMyORUP/xsxFW67rJrIrG+eCvsacPE6mpYwIV/m/KgXA==
X-Received: by 2002:a17:90a:a47:: with SMTP id o65mr1156541pjo.90.1568771586947;
        Tue, 17 Sep 2019 18:53:06 -0700 (PDT)
Received: from [127.0.0.1] (s214090.ppp.asahi-net.or.jp. [220.157.214.90])
        by smtp.gmail.com with ESMTPSA id u18sm3037895pge.69.2019.09.17.18.53.03
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 17 Sep 2019 18:53:05 -0700 (PDT)
From:   Magnus Damm <magnus.damm@gmail.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Magnus Damm <magnus.damm@gmail.com>, geert@glider.be
Date:   Wed, 18 Sep 2019 10:54:52 +0900
Message-Id: <156877169225.29395.9771334507494949542.sendpatchset@octo>
Subject: [PATCH/RFC] ARM: dts: emev2: Add whitespace for GPIO nodes
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Magnus Damm <damm+renesas@opensource.se>

It turns out that the GPIO nodes for EMEV2 are missing whitespace,
so focus on what is important in life and adjust the coding style
to match the rest of the code base.

Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

 arch/arm/boot/dts/emev2.dtsi |    4 ++++
 1 file changed, 4 insertions(+)

--- 0001/arch/arm/boot/dts/emev2.dtsi
+++ work/arch/arm/boot/dts/emev2.dtsi	2019-09-17 22:40:44.504846903 +0900
@@ -212,6 +212,7 @@
 		interrupt-controller;
 		#interrupt-cells = <2>;
 	};
+
 	gpio1: gpio@e0050080 {
 		compatible = "renesas,em-gio";
 		reg = <0xe0050080 0x2c>, <0xe00500c0 0x20>;
@@ -224,6 +225,7 @@
 		interrupt-controller;
 		#interrupt-cells = <2>;
 	};
+
 	gpio2: gpio@e0050100 {
 		compatible = "renesas,em-gio";
 		reg = <0xe0050100 0x2c>, <0xe0050140 0x20>;
@@ -236,6 +238,7 @@
 		interrupt-controller;
 		#interrupt-cells = <2>;
 	};
+
 	gpio3: gpio@e0050180 {
 		compatible = "renesas,em-gio";
 		reg = <0xe0050180 0x2c>, <0xe00501c0 0x20>;
@@ -248,6 +251,7 @@
 		interrupt-controller;
 		#interrupt-cells = <2>;
 	};
+
 	gpio4: gpio@e0050200 {
 		compatible = "renesas,em-gio";
 		reg = <0xe0050200 0x2c>, <0xe0050240 0x20>;
