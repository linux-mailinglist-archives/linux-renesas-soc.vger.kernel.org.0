Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C41771B5B9B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Apr 2020 14:40:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726867AbgDWMkh (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 23 Apr 2020 08:40:37 -0400
Received: from mail.kernel.org ([198.145.29.99]:34666 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726117AbgDWMkg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 23 Apr 2020 08:40:36 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1587645636;
        bh=ZfZGjdyMZMOG85os+QauXPi8YGVJrVSuZkfImOB0oIU=;
        h=Subject:From:Date:To:From;
        b=OCGcEoBOCWVdk6ylIFV4tSDHsDWheGNZpMvtFan7QN2PkzZmuO7U8AzW1opBzaw78
         RRqy6cMInUjBrJLZG4KZ08ABHx5NAPY1k7IyiwrNszcP2AHD1dWXGOAQvMVxzqqFvZ
         ZKK9fdDmDMg9zAYQAGq9HAJbUdOJZwQ3icGcfFm8=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <158764563671.31097.16821487410810775948.git-patchwork-housekeeping@kernel.org>
Date:   Thu, 23 Apr 2020 12:40:36 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v2] mmc: renesas_sdhi: avoid bad TAPs for Gen3 (2020-04-23T12:24:46)
  Superseding: [v1] mmc: renesas_sdhi: avoid bad TAPs for Gen3 (2020-04-22T12:59:13):
    [1/2] mmc: renesas_sdhi: handle M3-N ES1.2 and 1.3 revisions
    [2/2] mmc: renesas_sdhi: avoid bad TAP in HS400


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
