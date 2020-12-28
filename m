Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 471372E6BDD
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 29 Dec 2020 00:15:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730697AbgL1Wzx (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 28 Dec 2020 17:55:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729399AbgL1UXK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 28 Dec 2020 15:23:10 -0500
Received: from mail-il1-x131.google.com (mail-il1-x131.google.com [IPv6:2607:f8b0:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C7A3C0613D6;
        Mon, 28 Dec 2020 12:22:30 -0800 (PST)
Received: by mail-il1-x131.google.com with SMTP id 75so10384246ilv.13;
        Mon, 28 Dec 2020 12:22:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Eod5eAjFZ4xfIaR/VENNIsdfb75+wcip+n5OuajdH2w=;
        b=T2jGv9CsnJHMgyatz00MBsWaD0r+ApchbWpF1m7bHL6VPsPQSu6msHpHY8V8SI5+zt
         ZkAY0q40koe4Ou4j4Zy+b9CvGJRut4oVV+35pehJzSSm3ln4ou+uOgpqQ0T+VPP0L7p6
         noL4PhI2jnqJgpQmtgsd2MIUgN2LpvvQhnfqW0qv0170RwPo9XHRO+Cwt0ox+E+Q294S
         rDMCoA8/DeNmFTESWa8nhC2IBxacREbisnYvlynjXFXmn7qSwLgAukTqcuFnSnzLnggF
         ZwxRvzlfgHodukbhzngi+r850hxvxwMIW93mTp7dWMiPOET8P6WxpzrfAjrFcgPvL0N2
         zbwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Eod5eAjFZ4xfIaR/VENNIsdfb75+wcip+n5OuajdH2w=;
        b=aNafVA5X+LKLjvUUb7Tf/h1HWdW6Qw5jBiQg+Pun+FcNgFbESN1fMC1/MIpjOTjQ3j
         FhwXv8LCvzDYcoUYFSILDdiGDWQRP7V/Jtaaq219AcMq3ZmCHqXIl2+P9g3hLVIAXT/U
         NDOzepAyCC1YMYWCPaqHlaqUzp+qIP2aU5o22MfHZeKqsHSFvck4LSWrolLWYmYTcmeH
         6YAnBtkivs9dt2iXhVyK+tnzzZjc9z2H5L37wjJ/rklG7HOBFMA3fFEIPRMyfils1fr4
         Ezq8CbGuvdokxeSFQ1P8qHWhww0V9IpSkiMVpp2Oh5tLXaOOkZddpts2bVVNFIJ5Gqgb
         8Bdg==
X-Gm-Message-State: AOAM533gqQKeOlMaCkMiXcehyYlFcHfAagLBMtnUdPHRSlhQmt6Yaxwp
        eb3JGVchWHWyzf/AISQiJ65XEL6BWZgQ8w==
X-Google-Smtp-Source: ABdhPJx0LnfZF3KK/9eZYUCt96yASHoXK2XSKByjjhUmuKMyKviBohXoraBvm/qCOOGAhYycm/Bzyg==
X-Received: by 2002:a05:6e02:5c2:: with SMTP id l2mr43993377ils.231.1609186949055;
        Mon, 28 Dec 2020 12:22:29 -0800 (PST)
Received: from aford-IdeaCentre-A730.lan ([2601:448:8400:9e8:f45d:df49:9a4c:4914])
        by smtp.gmail.com with ESMTPSA id w3sm29043763ilk.17.2020.12.28.12.22.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Dec 2020 12:22:28 -0800 (PST)
From:   Adam Ford <aford173@gmail.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     aford@beaconembedded.com, Adam Ford <aford173@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: clock: renesas: rcar-usb2-clock-sel: Add support for RZ/G2 M/N/H
Date:   Mon, 28 Dec 2020 14:22:20 -0600
Message-Id: <20201228202221.2327468-1-aford173@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The datasheet for the RZ/G2 Series show the bit for choosing between a crystal
oscillator and an external oscillator is present.  Add the bindings for
r8a774a1 (RZ/G2M), r8a774b1 (RZ/G2N), and r8a774e1 (RZ/G2H)

Signed-off-by: Adam Ford <aford173@gmail.com>

diff --git a/Documentation/devicetree/bindings/clock/renesas,rcar-usb2-clock-sel.yaml b/Documentation/devicetree/bindings/clock/renesas,rcar-usb2-clock-sel.yaml
index 5be1229b3d6e..6eaabb4d82ec 100644
--- a/Documentation/devicetree/bindings/clock/renesas,rcar-usb2-clock-sel.yaml
+++ b/Documentation/devicetree/bindings/clock/renesas,rcar-usb2-clock-sel.yaml
@@ -35,6 +35,9 @@ properties:
   compatible:
     items:
       - enum:
+          - renesas,r8a774a1-rcar-usb2-clock-sel # RZ/G2M
+          - renesas,r8a774b1-rcar-usb2-clock-sel # RZ/G2N
+          - renesas,r8a774e1-rcar-usb2-clock-sel # RZ/G2H
           - renesas,r8a7795-rcar-usb2-clock-sel  # R-Car H3
           - renesas,r8a7796-rcar-usb2-clock-sel  # R-Car M3-W
           - renesas,r8a77961-rcar-usb2-clock-sel # R-Car M3-W+
-- 
2.25.1

