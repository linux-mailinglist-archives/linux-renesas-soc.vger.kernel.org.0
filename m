Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E24933FD64D
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  1 Sep 2021 11:17:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233149AbhIAJSc (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 1 Sep 2021 05:18:32 -0400
Received: from www.zeus03.de ([194.117.254.33]:37082 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232048AbhIAJSb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 1 Sep 2021 05:18:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=k1; bh=8sjjsqM9bDbahKkPf3dByNgPJ+4
        EVVYgZYdWGObLQUU=; b=Rhl2QI3L5LdbPv22oC23w7XNXX1Aw0tEjnYhsa/utyv
        oqjB0cH3p1pCbNelFIhNnpWT3+tIptkqdnq6yt2GJPH3dsT+pNbHQMsKmPGm5Meu
        aiCdxcbLAC9sa6qUzH3QceLS1qE+6rNhj5WY2pt1zfDCVb4exWj21hXIh/tJWFYI
        =
Received: (qmail 2978671 invoked from network); 1 Sep 2021 11:17:34 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 1 Sep 2021 11:17:34 +0200
X-UD-Smtp-Session: l3s3148p1@28xXievKUIMgARa4Rc4DAUbRC24QnL0V
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH 0/3] v3u: add support for TPU
Date:   Wed,  1 Sep 2021 11:17:22 +0200
Message-Id: <20210901091725.35610-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Here is the series with patches for Geert to enable TPU on V3U. I took
the DTS patches from the BSP, the rest was developed on mainline tree.
Patch 3 enables it on the Falcon board where it will be available on the
GPIO connector CN4. Otherwise, it is not actively used on that platform.
Not essential, but nice to have, I'd say.

Tested remotely using the sloppy GPIO logic analyzer. Pulses could be
traced and changes to period and duty cycles showed up in the scopes as
well.


Duc Nguyen (2):
  arm64: dts: renesas: r8a779a0: Add TPU node
  arm64: dts: r8a779a0-falcon-cpu: Add TPU support

Wolfram Sang (1):
  clk: renesas: r8a779a0: Add TPU clock

 arch/arm64/boot/dts/renesas/r8a779a0-falcon-cpu.dtsi | 12 ++++++++++++
 arch/arm64/boot/dts/renesas/r8a779a0.dtsi            | 11 +++++++++++
 drivers/clk/renesas/r8a779a0-cpg-mssr.c              |  1 +
 3 files changed, 24 insertions(+)

-- 
2.30.2

