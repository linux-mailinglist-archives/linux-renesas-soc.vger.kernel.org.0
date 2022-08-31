Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E58C35A7900
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 31 Aug 2022 10:27:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230189AbiHaI1N (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 31 Aug 2022 04:27:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229616AbiHaI1M (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 31 Aug 2022 04:27:12 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A9F79A9F6
        for <linux-renesas-soc@vger.kernel.org>; Wed, 31 Aug 2022 01:27:12 -0700 (PDT)
Received: from deskari.lan (91-158-154-79.elisa-laajakaista.fi [91.158.154.79])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C43F7481;
        Wed, 31 Aug 2022 10:27:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1661934429;
        bh=P4B4DCvFz9xvhJaQDYi4kcFnEh/OgWv3FNgOhXgnyl0=;
        h=From:To:Cc:Subject:Date:From;
        b=qRqG4cE6gh9YL1huTijpJaIzhgjsMah2YA4KRP8xd12ZRuOT48CeUkSGSnVaJaY5r
         AxiaBYpAd/solkEPZTIa5AExG/gqmAiCn57gxyqwuwLivSIAWoYo3wFF2J6egRM7Ob
         rn7tLDkC+82JKpnup3qCcu3crcWWZWO/MkXIOkDA=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     Douglas Anderson <dianders@chromium.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Robert Foss <robert.foss@linaro.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v6 0/3] drm/bridge: ti-sn65dsi86: Basic DP support
Date:   Wed, 31 Aug 2022 11:26:50 +0300
Message-Id: <20220831082653.20449-1-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi,

v5 of the series can be found from:

https://lore.kernel.org/all/20220824130034.196041-1-tomi.valkeinen@ideasonboard.com/

Changes to v5:
- Drop the broken "check AUX errors better" patch
- Fix sync pulse widths in "Reject modes with too large blanking"
- Drop the text about eDP, detect and get_edid from the desc of
  "Implement bridge connector operations"

 Tomi

Laurent Pinchart (2):
  drm/bridge: ti-sn65dsi86: Support DisplayPort (non-eDP) mode
  drm/bridge: ti-sn65dsi86: Implement bridge connector operations for DP

Tomi Valkeinen (1):
  drm/bridge: ti-sn65dsi86: Reject modes with too large blanking

 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 72 +++++++++++++++++++++++++--
 1 file changed, 69 insertions(+), 3 deletions(-)

-- 
2.34.1

