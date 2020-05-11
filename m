Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7FB5A1CD5C6
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 May 2020 12:00:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726287AbgEKKAl (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 11 May 2020 06:00:41 -0400
Received: from mail.kernel.org ([198.145.29.99]:42284 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725983AbgEKKAl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 11 May 2020 06:00:41 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589191240;
        bh=4hpo5B+qDGwdSIgEqMWUoymDPhtrN8YHzZgYfHYscZE=;
        h=Subject:From:Date:To:From;
        b=m69esYDLthbQScYqYAHU/+9jKt5s8iliyqn07JqsLBbsxs+5X7lmLIm3UHc6cEhvw
         lbKbRCMi8TqglPVMi6veDmT42NVvBTDGA/1Kcea0gnIv6Lw0n5RhlmH09FjQfHqgrb
         9uCpKqTEw3QmDl2lE844FJpnyFxk1dclXlNv2F54=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <158919124090.15456.5209192997973420714.git-patchwork-housekeeping@kernel.org>
Date:   Mon, 11 May 2020 10:00:40 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v1] ASoC: rsnd: add interrupt support for SSI BUSIF buffer (2020-05-11T09:45:20)
  Superseding: [v1] ASoC: rsnd: add interrupt support for SSI BUSIF buffer (2020-05-08T07:47:53):
    ASoC: rsnd: add interrupt support for SSI BUSIF buffer


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
