Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 239E72A0057
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 Oct 2020 09:50:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725808AbgJ3IuG (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 30 Oct 2020 04:50:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:54860 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725784AbgJ3IuG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 30 Oct 2020 04:50:06 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604047805;
        bh=rn7tGnwzbV+EMHhqDgHqcu/oC+Q8YmeO9dcUCq7RsfQ=;
        h=Subject:From:Date:To:From;
        b=1xcuAlZHp1v2JAoZ7PTj/he6mD71GuUvGqNKugx1zKwpR8EiQu9bGWtjxVeiLHno+
         b1kGHOoYgROs3qmFV5WE+7zhsNQAmDjEqPaA+7jxmbziWSYWusWNKuvutiPB0w7UaD
         WjsHmFiWd92kBwgSkMfeXOjMecQZXgcOSQpt13Tg=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <160404780542.28147.12854293592701692849.git-patchwork-summary@kernel.org>
Date:   Fri, 30 Oct 2020 08:50:05 +0000
To:     linux-renesas-soc@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (refs/heads/master):

Series: [1/2] arm64: dts: renesas: r8a77961: Add CAN{0,1} placeholder nodes
  Submitter: Eugeniu Rosca <erosca@de.adit-jv.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=373143
  Lore link: https://lore.kernel.org/r/20201029133741.25721-1-erosca@de.adit-jv.com
    Patches: [1/2] arm64: dts: renesas: r8a77961: Add CAN{0,1} placeholder nodes
             [2/2] arm64: dts: renesas: r8a77961: ulcb-kf: Initial device tree

Total patches: 2

--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


