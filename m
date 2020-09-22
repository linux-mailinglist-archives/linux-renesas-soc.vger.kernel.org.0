Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B13B2741F7
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 22 Sep 2020 14:20:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726518AbgIVMUp (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 22 Sep 2020 08:20:45 -0400
Received: from mail.kernel.org ([198.145.29.99]:35566 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726505AbgIVMUp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 22 Sep 2020 08:20:45 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600777245;
        bh=uhTzUtwYKheN7g3nZkCT1TiruOoYLkXxh7KAZgRpl+0=;
        h=Subject:From:Date:To:From;
        b=OEysz9fDA7HW803J64HYgeb1TNgFLOIRQjIub0AjrdTYpDWymkUkhM2rxDEH61RSg
         Hi5TcxoMabGQ1UmDCFqeXemBwPYVQKaBbsGQvFItSGt9t79K2gTSwAdYbOVr5Z81zy
         vKTiSyr3GDlR4HLhW/JT91x5rp/Lg9KKNzQrv4uA=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <160077724520.6396.2455809890030711189.git-patchwork-housekeeping@kernel.org>
Date:   Tue, 22 Sep 2020 12:20:45 +0000
To:     linux-renesas-soc@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v1] clk: renesas: rcar-gen3: remove stp_ck handling for SDHI (2020-09-22T12:00:36)
  Superseding: [v1] clk: renesas: rcar-gen3: remove stp_ck handling for SDHI (2020-09-14T09:04:26):
    [RFC] clk: renesas: rcar-gen3: remove stp_ck handling for SDHI


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
