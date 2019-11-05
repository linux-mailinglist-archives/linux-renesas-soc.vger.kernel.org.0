Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0FFC1EFBF2
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 Nov 2019 12:00:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730731AbfKELAk (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 5 Nov 2019 06:00:40 -0500
Received: from mail.kernel.org ([198.145.29.99]:58162 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726867AbfKELAk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 5 Nov 2019 06:00:40 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1572951639;
        bh=atMdW7h1+SR3F7YEs/XVKod8EGhCt+Am9Ty8wL1I2Dg=;
        h=Subject:From:Date:To:From;
        b=jGani0pfGh7w/EMoctULb5S81sfuYAz2IiR/q49odsbRiFFUljC7bAUpBQ8jRCjHk
         Nj4HFTWbMMqVKXqgjWYaargkZMFnkdffV/70pDSbHGLvTD7j+eee8/sYWdq4p0q08R
         BXS0o62uBoRBI6wQjtesY/Dl0Tz7gyu15kwdeyAU=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <157295163982.7701.16573474496337850376.git-patchwork-housekeeping@kernel.org>
Date:   Tue, 05 Nov 2019 11:00:39 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v4] PCI: rcar: Fix missing MACCTLR register setting (take2) (2019-11-05T10:51:27)
  Superseding: [v3] PCI: rcar: Fix missing MACCTLR register setting (take2) (2019-11-05T02:48:11):
    [v3,1/2] Revert "PCI: rcar: Fix missing MACCTLR register setting in rcar_pcie_hw_init()"
    [v3,2/2] PCI: rcar: Fix missing MACCTLR register setting in initialize sequence


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
