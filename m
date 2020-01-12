Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 700CB1387E4
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 12 Jan 2020 20:13:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733180AbgALTNd (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 12 Jan 2020 14:13:33 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:32827 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732957AbgALTNd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 12 Jan 2020 14:13:33 -0500
Received: by mail-wr1-f67.google.com with SMTP id b6so6523942wrq.0
        for <linux-renesas-soc@vger.kernel.org>; Sun, 12 Jan 2020 11:13:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=F93r4W5TT+UANdmf3uZsJ4rCPeQMdPoslDgiksoeuZM=;
        b=DV2eAX2nCi+sT5spOQZVveW1lzDfsjoe/jHMteFsOvFy3L40Th+QWqMXwDKROd8MqS
         Y4yQfM4D8zFJlQP9YXzKmrxutHmZo5hE7jx4rcKv5HpOk89Zw4Vc9I4uOUG3j6Dupj5/
         Z1fi6okm8TMR3IU3ARfB1Xry9uY7O4LqaK/Brp3kqfhh7X8ZMJrpWW/4WwWVol/JS8uK
         +vQU05myd2JJLdup6+ZI6eiWGv5MbYQS9Zw8gfe1Oj1qtaFJqfIdCad/JWtTGgRpAXTm
         2ezsOmUXlB6/mBie3taIncQdpk+FjaoakKK7K0SazCEtwR64fCBiZyxD0EIkDowgDFvn
         XqzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=F93r4W5TT+UANdmf3uZsJ4rCPeQMdPoslDgiksoeuZM=;
        b=TBAG6+3Zcr4lPE6jF/tzrUDAYk+wK9Eq6wVdh4LgtH5yW5nWrVTYSY/9Re59dzCRNW
         0HxUl4/4dLHCyg8Rdb7xqgSGwipDeGT56kdQ6EftywRxeVqvEfM0AxS4le8hqgudhleU
         PgUKfHRPlaaeyDsS6PajX3c9EHZUwp2ipe+FrrlTFrKfJKKoiBZrf2xy/NkuYQ8eua6D
         NJ+vGB48MUa9AS2EfXrGBtUsEOWPezAq38PYFlIxbiVR/H/Ak6L9Kk1Nru0Gbii2EXnU
         dZAYR4Kb3RSvswqjnxBrafNVDn81XSBb6h4cnqCSB6e8+jPFhBohgVyeTq94By58QAyC
         /LuA==
X-Gm-Message-State: APjAAAW77G8egPZqbVPXDaBkb66eSTcMedqB2q62C8v+xGNxuqNXvxe4
        mXLajU3HZ4bl4+bcqA0AxDc=
X-Google-Smtp-Source: APXvYqwpHMDLdCF8cLDyA9fbFvj870WcW9R+1uWaUnO2bw2pZGKS/h90TZIF9GOy+rnZnUfg+yjQiA==
X-Received: by 2002:a5d:45c4:: with SMTP id b4mr14409475wrs.303.1578856410865;
        Sun, 12 Jan 2020 11:13:30 -0800 (PST)
Received: from chi.lan (cst-prg-19-39.cust.vodafone.cz. [46.135.19.39])
        by smtp.gmail.com with ESMTPSA id o7sm10974030wmh.11.2020.01.12.11.13.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jan 2020 11:13:28 -0800 (PST)
From:   marek.vasut@gmail.com
To:     linux-arm-kernel@lists.infradead.org
Cc:     Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [RFC][PATCH] ARM: dts: renesas: Add missing ethernet PHY reset GPIO on Gen2 reference boards
Date:   Sun, 12 Jan 2020 20:13:15 +0100
Message-Id: <20200112191315.118831-1-marek.vasut@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Marek Vasut <marek.vasut+renesas@gmail.com>

The ethernet PHY reset GPIO was missing and the kernel was depending
solely on the bootloader to bring the PHY out of reset. Fix this to
get rid of the dependency on bootloader.

Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
---
NOTE: Thus far tested on R8A7791 Koelsch
---
 arch/arm/boot/dts/r8a7790-lager.dts   | 1 +
 arch/arm/boot/dts/r8a7790-stout.dts   | 1 +
 arch/arm/boot/dts/r8a7791-koelsch.dts | 1 +
 arch/arm/boot/dts/r8a7791-porter.dts  | 1 +
 arch/arm/boot/dts/r8a7793-gose.dts    | 1 +
 arch/arm/boot/dts/r8a7794-alt.dts     | 1 +
 arch/arm/boot/dts/r8a7794-silk.dts    | 1 +
 7 files changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/r8a7790-lager.dts b/arch/arm/boot/dts/r8a7790-lager.dts
index 097fd9317c6e..b88d4f4d5d9e 100644
--- a/arch/arm/boot/dts/r8a7790-lager.dts
+++ b/arch/arm/boot/dts/r8a7790-lager.dts
@@ -671,6 +671,7 @@ &ether {
 
 	phy1: ethernet-phy@1 {
 		reg = <1>;
+		reset-gpios = <&gpio5 31 GPIO_ACTIVE_LOW>;
 		interrupt-parent = <&irqc0>;
 		interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
 		micrel,led-mode = <1>;
diff --git a/arch/arm/boot/dts/r8a7790-stout.dts b/arch/arm/boot/dts/r8a7790-stout.dts
index a315ba749aa4..98dcfcbf0b70 100644
--- a/arch/arm/boot/dts/r8a7790-stout.dts
+++ b/arch/arm/boot/dts/r8a7790-stout.dts
@@ -200,6 +200,7 @@ &ether {
 
 	phy1: ethernet-phy@1 {
 		reg = <1>;
+		reset-gpios = <&gpio3 31 GPIO_ACTIVE_LOW>;
 		interrupt-parent = <&irqc0>;
 		interrupts = <1 IRQ_TYPE_LEVEL_LOW>;
 		micrel,led-mode = <1>;
diff --git a/arch/arm/boot/dts/r8a7791-koelsch.dts b/arch/arm/boot/dts/r8a7791-koelsch.dts
index 2b096d5e06fb..6619689a17d4 100644
--- a/arch/arm/boot/dts/r8a7791-koelsch.dts
+++ b/arch/arm/boot/dts/r8a7791-koelsch.dts
@@ -630,6 +630,7 @@ &ether {
 
 	phy1: ethernet-phy@1 {
 		reg = <1>;
+		reset-gpios = <&gpio5 22 GPIO_ACTIVE_LOW>;
 		interrupt-parent = <&irqc0>;
 		interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
 		micrel,led-mode = <1>;
diff --git a/arch/arm/boot/dts/r8a7791-porter.dts b/arch/arm/boot/dts/r8a7791-porter.dts
index f9ece7ab2010..2ba2e8e5f1c3 100644
--- a/arch/arm/boot/dts/r8a7791-porter.dts
+++ b/arch/arm/boot/dts/r8a7791-porter.dts
@@ -304,6 +304,7 @@ &ether {
 
 	phy1: ethernet-phy@1 {
 		reg = <1>;
+		reset-gpios = <&gpio5 22 GPIO_ACTIVE_LOW>;
 		interrupt-parent = <&irqc0>;
 		interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
 		micrel,led-mode = <1>;
diff --git a/arch/arm/boot/dts/r8a7793-gose.dts b/arch/arm/boot/dts/r8a7793-gose.dts
index 22ca7cd1e7d2..4da82f1e1e94 100644
--- a/arch/arm/boot/dts/r8a7793-gose.dts
+++ b/arch/arm/boot/dts/r8a7793-gose.dts
@@ -588,6 +588,7 @@ &ether {
 
 	phy1: ethernet-phy@1 {
 		reg = <1>;
+		reset-gpios = <&gpio5 22 GPIO_ACTIVE_LOW>;
 		interrupt-parent = <&irqc0>;
 		interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
 		micrel,led-mode = <1>;
diff --git a/arch/arm/boot/dts/r8a7794-alt.dts b/arch/arm/boot/dts/r8a7794-alt.dts
index f79fce74cd9c..7aa1e8ca808b 100644
--- a/arch/arm/boot/dts/r8a7794-alt.dts
+++ b/arch/arm/boot/dts/r8a7794-alt.dts
@@ -340,6 +340,7 @@ &ether {
 
 	phy1: ethernet-phy@1 {
 		reg = <1>;
+		reset-gpios = <&gpio1 24 GPIO_ACTIVE_LOW>;
 		interrupt-parent = <&irqc0>;
 		interrupts = <8 IRQ_TYPE_LEVEL_LOW>;
 		micrel,led-mode = <1>;
diff --git a/arch/arm/boot/dts/r8a7794-silk.dts b/arch/arm/boot/dts/r8a7794-silk.dts
index 2c16ad854300..3c0ed684f4a1 100644
--- a/arch/arm/boot/dts/r8a7794-silk.dts
+++ b/arch/arm/boot/dts/r8a7794-silk.dts
@@ -391,6 +391,7 @@ &ether {
 
 	phy1: ethernet-phy@1 {
 		reg = <1>;
+		reset-gpios = <&gpio1 24 GPIO_ACTIVE_LOW>;
 		interrupt-parent = <&irqc0>;
 		interrupts = <8 IRQ_TYPE_LEVEL_LOW>;
 		micrel,led-mode = <1>;
-- 
2.24.1

