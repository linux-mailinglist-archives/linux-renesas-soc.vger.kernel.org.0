Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 52D0A228EAF
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Jul 2020 05:40:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731857AbgGVDkl (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 21 Jul 2020 23:40:41 -0400
Received: from mail.kernel.org ([198.145.29.99]:58626 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731793AbgGVDkl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 21 Jul 2020 23:40:41 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595389241;
        bh=RHaf8W9vLHd4vZ2C1NagFKca3JSJHLsYv4BfSsbW25M=;
        h=Subject:From:Date:To:From;
        b=niTlzv5mmGmLKIvcVhF0m7BVSEWJlPLE92/9rTRN77ijmaCyt3bBLUenWneMt7eQh
         C0y1TgyEt9Ni/ln75jyw8gRDKEKv8abrrGt9K8w2IvlXJaRuuDnW96rjIp6TpHvlyu
         6AWOqPQOaNVl7+lZxHoXvkoF761VdLErwKVjgfgw=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <159538924108.17625.14138572433200334980.git-patchwork-housekeeping@kernel.org>
Date:   Wed, 22 Jul 2020 03:40:41 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v2] PCI: rcar-gen2: Use fallthrough pseudo-keyword (2020-07-22T03:28:51)
  Superseding: [v1] PCI: rcar-gen2: Use fallthrough pseudo-keyword (2020-07-16T21:15:17):
    [next] PCI: rcar-gen2: Use fallthrough pseudo-keyword


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
