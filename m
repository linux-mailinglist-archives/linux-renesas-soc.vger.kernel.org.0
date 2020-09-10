Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CDDEE264C18
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Sep 2020 20:01:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726833AbgIJSAz (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 10 Sep 2020 14:00:55 -0400
Received: from mail.kernel.org ([198.145.29.99]:38802 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726424AbgIJSAr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 10 Sep 2020 14:00:47 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599760846;
        bh=8R28J1WFgXv2fCupLnQlWm43yJn88LXy34hQKQ8Bx2E=;
        h=Subject:From:Date:To:From;
        b=cl3ZPv2q+R0WjpBg79lYIXRc0nswZyEOeKtePmwEMtX0dG9w72MNr1SU5oey7JPRh
         gJf7QCGLBvxJxjveB3Q0gw6DGDT9wUH/1Okstden/qTYlFo9qxFA8sybgBfM5dgiVn
         4auE6uZZtTVG6ymnNcZD326uFSzBOPo3IefokpQQ=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <159976084675.22157.2703762991812912496.git-patchwork-housekeeping@kernel.org>
Date:   Thu, 10 Sep 2020 18:00:46 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v5] dt-bindings: media: imx274: Convert to json-schema (2020-09-10T16:20:09)
  Superseding: [v3] dt-bindings: media: imx274: Convert to json-schema (2020-08-24T10:58:50):
    [v3] dt-bindings: media: imx274: Convert to json-schema

Latest series: [v5] dt-bindings: media: ov772x: Convert to json-schema (2020-09-10T16:20:55)
  Superseding: [v4] dt-bindings: media: ov772x: Convert to json-schema (2020-09-03T13:10:29):
    [v4,1/3] dt-bindings: media: ov772x: Convert to json-schema
    [v4,2/3] dt-bindings: media: ov772x: Make bus-type mandatory
    [v4,3/3] dt-bindings: media: ov772x: Document endpoint props

Latest series: [v5] dt-bindings: media: mt9v111: Convert to json-schema (2020-09-10T16:19:49)
  Superseding: [v3] dt-bindings: media: mt9v111: Convert to json-schema (2020-08-24T10:59:19):
    [v3] dt-bindings: media: mt9v111: Convert to json-schema

Latest series: [v5] dt-bindings: media: imx214: Convert to json-schema (2020-09-10T16:20:30)
  Superseding: [v1] dt-bindings: media: imx214: Convert to json-schema (2020-08-18T12:17:55):
    dt-bindings: media: imx214: Convert to json-schema


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
