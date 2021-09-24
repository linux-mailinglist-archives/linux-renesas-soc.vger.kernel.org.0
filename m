Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F10E34179CE
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Sep 2021 19:23:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347944AbhIXRWZ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 24 Sep 2021 13:22:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347810AbhIXRVr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 24 Sep 2021 13:21:47 -0400
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com [IPv6:2607:f8b0:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8540FC061613
        for <linux-renesas-soc@vger.kernel.org>; Fri, 24 Sep 2021 10:19:17 -0700 (PDT)
Received: by mail-il1-x130.google.com with SMTP id d11so11172068ilc.8
        for <linux-renesas-soc@vger.kernel.org>; Fri, 24 Sep 2021 10:19:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=L0Ac76m4QMv8pR6+SHH1UnHMddACZEl4Iq5VWZobcJQ=;
        b=ZQ/uWVosjNDAF5h19T2aMSoW/1TGiHASULoDjBXAAvL9GDy3Bd/RBDwGbsbU/eVjNL
         zsxsAkaNDmdkmT8jS4gi8KsBJkrwPnH0n0e8eDgWkVj9KFAPH17/pKNblUoyJq/iQjjS
         pjuo1EJ3acWr0NbKDJ3mdZ1KMZGvDZbK712bKOfP2N5YZTHxKMBTP90evu0TaFXMBSMV
         lTKWl8q64p+YFInZgZlQUrc9URnuD6z5OCPIO5jBIme1PSKnGYPL4BMpxi/YKOlKAcUT
         zEIcznl2Ki2iWjPXkWQgDd9bZSJV0yStFwMm1ECk0s29Mcp8DAxGZJxc9Xeo3oOCf4GE
         mk+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=L0Ac76m4QMv8pR6+SHH1UnHMddACZEl4Iq5VWZobcJQ=;
        b=Kt4bCoc80KCD1N/FpNZ6FxHKZzqZ76AydsYIBe6/UDfKJU7Y8lxOuJbMUhnDbO5kjb
         WeXNVsothSYzM1i6hd3WB2hDqMF25JH8StDE5R7AoLnnINtHOhp+4GmnYCv3PAUA0QWf
         s+49BCD+hx1txhriGm+EWp0d3fduVqqKqcJHcFQey6iiVR/ZF5zwNpfLSUeyRQo/rFW+
         T4fD1InuYO5ogF0OHRzrhGdiITnTYFA3kVVaAbu+pa/4t4TkvnSdievstdiaHcrzO0uv
         9qr3SwBX/f2Tbkq6Uu222EW9rCK/kfFtQo20wgMdC9Ax+zxyRdSBPhCOYKDLNDIWDoNv
         uvxA==
X-Gm-Message-State: AOAM53108fJyv1pL+2otQSVjiRUqoZAvfLSEtjFAoloDwqnmYZ6VqHDS
        suTaazavcqCAGmIhhHaFXJeQEBpkCLY=
X-Google-Smtp-Source: ABdhPJzDB0RmGNnp20Lbf4S678t17m/hW/SZW2LtwbHo2e4nNRzzsSfVgh/curiAhmANSQpOnDYQhw==
X-Received: by 2002:a05:6e02:1b04:: with SMTP id i4mr9142237ilv.221.1632503956068;
        Fri, 24 Sep 2021 10:19:16 -0700 (PDT)
Received: from aford-IdeaCentre-A730.lan ([2601:448:8400:9e8:abdd:e739:760:de69])
        by smtp.gmail.com with ESMTPSA id b3sm4497738ile.37.2021.09.24.10.19.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Sep 2021 10:19:14 -0700 (PDT)
From:   Adam Ford <aford173@gmail.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     geert+renesas@glider.be, aford@beaconembedded.com,
        Adam Ford <aford173@gmail.com>
Subject: [PATCH] arm64: dts: renesas: beacon: Fix memory corruption from TF-A
Date:   Fri, 24 Sep 2021 12:19:05 -0500
Message-Id: <20210924171905.347115-1-aford173@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Trusted Firmware allocates a chunk of memory for a lossy compressor
which makes the memory unavailable to Linux and any attempts to read/write
from Linux result in memory corruption or a crash.  Fix this by reserving
the section of memory marked as unavailable by TF-A.

Fixes: a1d8a344f1ca ("arm64: dts: renesas: Introduce r8a774a1-beacon-rzg2m-kit")
Signed-off-by: Adam Ford <aford173@gmail.com>

diff --git a/arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi b/arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi
index 090dc9c4f57b..e01cb30e03e8 100644
--- a/arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi
@@ -13,6 +13,17 @@ memory@48000000 {
 		reg = <0x0 0x48000000 0x0 0x78000000>;
 	};
 
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		lossy_decompress: lossy-decompress@54000000 {
+			reg = <0 0x54000000 0 0x03000000>; /* Reserved by TF-A */
+			no-map;
+		};
+	};
+
 	osc_32k: osc_32k {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
-- 
2.25.1

