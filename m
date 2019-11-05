Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4D049EF3C5
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 Nov 2019 04:00:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728351AbfKEDAj (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 4 Nov 2019 22:00:39 -0500
Received: from mail.kernel.org ([198.145.29.99]:33882 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727861AbfKEDAj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 4 Nov 2019 22:00:39 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1572922839;
        bh=S4kkYmIuPBZbrLpKxieNabcDfSGBtSHCNIEePVJrkh4=;
        h=Subject:From:Date:To:From;
        b=SYMd00tQLDH9G6dR7tzbF27Z3DTMMuGzzIfsaJJZMkTlXv9QkLs4+TU4u9nOIjgLm
         KgtxsZaJWKt/+3R4gXDkaSa1AqhPNnZ6zFxzX3FEtCQS4LbVoJym8TXKpJpF8FlKqh
         EJLj213PzJmIyIUDMuffgLDfhCVRTdpAJYUsBOHI=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <157292283904.17441.560744637180000989.git-patchwork-housekeeping@kernel.org>
Date:   Tue, 05 Nov 2019 03:00:39 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v3] PCI: rcar: Fix missing MACCTLR register setting (take2) (2019-11-05T02:48:11)
  Superseding: [v2] PCI: rcar: Fix missing MACCTLR register setting (take2) (2019-11-01T06:31:29):
    [v2,1/2] Revert "PCI: rcar: Fix missing MACCTLR register setting in rcar_pcie_hw_init()"
    [v2,2/2] PCI: rcar: Fix missing MACCTLR register setting in initialize sequence


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
