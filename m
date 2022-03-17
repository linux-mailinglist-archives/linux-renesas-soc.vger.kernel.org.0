Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3C0114DC74C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 17 Mar 2022 14:13:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233573AbiCQNO0 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 17 Mar 2022 09:14:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229841AbiCQNOX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 17 Mar 2022 09:14:23 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78CF3DA6CF
        for <linux-renesas-soc@vger.kernel.org>; Thu, 17 Mar 2022 06:13:05 -0700 (PDT)
Received: from Monstersaurus.ksquared.org.uk.beta.tailscale.net (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9DF32EE;
        Thu, 17 Mar 2022 14:13:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1647522782;
        bh=7ZonxhVkbDxjYzF5FzF6x21UH8D7bWtEKmXTk5qLEVg=;
        h=From:To:Cc:Subject:Date:From;
        b=WA533GR2Qm518vzLdN6xcntpO6911BzxIiFw5eSiT/R1xpo0DTjvuExi1Xqr8eJXw
         7FUtGJTLWywb50K8J3p4HKagMgM+oEEUr7dLXPCXJTaEtHqXoO5YwIyaB/sX/54Dva
         lIBoXSQDXQULQmtpU4JyxghRbF6s7tfL6X4r6EZ0=
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To:     Douglas Anderson <dianders@chromium.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: [PATCH v4 0/3] drm/bridge: ti-sn65dsi86: Support non-eDP DisplayPort connectors
Date:   Thu, 17 Mar 2022 13:12:47 +0000
Message-Id: <20220317131250.1481275-1-kieran.bingham+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.32.0
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

Implement support for non eDP connectors on the TI-SN65DSI86 bridge, and
provide IRQ based hotplug detect to identify when the connector is
present.

no-hpd is extended to be the default behaviour for non DisplayPort
connectors.

This series is based upon Sam Ravnborgs and Rob Clarks series [0] to
support DRM_BRIDGE_STATE_OPS and NO_CONNECTOR support on the SN65DSI86,
however some extra modifications have been made on the top of Sam's
series to fix compile breakage and the NO_CONNECTOR support.

A full branch with these changes is available at [1]

As in v3, I have not taken ownership of the patches at [0], so it would
be good to hear if Sam has any plans to revive or push this series.
These patches are not expected to be integrated without [0].

[0] https://lore.kernel.org/all/20220206154405.1243333-1-sam@ravnborg.org/
[1] git://git.kernel.org/pub/scm/linux/kernel/git/kbingham/rcar.git
    branch: kbingham/drm-misc/next/sn65dsi86/hpd

Kieran Bingham (1):
  drm/bridge: ti-sn65dsi86: Support hotplug detection

Laurent Pinchart (2):
  drm/bridge: ti-sn65dsi86: Support DisplayPort (non-eDP) mode
  drm/bridge: ti-sn65dsi86: Implement bridge connector operations

 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 191 ++++++++++++++++++++++++--
 1 file changed, 176 insertions(+), 15 deletions(-)

-- 
2.32.0

