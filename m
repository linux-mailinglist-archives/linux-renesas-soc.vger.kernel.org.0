Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D865F24FFB3
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Aug 2020 16:20:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725904AbgHXOUj (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 24 Aug 2020 10:20:39 -0400
Received: from mail.kernel.org ([198.145.29.99]:60252 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725780AbgHXOUj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 24 Aug 2020 10:20:39 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598278839;
        bh=2x2Gw3dqMYBhZu6UxQ+ncIVDkO1AZ2yNk2kXfn+vSok=;
        h=Subject:From:Date:To:From;
        b=xTc/VoTiXiZf3aVxMfz1yzJXWSLFQQEqtrNnhpcceVQHl5lHk+9EbqTWxo9XbWqcl
         K6g3S/G9VvgQNg0gtWe2u+Zqyf4QnjXL2UxCAo4GyNxK0Xdqn13StMpWzkWCxp0v2b
         cfSxyjqsxYwhRbx6v3RSNDaI3+quoAINJhVfshvQ=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <159827883912.5513.9471868859113081667.git-patchwork-housekeeping@kernel.org>
Date:   Mon, 24 Aug 2020 14:20:39 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v3] Remodel HD3SS3220 device nodes (2020-08-24T14:10:48)
  Superseding: [v2] Remodel HD3SS3220 device nodes (2020-08-11T08:02:22):
    [v2,1/5] dt-bindings: usb: convert ti,hd3ss3220 bindings to json-schema
    [v2,2/5] dt-bindings: usb: renesas,usb3-peri: Document HS and SS data bus
    [v2,3/5] usb: typec: hd3ss3220: Use OF graph API to get the connector fwnode
    [v2,4/5] arm64: dts: renesas: cat874: Move connector node out of hd3ss3220 device
    [v2,5/5] arm64: dts: renesas: beacon-renesom-baseboard: Move connector node out of hd3ss3220 device


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
