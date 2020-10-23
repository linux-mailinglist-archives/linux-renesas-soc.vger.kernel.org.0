Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 88E6D296F89
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Oct 2020 14:40:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S373256AbgJWMkE (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 23 Oct 2020 08:40:04 -0400
Received: from mail.kernel.org ([198.145.29.99]:59874 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S373253AbgJWMkE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 23 Oct 2020 08:40:04 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603456804;
        bh=iXNLB9iFyL6RvJCNBYq6kCFhpEL59V/mPvTt0oyAXbo=;
        h=Subject:From:Date:To:From;
        b=CxrGoUbrFrGA6aGquxD8mNH++D0rEzM/ocNl3nzqb8JCvFqRUpTs0aHlSs99Exec4
         ttG7Gge9sIAaqxB8T39jnwFXwuW+k1YVfCSZchRk2lmKAZn9iKhqZxBO/HSwqc6X/a
         sOBnduiGdmFY+89n0MOnLugI92jQKX3deuN9Bp6o=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <160345680414.8792.17613619172458818313.git-patchwork-summary@kernel.org>
Date:   Fri, 23 Oct 2020 12:40:04 +0000
To:     linux-renesas-soc@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (refs/heads/master):

Series: [1/2] arm64: dts: renesas: hihope-rzg2-ex: Drop rxc-skew-ps from ethernet-phy node
  Submitter: Biju Das <biju.das.jz@bp.renesas.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=365075
  Lore link: https://lore.kernel.org/r/20201015132350.8360-1-biju.das.jz@bp.renesas.com
    Patches: [1/2] arm64: dts: renesas: hihope-rzg2-ex: Drop rxc-skew-ps from ethernet-phy node
             [2/2] arm64: dts: renesas: cat875: Remove rxc-skew-ps from ethernet-phy node
Patch: ARM: dts: r8a7742-iwg21d-q7-dbcm-ca: Enable VIN instances
  Submitter: Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=364625
  Lore link: https://lore.kernel.org/r/20201014145558.12854-1-prabhakar.mahadev-lad.rj@bp.renesas.com

Total patches: 3

--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


