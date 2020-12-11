Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 557262D75D3
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Dec 2020 13:42:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2395425AbgLKMll convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 11 Dec 2020 07:41:41 -0500
Received: from mail-oi1-f195.google.com ([209.85.167.195]:35272 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2395292AbgLKMlT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 11 Dec 2020 07:41:19 -0500
Received: by mail-oi1-f195.google.com with SMTP id s2so9653861oij.2;
        Fri, 11 Dec 2020 04:41:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=6Bb6o06h8BdiZHWVT6GAukTUptqWBGvBlbDK3o3wGoQ=;
        b=tbZKHI3/4W8DJiR5bzUHZiGrfvBqQJHwqrNTV6u39Ps3DiB1hQE6AnWIGMlNFZs54d
         UoASxz51K3juS0LGkyhob67vLD6pY1J4BsTrTrvEnpsooZknp4npRgOZm4pMRPL0hEWt
         JUd1Ml2ucEjPo2VLo+dXLirlPch2uBaMnzrblP1yQximUg/I6FKFFLYW3o/YeV4x5CJr
         45PT205DxOuX0EBPewFHutiwEFlAEQxU5VXFGOxsID5LrN+WC6/HbdUPwi8gmFlnosnJ
         ejBUtgH77xmTb5XO5bSqp43aJsaSmelhlyAuSH4P0jsnqD/g0rwrKdYzFoWSac+elab8
         5VGw==
X-Gm-Message-State: AOAM532XCIC2t2oZ4ExvmbMjE8TeWUuTbb6NsZy2WL+uIOEJDIIEjNdm
        xjHiGXLIE59gyufr1FL2OAGg3WRPzKUJKtWEfPw=
X-Google-Smtp-Source: ABdhPJz2Vf/UIvdsqH4sFBehsv3Ec2ZkKmfJvGaTEel5TI3Vtq1Jq6tR8sVUstb4URmi0GWWdtBf4hw/qgV02NjKN6M=
X-Received: by 2002:aca:ec09:: with SMTP id k9mr9013514oih.153.1607690438587;
 Fri, 11 Dec 2020 04:40:38 -0800 (PST)
MIME-Version: 1.0
References: <20201210152705.1535156-1-niklas.soderlund+renesas@ragnatech.se> <20201210152705.1535156-4-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20201210152705.1535156-4-niklas.soderlund+renesas@ragnatech.se>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 11 Dec 2020 13:40:27 +0100
Message-ID: <CAMuHMdUJBmeh0wGPPp==re8BPo2-yeVN3vj-jCxmGxjdSZsr_Q@mail.gmail.com>
Subject: Re: [PATCH v2 3/6] arm64: dts: renesas: r8a77961: Add TMU nodes
To:     =?UTF-8?Q?Niklas_S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Dec 10, 2020 at 4:27 PM Niklas Söderlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> Add device nodes for the Timer Unit (TMU) on the Renesas R-Car M3-W+
> (r8a77961) SoC.
>
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.12.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
