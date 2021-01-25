Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0884D3022AB
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 Jan 2021 09:09:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727184AbhAYIJB (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 25 Jan 2021 03:09:01 -0500
Received: from www.zeus03.de ([194.117.254.33]:50414 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727252AbhAYIAX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 25 Jan 2021 03:00:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=k1; bh=8STZE6FzUKs73jwFwNWuYC+FhKt
        UcA6MK2Q4QIZeqZI=; b=gBR/KWHEXoPib4ir658Umi5d0rp8lcHywZqCVuP4gHc
        6F0Ryt2wuBWp60xmV0rA1+tH2VHgxvt21Jn+Bzkxqt/zwuz8Ile1lcZgkXKsMIpq
        23Sltuo8UB+bGADNR6amkIavjTHxuRSCnKsVehfbAvHi1Etjgz5TUrwURbdWMTnw
        =
Received: (qmail 3246821 invoked from network); 25 Jan 2021 08:58:47 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 25 Jan 2021 08:58:47 +0100
X-UD-Smtp-Session: l3s3148p1@K3NZ6LS5eNJUhs5S
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH v3 0/2] v3u: add support for SDHI
Date:   Mon, 25 Jan 2021 08:58:43 +0100
Message-Id: <20210125075845.3864-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Here is the updated series to enable SDHI on V3U. I just updated the
tags, especially the SoB from Saito-san. Because there are no code
changes, I also decided to not update the v3u/devel-v2 branch.

Takeshi Saito (2):
  arm64: dts: renesas: r8a779a0: Add MMC node
  arm64: dts: renesas: falcon: Enable MMC

 .../boot/dts/renesas/r8a779a0-falcon-cpu.dtsi | 41 +++++++++++++++++++
 arch/arm64/boot/dts/renesas/r8a779a0.dtsi     | 12 ++++++
 2 files changed, 53 insertions(+)

-- 
2.28.0

