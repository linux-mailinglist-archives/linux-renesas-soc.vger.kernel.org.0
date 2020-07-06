Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A9DE2153E1
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 Jul 2020 10:20:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728024AbgGFIUi (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 6 Jul 2020 04:20:38 -0400
Received: from mail.kernel.org ([198.145.29.99]:39348 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728012AbgGFIUi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 6 Jul 2020 04:20:38 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1594023638;
        bh=GtEhzda4sVnjwROyb/261hSkeVFZ7MRi7+VL2tEmK9M=;
        h=Subject:From:Date:To:From;
        b=EXqv75f0KNk5UW6YlgxnpCwkvC/ZwhCENFd5Sug6O3UxDU/C++cDz3AeNr+Qk1gzY
         vwB+4pAfqxHMBU7yv8SIKRya/Qj80zl+7E96SpdncSkzifpTumOk5YMMbygLe3diUo
         7oo5lFpoO0xI3M44zwV1mQaoJ1l06Z64uFP+F5tw=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <159402363837.12097.5328297408879588997.git-patchwork-summary@kernel.org>
Date:   Mon, 06 Jul 2020 08:20:38 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
geert/renesas-devel (refs/heads/master):

Patch: [v4] thermal: rcar_gen3_thermal: Fix undefined temperature if negative
  Submitter: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=308333
  Link: <1593085099-2057-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>

Total patches: 1

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
