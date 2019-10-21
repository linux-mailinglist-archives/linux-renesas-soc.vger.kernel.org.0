Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 16871DE18B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Oct 2019 02:41:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726665AbfJUAli (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 20 Oct 2019 20:41:38 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:41740 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726610AbfJUAli (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 20 Oct 2019 20:41:38 -0400
Received: by mail-lf1-f68.google.com with SMTP id x4so2288993lfn.8
        for <linux-renesas-soc@vger.kernel.org>; Sun, 20 Oct 2019 17:41:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=G+bmNIcrnyOIzrPmxwvjVgZiBAJd1fM+3wbATTNFbEI=;
        b=mLAX2bW2iX5ydQdQba6GHiEYCGuP3ryiI3ZGiaySwfC3y8Qhd9wrPmUBZI5OiTWvwT
         wPQOA7PyZyWL2zcmKOeQYLc5fwcB20NjJgUletSLLOah1HsnJ29+iSbQWuDyeB8SQWTn
         Ld9wXWuG66dbY+YAzanSVTWfpZmcgDAXgJNhEPK2VzpwUHVRm1zO39/xCUi38A7323Oi
         8WDhYNPbYDeIKFkc63K7uVj7xqE2WZfnxrd0duu6RROq5ixmu/g8+fs0dtIJUe/Ifdu9
         SuQWLo/Gfs8DPn2mc6jejc3Iw/NOwYGQNv5V97tLh1nivdcvh1Iyg/RHcLvVBnaKRX2g
         xGMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=G+bmNIcrnyOIzrPmxwvjVgZiBAJd1fM+3wbATTNFbEI=;
        b=WN9SymIUK71YHnVrdYRUoitqvuVvVW5+MGVdOL/lKb7Nrs3PlEblYcju388hOyb7/1
         lo+HlC/QcQTY4rFTIyQg2sc012ciqeZtZPlasl8H0lGjPzeq7iZcyQ23VlF1HtYogAcO
         4f+P+9M7nbyG9puYRFyY1gNNJxG38mEdFG0uq+6NhbEvB3MlPlpAVZiv5qTxrHJgux9S
         wusdAZiNkgKGUziq21VdnB1JPhumXJ8CuOjOQbpjwf7woacAP125kObaQAr1WaQ3EwKC
         p08eVl0CKkdNOZyKtsPNuDgNCFSs4ryvolqnGEiNHsSQlZSaCQg9z0f4fyini6cVOBbu
         K40A==
X-Gm-Message-State: APjAAAXonBG5/r0U7igIJBuqmBXvr9DqQZpypH9ZNNnClg4GiLLEZTY6
        feMH4Wh6LgSKfzxOPlJTqF574ILXiXdk7a18JrEtYA==
X-Google-Smtp-Source: APXvYqwIyNjawN1mEod1YyKYfTSA83orVXCv2STO/nJGv1866U3Q0y95F+b9JrmTVy90oQrZGDMZUrGbFb9ILn0rOUI=
X-Received: by 2002:a19:f018:: with SMTP id p24mr2105108lfc.93.1571618496433;
 Sun, 20 Oct 2019 17:41:36 -0700 (PDT)
MIME-Version: 1.0
References: <20191016200647.32050-1-robh@kernel.org> <20191016200647.32050-19-robh@kernel.org>
In-Reply-To: <20191016200647.32050-19-robh@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 21 Oct 2019 02:41:24 +0200
Message-ID: <CACRpkdYq86_h7yPr3+UJryNWHLqrzrR0SbhWRALcEVCR-pE9+Q@mail.gmail.com>
Subject: Re: [PATCH v2 18/25] PCI: versatile: Enable COMPILE_TEST
To:     Rob Herring <robh@kernel.org>
Cc:     Andrew Murray <andrew.murray@arm.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        linux-pci <linux-pci@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
        Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Hou Zhiqiang <Zhiqiang.Hou@nxp.com>,
        Jingoo Han <jingoohan1@gmail.com>,
        Karthikeyan Mitran <m.karthikeyan@mobiveil.co.in>,
        Ley Foon Tan <lftan@altera.com>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Michal Simek <michal.simek@xilinx.com>,
        Ray Jui <rjui@broadcom.com>, rfi@lists.rocketboards.org,
        Ryder Lee <ryder.lee@mediatek.com>,
        Scott Branden <sbranden@broadcom.com>,
        Shawn Lin <shawn.lin@rock-chips.com>,
        Simon Horman <horms@verge.net.au>,
        Srinath Mannam <srinath.mannam@broadcom.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Toan Le <toan@os.amperecomputing.com>,
        Tom Joseph <tjoseph@cadence.com>, Will Deacon <will@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Oct 16, 2019 at 10:07 PM Rob Herring <robh@kernel.org> wrote:

> Since commit a574795bc383 ("PCI: generic,versatile: Remove unused
> pci_sys_data structures") the build dependency on ARM is gone, so let's
> enable COMPILE_TEST for versatile.
>
> Reviewed-by: Andrew Murray <andrew.murray@arm.com>
> Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
> Cc: Bjorn Helgaas <bhelgaas@google.com>
> Signed-off-by: Rob Herring <robh@kernel.org>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
