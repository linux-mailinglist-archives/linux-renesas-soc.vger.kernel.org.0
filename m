Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8CDF0366EAA
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Apr 2021 17:02:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243330AbhDUPDJ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 21 Apr 2021 11:03:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240280AbhDUPDJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 21 Apr 2021 11:03:09 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2088C06138A
        for <linux-renesas-soc@vger.kernel.org>; Wed, 21 Apr 2021 08:02:35 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id e7so49661431edu.10
        for <linux-renesas-soc@vger.kernel.org>; Wed, 21 Apr 2021 08:02:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mnvan/eG3rNIHa8KQ/ozU59f07FEevJHW+/7zIH5D+I=;
        b=IuPmx+mXs5T1dp1hlusVOIxaxvC++YSAiWHi0UPbGr9oEWvg228bB8ltxbek9Y3WN8
         56HAf3CL/O9Xv8I8QW7g/fm+knMr5l7AEmoYIfoT5hKwbDeK+k6q4zjyH87TELjZOza1
         EQ45JJlVZFj1UCM76WafyOQ6J3+v57UTSMkaaj7fIfcc284ii1iyGjNTXA3yyz0nxFF8
         EyyeTiYF+uMaIyG/umbP+K1LZGd4k8ZdgB9Wfxe1cKA2vm4YzPxlldnrOLKTR+14/yDH
         5hbRNGsZrVVspClfsxCIWWhnZ22BWIhHlHtXSBv8+NVPsh1KmQRNZJfSdlhFNUsb0Gu3
         I8bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mnvan/eG3rNIHa8KQ/ozU59f07FEevJHW+/7zIH5D+I=;
        b=OwZrmZFL7Zl7Qk41RvEWmdNUT6riBxJrkHJuHYZyHXxMytmGz7RzPWLNtNsiNSSGkl
         6fj4b3CyviUpEO4VPVgMHwLY84Uz0W2bXhbgST3By5J0EyaW4RtmVpFUZoRiU0QPTlXY
         KuGg+2ihqt58ojfxi8PzOFjHo69sJtGQ3MBRDxOFWUbLYn5CbYDsNffUII1a9WdZxrN4
         9abFB76n63k5rZvE29+PO97K1ngJdiH9mZyBFlAFvRd2wDt/OkcNK4bBQgBoQoO6r51b
         oTlXKU2S2jXb5c9SM8Af0R/DP2ukitI8twUEY5qrw1gbKqbo4Bqk7C/zg0dsoBW4zPuE
         /q5Q==
X-Gm-Message-State: AOAM531a1p5l7iUcOpYqi36drutHL5b38eKO0vwnDVM/88XmVABbIsWj
        CnqryXaUwY5fetjMTC12ed9O7g==
X-Google-Smtp-Source: ABdhPJyYqB2eiVgLBMBqlxWC5tTDvO35lZOYm424dNZLdQo4pczRsc5Xtt8EVCP9zSPAHdAUQX0Ttw==
X-Received: by 2002:aa7:c3ca:: with SMTP id l10mr30781204edr.55.1619017354679;
        Wed, 21 Apr 2021 08:02:34 -0700 (PDT)
Received: from bismarck.berto.se (p54ac5521.dip0.t-ipconnect.de. [84.172.85.33])
        by smtp.googlemail.com with ESMTPSA id g11sm3692588edt.35.2021.04.21.08.02.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Apr 2021 08:02:34 -0700 (PDT)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 1/2] arm64: dts: renesas: aistarvision-mipi-adapter-2.1: Fix CSI40 ports
Date:   Wed, 21 Apr 2021 17:02:20 +0200
Message-Id: <20210421150221.3202955-2-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210421150221.3202955-1-niklas.soderlund+renesas@ragnatech.se>
References: <20210421150221.3202955-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Fix the DTS schema by explicitly stating that the input is port@0. This
fixes a schema validation error but have no runtime effect as the
default port number is 0 if not specified.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 arch/arm64/boot/dts/renesas/r8a774c0-ek874-mipi-2.1.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a774c0-ek874-mipi-2.1.dts b/arch/arm64/boot/dts/renesas/r8a774c0-ek874-mipi-2.1.dts
index e7b4a929bb174840..2e3d1981cac48144 100644
--- a/arch/arm64/boot/dts/renesas/r8a774c0-ek874-mipi-2.1.dts
+++ b/arch/arm64/boot/dts/renesas/r8a774c0-ek874-mipi-2.1.dts
@@ -33,7 +33,7 @@ &csi40 {
 	status = "okay";
 
 	ports {
-		port {
+		port@0 {
 			csi40_in: endpoint {
 				clock-lanes = <0>;
 				data-lanes = <1 2>;
-- 
2.31.1

