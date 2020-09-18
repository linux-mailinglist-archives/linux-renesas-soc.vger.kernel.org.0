Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 45297270700
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Sep 2020 22:26:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726205AbgIRU0W (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 18 Sep 2020 16:26:22 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:41296 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726118AbgIRU0W (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 Sep 2020 16:26:22 -0400
Received: from localhost.localdomain (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 946D52D7;
        Fri, 18 Sep 2020 22:26:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1600460779;
        bh=rNLT8cbGemD3wGEPmborM2ejdIWHLejXdeN9JO1hoq4=;
        h=From:To:Cc:Subject:Date:From;
        b=HtSG+ovU0nweZ6QArwVoNoW2xQUAzZy4e6QwbKwcFDIwLfCHY+KLApxfHssMFkPIg
         CebRQrNvnRsThtj9lu9wkq1sD7hst3kGovfDk60OLhfcQiSunkjDbZz0h7dunvwUNN
         Gwn4vgzCLYUDnnKQXfIemoD7JBDyG2nBguJyKEFQ=
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH 0/3] VSP-Tests: unbind: 
Date:   Fri, 18 Sep 2020 21:26:13 +0100
Message-Id: <20200918202616.55977-1-kieran.bingham@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The VSP unbind test recently added causes an issue when the VSP utilised
by the DU is unbound and rebound.

That needs to be fixed, but will be handled separately - so we limit the
scope to allow running the remaining tests for now.

As the unbind test requires root to run, skip it if it's run by a normal
user, and while were here - remove an unused variable identified during
the creation of these patches.

Kieran Bingham (3):
  scripts: vsp-lib.sh: Remove unused variable
  tests: Skip unbind/bind tests when not root
  tests: unbind/bind: Only test non display VSPs

 scripts/vsp-lib.sh          |  2 --
 tests/vsp-unit-test-0026.sh | 17 +++++++++++++++--
 2 files changed, 15 insertions(+), 4 deletions(-)

-- 
2.25.1

