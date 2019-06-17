Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 133E047EF1
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Jun 2019 11:58:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727624AbfFQJ6l (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 17 Jun 2019 05:58:41 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:42758 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727518AbfFQJ6l (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Jun 2019 05:58:41 -0400
Received: by mail-pg1-f195.google.com with SMTP id l19so5513961pgh.9
        for <linux-renesas-soc@vger.kernel.org>; Mon, 17 Jun 2019 02:58:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:date:message-id:subject;
        bh=f14t+iNNSc4JtArihmkhPbQk5+ihAbR3yUSivmL55Qw=;
        b=NZ7vp27rwNdn0iaJGI+7YYbqc3fOPjlOTV0JGwElFjhUaKf6ptrhtwnfZgoRuCSPe8
         Fl6/gb/aO8SJ5LG5RdvVCuT7536Aje/2XoEXZObxtZcjNhmoPqBk8jK4YJzh1hnieuxx
         tXeqXVOVxWQaP6ebhIXFuM3hwekEFA3/VP2pDspAR9umM3bNxwD+xOSh+VN94OMrUWhK
         a6uUegke8CwcdaOpjHHaQ+OKwDc3DLUdSWRTEeEdSBJCEWFGQh+oiUjnUTYN/VX9gdLH
         VPL1EYdj+meaaEaS7p2JaMsfb3zOrB4eQcBn5sgbiM7o421MKXdyrxAnSS3BVdjtKVk+
         CpSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:date:message-id:subject;
        bh=f14t+iNNSc4JtArihmkhPbQk5+ihAbR3yUSivmL55Qw=;
        b=Wo34w6RH0i5knqAUEiqwGL33KTi1+uFyArpKEYGWiaZRsQUhkpGMuBzhRc0YVhVsUN
         oea2wnoct4wIiyt1R8yOwMa6NUkUf6Kt1LXuqTTIAuT8lG+rBnYYzDdPDghrJI7lMZqg
         YLZiwbr764f7Sgb//RLkipsTOCPoqxl5KlgNUpgwZMoB155viPSs4xFg9fH645D72ZVF
         OAaXjY9sLkUn8S81KA38et0nuCyFgebITGcAMta/Q89ytV6GRZIjJqcSb620kW4FLMlD
         Rxd2qj5RM2EHlLZ2cge7Btom5eNO0XOVTjzlRBxW9KOxeWxWscDRvpajUL36C9glZmg6
         w0Dg==
X-Gm-Message-State: APjAAAVHFWuPtbg9jBn0NZHg6XWfKFb9CftPXFkmRQVi+2rmEtizg/FB
        UlFDY0WQEtxsrUmuquh8zyd5SVoS
X-Google-Smtp-Source: APXvYqxHA+rDAiSmQhVsF6KW87EepfXCW/10Rb8BZJITyPlXfOz8KzSZUY1RL2gV9gdkoQpqnVwYMw==
X-Received: by 2002:aa7:8007:: with SMTP id j7mr48653391pfi.154.1560765520302;
        Mon, 17 Jun 2019 02:58:40 -0700 (PDT)
Received: from [127.0.0.1] (l193216.ppp.asahi-net.or.jp. [218.219.193.216])
        by smtp.gmail.com with ESMTPSA id p6sm18908282pgs.77.2019.06.17.02.58.38
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 17 Jun 2019 02:58:39 -0700 (PDT)
From:   Magnus Damm <magnus.damm@gmail.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Magnus Damm <magnus.damm@gmail.com>
Date:   Mon, 17 Jun 2019 19:00:06 +0900
Message-Id: <156076560641.6960.5508309411424406087.sendpatchset@octo>
Subject: [PATCH 0/3] clocksource/drivers/sh_cmt: Minor DT compat string update
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

clocksource/drivers/sh_cmt: Minor DT compat string update

[PATCH 1/3] clocksource/drivers/sh_cmt: SoC-specific match for CMT1 on r8a7740 and sh73a0
[PATCH 2/3] clocksource/drivers/sh_cmt: Remove "cmt-48-gen2" support
[PATCH 3/3] clocksource/drivers/sh_cmt: Document "cmt-48" as deprecated

Move over to new CMT1 bindings on r8a7740 and sh73a0 and get rid of old
stale stuff such as "cmt-48-gen2" while keeping "cmt-48" around but document
it as deprecated.

Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

Patch 1 and patch 3 depend on updated SoC-specific DT bindings in:
[PATCH 2/8] dt-bindings: timer: renesas, cmt: Update CMT1 on sh73a0 and r8a7740

 drivers/clocksource/sh_cmt.c |   19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)
