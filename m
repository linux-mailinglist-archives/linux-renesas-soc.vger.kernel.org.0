Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 62D73187040
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2020 17:40:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732147AbgCPQkj (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 16 Mar 2020 12:40:39 -0400
Received: from mail.kernel.org ([198.145.29.99]:44924 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732065AbgCPQkj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 16 Mar 2020 12:40:39 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1584376839;
        bh=Akjozseg+0Fuy06l3UvBy/0mxB2izTW/lmyL1z8HEo4=;
        h=Subject:From:Date:To:From;
        b=2u4VadSAZuskGp98anYpcnLC30K+uuEKSd0nHQUZhjpHyww3j8SbEpPp8KooR5jof
         cjny+RH6r7YiPGYnfX+MWnT/osPvQy9DHxsz3tX3+TXOShmfQ7ubFzNMa4/SfzBOhT
         85Fy8uUJf3T9a9UixqJ9680jDkzo1r+ENFPjKSQ0=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <158437683905.19590.7630994804016867774.git-patchwork-housekeeping@kernel.org>
Date:   Mon, 16 Mar 2020 16:40:39 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v2] clk: renesas: cpg-mssr: add ignore-unused option (2020-03-16T16:34:37)
  Superseding: [v1] clk: renesas: cpg-mssr: add ignore-unused option (2020-02-26T20:28:06):
    [01/11] clk: renesas: cpg-mssr: add support for ignore-unused clocks
    [02/11] clk: renesas: r8a7796: mark RWDT clock as ignore-unused
    [03/11] clk: renesas: r8a7795: mark RWDT clock as ignore-unused
    [04/11] clk: renesas: r8a77970: mark RWDT clock as ignore-unused
    [05/11] clk: renesas: r8a77980: mark RWDT clock as ignore-unused
    [06/11] clk: renesas: r8a77995: mark RWDT clock as ignore-unused
    [07/11] clk: renesas: r8a774a1: mark RWDT clock as ignore-unused
    [08/11] clk: renesas: r8a774b1: mark RWDT clock as ignore-unused
    [09/11] clk: renesas: r8a774c0: mark RWDT clock as ignore-unused
    [10/11] clk: renesas: r8a77965: mark RWDT clock as ignore-unused
    [11/11] clk: renesas: r8a77990: mark RWDT clock as ignore-unused


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
