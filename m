Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D5CC611EBF3
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Dec 2019 21:40:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725818AbfLMUkl (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 13 Dec 2019 15:40:41 -0500
Received: from mail.kernel.org ([198.145.29.99]:44028 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725799AbfLMUkl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 13 Dec 2019 15:40:41 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1576269640;
        bh=cLj2FQ+VUhgWA+T9dZlzNiCUPeJYUTGengOA01DbKfk=;
        h=Subject:From:Date:To:From;
        b=DTqkp1uKHwY+8sMRV0VSrH7rDsuPSM6APEQuZ2exG3VATP+XWCEQYox8CsXKhtGx3
         nuvKfFHOed6i4Xwmg6LMOPjXWOLsPWnLRXsNouDBhQFRpJJ7Tr3q1gGxlut4qydJBR
         /B6ncj6vliQ5zjyIh1Bsmu+qUVfaVV16yRfPnl3Q=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <157626964000.26243.3675694973901363796.git-patchwork-housekeeping@kernel.org>
Date:   Fri, 13 Dec 2019 20:40:40 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v2] drm: rcar-du: lvds: Get mode from state (2019-12-13T18:27:42)
  Superseding: [v1] drm: rcar-du: lvds: Get mode from state (2019-10-15T23:25:21):
    drm: rcar-du: lvds: Get mode from state


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
