Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0432317F43B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Mar 2020 11:00:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726205AbgCJKA0 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 10 Mar 2020 06:00:26 -0400
Received: from mail.kernel.org ([198.145.29.99]:52388 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726202AbgCJKA0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 10 Mar 2020 06:00:26 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1583834425;
        bh=kaZXxUJXVo0Gw3P6OZoWnuRljBcYLroWv+EFRAKobgE=;
        h=Subject:From:Date:References:To:From;
        b=PA8ScEjZ+fSau40Y6r4ex9vxoz2SOHd9H3YKCRdQtC6XenK6RbmHH8RkiH4vaXCHz
         bbrqweUQrDq4Pn59JhZfbpz8NhmgyUD7XEFFYeZS/wDgkIZ2TkMP1yMyYGTNa/DQMt
         Ol/vJH9/qgwljLpz5Fx6TxVHfCLijysNgzdWdDhQ=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <158383442571.19535.17055760781466061171.git-patchwork-summary@kernel.org>
Date:   Tue, 10 Mar 2020 10:00:25 +0000
References: <20200309170825.20882-1-geert+renesas@glider.be>
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
geert/renesas-devel (refs/heads/next):

Patch: arm64: dts: renesas: r8a77961: salvator-xs: Fix memory unit-address
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=253477

Total patches: 1

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
