Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 710B15458BA
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Jun 2022 01:41:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237000AbiFIXlE (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 9 Jun 2022 19:41:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245457AbiFIXlB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 9 Jun 2022 19:41:01 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCAFA20EEB9
        for <linux-renesas-soc@vger.kernel.org>; Thu,  9 Jun 2022 16:40:59 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 350EF12F3;
        Fri, 10 Jun 2022 01:40:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1654818046;
        bh=Z2D0MQxcVadUml2rXulFn7D4ItzSgFPP/+yhOdIm/rE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=f5dDxWJEC0aMP7d9neSDiFyR9cC6bmHb/AXaZWbrgi4S2UBu1TM6NVZ5/mmilpLyA
         2CLU5L3hFhMR5UcQCkQc+8xoz0QIOCfMchAOMr0sLdhscYO4MJnD1dFhcP8ALqivnr
         s490vSnrflS8CNszWTpyVSyFvNbdsybdj6x7FPic=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [kms-test] [PATCH 10/10] tests: Rename kms-test-planeposition.py to kms-test-plane-position.py
Date:   Fri, 10 Jun 2022 02:40:31 +0300
Message-Id: <20220609234031.14803-11-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220609234031.14803-1-laurent.pinchart@ideasonboard.com>
References: <20220609234031.14803-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Match the name scheme of other tests by renaming
kms-test-planeposition.py to kms-test-plane-position.py.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 tests/{kms-test-planeposition.py => kms-test-plane-position.py} | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename tests/{kms-test-planeposition.py => kms-test-plane-position.py} (100%)

diff --git a/tests/kms-test-planeposition.py b/tests/kms-test-plane-position.py
similarity index 100%
rename from tests/kms-test-planeposition.py
rename to tests/kms-test-plane-position.py
-- 
Regards,

Laurent Pinchart

