Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C9DB7220895
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Jul 2020 11:22:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730390AbgGOJUq (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 15 Jul 2020 05:20:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:38160 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730611AbgGOJUq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 15 Jul 2020 05:20:46 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1594804845;
        bh=EUeksOcZoV7meryAkccbsL3Of8fCDbvx8IXBZNFrLA0=;
        h=Subject:From:Date:To:From;
        b=K7XKryjxWmVZBJMf/zpT/RcHPWz2/eY6RuVK7sBoG7+A6DBwL7QTt2R2U+6SRFiSO
         diMsXQSjg13ITOVTskaS7tsyP3/zj9BugrlVjKlor+rUQ3Vz8XrBAye8Xgy6v9h5tF
         BPmOT42PDvhyBKuvfAsyADRrYiDMXewhuT97fZtg=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <159480484591.31571.10464876877519867680.git-patchwork-housekeeping@kernel.org>
Date:   Wed, 15 Jul 2020 09:20:45 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v2] dt-bindings: adv7604: Convert bindings to json-schema (2020-07-15T09:14:52)
  Superseding: [v1] dt-bindings: adv7604: Convert bindings to json-schema (2020-07-13T11:18:41):
    [1/3] dt-bindings: adv7604: Fix documentation for hpd-gpios
    [2/3] dt-bindings: adv7604: Convert bindings to json-schema
    [3/3] MAINTAINERS: Add ADV7604 bindings documentation


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
