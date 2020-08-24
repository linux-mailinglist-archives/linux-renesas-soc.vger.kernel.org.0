Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B26C24F13D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Aug 2020 04:40:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727056AbgHXCkl (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 23 Aug 2020 22:40:41 -0400
Received: from mail.kernel.org ([198.145.29.99]:42904 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726684AbgHXCkk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 23 Aug 2020 22:40:40 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598236839;
        bh=QJsWccZQOGJAj2KoKT2xN1OdCZc6whX3zQFV4++dknE=;
        h=Subject:From:Date:To:From;
        b=zGSXmrAQEdmUH6V5bruerGHUsQ13ViSWba0Ut1SKcTzl5ED3G1xOBrQ31beZmKC48
         8N0QlLlv8gAk3uKp/kTwkWN11A2FnWjK9LiVUy3LNHt2ZMTPW2CIAegbOyahlKhhTj
         a1jToxyghluBRpBs1gQWbyqiGGnehL16vU6SgMcE=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <159823683991.17426.1968828392881197274.git-patchwork-housekeeping@kernel.org>
Date:   Mon, 24 Aug 2020 02:40:39 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v3] soc: renesas: use menu for Renesas SoC (2020-08-24T02:20:53)
  Superseding: [v2] soc: renesas: use menu for Renesas SoC (2020-08-17T04:50:24):
    [v2,1/3] soc: renesas: use menu for Renesas SoC
    [v2,2/3] soc: renesas: align driver description title
    [v2,3/3] soc: renesas: sort driver description title

Latest series: [v3] pinctrl: sh-pfc: collect Renesas related CONFIGs in one place (2020-08-24T02:29:28)
  Superseding: [v2] pinctrl: sh-pfc: collect Renesas related CONFIGs in one place (2020-08-17T04:44:55):
    [v2,1/3] pinctrl: sh-pfc: collect Renesas related CONFIGs in one place
    [v2,2/3] pinctrl: sh-pfc: align driver description title
    [v2,3/3] pinctrl: sh-pfc: sort driver description title


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
