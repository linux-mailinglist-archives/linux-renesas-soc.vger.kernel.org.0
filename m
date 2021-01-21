Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A1C502FE6D3
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 Jan 2021 10:56:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728617AbhAUJzp (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 21 Jan 2021 04:55:45 -0500
Received: from www.zeus03.de ([194.117.254.33]:44328 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727571AbhAUJzj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 21 Jan 2021 04:55:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=k1; bh=thEaPpC9Kj4xlIGFYb2CG4ZdOCG
        UTUy30fqxGeilBVI=; b=i/DeyLWKsprujXI3Vejp0KwbYzrpFKpkcUQM1t/6WgC
        f+v2a1U0+2L6/cl5h3GiaTZK64yjSncuAlk6HsIFhPTOcXWp4McmBza8B+63VFRb
        aQcCtL94lotLWJBBUGj1Bpnn2eiNT21SEI2uTdpLLMrCM2de/WlzbzhOB8pRfQ3U
        =
Received: (qmail 1784013 invoked from network); 21 Jan 2021 10:54:27 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 21 Jan 2021 10:54:27 +0100
X-UD-Smtp-Session: l3s3148p1@3XatDma5mr4gAwDPXyX1ACWcscxtZ2TX
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     linux-clk@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH V2 0/4] v3u: add support for I2C
Date:   Thu, 21 Jan 2021 10:54:16 +0100
Message-Id: <20210121095420.5023-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Here is the updated series to enable I2C on V3U. Please check the
individual patches for updates. Please note that the last patch is not
for upstream, but just for testing.

Koji Matsuoka (1):
  arm64: dts: renesas: Add I2C to R8A779A0

Wolfram Sang (3):
  clk: renesas: r8a779a0: add clocks for I2C
  arm64: dts: renesas: Add I2C0,1,6 support for falcon board
  v3u: enable other I2C busses for testing

 .../boot/dts/renesas/r8a779a0-falcon-cpu.dtsi |  93 +++++++++++++
 arch/arm64/boot/dts/renesas/r8a779a0.dtsi     | 122 ++++++++++++++++++
 drivers/clk/renesas/r8a779a0-cpg-mssr.c       |   7 +
 3 files changed, 222 insertions(+)

-- 
2.29.2

