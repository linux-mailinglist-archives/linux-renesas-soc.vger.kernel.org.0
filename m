Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 74507193DC6
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2020 12:20:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727697AbgCZLUm (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 26 Mar 2020 07:20:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:55086 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727560AbgCZLUl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 26 Mar 2020 07:20:41 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1585221641;
        bh=WPzuIFYcXqOxiU0BB4TQVmdanVf2K8/ORq4b/E6cEms=;
        h=Subject:From:Date:To:From;
        b=T3ReUzSV3PrrU9tBNk7JX69zxmBrBtdrTdT352sEDJM54NxGbu1mW0XHY3t/OU/Un
         Q2NqxFW4FgUxZNvlwSdaO0qezVb/dxdEjaFxfWWUL/8zF3gOVkF1ZdN/j8xIOS4xC0
         EpqvoqocskI4ZbMW0XAlYw3GJb4I4BcjURfq/cfs=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <158522164136.27533.13015651185594045985.git-patchwork-housekeeping@kernel.org>
Date:   Thu, 26 Mar 2020 11:20:41 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v4] media: adv748x: add support for HDMI audio (2020-03-26T10:34:54)
  Superseding: [v3] media: adv748x: add support for HDMI audio (2020-03-20T16:11:40):
    [v3,01/11] media: adv748x: fix end-of-line terminators in diagnostic statements
    [v3,02/11] media: adv748x: include everything adv748x.h needs into the file
    [v3,03/11] media: adv748x: reduce amount of code for bitwise modifications of device registers
    [v3,04/11] media: adv748x: add definitions for audio output related registers
    [v3,05/11] media: adv748x: add support for HDMI audio
    [v3,06/11] media: adv748x: prepare/enable mclk when the audio is used
    [v3,07/11] media: adv748x: only activate DAI if it is described in device tree
    [v3,08/11] dt-bindings: adv748x: add information about serial audio interface (I2S/TDM)
    [v3,09/11] arm64: dts: renesas: salvator: add a connection from adv748x codec (HDMI input) to the R-Car SoC
    [v3,10/11] media: adv748x: add support for log_status ioctl
    [v3,11/11] media: adv748x: allow the HDMI sub-device to accept EDID


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
