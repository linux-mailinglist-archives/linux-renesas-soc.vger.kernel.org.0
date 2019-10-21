Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DD1A0DE180
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Oct 2019 02:39:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726663AbfJUAjZ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 20 Oct 2019 20:39:25 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:41539 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726200AbfJUAjZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 20 Oct 2019 20:39:25 -0400
Received: by mail-lj1-f194.google.com with SMTP id f5so11383063ljg.8
        for <linux-renesas-soc@vger.kernel.org>; Sun, 20 Oct 2019 17:39:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9FExjd8Mw+5S7YMEqY/A4+by9kWereoTqCBatm9VlSY=;
        b=bKfda/5lV6mWSWAiZpVxxNgMPBVwZY2DPWmhX6/nmnzg2UVxlImBP+/CfiJfb0DiYB
         w9AfDMSY2xb7TJKWzJ0+yMgQCi8J1xBfKrV90PGs/IEDPvEiqamNKpZqVWxgVnPWKGYm
         VN/CkYJn3XGCMykhmOivjJ0NuoUfJFVlSmhq7Xl76tAXV8UZroBJtxN4TpJwd1ySaSUC
         AaUBJg36OCzkyyf51aFEd1O4z9D+UjGo/4Y2R/zIT6yqBY2hyQ2lWAyh03UyWv4Mk6X2
         lSmCEqBEonc5NP58z1JO+HSpRadEiRVD11I6IW2n1nbWguPbe6WtLVRLwW/8m44zqXMN
         cG7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9FExjd8Mw+5S7YMEqY/A4+by9kWereoTqCBatm9VlSY=;
        b=q0bbjQS77han5hF29/6ARCSbO9mkJMUzn2qZs5CpWkweZA/ouvN7+C7HbxKE9M4HZH
         1rNqKm/6YwGz8wbnwwsWKhglY865tgqpEyC+kq1XetsGaEz99qfCUBQZCK+DQx+2CAiJ
         chFSS8p2+XlnsvyFfPftDv8Gl/oTNo3EaXm/gMRJWj7aMH2EAxm4L3vzvWo2blqekUFv
         OsOPMRZr32Zn/uml10kkE3W6m5EvleyeCv5NlouszcevP3qZiuB/gDrg4YmpwiVz7wDR
         08Lfm+AVNytJU3rtBypFp/sXeUYIYXuhjaBh1K54GQMT7+p44UviEKCF+HuJBe2fMEX/
         iMCA==
X-Gm-Message-State: APjAAAU/+6ZoFLoKuHWa9d70Ctzig8ltgoLRS5M1QrMtO2xY2GGnkmAB
        sWLOjt9tZFnk9Z79eu+FYAC180h4qp3GYmqOYUnEcQ==
X-Google-Smtp-Source: APXvYqzWOeDq45DqnffOCq2/ChHGoqMhScnvErLh5JbufOO4hYwyRCMdCCsjftBVaXnakQZF8XtaUFolXzMPZX14iKU=
X-Received: by 2002:a05:651c:1202:: with SMTP id i2mr6489156lja.218.1571618361501;
 Sun, 20 Oct 2019 17:39:21 -0700 (PDT)
MIME-Version: 1.0
References: <20191016200647.32050-1-robh@kernel.org> <20191016200647.32050-17-robh@kernel.org>
In-Reply-To: <20191016200647.32050-17-robh@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 21 Oct 2019 02:39:07 +0200
Message-ID: <CACRpkdYjY0JZCCfb9r9A2GKmO03hHXNCqGmy6qqBkLfOdZZdEQ@mail.gmail.com>
Subject: Re: [PATCH v2 16/25] PCI: versatile: Use pci_parse_request_of_pci_ranges()
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

> Convert ARM Versatile host bridge to use the common
> pci_parse_request_of_pci_ranges().
>
> There's no need to assign the resources to a temporary list first. Just
> use bridge->windows directly and remove all the temporary list handling.
>
> Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
> Cc: Bjorn Helgaas <bhelgaas@google.com>
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
> v2:
> - Fix 'mem' initial value to 1
> - Remove temporary resource list

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
