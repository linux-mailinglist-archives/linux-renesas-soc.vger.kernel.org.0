Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1B420FB47D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 Nov 2019 17:00:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728207AbfKMQAm (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 13 Nov 2019 11:00:42 -0500
Received: from mail.kernel.org ([198.145.29.99]:34228 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728199AbfKMQAm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 13 Nov 2019 11:00:42 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1573660842;
        bh=GNHrMMU+hKlaRO/PpSci28OZYWfwj81vmkF4z5B+HxM=;
        h=Subject:From:Date:To:From;
        b=N+BV43E2Z3nWJuCrQQkGn3ESsm4YDBPjS/AUucwuSkCX4JTH8qNjqauJWYmJ3C2nG
         PbpV09cI0ubxCygDAqYZWLcPI1hOLl0GLSgyTjKNXs2kDeb0OQecHrx9v3/uTl+1TW
         01yMA80hCnVA5AJMIRKLq/x31hxgAa3gq60pmzsg=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <157366084195.29873.1432540471942837719.git-patchwork-housekeeping@kernel.org>
Date:   Wed, 13 Nov 2019 16:00:41 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v4] Add LCD panel support to iwg20d (2019-11-13T15:51:19)
  Superseding: [v3] Add LCD panel support to iwg20d (2019-11-07T20:10:56):
    [v3,1/7] dt-bindings: display: bridge: Convert lvds-transmitter binding to json-schema
    [v3,2/7] drm/bridge: Repurpose lvds-encoder.c
    [v3,3/7] dt-bindings: display: bridge: Repurpose lvds-encoder
    [v3,4/7] drm: Define DRM_MODE_CONNECTOR_PARALLEL
    [v3,5/7] drm/panel: panel-simple: Add connector type for etm0700g0dh6
    [v3,6/7] ARM: dts: iwg20d-q7-common: Add LCD support
    [v3,7/7] ARM: shmobile_defconfig: Enable support for panels from EDT


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
