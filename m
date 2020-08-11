Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 40E24241822
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Aug 2020 10:20:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728321AbgHKIUl (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 11 Aug 2020 04:20:41 -0400
Received: from mail.kernel.org ([198.145.29.99]:44148 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726397AbgHKIUk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 11 Aug 2020 04:20:40 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1597134040;
        bh=SltuEqRmE/kaP6dkQAlC68xaNsNO5LLCDv5ra5yP/lk=;
        h=Subject:From:Date:To:From;
        b=gKLFNsgwrZbzZNJZbmFao5oJWhlm30JO5HxTGbDIvrsQKCNJGCR1kdpwfX7aS1qcL
         DV/sZZvJiFwG4JGwZsFN3ltkTd6/ux/yf70QTQmg67tyU1ZyY38e81n+wqNUk3wUd2
         b6M7NKdqf9eXQl5U50GtytGAbQMHDm4bQqcHari0=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <159713404065.17261.813000654891948897.git-patchwork-housekeeping@kernel.org>
Date:   Tue, 11 Aug 2020 08:20:40 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v2] ata: sata_rcar: Fix DMA boundary mask (2020-08-11T08:17:12)
  Superseding: [v1] ata: sata_rcar: Fix DMA boundary mask (2020-05-13T11:04:26):
    ata: sata_rcar: Fix DMA boundary mask

Latest series: [v2] Remodel HD3SS3220 device nodes (2020-08-11T08:02:22)
  Superseding: [v1] Remodel HD3SS3220 device nodes (2020-08-04T17:48:23):
    [1/5] dt-bindings: usb: convert ti,hd3ss3220 bindings to json-schema
    [2/5] dt-bindings: usb: renesas,usb3-peri: Document HS and SS data bus
    [3/5] usb: typec: hd3ss3220: Use OF graph API to get the connector fwnode
    [4/5] arm64: dts: renesas: cat874: Move connector node out of hd3ss3220 device
    [5/5] arm64: dts: renesas: beacon-renesom-baseboard: Move connector node out of hd3ss3220 device


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
