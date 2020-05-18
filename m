Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB92B1D73CB
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 May 2020 11:20:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726290AbgERJUo (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 18 May 2020 05:20:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:34144 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726285AbgERJUn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 18 May 2020 05:20:43 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589793643;
        bh=DiIV7Q8yxO5IbB8tKfcnSKRju7ey1Z9JQImfbif1sN4=;
        h=Subject:From:Date:To:From;
        b=asvQtS2ktP0pRLJtcsKuNkCipxL8+Iik2k3JxKTcrRXJhsu0iZiUwJPXuc7ew4td6
         gOiuQGnUhEW3oCeMMCB9MV6nVT992jXcbKHUNeRegONqynzTWT5H94jIJtgb8iCTWH
         dQ5sb/st+iG+lg2tI4PtReWWpmiKJw7BesZN5oFs=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <158979364372.30357.11636752188783434373.git-patchwork-housekeeping@kernel.org>
Date:   Mon, 18 May 2020 09:20:43 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v2] dt-bindings: clock: renesas: cpg: Convert to json-schema (2020-05-18T08:16:44)
  Superseding: [v1] dt-bindings: clock: renesas: cpg: Convert to json-schema (2020-05-08T10:02:31):
    dt-bindings: clock: renesas: cpg: Convert to json-schema


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
