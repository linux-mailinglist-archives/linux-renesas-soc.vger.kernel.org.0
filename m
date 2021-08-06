Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C1DB63E2AC0
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Aug 2021 14:43:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241735AbhHFMnX (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 6 Aug 2021 08:43:23 -0400
Received: from mail.kernel.org ([198.145.29.99]:56102 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236860AbhHFMnW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 6 Aug 2021 08:43:22 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 74C4561176;
        Fri,  6 Aug 2021 12:43:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1628253787;
        bh=bNL016xssL9s5HaTioY077mWsQhoc/LW1BtqHoEY8ZU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ckkq/z7PjH8iMAF9eCLUtZurD/CsNQVBSEb2xPkQg576mYkDLOvpiQufFQtk4w84P
         E1R3WY1Mrtlt/0yoiB7RvHWruR9JlKyKEhi+MQDoHLHwPdp4SH2pfOVQwZHhkBlQ4v
         jFgQXthwtZshZ6EfU85/OkZAoKCfPW2a9SrqZxft0yhKmNQZr4Kemz1bk/NVuGIXZQ
         Oe3bNEV7yIZPx+C3TR/1vh23Tr1GDEoIlQi6sjjSN8tRsnmnt/f+Sj0FdArwo9xxVu
         cVQzjteX1Glp18DRbzyllkHonNp7Ou7/zC8LL0GflplqUl/+mJ27A/Bn3Mclmo80/W
         GVZZlvwgYElTw==
Date:   Fri, 6 Aug 2021 18:13:03 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        linux-renesas-soc@vger.kernel.org, linux-phy@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v5 3/6] phy: renesas: phy-rcar-gen3-usb2: Add USB2.0 PHY
 support for RZ/G2L
Message-ID: <YQ0uVyBGYbvG4WTi@matsya>
References: <20210727185527.19907-1-biju.das.jz@bp.renesas.com>
 <20210727185527.19907-4-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210727185527.19907-4-biju.das.jz@bp.renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 27-07-21, 19:55, Biju Das wrote:
> This patch adds USB2.0 PHY support for RZ/G2L SoC.
> 
> We need to use a different compatible string due to some differences
> with R-Car Gen3 USB2.0 PHY. It uses line ctrl register for OTG_ID
> pin changes and different OTG-BC interrupt bit for device recognition.

Applied, thanks

-- 
~Vinod
