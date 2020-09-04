Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9964025D422
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Sep 2020 11:00:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729603AbgIDJA2 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 4 Sep 2020 05:00:28 -0400
Received: from mail.kernel.org ([198.145.29.99]:32942 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728588AbgIDJA1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 4 Sep 2020 05:00:27 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599210027;
        bh=xH3qZB0+ZUE15QRoqW+sbDnbnEArT9IsPAaQsRvOl7s=;
        h=Subject:From:Date:To:From;
        b=jGEXBy+kLQbDnLYa6tRQ/JPsEOo6axJ4rbIKP1eJ3hAh6eoJJsbiNOwJTDg7rFQkM
         4j5K4WAWEwRoVov0ONRZlAr2yCpaDtxq1wEsTmV61mqFWkDyLatKVfj+glUooE8HsR
         TGSPbJx1GZwd9MCwxAb3eF6F7Ehd4OWbbjDGfsgw=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <159921002720.2144.14126309256213616783.git-patchwork-summary@kernel.org>
Date:   Fri, 04 Sep 2020 09:00:27 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
geert/renesas-devel (refs/heads/next):

Patch: arm64: dts: renesas: Add HiHope RZ/G2H board with idk-1110wr display
  Submitter: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=339755
  Link: <20200827181918.30130-1-prabhakar.mahadev-lad.rj@bp.renesas.com>

Total patches: 1

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
