Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 93D3A1F4A67
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Jun 2020 02:40:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726021AbgFJAkn (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 9 Jun 2020 20:40:43 -0400
Received: from mail.kernel.org ([198.145.29.99]:42328 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726017AbgFJAkl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 9 Jun 2020 20:40:41 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1591749641;
        bh=cKUy8gQUPJXmKq2DbzqBlUxbnYof2RfEk3o6/qbYW8I=;
        h=Subject:From:Date:To:From;
        b=pM+x2/HQFGCIc5niyKGbXLb7FpNtIrrXZtttxVTOJFRyKHFQbGxtWZfhbPStcKXac
         DIoe3eSns/CaQjHGRe3tkCGrefEPfAKkrHGPDcls0fAPH0JRuDyXCt1NTCoCe3QZu5
         DSBLucfB3/H536pWjOMc6JLhZyIQ0832dH/74P8A=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <159174964152.10377.15029453265286775841.git-patchwork-housekeeping@kernel.org>
Date:   Wed, 10 Jun 2020 00:40:41 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v2] thermal: rcar_gen3_thermal: Do not shadow thcode variable (2020-06-10T00:33:00)
  Superseding: [v1] thermal: rcar_gen3_thermal: Do not shadow thcode variable (2020-05-15T13:56:26):
    thermal: rcar_gen3_thermal: Do not shadow thcode variable


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
