Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D3893123D03
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Dec 2019 03:20:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726487AbfLRCUh (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 17 Dec 2019 21:20:37 -0500
Received: from mail.kernel.org ([198.145.29.99]:48654 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725975AbfLRCUh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 17 Dec 2019 21:20:37 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1576635636;
        bh=dMoTs6se/zRMeONhl50dXi/tym8koXET4v9YFUo++6E=;
        h=Subject:From:Date:To:From;
        b=S/A8gTCJrwy6d0RgYWoWC31SqYNc+/U8LOj5+YQL0kZKIe6CTXag6/iRK/A1FJgLf
         M7xeRAOZI3faWhEUG3/TVoHYYsbUsrLay9nbvLwdGCNI9/siqpyvappBlbkMw/t4zp
         beWRQ5ljXSPqNeBz1PVyv38CXbUUqp0grDe5hiw0=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <157663563657.10392.3715739690910117681.git-patchwork-housekeeping@kernel.org>
Date:   Wed, 18 Dec 2019 02:20:36 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v3] SH: Convert ins[bwl]/outs[bwl] macros to inline functions (2019-12-18T02:08:35)
  Superseding: [v2] SH: Convert ins[bwl]/outs[bwl] macros to inline functions (2019-12-17T07:51:16):
    [v2] SH: Convert ins[bwl]/outs[bwl] macros to inline functions


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
