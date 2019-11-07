Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 78644F26D5
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 Nov 2019 06:20:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726372AbfKGFUi (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 7 Nov 2019 00:20:38 -0500
Received: from mail.kernel.org ([198.145.29.99]:55096 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726005AbfKGFUh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 7 Nov 2019 00:20:37 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1573104037;
        bh=hCdQYKSKvHpNSd12QgRVit79tY1lf/b18Zlaq67aJH4=;
        h=Subject:From:Date:To:From;
        b=xmKBBjzJ/do5orq78F3Lydbu9uy6UsEBE/Be1DAbBShSgkrVHlTjGN8FEbXAX5U3Y
         sJ2gDSFwnn9gS4mt5WCy0jS4HNKXNSh5JHorM7iBFnvdaoX2DvEAl2IfIysj+m1bZb
         rdp8eUyZwQF6CPyvWxJMvIlbSqQyS/2ifHH3aI/k=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <157310403730.18694.729706528728248071.git-patchwork-housekeeping@kernel.org>
Date:   Thu, 07 Nov 2019 05:20:37 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v3] dt-bindings: usb: renesas_usbhs: convert bindings to json-schema (2019-11-07T05:02:24)
  Superseding: [v2] dt-bindings: usb: renesas_usbhs: convert bindings to json-schema (2019-11-06T10:34:43):
    [v2] dt-bindings: usb: renesas_usbhs: convert bindings to json-schema


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
