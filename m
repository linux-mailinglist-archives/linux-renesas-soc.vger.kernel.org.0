Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1E4A6ED44B
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  3 Nov 2019 20:13:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727474AbfKCTNE (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 3 Nov 2019 14:13:04 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:33293 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727322AbfKCTNE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 3 Nov 2019 14:13:04 -0500
Received: by mail-lj1-f196.google.com with SMTP id t5so15290550ljk.0
        for <linux-renesas-soc@vger.kernel.org>; Sun, 03 Nov 2019 11:13:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UiW/0WHLJskoRcE/9uKEsyk5EFZYescblroVQb5zKlE=;
        b=uyMDuND3S2NyktyEGi6EMW55IECsFk6yKS5/4mMGMJYNW+HDwn0jsKQvxlE05BcE7T
         EFttc/eMyUsVg6WRFPpBUxsdQdTTokWkIONMbX4QHQJYNIZ4K4Xh2phOthgb0NF0PU9h
         VsaoAIqfA0Lv3RImklSTDc4BEROwJkqraKG/fU3BXxvrzT6fpWqMtoupE1NzFn9RbRto
         SXk27Ud+PmV1GeBwBnFf9sBHft3bCK+Z5z4LygP+el6DmjiD/yiKcP2BCQEC4su6PATj
         J52yNjimfedpRmm+T7U3k6Srk+Y26z+wxWsWUywHXSNl4u3N293TUJkKO+EoUANRcS29
         Hk8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UiW/0WHLJskoRcE/9uKEsyk5EFZYescblroVQb5zKlE=;
        b=YbcINMgLZoznFL50br2124kS780Qr8wfdYGqfg0FggUxRMoplclphg3907FfDz9vH5
         /Dpa8p89I20+d7MmgzkEYxOY/J+nqlAj+C7/OM/OVg5ZG3sbpIjls9LI1fGG2P2HnDF6
         2eGLM/dFYm4Qo0zIffahuwyUQ2/OqVCHXdtDGqbxUOZAQzrhoj6jTpfiod2IHa/gtA4Y
         SvcVCOulq6kB8nR/Ur6jRmHJm4+QsAOSLeufxTyBx75VgCU8iQnTWM7dkx+DJDeE9EyY
         5DCzr11MuUD3tMSHBd7vvfZrIG07NedVNTk3KVFauXsOATJQjJakKpzDvQwTOc5GTtpl
         1UvA==
X-Gm-Message-State: APjAAAWXjfJnq7ynJhZEIrlVKQaWw3KVtvm/pq2yNZMvWWP4ZwycQYjT
        PFdBp0nnKUynu5TFB8hId6zDzYgCNgCtcIFag2hV/A==
X-Google-Smtp-Source: APXvYqy73yfbuGgDPFc4FBM6JZGP/U7k4Gi/uo9VBKWono9/2nIhaCedCnD+8RqzMifRM5Br5pU2EVluL5emOXee0Xo=
X-Received: by 2002:a2e:a0c9:: with SMTP id f9mr16191510ljm.77.1572808380560;
 Sun, 03 Nov 2019 11:13:00 -0800 (PST)
MIME-Version: 1.0
References: <20191028163256.8004-1-robh@kernel.org> <20191028163256.8004-7-robh@kernel.org>
In-Reply-To: <20191028163256.8004-7-robh@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 3 Nov 2019 20:12:45 +0100
Message-ID: <CACRpkdYzH5TCBxSCyYKeu3KUqMzDi44H7yOuXkU6ZBWNG901Eg@mail.gmail.com>
Subject: Re: [PATCH v3 06/25] PCI: faraday: Use pci_parse_request_of_pci_ranges()
To:     Rob Herring <robh@kernel.org>
Cc:     Andrew Murray <andrew.murray@arm.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        linux-pci <linux-pci@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
        Christoph Hellwig <hch@infradead.org>,
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

On Mon, Oct 28, 2019 at 5:33 PM Rob Herring <robh@kernel.org> wrote:

> Convert the Faraday host bridge to use the common
> pci_parse_request_of_pci_ranges().
>
> There's no need to assign the resources to a temporary list first. Just
> use bridge->windows directly and remove all the temporary list handling.
>
> Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
> Cc: Bjorn Helgaas <bhelgaas@google.com>
> Reviewed-by: Andrew Murray <andrew.murray@arm.com>
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
> v2:
>  - Remove temporary resource list

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
