Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7DCB418D52B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Mar 2020 18:00:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727092AbgCTRAm (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 20 Mar 2020 13:00:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:39656 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726809AbgCTRAm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 20 Mar 2020 13:00:42 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1584723642;
        bh=2kDKfqEgxy43W/tisHI3Tmxrbj7SvXfkmhIChbq4Er4=;
        h=Subject:From:Date:To:From;
        b=U6YfFzAdIdiCWpRSqlu1tyvE0yMeonbyacoQ/MxFfSTvbEEPH84urTjTP0HK+8caR
         qHkE0pJkxpgmVHvzi2RtQzFv0PwUdIJxVdVSBECkmBhoCldDEHEV26o+qIjkTeJPNS
         ZZLb2FIs1M8VrcSHoGfNlnd+Mc/xNoWEstq1jCgw=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <158472364223.7726.6856162845074243328.git-patchwork-housekeeping@kernel.org>
Date:   Fri, 20 Mar 2020 17:00:42 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v3] media: adv748x: add support for HDMI audio (2020-03-20T16:11:40)
  Superseding: [v2] media: adv748x: add support for HDMI audio (2020-03-19T17:41:48):
    [v2,01/10] media: adv748x: fix end-of-line terminators in diagnostic statements
    [v2,02/10] media: adv748x: include everything adv748x.h needs into the file
    [v2,03/10] media: adv748x: reduce amount of code for bitwise modifications of device registers
    [v2,04/10] media: adv748x: add definitions for audio output related registers
    [v2,05/10] media: adv748x: add support for HDMI audio
    [v2,06/10] media: adv748x: only activate DAI if it is described in device tree
    [v2,07/10] dt-bindings: adv748x: add information about serial audio interface (I2S/TDM)
    [v2,08/10] arm64: dts: renesas: salvator: add a connection from adv748x codec (HDMI input) to the R-Car SoC
    [v2,09/10] media: adv748x: add support for log_status ioctl
    [v2,10/10] media: adv748x: allow the HDMI sub-device to accept EDID


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
