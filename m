Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6E134178B0A
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Mar 2020 08:00:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728319AbgCDHAk (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 4 Mar 2020 02:00:40 -0500
Received: from mail.kernel.org ([198.145.29.99]:60106 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728244AbgCDHAk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 4 Mar 2020 02:00:40 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1583305240;
        bh=XOyVkmw+Y8NXUYMK42ANXVLccpNdYJbPkw0S6+ZLd+0=;
        h=Subject:From:Date:To:From;
        b=uuoRod9TAW6L7xLOj03w8v0PEeI9rJB9b4UcNyMcnUa9fWbrWaSTEuxjXSxYhnv+U
         4RaxeLshGNv72gVYArMcKQ7dLFCent+SBLlCdJjQ5uUl+zGd+DiDvnwSeLx7ZgYd8H
         OOE0mHyOuN7maf5HvcdLS4qV2bnkvDyKf+zFz8pQ=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <158330524003.10017.14575086238869209457.git-patchwork-housekeeping@kernel.org>
Date:   Wed, 04 Mar 2020 07:00:40 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v4] clk: renesas: rcar-usb2-clock-sel: Fix clks/resets handling (2020-03-04T06:42:13)
  Superseding: [v3] clk: renesas: rcar-usb2-clock-sel: Fix clks/resets handling (2019-11-01T07:03:07):
    [v3,1/4] dt-bindings: clock: renesas: rcar-usb2-clock-sel: Fix clock[-name]s properties
    [v3,2/4] dt-bindings: clock: renesas: rcar-usb2-clock-sel: Add power-domains and resets properties
    [v3,3/4] clk: renesas: rcar-usb2-clock-sel: Add multiple clocks management
    [v3,4/4] clk: renesas: rcar-usb2-clock-sel: Add reset_control


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
