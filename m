Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4FB3A2D8F74
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 13 Dec 2020 19:46:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387661AbgLMSjk (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 13 Dec 2020 13:39:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732770AbgLMSjh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 13 Dec 2020 13:39:37 -0500
Received: from mail-il1-x142.google.com (mail-il1-x142.google.com [IPv6:2607:f8b0:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6AABC061282;
        Sun, 13 Dec 2020 10:38:32 -0800 (PST)
Received: by mail-il1-x142.google.com with SMTP id c18so13771907iln.10;
        Sun, 13 Dec 2020 10:38:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=p6tsPoNMSLdKhY/7wLeVC20Btxn4HAVOwEt7BvWZpxY=;
        b=YQ5dsbUEIgwSExuxPO/FCa+OZTUjEQeIkiY3dMgi1R57gEOYZZm6yxiepUGG5ZXUir
         JMWAJQs2YJFc0AxqSFNFMp2zDq7zfd18QK2ClGTdPOhqvMADjBBDbPzfv735scazFyMI
         s9WbeezRf0rEwn5L3oZ58tGXWjetFDzYMirt/1Qu4HlSE0dwSobUClH2MIOhvx+Sgt2u
         oWVRzCf9XOpJVxeM7xKt6dq6fSf1AugiLVFm+w4IItsUHty4o6LdyHcYMOsZhE4MgPTF
         6YUfYL7tJqIJP2WVxswdh+DixUSJLV6b+uNePOHXYGwigbvEWD4rq1VEtmnIkO0OZkhg
         j2cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=p6tsPoNMSLdKhY/7wLeVC20Btxn4HAVOwEt7BvWZpxY=;
        b=C3yuxMiCsCXOyjQ9BjPNLH2ZpQ/3sgsHkdZeeaDb6s8Y0NZ4v0Z6HuYSVLTeMo13OO
         ShQvv9Ps94jzTazQ8u2S4LElF1xMpRbCUrh+oS9tgOVy6KD7wm3nY3TOwnWxU4C4Wm9b
         TiP2wIWnJWxGGo1eVPmJbA85olCZyPSozeOkHad1KXkaMPVzhPeibu+h9Z2lJc7mjGHx
         VZpoc+ZyB+OJi3ZdmNWEX/IGOwcT7KFWgs31bY5zowJYVK884sap2A/I9EciBJsXWAuf
         RsAAGR51HWJYQsw3nyaxWI4LXiDU2EU+g8rfg1lDzrx1nfXNQOvXQrvtZkSVhmHWXOyJ
         D79A==
X-Gm-Message-State: AOAM532XpzuhuD39ugb4yvALsae3C7p5NnssHhGoVAhPtCwqeBtyGZHw
        D1hBOSJYiozTllz4IFcbLaXSEWxEYsQyfg==
X-Google-Smtp-Source: ABdhPJxDFdWVFGKzMVIOijxCctsIt4TZsnYu/dxBAVm0p31VKWXTDlo2aEZa+YR7pffJVz9m9CEHJA==
X-Received: by 2002:a92:c102:: with SMTP id p2mr7282262ile.167.1607884712006;
        Sun, 13 Dec 2020 10:38:32 -0800 (PST)
Received: from aford-IdeaCentre-A730.lan ([2601:448:8400:9e8:f45d:df49:9a4c:4914])
        by smtp.gmail.com with ESMTPSA id o11sm7804532ioa.37.2020.12.13.10.38.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Dec 2020 10:38:31 -0800 (PST)
From:   Adam Ford <aford173@gmail.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     aford@beaconembedded.com, Adam Ford <aford173@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 10/18] arm64: dts: renesas: Don't make vccq_sdhi0 always on
Date:   Sun, 13 Dec 2020 12:37:50 -0600
Message-Id: <20201213183759.223246-11-aford173@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201213183759.223246-1-aford173@gmail.com>
References: <20201213183759.223246-1-aford173@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

vccq_sdhi0 is referenced from sdhi0, so there is no need to force
this regualtor to be always-on.  In theory it could help with
low power modes in the future.

Signed-off-by: Adam Ford <aford173@gmail.com>
---
 arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi b/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi
index 87a0f556cd2f..f951bae2a1c6 100644
--- a/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi
+++ b/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi
@@ -201,15 +201,12 @@ sound_card {
 
 	vccq_sdhi0: regulator-vccq-sdhi0 {
 		compatible = "regulator-gpio";
-
 		regulator-name = "SDHI0 VccQ";
 		regulator-min-microvolt = <1800000>;
 		regulator-max-microvolt = <3300000>;
-
 		gpios = <&gpio6 30 GPIO_ACTIVE_HIGH>;
 		gpios-states = <1>;
 		states = <3300000 1>, <1800000 0>;
-		regulator-always-on;
 	};
 
 	/* External DU dot clocks */
-- 
2.25.1

