Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F19C1201C4B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 19 Jun 2020 22:21:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389360AbgFSUVm (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 19 Jun 2020 16:21:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392011AbgFSUVk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 19 Jun 2020 16:21:40 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8876FC06174E
        for <linux-renesas-soc@vger.kernel.org>; Fri, 19 Jun 2020 13:21:40 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id c17so12888972lji.11
        for <linux-renesas-soc@vger.kernel.org>; Fri, 19 Jun 2020 13:21:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:from:to:cc:references:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=LUBR4CULljFUZ9PDSVX5KbmdMj0OiDPwIg7vSOQMetQ=;
        b=QNlaYFSjvf9NC/TSd7BE/N2D9vWtKgE8mBozN/DzLanRll1xVP33aNJFckyW08QTZa
         uSktLWSJeaWe6qVnG5OjOq2lsDFSwc8c1ze05l+Z2IB5geXBxVUQGb7hcTooKcKAe2ep
         uXMblxqiLTuf8HYd220hsaJQ2dcTXw5Ez/3UC27wVr7k4WedIVor7x83pcQf5K47FjzO
         y40sMk+wnI7rUD12FHkYNq+W61sK/q8Dw1YBZmMmEngxFwaEUQWjdVM21GjDevFDy6Gd
         BsaAj7pTfd9wICKnhp59BihM/wEJxHoRzJ+THZ3sDXxka23sIUxVMRiOZ8bCwLdyP3N9
         fQoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=LUBR4CULljFUZ9PDSVX5KbmdMj0OiDPwIg7vSOQMetQ=;
        b=PQbCfo5HZBYNZiCR4//iNtRZWRM54VQFbbivnHF3Sl3JEsd7As99puNjFYYbHqblRD
         H17Sk2FNq3e7CyTy/wdNtUo+aAIEzGU5LWBwp255wj+J4svhYs51KwNkynnSaRqc1lVk
         HMvYcHjgAYGkMmNNPwBNsBYGPG3ZQDtNkdLAHn+/CrfEW2FpZqP7tIe+icoLtAay7ODO
         9xz12G+87CwPqWpq0GOtoBc6M/X8+PbFQwIxyjbv5iHhsPLBj6A+eOXG+2NCHdj9mTf9
         E0ubQR/bn+WhGoHvpU+1/LAkMgG34pmjSsO9f8b+vxaAYoOVMz4P+j+6/GG35+j08YT+
         PqjA==
X-Gm-Message-State: AOAM532mVIyAGn7g78M+ioQJo1wABCw6sbMJym4Of1YIXYQY6fOJr361
        BeYclcZZEnu0rR907SAC1UB1iQ==
X-Google-Smtp-Source: ABdhPJwEuxEbpJcCU+QAdtPf83HUNRNDcXOLnWwwodMrY8VTMdGcnhaaxKtYFl/mjdm1gkW3XNPNxA==
X-Received: by 2002:a2e:8690:: with SMTP id l16mr2341085lji.462.1592598098981;
        Fri, 19 Jun 2020 13:21:38 -0700 (PDT)
Received: from wasted.cogentembedded.com ([2a00:1fa0:441c:ac8f:7564:6e7d:9e36:7ded])
        by smtp.gmail.com with ESMTPSA id r11sm1591776lfc.29.2020.06.19.13.21.38
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 19 Jun 2020 13:21:38 -0700 (PDT)
Subject: [PATCH v2 1/2] arm64: dts: renesas: r8a77970: add RPC-IF support
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
Cc:     linux-renesas-soc@vger.kernel.org,
        Magnus Damm <magnus.damm@gmail.com>
References: <13425133-eedf-081f-4ed7-cd9012ce7d6d@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <ba8bb326-7e77-6ab7-668f-fdc22010c8ef@cogentembedded.com>
Date:   Fri, 19 Jun 2020 23:21:37 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <13425133-eedf-081f-4ed7-cd9012ce7d6d@cogentembedded.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Describe RPC-IF in the R8A77970 device tree.

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
Changes in version 2:
- removed the R8A77980 part, renamed the patch, and updated the description;
- renamed the RPC-IF node to "spi@ee200000";
- updated the R8A77970 RPC-IF "compatible" prop to match the bindings;
- split the 1st region in the "reg"/"reg-names" props for the WBUF registers;
- refreshed the patch.

 arch/arm64/boot/dts/renesas/r8a77970.dtsi |   17 +++++++++++++++++
 1 file changed, 17 insertions(+)

Index: renesas-devel/arch/arm64/boot/dts/renesas/r8a77970.dtsi
===================================================================
--- renesas-devel.orig/arch/arm64/boot/dts/renesas/r8a77970.dtsi
+++ renesas-devel/arch/arm64/boot/dts/renesas/r8a77970.dtsi
@@ -1039,6 +1039,23 @@
 			status = "disabled";
 		};
 
+		rpc: spi@ee200000 {
+			compatible = "renesas,r8a77970-rpc-if",
+				     "renesas,rcar-gen3-rpc-if";
+			reg = <0 0xee200000 0 0x200>,
+			      <0 0x08000000 0 0x4000000>,
+			      <0 0xee208000 0 0x100>;
+			reg-names = "regs", "dirmap", "wbuf";
+			interrupts = <GIC_SPI 38 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 917>;
+			clock-names = "rpc";
+			power-domains = <&sysc R8A77970_PD_ALWAYS_ON>;
+			resets = <&cpg 917>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		gic: interrupt-controller@f1010000 {
 			compatible = "arm,gic-400";
 			#interrupt-cells = <3>;
