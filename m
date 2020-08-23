Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4698C24F008
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Aug 2020 00:12:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726779AbgHWWMi (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 23 Aug 2020 18:12:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726711AbgHWWMh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 23 Aug 2020 18:12:37 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D41BC061573
        for <linux-renesas-soc@vger.kernel.org>; Sun, 23 Aug 2020 15:12:35 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D71A1279;
        Mon, 24 Aug 2020 00:12:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1598220742;
        bh=zkSq5ExsiAVIRMBJx6Z8v4ib8BkBBffqmnt6iNsk6D8=;
        h=From:To:Cc:Subject:Date:From;
        b=jpWpflSgTpjp9aX1PwW42CtJwG28fhmhyeGBQr9RspHJPED/13DipaiFFmDWFQPtN
         UB8TBfzR+ceC+jgXKt2XrbXW/DT7L/r10E+3TqHlMNjWQht2fangccwDeEqjbEJEhr
         pMETmu7RHAbhAaGqkRqur5RTbcU/xd0k+hMLmGXQ=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [kmsxx] [PATCH 0/2] Support writeback connectors
Date:   Mon, 24 Aug 2020 01:11:50 +0300
Message-Id: <20200823221152.31978-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello,

This small patch series adds support for writeback connectors to kmsxx.
The implementation is fairly straightforward, with patch 1/2 enabling
the enumeration of writeback connectors (conditioned to support in
libdrm), and patch 2/2 adding a method to dump the contents of a
framebuffer to allow capturing frames from writeback connectors.

Laurent Pinchart (2):
  card: Add support for writeback connectors
  utils: Add a dump_framebuffer() method

 kms++/inc/kms++/card.h              |  2 ++
 kms++/src/card.cpp                  | 13 +++++++++++++
 kms++/src/connector.cpp             |  1 +
 kms++util/CMakeLists.txt            |  2 ++
 kms++util/inc/kms++util/kms++util.h |  2 ++
 kms++util/src/drawing.cpp           |  7 +++++++
 kms++util/src/resourcemanager.cpp   |  5 +++++
 py/pykms/pykmsbase.cpp              |  1 +
 py/pykms/pykmsutil.cpp              |  6 +++++-
 utils/kmsblank.cpp                  |  5 +++++
 utils/kmstest.cpp                   |  4 ++++
 11 files changed, 47 insertions(+), 1 deletion(-)

-- 
Regards,

Laurent Pinchart

