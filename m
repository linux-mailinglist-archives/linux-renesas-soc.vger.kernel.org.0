Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CA36013C22A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Jan 2020 14:01:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726483AbgAONAe (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 15 Jan 2020 08:00:34 -0500
Received: from mail.kernel.org ([198.145.29.99]:46724 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726187AbgAONAe (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 15 Jan 2020 08:00:34 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1579093234;
        bh=lRDPp64a4j3EnlsVYD7sb/P+F6GYTcmT6TE8oECuW3Y=;
        h=Subject:From:Date:To:From;
        b=jVIG9w0V4RDUaB3BZmIK4Ed/8YWZ4N6ZLCRfCJJMiKACjtmqPDSOiHoqTE9d2e2sW
         cM6vzt7KYmxSLTylriqAiBK5azwyrI84cyFR8fR4CIWwXX9cSODgAH/GDbHenAf8pz
         y0Ya3z2IL0WTagKcDvFRYToSYwBg0iwlChx1ZiWQ=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <157909323410.26351.7965266782807663549.git-patchwork-housekeeping@kernel.org>
Date:   Wed, 15 Jan 2020 13:00:34 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v2] drm: Add support for Okaya RH128128T (2020-01-15T12:45:46)
  Superseding: [v1] drm: Add support for Okaya RH128128T (2020-01-02T14:12:44):
    [1/3] dt-bindings: display: sitronix,st7735r: Add Okaya rh128128t
    [2/3] drm/mipi_dbi: Add support for display offsets
    [3/3] drm: tiny: st7735r: Add support for Okaya RH128128T


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
