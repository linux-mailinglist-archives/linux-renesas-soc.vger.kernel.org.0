Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A601812818B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Dec 2019 18:40:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727390AbfLTRkY (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 20 Dec 2019 12:40:24 -0500
Received: from mail.kernel.org ([198.145.29.99]:56288 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727388AbfLTRkY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 20 Dec 2019 12:40:24 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1576863624;
        bh=VzCJ147MdWTl9UCaPgzCDHYYj8AyzBSkDDwpiyeGI/k=;
        h=Subject:From:Date:References:To:From;
        b=aIARkYz4fqUCbzsvkmFPrjAXJNXsw0AklnhiKJB0VN5cF1i9HHcqwXwMTd1IPMVd5
         m43Qz1w4ZkJTJAAWqqgbAdOO9CRcHHGs/CDlpJ1Xk0XS58d8mb7QLD8rZ0StsepGpa
         KUp8PR4CIX47rhly1Y1+hCx3jOcZoy1Wsm6shPpI=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <157686362438.31261.10149489912711710905.git-patchwork-summary@kernel.org>
Date:   Fri, 20 Dec 2019 17:40:24 +0000
References: <87mubt3tux.wl-kuninori.morimoto.gx@renesas.com>
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
geert/renesas-devel (refs/heads/next):

Patch: arm64: renesas: r8a77990-ebisu: remove clkout-lr-synchronous from rcar_sound
  Submitter: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=217187

Total patches: 1

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
