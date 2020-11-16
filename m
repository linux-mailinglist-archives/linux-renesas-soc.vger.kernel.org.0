Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6612C2B41D7
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Nov 2020 12:01:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728695AbgKPLA1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 16 Nov 2020 06:00:27 -0500
Received: from mail.kernel.org ([198.145.29.99]:49704 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728603AbgKPLA1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 16 Nov 2020 06:00:27 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1605524426;
        bh=DZi7kgyxkI2WBrKCz7dqB1DYsL71dVCRIpwu/cmUWu8=;
        h=Subject:From:Date:To:From;
        b=Ih+GJ7z3cG6Kf4FdE49h2KvfEGu71FmNuO9kU3pVG5shjKXryCdnyV81K59N1WFnA
         cQ092KL5W295YVU1Dts3YCXGvIOYk20TvvD2YuoRibNcvuwJmzkNCHhrhoNtD4jXIW
         KQX3gyDzJMKoEJMB1C7WKbKz3GVwDV5IFugNeTrc=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <160552442641.18636.17495830760421704727.git-patchwork-summary@kernel.org>
Date:   Mon, 16 Nov 2020 11:00:26 +0000
To:     linux-renesas-soc@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (refs/heads/master):

Patch: usb: cdc-acm: Add DISABLE_ECHO for Renesas USB Download mode
  Submitter: Chris Brandt <chris.brandt@renesas.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=382065
  Lore link: https://lore.kernel.org/r/20201111131209.3977903-1-chris.brandt@renesas.com

Total patches: 1

--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


