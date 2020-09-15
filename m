Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C88826AC57
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Sep 2020 20:43:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727685AbgIOSmw (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 15 Sep 2020 14:42:52 -0400
Received: from mail.kernel.org ([198.145.29.99]:53428 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727846AbgIOSku (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 15 Sep 2020 14:40:50 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600195247;
        bh=KVrWSIMEJ+Qy7TTJci/3cVyLZzhZGSABRPmCcy84PxA=;
        h=Subject:From:Date:To:From;
        b=g0V5e35fBAWDDYm8hFj6naYe1B3envZU3BORZrv8ecQ+QVMz3fnONkpkQZX7bmYoe
         dchZ9ppARA0FU+WUOkN1WGaiKUE2+/gEKy2SgrZNPVvT/mRGyXLa7ullOXkDPeHWjz
         CgNPLnCyktK6Y/MUeZ8NuxjzOcN0WBhEs64naTRY=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <160019524754.3549.16466675789321206821.git-patchwork-housekeeping@kernel.org>
Date:   Tue, 15 Sep 2020 18:40:47 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v4] dt-bindings: adv7604: Convert bindings to json-schema (2020-09-15T18:19:42)
  Superseding: [v3] dt-bindings: adv7604: Convert bindings to json-schema (2020-08-01T16:18:22):
    [v3,1/3] dt-bindings: adv7604: Fix documentation for hpd-gpios
    [v3,2/3] dt-bindings: adv7604: Convert bindings to json-schema
    [v3,3/3] MAINTAINERS: Add ADV7604 bindings documentation

Latest series: [v2] media: rcar-vin: Kconfig: Update Kconfig (2020-09-15T18:20:27)
  Superseding: [v1] media: rcar-vin: Kconfig: Update Kconfig (2020-09-11T10:14:22):
    [1/2] media: rcar-vin: Kconfig: Update help description for VIDEO_RCAR_CSI2 config
    [2/2] media: rcar-vin: Kconfig: Update help description for VIDEO_RCAR_VIN config


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
