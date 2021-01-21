Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 33A1A2FE849
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 Jan 2021 12:03:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730048AbhAULC1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 21 Jan 2021 06:02:27 -0500
Received: from www.zeus03.de ([194.117.254.33]:34578 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730037AbhAULBK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 21 Jan 2021 06:01:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=k1; bh=r48lPHVY77PEOGg/lMYbk/kknKz
        D2sV642ac77leBdo=; b=OUFo1pvfjb384MzBkGgQ1tAqsZwLtKhOEhqkb44mvMj
        jr49uValWW1Jiti+4BV8bBB61DIsamTEJXh3rFdyWrPhbKJ04B1j8wUB6XG5Ldz3
        rOCbqzFcvWS2ZIMOLcAuLrWHJMxEynb3z5CnO7k9pCpK+P3LjIZXTL5zNu38lTSc
        =
Received: (qmail 1815140 invoked from network); 21 Jan 2021 12:00:13 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 21 Jan 2021 12:00:13 +0100
X-UD-Smtp-Session: l3s3148p1@cVTd+Wa5FL8gAwDPXyX1ACWcscxtZ2TX
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH v2 0/4] v3u: add support for SCIF
Date:   Thu, 21 Jan 2021 12:00:04 +0100
Message-Id: <20210121110008.15894-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Here is the updated series to enable SCIF & HSCIF on V3U. Please check
the individual patches for updates. Please note that the last patch is
not for upstream, but just for testing.

Linh Phung (1):
  arm64: dts: renesas: r8a779a0: Add HSCIF support

Wolfram Sang (3):
  arm64: dts: renesas: r8a779a0: add & update SCIF nodes
  arm64: dts: renesas: falcon: add SCIF0 nodes
  HACK: make hscif0 console

 .../boot/dts/renesas/r8a779a0-falcon-cpu.dtsi |  25 ++++
 .../boot/dts/renesas/r8a779a0-falcon.dts      |   2 +-
 arch/arm64/boot/dts/renesas/r8a779a0.dtsi     | 114 ++++++++++++++++++
 3 files changed, 140 insertions(+), 1 deletion(-)

-- 
2.29.2

