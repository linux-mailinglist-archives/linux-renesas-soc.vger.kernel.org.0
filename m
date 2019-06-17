Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 42CCE47E15
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Jun 2019 11:15:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726793AbfFQJP0 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 17 Jun 2019 05:15:26 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:33789 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726753AbfFQJP0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Jun 2019 05:15:26 -0400
Received: by mail-pg1-f195.google.com with SMTP id k187so5466126pga.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 17 Jun 2019 02:15:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:date:message-id:in-reply-to:references:subject;
        bh=hC21z8H3svuyIJTy660QJObfqNz2CLNT3XWoDEhxrwY=;
        b=RRJQwafTnbw9ZMmCckAkGIMeUFuAkRgIq77j7h6UIJReRprbHsCng3pWPAFO+8DOuZ
         J63sHpT/+wnzTVpBmKPp2jVOl2n1Hu3AZPnkngB3mjcwVb2BS0mcpgGNrmDF8gW2DdRv
         PNh3TYPooyinkosUFd/+nmkfHT8vy0WoaS6RlVgtXM6825vL5R+FWWyQu5UFDfvALbrf
         tw+Szu2vfBuouqaETH/DUM+KVkAfe+byOZ6pgk8dwj6f5MymG6fsNUxxfb8n2yOavKzR
         DuaTh4PjyI1ewTcZpcwMXln5nBOex+LB3O7fk938ndllafHmOt4CIGvfN4yZv0lBHAiG
         dGOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:date:message-id:in-reply-to
         :references:subject;
        bh=hC21z8H3svuyIJTy660QJObfqNz2CLNT3XWoDEhxrwY=;
        b=BbJOzWSrEzOf6vZ49Ja2oH/o3v5vVLzFt4+6IuMnXJ2A5GaWlKpyYyQE5KESUzeL96
         NjM4cMeWqsTvIez1+IEHc6nchbrqH2TiEvNQE2Xil6zQBNZBNXJTNxALp1ZHpyWw3JiR
         YPbgQYD1Md+U6u7QDC6INWr7NLXlSP5mP635d6PmKvGbYeiLiSkAaCvl6lOsToipuqjL
         iAdAUi2wg5aUQeao6zHUZwcUKKENux/RqD70mTCCs16GBOlzczZfmkJhUb98118/82UH
         DP1RPJE4dzSp1BNyjrF8Q6WCFpPnZDvOq2migSoSzkCepFx7IOsUmbB7yLxfZBOjl1nL
         qC5A==
X-Gm-Message-State: APjAAAWaPQZNRg8hDOQaJcc1kBfi9Y2NMxufj/jy8SXXmcu56iv/Yt69
        76TrR/Om2dqG2b01+zQYSUVl1B6N
X-Google-Smtp-Source: APXvYqx2cBpzNoiZZgDKPW2HQScp4zYt8WIw77sL0dUAHRHorf10kouwhKpnPRRWMSPmvU9WpsBq0w==
X-Received: by 2002:aa7:8b55:: with SMTP id i21mr5538271pfd.155.1560762925043;
        Mon, 17 Jun 2019 02:15:25 -0700 (PDT)
Received: from [127.0.0.1] (l193216.ppp.asahi-net.or.jp. [218.219.193.216])
        by smtp.gmail.com with ESMTPSA id k184sm10698210pgk.7.2019.06.17.02.15.23
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 17 Jun 2019 02:15:24 -0700 (PDT)
From:   Magnus Damm <magnus.damm@gmail.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Magnus Damm <magnus.damm@gmail.com>
Date:   Mon, 17 Jun 2019 18:16:51 +0900
Message-Id: <156076301133.5827.18087893489480810339.sendpatchset@octo>
In-Reply-To: <156076300266.5827.16345352064689583105.sendpatchset@octo>
References: <156076300266.5827.16345352064689583105.sendpatchset@octo>
Subject: [PATCH 1/3] ARM: dts: Update CMT1 DT compat strings on r8a7740
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Magnus Damm <damm+renesas@opensource.se>

Update the r8a7740 to use the CMT1 DT compat string documented in:
[PATCH 2/8] dt-bindings: timer: renesas, cmt: Update CMT1 on sh73a0 and r8a7740

The "renesas,cmt-48" portion is left as-is to avoid breakage until the CMT
driver has been updated to make use of the new DT compat strings.

Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

 arch/arm/boot/dts/r8a7740.dtsi |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- 0001/arch/arm/boot/dts/r8a7740.dtsi
+++ work/arch/arm/boot/dts/r8a7740.dtsi	2019-06-17 14:21:14.647792561 +0900
@@ -83,7 +83,7 @@
 	};
 
 	cmt1: timer@e6138000 {
-		compatible = "renesas,cmt-48-r8a7740", "renesas,cmt-48";
+		compatible = "renesas,r8a7740-cmt1", "renesas,cmt-48";
 		reg = <0xe6138000 0x170>;
 		interrupts = <GIC_SPI 58 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&mstp3_clks R8A7740_CLK_CMT1>;
