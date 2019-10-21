Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3607EDE190
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Oct 2019 02:42:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726576AbfJUAmN (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 20 Oct 2019 20:42:13 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:40572 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726597AbfJUAmN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 20 Oct 2019 20:42:13 -0400
Received: by mail-lj1-f195.google.com with SMTP id 7so11391679ljw.7
        for <linux-renesas-soc@vger.kernel.org>; Sun, 20 Oct 2019 17:42:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=U5RAFiewUpPwyWuNdO/9XHW8T8gkSCyTvJItx6zJP94=;
        b=KmVc3jxGab4evVVavdh8XOYseBclVoWhBn3e9VOmXOZdYnYPMcL5SpohY4awkYK3DQ
         ETOCTAvUrzeAA3ul7m/7zfE0PHm6zwSF3ye2VoN++TBijRbvYwEkQCP05TO+pB9YqrFR
         +q7MfhaCHG4BsAstUzZZHQ8PulcP3ubwfYlrvNuM/ElkY8bA2eObOyRtPuiA3p/mY54V
         VP2vhufU23hOrjdFpos+8jdfhEXZfXeYSaLsJ+vvLJAv4qBMDOfDfq/V/XtjjgF0Ai55
         +EMVQR7fFKfIUu14QUj/HT8f24/VPzQjTJwZmF+Vdyf/LYZVLXDM9MQCxVYrUDTqA1fw
         E3Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=U5RAFiewUpPwyWuNdO/9XHW8T8gkSCyTvJItx6zJP94=;
        b=U3LWM6IiZU1wNPBlgwt3fkmfS0G3TZTfHP2dIfxsg+49iMT01wxJ+X5jp6kAQkZ05P
         /XIzjXRp9mZAWlaKs0ejhsOW+0lPmuKBReoEzo/BjSjUrQ+AH2Nm+LVZG0tsEpL4Fpqr
         NefnDKasLZlibXbEBp7tVE/z1p+2xYqnO34qtL76OuEl73M1/G+WkAIoy9ndXY72SSNn
         y6QSkm83iSjCE0Gvd1hvg0jrmjsBNQMXWwHlEdZHcLAV5m9NEP1anSRzwXyifbldG7if
         xkpuESDh3/8KIcST3kTlOJ8GIGCNuWkvGS1yPPwKQcXPs13ap1yFMk1T08LmggS/VDWS
         25mQ==
X-Gm-Message-State: APjAAAUiU/H5sQq0tRDMe36M8HTSGrHlzoiWxOAiCENvPbwfDDSc0hcU
        br1lDyyidpCsiU7rYXLLDAoUAEVCs6Xn1l91fclz5A==
X-Google-Smtp-Source: APXvYqx02W60Klyl42qZZwLW2dzAZTfOGWXnrCHVzSdWGC2CYqb7qVDnpQS6901eL0bM7HBE5DOtd24dGywuNoa+dsM=
X-Received: by 2002:a2e:1214:: with SMTP id t20mr12711065lje.191.1571618531310;
 Sun, 20 Oct 2019 17:42:11 -0700 (PDT)
MIME-Version: 1.0
References: <20191016200647.32050-1-robh@kernel.org> <20191016200647.32050-21-robh@kernel.org>
In-Reply-To: <20191016200647.32050-21-robh@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 21 Oct 2019 02:41:58 +0200
Message-ID: <CACRpkdby+LF5B8t8omn4CVv36NoYya0DZJPCi3a-4FUmDCFrVA@mail.gmail.com>
Subject: Re: [PATCH v2 20/25] PCI: ftpci100: Use inbound resources for setup
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

> Now that the helpers provide the inbound resources in the host bridge
> 'dma_ranges' resource list, convert Faraday ftpci100 host bridge to use
> the resource list to setup the inbound addresses.
>
> Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
> Cc: Bjorn Helgaas <bhelgaas@google.com>
> Reviewed-by: Andrew Murray <andrew.murray@arm.com>
> Signed-off-by: Rob Herring <robh@kernel.org>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
