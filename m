Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E8BC12D5B14
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Dec 2020 14:00:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388352AbgLJM7T convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 10 Dec 2020 07:59:19 -0500
Received: from mail-ot1-f66.google.com ([209.85.210.66]:40066 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732831AbgLJM7L (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 10 Dec 2020 07:59:11 -0500
Received: by mail-ot1-f66.google.com with SMTP id j12so4734124ota.7;
        Thu, 10 Dec 2020 04:58:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Ghg05MC4S/bnxJ+svvza6c5G2cbCYHhUIsHHq9OSvdo=;
        b=gRQZwwbloiTG/1/JLuFvo1TxmVjrg7tKNowt0Vqp2gkl1oj14XyxqHL0xhDF0WbDKF
         /rdWueAslneQEYudN4ddowrBCnUux7gdX2eWYrP+KkVdK9+40af2Xni/PSEDa6Pxd4X9
         D/913MPXW7s/hko3+QQ2hgEfxKZSIha2mbn2H/7o3fayGmJBGY8KzEV0fur/J9IkxlWn
         Lq3SWCVKJBWdhEecUoLJN0ysOtRFKSNFXAF3ALV6EGvY7JfPSBOIIuqVAQPUy5ezx1R6
         S0CNMK22eBmvBgq7wN9k/PTIRZjkbpDyBmNreo7OTzgcmddBnYtbAoqdaAA9qCqx0/iY
         lN4Q==
X-Gm-Message-State: AOAM531fSyszoPCEhyPdLS6oYD0pDfkAPOMVRnSZRZB24+FYFWFzd1vw
        YwlCLQiJg8o9PqiaqbjrCNLFln3SOZ6+hfvBgg4=
X-Google-Smtp-Source: ABdhPJz+wWfprNtfHT6L45mOHHUI/7Z0cwBmP+dw0Cf78cI82UDAN6HunCM9ykSP+kBa+dN/Rpr6lMAzEoguNcr0/Qg=
X-Received: by 2002:a9d:2203:: with SMTP id o3mr5666650ota.107.1607605110474;
 Thu, 10 Dec 2020 04:58:30 -0800 (PST)
MIME-Version: 1.0
References: <20201209200738.811173-1-niklas.soderlund+renesas@ragnatech.se> <20201209200738.811173-3-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20201209200738.811173-3-niklas.soderlund+renesas@ragnatech.se>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 10 Dec 2020 13:58:19 +0100
Message-ID: <CAMuHMdVxEvZ=oN5qCOKjFPCE=+EXxMuHP5djHp5eYw-QK4d3dw@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: renesas: r8a77995: Add CMT nodes
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

On Wed, Dec 9, 2020 at 9:08 PM Niklas Söderlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> Add device nodes for the Compare Match Timer (CMT) on the Renesas R-Car
> D3 (r8a77995) SoC.
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
