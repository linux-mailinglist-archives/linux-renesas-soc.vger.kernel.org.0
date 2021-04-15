Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C12963606D8
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 Apr 2021 12:12:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232287AbhDOKNI (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 15 Apr 2021 06:13:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232119AbhDOKNH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 15 Apr 2021 06:13:07 -0400
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27B8DC061574
        for <linux-renesas-soc@vger.kernel.org>; Thu, 15 Apr 2021 03:12:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
         s=20161220; h=Content-Transfer-Encoding:Content-Type:Message-ID:References:
        In-Reply-To:Subject:Cc:To:From:Date:MIME-Version:Sender:Reply-To:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=CbOTGVvPs0U6ccPcBAz3XTa5DR3oDV4c8Psx+m0JOCE=; b=Xz2u2WU+XkMOIzge50EntfZGiH
        WEskqO3kq7MPQBVc5Bz/iSGAydNJ/76D5oKIEs5rBq8RZZO4765DsJMtedxAUkaWaBz3K9MIAXk8Y
        TDfBgkyjy2MvnsW+DaMIJoeMk8F4NSu1hxMYGbt1UlyFcLBd3XtI6ki83co28rPNZsfSzV4t/AtuT
        ssS8dVWKRBVQTQkEmggIo0JutLgts6ZAI0ZtJ7NxnugajXEpEcd8F4BKTs9WDx/4jsWkW102uYzU1
        Rah7FW8SMxuzA0gPNgCye7uH4QzMRrFgHDC+7ms2o3vjZz2cxp6W31Zne5xHOgxUTek36avcI92Tp
        YNp82f3A==;
Received: from webng-gw.kapsi.fi ([91.232.154.200] helo=roundcube.kapsi.fi)
        by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <jyri.sarha@iki.fi>)
        id 1lWyz9-0000wI-45; Thu, 15 Apr 2021 13:12:31 +0300
MIME-Version: 1.0
Date:   Thu, 15 Apr 2021 13:12:28 +0300
From:   Jyri Sarha <jyri.sarha@iki.fi>
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc:     dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Neil Armstrong <narmstrong@baylibre.com>,
        Robert Foss <robert.foss@linaro.org>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Jingoo Han <jingoohan1@gmail.com>,
        Xinliang Liu <xinliang.liu@linaro.org>,
        Tian Tao <tiantao6@hisilicon.com>,
        Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
        Edmund Dea <edmund.j.dea@intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Tomi Valkeinen <tomba@kernel.org>,
        Sandy Huang <hjc@rock-chips.com>,
        =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
        Benjamin Gaignard <benjamin.gaignard@linaro.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH] drm/bridge: Centralize error message when bridge attach
 fails
In-Reply-To: <20210415014710.4033-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20210415014710.4033-1-laurent.pinchart+renesas@ideasonboard.com>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <04682a45a799554116db621627d28723@iki.fi>
X-Sender: jyri.sarha@iki.fi
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 91.232.154.200
X-SA-Exim-Mail-From: jyri.sarha@iki.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 2021-04-15 4:47, Laurent Pinchart wrote:
> Being informed of a failure to attach a bridge is useful, and many
> drivers prints an error message in that case. Move the message to
> drm_bridge_attach() to avoid code duplication.
> 
> Suggested-by: Stephen Boyd <swboyd@chromium.org>
> Signed-off-by: Laurent Pinchart 
> <laurent.pinchart+renesas@ideasonboard.com>

Reviewed-by: Jyri Sarha <jyri.sarha@iki.fi>
