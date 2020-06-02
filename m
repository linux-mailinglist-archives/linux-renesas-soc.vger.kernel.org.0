Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C357C1EC34F
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Jun 2020 22:00:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727011AbgFBUAl (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 2 Jun 2020 16:00:41 -0400
Received: from mail.kernel.org ([198.145.29.99]:49630 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726139AbgFBUAl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 2 Jun 2020 16:00:41 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1591128041;
        bh=GxA/iZE+NFdzjpjQkLNvQ5OyEPsKHqFGrQXC605wiuA=;
        h=Subject:From:Date:To:From;
        b=nMPhzK9map4mHTorEpLSeI4pDH46adUaTNycF3jXA/e5r8j2KAllvpl4dlz5WfMA8
         dDs4VCsr2QkHAI8hCBvzrog7GfmYmQ4E6jV8LF2ykX5RygA1vNvEbESOUvXxmMCEOR
         0FUSwfnvoHoJqQ6pWdjd9CJo4Z2fQ+Qqb/dgGr/g=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <159112804101.15425.7529220128788208638.git-patchwork-housekeeping@kernel.org>
Date:   Tue, 02 Jun 2020 20:00:41 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v2] media: vsp1: dl: Fix NULL pointer dereference on unbind (2020-06-02T19:50:16)
  Superseding: [v1] media: vsp1: dl: Fix NULL pointer dereference on unbind (2020-05-23T08:13:34):
    media: vsp1: dl: Fix NULL pointer dereference on unbind


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
