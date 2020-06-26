Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 796FB20AF4F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 26 Jun 2020 12:00:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727017AbgFZKAf (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 26 Jun 2020 06:00:35 -0400
Received: from mail.kernel.org ([198.145.29.99]:39588 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725883AbgFZKAf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 26 Jun 2020 06:00:35 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1593165635;
        bh=G1dSBJ2MhTQTj0wU8Wg7ADNhvazdZWw3MMb428Hb+b0=;
        h=Subject:From:Date:To:From;
        b=D+MGPdR6jQSOvyKFaZgdM29DRKCHlrQVXdM1THrIjV7QIKYVgTEHA/JAm/BLwe8GU
         xaW2LaGhV34SNor+dRW5UVJe7WMEz0XW3TZAmgv968qlBVVCAQKxQq/Yplbbq7mOHN
         FaAkuijqur1mJTh0AjRdcYlPmoTSOm4w8xxjKhsc=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <159316563499.27998.3093973921853873921.git-patchwork-summary@kernel.org>
Date:   Fri, 26 Jun 2020 10:00:34 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
geert/renesas-devel (refs/heads/next):

Series: Add support for HiHope RZ/G2M[N] Rev.3.0/4.0
  Submitter: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=307887
  Link: <1593004330-5039-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
    Patches: [v2,01/11] arm64: dts: renesas: r8a774a1-hihope-rzg2m[-ex/-ex-idk-1110wr]: Rename HiHope RZ/G2M boards
             [v2,02/11] arm64: dts: renesas: r8a774b1-hihope-rzg2n[-ex]: Rename HiHope RZ/G2N boards
             [v2,03/11] arm64: dts: renesas: hihope-common: Separate out Rev.2.0 specific into hihope-common-rev2.dtsi file
             [v2,04/11] arm64: dts: renesas: Add HiHope RZ/G2M[N] Rev.3.0/4.0 specific into common file
             [v2,05/11] arm64: dts: renesas: Add HiHope RZ/G2M Rev.3.0/4.0 main board support
             [v2,06/11] arm64: dts: renesas: Add HiHope RZ/G2M Rev.3.0/4.0 sub board support
             [v2,07/11] arm64: dts: renesas: hihope-rzg2-ex: Separate out lvds specific nodes into common file
             [v2,08/11] arm64: dts: renesas: Add HiHope RZ/G2M Rev.3.0/4.0 board with idk-1110wr display
             [v2,09/11] arm64: dts: renesas: Add HiHope RZ/G2N Rev.3.0/4.0 main board support
             [v2,10/11] arm64: dts: renesas: Add HiHope RZ/G2N Rev.3.0/4.0 sub board support
             [v2,11/11] arm64: dts: renesas: Add HiHope RZ/G2N Rev2.0/3.0/4.0 board with idk-1110wr display

Patch: [PATCH/RFC] arm64: dts: renesas: r8a77961: add IPMMU nodes
  Submitter: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=301227
  Link: <1591874021-10209-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>

Total patches: 12

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
