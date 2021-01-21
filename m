Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0CB782FE7D0
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 Jan 2021 11:41:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728660AbhAUKlJ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 21 Jan 2021 05:41:09 -0500
Received: from www.zeus03.de ([194.117.254.33]:57090 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729497AbhAUKjR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 21 Jan 2021 05:39:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=k1; bh=NqVh7BhOLaSjwUPUWYg+dbaFLtB
        V/R3CE9wpgdoYbfk=; b=KI8Jj3KF87x9iEt1+1mLd4Cq55iF+SUz13Sn0Wj5J8N
        TnxLvILnVvJBb2YcvQp9pH9eoC16eJvMyhPOKJrdRPrO+oIKBE8WQUeCyv79lgFO
        RU5jhmPIb5EZVAoSzIml+QKwWGPTBBzCloD9aPl3mQ3X+TAqX3IuIa/xRBPqQRUg
        =
Received: (qmail 1805840 invoked from network); 21 Jan 2021 11:38:35 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 21 Jan 2021 11:38:35 +0100
X-UD-Smtp-Session: l3s3148p1@Ng94rGa57L4gAwDPXyX1ACWcscxtZ2TX
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH 0/2] v3u: add support for SDHI
Date:   Thu, 21 Jan 2021 11:38:28 +0100
Message-Id: <20210121103830.9575-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Here is the updated series to enable SDHI on V3U. Please check the
individual patches for updates.


Takeshi Saito (2):
  arm64: dts: renesas: r8a779a0: Add MMC node
  arm64: dts: renesas: falcon: Enable MMC

 .../boot/dts/renesas/r8a779a0-falcon-cpu.dtsi | 41 +++++++++++++++++++
 arch/arm64/boot/dts/renesas/r8a779a0.dtsi     | 12 ++++++
 2 files changed, 53 insertions(+)

-- 
2.29.2

