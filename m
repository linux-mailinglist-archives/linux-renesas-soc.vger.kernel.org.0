Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E0E6247447B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Dec 2021 15:06:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234794AbhLNOGY (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 14 Dec 2021 09:06:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234749AbhLNOGX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 14 Dec 2021 09:06:23 -0500
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 632FFC06173F
        for <linux-renesas-soc@vger.kernel.org>; Tue, 14 Dec 2021 06:06:23 -0800 (PST)
Received: by mail-lj1-x234.google.com with SMTP id v15so28538976ljc.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 14 Dec 2021 06:06:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5OHIqTeCctslyXClwppcychD+Bt9v8imN5KIL/FB1ac=;
        b=7XNeTlprK0EC0EYQZk82af0lBAepB2dSN4LxTKPJtbKj+K981dVNmwNhQ3deOSZCu/
         hX+W/TP/rpNK4MUWYBCE18wZbL24yJkLjpH5xM303ZliohXK4AMPKAjtZBW/jFNvCtUf
         U5KPaD9rHkdRCvqTSfD71ZaMU04/yz0dqi8yqF7V+RZYght30ZNFcaAesjo0ezHHQJR9
         e9wiK+147Su18xfMiYrMWRnCB5vJAaYnTJJf3/RHY9Zn4fnU/oZ1PNqA6/OmYwwTaWob
         5CHs7k981KAWlqnsx+w/zP5mh1Aid6zjsY9pFm4hzvJtHDTYSF/FRFnRmTWukZXcXkWK
         9x3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5OHIqTeCctslyXClwppcychD+Bt9v8imN5KIL/FB1ac=;
        b=JqkQWoRNp+36pCRKiyHKlAXfUXrn9FYjrEBA04RzTOgp0Ry9JM4hhgxBMRE1yTHsh2
         tDTkzYohyKXTHRGb3c+iOIo1MKxhpvQ0xPzmvUOG4W8dAAorsbbqVK6y3Dd7jlSzxyoY
         mPl1n00zIyrXBsbUaY58Covqb/dd8ea4whHyJt2p3evTW1bRWHep7JstTNl3BfC8lMWF
         qPteeWadTDTb7VyLNgAw9elwa0U5vkVqgFtfvFvVgLMNe8AL+bfOp8HzPn4zIEBZg9Ae
         zAzw2WGdNc+8pSjhg6Lw+n8SVLNcJsZlj054D91mD4v/3ZCrR0HHfcSm6RYUUYDJz2VJ
         8L0A==
X-Gm-Message-State: AOAM533CJxviaCL5CsRE2PGDgRaIQenpYugqimK3jsAuG4ECN2rhgQux
        eSjBeBCB904TmIOSoeiVwX53nA==
X-Google-Smtp-Source: ABdhPJwUkvgiweqBFysLh77zBjdGwWST7ymu1RsItxPuFZy/tsGkwB9hIm9cipKABO1vQXYDIc2LiA==
X-Received: by 2002:a2e:b6d4:: with SMTP id m20mr5068850ljo.471.1639490781628;
        Tue, 14 Dec 2021 06:06:21 -0800 (PST)
Received: from cobook.home (nikaet.starlink.ru. [94.141.168.29])
        by smtp.gmail.com with ESMTPSA id i4sm1839605lfe.26.2021.12.14.06.06.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Dec 2021 06:06:21 -0800 (PST)
From:   Nikita Yushchenko <nikita.yoush@cogentembedded.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sergey Shtylyov <s.shtylyov@omp.ru>
Cc:     linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Nikita Yushchenko <nikita.yoush@cogentembedded.com>
Subject: [PATCH v2] arm64: dts: renesas: r8a77961: Add lvds0 device node
Date:   Tue, 14 Dec 2021 17:06:07 +0300
Message-Id: <20211214140607.1147976-1-nikita.yoush@cogentembedded.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <d4a00def-7765-e0e4-c5c7-8d648eeb8cf2@omp.ru>
References: <d4a00def-7765-e0e4-c5c7-8d648eeb8cf2@omp.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add the missing lvds0 node for the R-Car M3-W+ SoC.

Signed-off-by: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
---
Changes in v2:
- fix typo in subject

 arch/arm64/boot/dts/renesas/r8a77961.dtsi | 27 +++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a77961.dtsi b/arch/arm64/boot/dts/renesas/r8a77961.dtsi
index 86d59e7e1a87..d324dfd0d1f7 100644
--- a/arch/arm64/boot/dts/renesas/r8a77961.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77961.dtsi
@@ -2718,6 +2718,33 @@ du_out_hdmi0: endpoint {
 				port@2 {
 					reg = <2>;
 					du_out_lvds0: endpoint {
+						remote-endpoint = <&lvds0_in>;
+					};
+				};
+			};
+		};
+
+		lvds0: lvds@feb90000 {
+			compatible = "renesas,r8a7796-lvds";
+			reg = <0 0xfeb90000 0 0x14>;
+			clocks = <&cpg CPG_MOD 727>;
+			power-domains = <&sysc R8A77961_PD_ALWAYS_ON>;
+			resets = <&cpg 727>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					lvds0_in: endpoint {
+						remote-endpoint = <&du_out_lvds0>;
+					};
+				};
+				port@1 {
+					reg = <1>;
+					lvds0_out: endpoint {
 					};
 				};
 			};
-- 
2.30.2

