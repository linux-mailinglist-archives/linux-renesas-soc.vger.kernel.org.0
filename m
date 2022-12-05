Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F2099642406
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  5 Dec 2022 09:04:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231630AbiLEIEW (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 5 Dec 2022 03:04:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231888AbiLEIEA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 5 Dec 2022 03:04:00 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B29E11C28
        for <linux-renesas-soc@vger.kernel.org>; Mon,  5 Dec 2022 00:03:57 -0800 (PST)
Received: from desky.lan (91-154-32-225.elisa-laajakaista.fi [91.154.32.225])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0210825B;
        Mon,  5 Dec 2022 09:03:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1670227435;
        bh=YNKLS2KG1O9DEbnp8uNuMDdY6RRY3/XiEvi6FIauMM4=;
        h=From:To:Cc:Subject:Date:From;
        b=QTL6KktK+Pskv+yey7YVTX/wcYUvk5pXCSr4YvzHPJrKg3RxMaM2fSDq+eVsdlMbJ
         SEmay75wDAjhLxGLUfvZ8fShAx//2++vG/bRuQjOPGCYINwbx6oNswzefYyhEEsYjc
         03pCZZsGxKyUG26Bl12O6bHQVFngp2FzEPMW1czY=
From:   Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
To:     linux-renesas-soc@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH kms++ v2 0/4] Support Y210, Y212, Y216  
Date:   Mon,  5 Dec 2022 10:03:35 +0200
Message-Id: <20221205080339.12801-1-tomi.valkeinen+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

Hi,

These kms++ patches add support for Y21x formats.

Changes in v2:

- Add Y212 and Y216 too
- Fix Y210 shifts (must be in the msbs)
- Format the pixelformats list a bit better
- Have dst as the first parameter in the write functions

 Tomi

Tomi Valkeinen (4):
  kms++: PixelFormats: Fix formatting
  kms++: PixelFormats: Add Y21x formats
  kms++util: Add endian.h
  kms++util: Add Y21x drawing support

 kms++/inc/kms++/pixelformats.h   |  4 ++
 kms++/src/pixelformats.cpp       | 92 +++++++++-----------------------
 kms++util/inc/kms++util/endian.h | 46 ++++++++++++++++
 kms++util/src/drawing.cpp        | 63 ++++++++++++++++++++++
 4 files changed, 139 insertions(+), 66 deletions(-)
 create mode 100644 kms++util/inc/kms++util/endian.h

-- 
2.34.1

