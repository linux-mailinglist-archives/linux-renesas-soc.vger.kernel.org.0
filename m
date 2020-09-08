Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7CDE72607BF
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Sep 2020 02:40:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728056AbgIHAkq (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 7 Sep 2020 20:40:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:55466 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728021AbgIHAkp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 7 Sep 2020 20:40:45 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599525645;
        bh=LUy7WEJvvpdr3CfjEP00HibbWhCb4obaswA8rmjeMhk=;
        h=Subject:From:Date:To:From;
        b=X4oyrNs97/VNU49RlC5VgY2iTWHVNlJT1fIlg5fsFTEsMIhasSipKthEqn7DcKRcX
         mkOSlFj4yLuMpqbIHU4gmqU1Oihr/RQ/VZIIJF/cJD7AlD5uFJS+WPuvQwP9CpDdqw
         7R72/4QMl3W/YnosB95uWY2BY4avAofSEtHJOWOI=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <159952564551.20070.7907409197634651787.git-patchwork-housekeeping@kernel.org>
Date:   Tue, 08 Sep 2020 00:40:45 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v2] arm64: renesas: enable HDMI Display/Sound on R-Car M3-W+ Salvator-XS (2020-09-08T00:33:35)
  Superseding: [v1] arm64: renesas: enable HDMI Display/Sound on R-Car M3-W+ Salvator-XS (2020-09-07T02:58:05):
    [1/9] dt-bindings: display: renesas: du: Document the r8a77961 bindings
    [2/9] dt-bindings: display: renesas: dw-hdmi: Add R8A77961 support
    [3/9] drm: rcar-du: Add r8a77961 support
    [4/9] arm64: dts: renesas: r8a77961: Add FCP device nodes
    [5/9] arm64: dts: renesas: r8a77961: Add VSP device nodes
    [6/9] arm64: dts: renesas: r8a77961: Add DU device nodes
    [7/9] arm64: dts: renesas: r8a77961: Add HDMI device nodes
    [8/9] arm64: dts: renesas: r8a77961-salvator-xs: add HDMI Display support
    [9/9] arm64: dts: renesas: r8a77961-salvator-xs: add HDMI Sound support


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
