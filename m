Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F8761CDE01
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 May 2020 17:00:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729955AbgEKPAo (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 11 May 2020 11:00:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:45610 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729641AbgEKPAo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 11 May 2020 11:00:44 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589209243;
        bh=oCHA++BnyCIYWJEW1NJ981dFQDugHaRMNi1SmRlQMdU=;
        h=Subject:From:Date:To:From;
        b=hfVcLTYRKGF/i0t7RH8DtDOsZIGqtxs+FILGdm0VKqYaK1C4eNLz8kO3y+lnvYSq+
         0pH0faNh2M81CD1YV075yIbDB+NHSEYRYYwbo9bteF0MaTL+1uzzUY2ZjMktbpZbGO
         e0h4tAUdoIYyysi7WGsRsywrA5WZBeAdZ3KrzDdo=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <158920924377.2628.13921229594174129694.git-patchwork-housekeeping@kernel.org>
Date:   Mon, 11 May 2020 15:00:43 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v7] gpio: Add GPIO Aggregator (2020-05-11T14:52:54)
  Superseding: [v6] gpio: Add GPIO Aggregator (2020-03-24T13:53:28):
    [v6,1/8] ARM: integrator: impd1: Use GPIO_LOOKUP() helper macro
    [v6,2/8] i2c: i801: Use GPIO_LOOKUP() helper macro
    [v6,3/8] mfd: sm501: Use GPIO_LOOKUP_IDX() helper macro
    [v6,4/8] gpiolib: Add support for GPIO lookup by line name
    [v6,5/8] gpiolib: Introduce gpiod_set_config()
    [v6,6/8] gpio: Add GPIO Aggregator
    [v6,7/8] docs: gpio: Add GPIO Aggregator documentation
    [v6,8/8] MAINTAINERS: Add GPIO Aggregator section


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
