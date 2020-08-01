Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 52C68235353
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  1 Aug 2020 18:20:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726300AbgHAQUp (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 1 Aug 2020 12:20:45 -0400
Received: from mail.kernel.org ([198.145.29.99]:50786 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725841AbgHAQUo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 1 Aug 2020 12:20:44 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1596298844;
        bh=mxfKVcxX8HAzPhYALwczf9hGrt4jSuruNYZ4sRt5mN4=;
        h=Subject:From:Date:To:From;
        b=Di6e2dl2jJAKwV0y7GEgxaLjo8itQKF0WPPYBEQfgdT9wF3m6DW2iUtxbBoHoBzue
         tV1boXa6cuKZ3tTcqUA0tqcbuwIxzW6cFuWNREdKF9ucAfCuKP+hvhADWPYqB0+fCq
         DFuiopg0sJcrwvi3zPFAsb+Ix1LkQaR6zfF1BAZQ=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <159629884456.21240.17677119647973319730.git-patchwork-housekeeping@kernel.org>
Date:   Sat, 01 Aug 2020 16:20:44 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v3] dt-bindings: adv7604: Convert bindings to json-schema (2020-08-01T16:18:22)
  Superseding: [v2] dt-bindings: adv7604: Convert bindings to json-schema (2020-07-15T09:14:52):
    [v2,1/3] dt-bindings: adv7604: Fix documentation for hpd-gpios
    [v2,2/3] dt-bindings: adv7604: Convert bindings to json-schema
    [v2,3/3] MAINTAINERS: Add ADV7604 bindings documentation


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
