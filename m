Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5BDA3265AFC
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Sep 2020 10:00:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725766AbgIKIAr (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 11 Sep 2020 04:00:47 -0400
Received: from mail.kernel.org ([198.145.29.99]:51788 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725554AbgIKIAq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 11 Sep 2020 04:00:46 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599811246;
        bh=TattB8bOIixblafq/YurmRTtyLQ8NKvXlsXnklz8sEI=;
        h=Subject:From:Date:To:From;
        b=iBRWpyx4NbaaDmrHacNaKLO1+6FlzjvuvgbUUJKYHSLmY5JgCa311I0M1CnZKsIiU
         PhtCoIymmdZaHkMxmEEJKbATX/ho44LdjjsS4+34MpS7bpMm3avF2XtAiLUaJeGODo
         +CIGCckrIxsWYq/nQmMHL8W9VODh5QA30NH/gF6o=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <159981124649.31887.6144724339169739607.git-patchwork-housekeeping@kernel.org>
Date:   Fri, 11 Sep 2020 08:00:46 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v3] treewide: add support for R-Car V3U (2020-09-11T07:43:48)
  Superseding: [v2] treewide: add support for R-Car V3U (2020-09-10T12:02:52):
    [v2,1/4] dt-bindings: arm: renesas: Document Renesas Falcon boards
    [v2,2/4] soc: renesas: r8a779a0-sysc: Add r8a779a0 support
    [v2,3/4] arm64: dts: renesas: Add Renesas R8A779A0 SoC support
    [v2,4/4] arm64: dts: renesas: Add Renesas Falcon boards support


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
