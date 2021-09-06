Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 83B16401DA0
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 Sep 2021 17:31:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231893AbhIFPcx (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 6 Sep 2021 11:32:53 -0400
Received: from mail-vs1-f51.google.com ([209.85.217.51]:36673 "EHLO
        mail-vs1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231751AbhIFPcx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 6 Sep 2021 11:32:53 -0400
Received: by mail-vs1-f51.google.com with SMTP id f6so5891818vsr.3;
        Mon, 06 Sep 2021 08:31:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JjpgCCKn8pZaZ4VTjt0b7oN/N//2baxfz4BZA8973Js=;
        b=OGXRUWj2gAvFT+ZdZBdfjgmPkONj8KCpGycICQ4wYQCa6t1c9Kzxe1Qlq0fQctvx+B
         iLhTg8C7hFanE0A8szQcykWuHpIv+hcRJBHvVwMZbNSuEqQAvB+HegyJtS2mlpUTs87T
         4qziMXi81hYODqpOGfv8V1fJy1A+9X87NKEh6QoSSqFyE2+i7wqpGZMCn8PtZPvXVJum
         UZeQL7qgTs4jKNlZhoP1mR3vOF1I7ATTucCl1F7nmJx8L75TAOqQ2ZJ4fJjcdp81nLHp
         GJ90mSgUzmZp+Ux+qG9GD3NadFGQCPO6xMnjNOtxx7neGZIOd0DZ/9ddT9b5jgAsLdi3
         Nq2Q==
X-Gm-Message-State: AOAM531MYusPET0KX0oGHmD8+co49z6q6abRyKFx4xAJoG1EX6Wyhqpd
        fIpAxpJjUaY27dOBHFA68BhajVi+HJWZLtR7NFfhrEPL
X-Google-Smtp-Source: ABdhPJxP0x+z+6DEKedIcEuAJAEjlfVgR/QCxZvmYioIDSdNu1ioPb0GPdZGzzgvuef6ZdSb0wKOzbQEVVW56N9cHQA=
X-Received: by 2002:a05:6102:b10:: with SMTP id b16mr2720341vst.41.1630942308124;
 Mon, 06 Sep 2021 08:31:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210901102705.556093-1-yoshihiro.shimoda.uh@renesas.com> <20210901102705.556093-2-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <20210901102705.556093-2-yoshihiro.shimoda.uh@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 6 Sep 2021 17:31:36 +0200
Message-ID: <CAMuHMdUOQQbrxcvFDPQYokAj9pewrML30jq1g_OGs12OY_36Tw@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: iommu: renesas,ipmmu-vmsa: add r8a779a0 support
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Linux IOMMU <iommu@lists.linux-foundation.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Sep 1, 2021 at 12:27 PM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> Add support for r8a779a0 (R-Car V3U).
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
