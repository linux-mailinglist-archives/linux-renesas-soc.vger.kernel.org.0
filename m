Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B64C20E416
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Jun 2020 00:04:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729379AbgF2VUv (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 29 Jun 2020 17:20:51 -0400
Received: from mail.kernel.org ([198.145.29.99]:40222 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729508AbgF2VUu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 29 Jun 2020 17:20:50 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1593465650;
        bh=3c7406qD/LhRQtK6JfxCno34UH7cDPTrkYKz1vxsnTs=;
        h=Subject:From:Date:To:From;
        b=qYcaQzAd1U5sh0AHgcdnNgrzEK8ka23xsyGxX6Idik3zHa87oF+oSX0nm/lYsnpn7
         GWZsaIQExgwwLCWVKTA/lCgxx1HfRRUm6fYSvinztVjaFPmcGwSxXLuq7z0C8LPVnT
         VCDQlDpclYUblXr8Rc8o0wGni0R8SL+Gggqv5lb4=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <159346564995.3919.1002751318796039467.git-patchwork-housekeeping@kernel.org>
Date:   Mon, 29 Jun 2020 21:20:49 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v6] acpi: thermal: Fix error handling in the register function (2020-06-29T11:16:08)
  Superseding: [v5] acpi: thermal: Fix error handling in the register function (2020-06-26T17:37:45):
    [v5,01/11] acpi: thermal: Fix error handling in the register function
    [v5,02/11] thermal: Store thermal mode in a dedicated enum
    [v5,03/11] thermal: Add current mode to thermal zone device
    [v5,04/11] thermal: Store device mode in struct thermal_zone_device
    [v5,05/11] thermal: remove get_mode() operation of drivers
    [v5,06/11] thermal: Add mode helpers
    [v5,07/11] thermal: Use mode helpers in drivers
    [v5,08/11] thermal: Explicitly enable non-changing thermal zone devices
    [v5,09/11] thermal: core: Stop polling DISABLED thermal devices
    [v5,10/11] thermal: Simplify or eliminate unnecessary set_mode() methods
    [v5,11/11] thermal: Rename set_mode() to change_mode()

Latest series: [v2] i2c: rcar: slave: only send STOP event when we have been addressed (2020-06-29T16:15:06)
  Superseding: [v1] i2c: rcar: slave: only send STOP event when we have been addressed (2020-06-29T15:38:07):
    i2c: rcar: slave: only send STOP event when we have been addressed


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
