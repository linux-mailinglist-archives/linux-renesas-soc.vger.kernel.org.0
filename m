Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 26D0549130
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Jun 2019 22:18:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726514AbfFQUSy (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 17 Jun 2019 16:18:54 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:38942 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726048AbfFQUSy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Jun 2019 16:18:54 -0400
Received: by mail-pf1-f194.google.com with SMTP id j2so6268371pfe.6
        for <linux-renesas-soc@vger.kernel.org>; Mon, 17 Jun 2019 13:18:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=rLIp2me5jZU1SNsGntPYn8e5/jApcYy2rM3bOxsRgHU=;
        b=Ou1Qv2C5wWRuORI60MzpGmPHAeCCdfaZVktWNZc2c7fSp7OvtS1jY6IznzraXf1Bb1
         RqXJ4HSEYP39Ontf/BM70otllMTdzUydEwKEVNtnd976UYJoCfgYFrpvqhojnhTcZL68
         FsznHjtay7S2jtWwDu5UiAPx0ensImFt/BNxz2cfeBKSBgojZylJ4jBot90MoPfdols2
         3WZeyqcYkhNrxK44/bUcprBG+ZXqER1ap4CH7S2s1vvxpTW8tvWzp1N/TrDnUhl0GKFe
         xPZBptaqbJ2sz4X8XC9i4xav98mpOO2bghbiHdArGIxomCFbS58mBWrctO3uTURxYz87
         VAOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=rLIp2me5jZU1SNsGntPYn8e5/jApcYy2rM3bOxsRgHU=;
        b=cn6hJOKt+rUKd2RZo1IsAzc3CEggjMHlkL3hMz4jTkHzOAzoufxHxUvRKVn+yM4GID
         7QxK/a3LWv5dqs2WcXeQcjOsr1mNEr5gJimRnhLhLWyCBuFtCDh8B8QQFFuamTBM/6es
         gmsPbLI5MuEZKzCZudoNXiQtTm+pTzX8o08S/2DDd8RJP/q6qpvnakBDFIyx24Z9dtrw
         pn0EavSxOM9fhNnmJdOK97zrrC2Im7LSiHS64VWTVhb+p1ECOCQQTU78+gwcOLBCWZ7N
         MvG3tOWE56CPlk8FLuxxSb9fbc1i1S+Etg2b3uGXRJwcD2jTcIVuSanlLgcc6s0EEYf0
         9cwg==
X-Gm-Message-State: APjAAAXuRWCT1BUIkD2ktd9s6Tf6ws7cplkJOiOQ38qwL/ZwwVRP9xz8
        3DruLVt5OeaUqzhVnfgrjKMQ9jf2
X-Google-Smtp-Source: APXvYqwVGzetBeRPDEU3UPBFTb4D0Rbgg5eyrtulEO9VoINtcmRqBzlMZ0z/f4I3ERYpLSK1x35EuQ==
X-Received: by 2002:aa7:9aaf:: with SMTP id x15mr64420337pfi.214.1560802712814;
        Mon, 17 Jun 2019 13:18:32 -0700 (PDT)
Received: from localhost.localdomain (KD118155013174.ppp-bb.dion.ne.jp. [118.155.13.174])
        by smtp.gmail.com with ESMTPSA id 11sm11965953pfo.19.2019.06.17.13.18.30
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Mon, 17 Jun 2019 13:18:31 -0700 (PDT)
From:   Yoshihiro Kaneko <ykaneko0929@gmail.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH/RFT] arm64: dts: renesas: r8a77995: Fix register range of display node
Date:   Tue, 18 Jun 2019 05:18:16 +0900
Message-Id: <1560802696-19042-1-git-send-email-ykaneko0929@gmail.com>
X-Mailer: git-send-email 1.9.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Since the R8A77995 SoC uses DU{0,1}, the range from the base address to
the 0x4000 address is used.
This patch fixed it.

Fixes: 18f1a773e3f9 ("arm64: dts: renesas: r8a77995: add DU support")

Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>
---

This patch is based on the devel branch of Simon Horman's renesas tree.

 arch/arm64/boot/dts/renesas/r8a77995.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a77995.dtsi b/arch/arm64/boot/dts/renesas/r8a77995.dtsi
index 0a344eb..0567b36 100644
--- a/arch/arm64/boot/dts/renesas/r8a77995.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77995.dtsi
@@ -995,7 +995,7 @@
 
 		du: display@feb00000 {
 			compatible = "renesas,du-r8a77995";
-			reg = <0 0xfeb00000 0 0x80000>;
+			reg = <0 0xfeb00000 0 0x40000>;
 			interrupts = <GIC_SPI 256 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 268 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 724>,
-- 
1.9.1

