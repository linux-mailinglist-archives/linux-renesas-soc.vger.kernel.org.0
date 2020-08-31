Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 669F025759F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 31 Aug 2020 10:40:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726573AbgHaIkn (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 31 Aug 2020 04:40:43 -0400
Received: from mail.kernel.org ([198.145.29.99]:32990 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725978AbgHaIkn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 31 Aug 2020 04:40:43 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598863243;
        bh=8fmJZwILZt6Ge2QwwXXPpxYP20F7wHaES0jO8wYrrpA=;
        h=Subject:From:Date:To:From;
        b=NHN67tm59vSy91xQP86jJ0d7TodKovqKzuwEEX0opMiT0EIvWb6soxsinFhSbejO+
         ngqjTgVknUaXCKWK9OVDdfdXWLZ+pTMZwx5kqKwIHNQ9dTwxGsiMG2WE5YPKp4hy3g
         +BIfRSPBbLLACankNxF0MDbGQ3ld9omq403TYip4=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <159886324325.28923.14572580848744759467.git-patchwork-summary@kernel.org>
Date:   Mon, 31 Aug 2020 08:40:43 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
geert/renesas-devel (refs/heads/next):

Patch: arm64: dts: renesas: r8a77961.dtsi: Enable Sound / Audio-DMAC
  Submitter: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=339277
  Link: <87h7sovdvt.wl-kuninori.morimoto.gx@renesas.com>

Series: r8a774e1 add PWM support
  Submitter: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=338131
  Link: <20200825104455.18000-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
    Patches: [1/2] dt-bindings: pwm: renesas,pwm-rcar: Add r8a774e1 support
             [2/2] arm64: dts: renesas: r8a774e1: Add PWM device nodes

Total patches: 3

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
