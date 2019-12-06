Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EC8391155A0
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Dec 2019 17:40:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726315AbfLFQkh (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 6 Dec 2019 11:40:37 -0500
Received: from mail.kernel.org ([198.145.29.99]:45398 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726261AbfLFQkh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 6 Dec 2019 11:40:37 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1575650436;
        bh=kuT9BMRSH/xAxfYO3xyBgLuG7JyMgz/IeYp1+4otHyg=;
        h=Subject:From:Date:To:From;
        b=lxY/EWfKgSsw9K67R/jzTesMp69sOGFNU9SMPIin3EMIBo06WIamJUGFdfdtLOdDU
         55KACrLocstJLtekrro2wHSI0UyalQTn4ZpboJkQjk+1U5kX5VpWNaXsHHR4PdYzpj
         x4JI1z1dezPZOhwxzazubgcy4cxUsVywofqL2SOI=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <157565043654.2987.4339006283982181745.git-patchwork-housekeeping@kernel.org>
Date:   Fri, 06 Dec 2019 16:40:36 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v4] Add dual-LVDS panel support to EK874 (2019-12-06T16:32:47)
  Superseding: [v3] Add dual-LVDS panel support to EK874 (2019-08-28T18:36:34):
    [v3,1/8] dt-bindings: display: Add bindings for LVDS bus-timings
    [v3,2/8] dt-bindings: display: Add idk-2121wr binding
    [v3,3/8] drm: Add bus timings helper
    [v3,4/8] drm: rcar-du: lvds: Add dual-LVDS panels support
    [v3,5/8] drm: bridge: thc63: Do not report input bus mode through bridge timings
    [v3,6/8] arm64: dts: renesas: Add EK874 board with idk-2121wr display support
    [v3,7/8,HACK] arm64: dts: renesas: draak: Enable LVDS
    [v3,8/8,HACK] arm64: dts: renesas: draak: Enable LVDS dual-link operation


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
