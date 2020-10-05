Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 41BEB2831C4
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  5 Oct 2020 10:20:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725994AbgJEIUJ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 5 Oct 2020 04:20:09 -0400
Received: from mail.kernel.org ([198.145.29.99]:50592 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725946AbgJEIUJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 5 Oct 2020 04:20:09 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601886009;
        bh=t9Q9u+Lg+OAhKJQg0/VTKhe5DcE5MZD0P8ntzKMTmjs=;
        h=Subject:From:Date:To:From;
        b=Pt4p8+YOMUPIbDeve8OMkaDgmGJk09ostTGrPjbfaRHhU1a3ZnR3l2rn7o9WwhbEi
         EdCmeb+d0UFGtaejSNBQRI5LMAlVmv4eBprIkqu/52JohSGQjYWF4yhsxbsl0ODRuR
         S2BKUIl0whN/gpi0j+bIqqoZ53d56VJwotAZp0iI=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <160188600886.22804.9488300489735744498.git-patchwork-summary@kernel.org>
Date:   Mon, 05 Oct 2020 08:20:08 +0000
To:     linux-renesas-soc@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (refs/heads/master):

Patch: [RESEND,v3] arm64: dts: renesas: align GPIO hog names with dtschema
  Submitter: Krzysztof Kozlowski <krzk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=358939
  Lore link: https://lore.kernel.org/r/20201002163945.7885-1-krzk@kernel.org
Patch: [v3] ARM: dts: r8a7742-iwg21d-q7: Add LCD support
  Submitter: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=357189
  Lore link: https://lore.kernel.org/r/20200929140502.16017-1-prabhakar.mahadev-lad.rj@bp.renesas.com

Total patches: 2

--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


