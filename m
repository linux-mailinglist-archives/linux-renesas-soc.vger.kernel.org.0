Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 17131240C8E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Aug 2020 20:00:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728053AbgHJSAt (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 10 Aug 2020 14:00:49 -0400
Received: from mail.kernel.org ([198.145.29.99]:44634 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728036AbgHJSAl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 10 Aug 2020 14:00:41 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1597082440;
        bh=S64qu7JHItffbJ33/p9rhSbsN97RDZymzHNNSx8FwjM=;
        h=Subject:From:Date:To:From;
        b=tKY22HuBedJ43UcQWi+msRz9PY6KQ7xPhNkYytgIeOHq1CpvonK4ifBvEh5AdpcWd
         /BzLctU8qES2i5TSVWM+JwWw2kRClF2a11UOWGEHcLhXO8bHaBA+ngXIvFm1xBecVY
         oEIASo6trgR0nCzQX1CXZwkRqD4kTp8b4CRpoHhE=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <159708244088.10946.16591768395579474638.git-patchwork-housekeeping@kernel.org>
Date:   Mon, 10 Aug 2020 18:00:40 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v3] ARM: dts: iwg20d-q7-common: Fix touch controller probe failure (2020-08-10T17:49:44)
  Superseding: [v1] ARM: dts: iwg20d-q7-common: Fix touch controller probe failure (2020-08-07T15:20:38):
    ARM: dts: iwg20d-q7-common: Fix touch controller probe failure


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
