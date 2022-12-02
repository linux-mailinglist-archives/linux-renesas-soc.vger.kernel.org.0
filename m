Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0D37B640793
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  2 Dec 2022 14:17:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233041AbiLBNR1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 2 Dec 2022 08:17:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232011AbiLBNR0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 2 Dec 2022 08:17:26 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61BF3D0391
        for <linux-renesas-soc@vger.kernel.org>; Fri,  2 Dec 2022 05:17:25 -0800 (PST)
Received: from desky.lan (91-154-32-225.elisa-laajakaista.fi [91.154.32.225])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 333336E0;
        Fri,  2 Dec 2022 14:17:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1669987043;
        bh=Vvp3GC1ku1oNURpxo5DAW0oDu9XgXlAGoZGz9tSDmRI=;
        h=From:To:Cc:Subject:Date:From;
        b=EAT+bA3gV4T8r1M3wVC8ZucYGAy9R9UtxwcuSgJhzjAbvVhNorzj0MVlt64VO1nDE
         W7P809vDKUhiOcVvmGtU5D9mVXH1260QCP64tkvU6MlNMrKSxsJL6KNeu/McSRFftr
         xRs5UL1MnX8Z92W45n/WZV6ahwlB5ek3D5DlgMwA=
From:   Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
To:     linux-renesas-soc@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH kms++ 0/4] Support Y210
Date:   Fri,  2 Dec 2022 15:16:54 +0200
Message-Id: <20221202131658.434114-1-tomi.valkeinen+renesas@ideasonboard.com>
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

These kms++ patches add support for Y210 format.

I didn't find a super clear description of the byte order for Y210
anywhere.  If someone knows what it is supposed to be, I'd appreciate
verifying the code =).

 Tomi

Tomi Valkeinen (4):
  kms++: PixelFormats: Fix formatting
  kms++: PixelFormats: Add Y210 format
  kms++util: Add endian.h
  kms++util: Add Y210 drawing support

 kms++/inc/kms++/pixelformats.h   |  2 +
 kms++/src/pixelformats.cpp       | 66 ++++++++------------------------
 kms++util/inc/kms++util/endian.h | 46 ++++++++++++++++++++++
 kms++util/src/drawing.cpp        | 31 +++++++++++++++
 4 files changed, 95 insertions(+), 50 deletions(-)
 create mode 100644 kms++util/inc/kms++util/endian.h

-- 
2.34.1

