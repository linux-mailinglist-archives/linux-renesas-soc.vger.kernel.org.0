Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C324647E16
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Jun 2019 11:15:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727323AbfFQJPe (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 17 Jun 2019 05:15:34 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:43856 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726753AbfFQJPe (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Jun 2019 05:15:34 -0400
Received: by mail-pl1-f194.google.com with SMTP id cl9so3827373plb.10
        for <linux-renesas-soc@vger.kernel.org>; Mon, 17 Jun 2019 02:15:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:date:message-id:in-reply-to:references:subject;
        bh=jP7zi3dmKrIb97iuExUNfcK90C1rjRR0NYbpWGJy7us=;
        b=tNSS6zm2IBtklxNaOYOoorgeSBkngVlX5kkUtzNXRFhWWs3cZNz+qSGH8SbNnkLyPs
         AdZSnDxo3KhwpSSYTTY3IOp1zdb08+xk5a267EdLkrQpO1c5R8aICk35fY+LL+dJSQmh
         HmUzaMK20ckOIWF+O64+m2v9PNnMKK+bBtxP8hKyBNisSI/YOw8LphLXvBlu+tVI3HEg
         1NrbCWNCOcNvayWfBovHGh3UhVV+k6QX11dDxbOqcPTskYrDyr3OHMtSxwsdsIwQNzd3
         Bp578osE4wO3PwSaEsGYMmJ80GixvMIBsJlqd4TGipzCSb9p9ssQ9gP4GQMT/G0m5bGF
         3Xwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:date:message-id:in-reply-to
         :references:subject;
        bh=jP7zi3dmKrIb97iuExUNfcK90C1rjRR0NYbpWGJy7us=;
        b=ITtB0A8vE/N6NAStMmFK022ZyZOsF+p9tCcf2LzJDrgJytgzlPFRlbvONfE8BVRKPk
         i1VEX2kWWnsc4qr7hfNna2Guqq6RCGzEkJrBBuwBwqCzodfAi7u2van8brupjIcZMBRM
         ZES+HaLnN7VUbNkW9CgAcewHsr2oJxmMOOzAxIUUa6D1IAqtwXMbKLQ29WQ2/G6ZVizA
         WGBsX2C5Nywzt54+trvUn/muzf1X6U4+/zTkBh8Tv3JIygIIELR/nHhZmfo9iWeQFJk2
         9hziqhdDBe/o4IdfmoKlwMvi2HYbdmwKIhaX8JzJZXUy/K3E8C2MMZ1x65MmBOWhjeE8
         02og==
X-Gm-Message-State: APjAAAWGK0wxzZgYgzkCfL1+s6ahRyZAVGO2fM4PbSlW5jD3/sHBiAUl
        Ogh28NYbsuKja0FqOkzVTH9egH3Y
X-Google-Smtp-Source: APXvYqyBsw9ih3YzdpGxjbpCtA4nLBcBfiiFcdSASM3HS1Pg9LZc1mMAGFKfeR3EDMD9ca+jSbRs7g==
X-Received: by 2002:a17:902:2b8a:: with SMTP id l10mr68269459plb.283.1560762933454;
        Mon, 17 Jun 2019 02:15:33 -0700 (PDT)
Received: from [127.0.0.1] (l193216.ppp.asahi-net.or.jp. [218.219.193.216])
        by smtp.gmail.com with ESMTPSA id d4sm9503659pju.19.2019.06.17.02.15.31
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 17 Jun 2019 02:15:32 -0700 (PDT)
From:   Magnus Damm <magnus.damm@gmail.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Magnus Damm <magnus.damm@gmail.com>
Date:   Mon, 17 Jun 2019 18:16:59 +0900
Message-Id: <156076301977.5827.3699303660557384258.sendpatchset@octo>
In-Reply-To: <156076300266.5827.16345352064689583105.sendpatchset@octo>
References: <156076300266.5827.16345352064689583105.sendpatchset@octo>
Subject: [PATCH 2/3] ARM: dts: Update CMT1 DT compat strings on sh73a0
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Magnus Damm <damm+renesas@opensource.se>

Update the sh73a0 to use the CMT1 DT compat string documented in:
[PATCH 2/8] dt-bindings: timer: renesas, cmt: Update CMT1 on sh73a0 and r8a7740

The "renesas,cmt-48" portion is left as-is to avoid breakage until the CMT
driver has been updated to make use of the new DT compat strings.

Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

 arch/arm/boot/dts/sh73a0.dtsi |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- 0001/arch/arm/boot/dts/sh73a0.dtsi
+++ work/arch/arm/boot/dts/sh73a0.dtsi	2019-06-17 14:23:20.096369624 +0900
@@ -92,7 +92,7 @@
 	};
 
 	cmt1: timer@e6138000 {
-		compatible = "renesas,cmt-48-sh73a0", "renesas,cmt-48";
+		compatible = "renesas,sh73a0-cmt1", "renesas,cmt-48";
 		reg = <0xe6138000 0x200>;
 		interrupts = <GIC_SPI 65 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&mstp3_clks SH73A0_CLK_CMT1>;
