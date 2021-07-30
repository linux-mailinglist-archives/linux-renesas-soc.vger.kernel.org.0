Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 493713DB8AF
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 Jul 2021 14:36:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238723AbhG3Mge (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 30 Jul 2021 08:36:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238793AbhG3Mgd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 30 Jul 2021 08:36:33 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1530C0613C1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 30 Jul 2021 05:36:27 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id r26so17678340lfp.5
        for <linux-renesas-soc@vger.kernel.org>; Fri, 30 Jul 2021 05:36:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=a6yoTwLjCZTcp5zCZT5VGKqs4hiUGuvsS21dwOFfXjs=;
        b=lL/dGG0fbS/8In4v2Cc9/dZeUykOnpTSnf91B6+adKwx3DDjpEnWLyL+Gt492N1Gwf
         Ca+al0GksCkCIKIgbVWeLACsrfR5kz9i+7PGn+33GcaHMulDwhGxHtFLVNbsHNuxAJwg
         +os5OwFEp4kx/WsSP4ZbJ6y4lzfSKsRFu5JFdeA3uyf+ldOFDE6ELxKnMdb8ZJCHr7zC
         AH1hL8Uqr/V+SXSRnQ+0dpggaVfLNsubj9g8D7kBiUtcs0ueIPrBfXl8TyUSf8oi4DuC
         aQ+hbt1EIlMGvRSP6OpcePMFe0Xkrc92A0FLJiXrLOEPd0+Id9JIsWTo2yvxtOcHCRUX
         FqKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=a6yoTwLjCZTcp5zCZT5VGKqs4hiUGuvsS21dwOFfXjs=;
        b=hU4k0EtM9xuCDUYvyv3LTcNfgZ6R3Umg8zZAeSBdYLRqXgz4OzpZUSQ6vhLkry0XWq
         oQP0DNQGNU3g9INXy8nh5JLcFliMGyQPruvuLGsBZacrT/1+xEwC8M4k0kW0fi3ZZvUF
         AiQIgLMke2bEXs3FNcuVvqHas2kdttnQ0ilVAL+hroAYjBOecCu7Fkv0GQ3QDPXlb3MQ
         yWSHyHgNGp6Av4MJjnCbEb/FBgKc9GL+fk1knaUzE/UpYCRtR8phQfWRLgxWeW69EfYj
         EQgUAQ9PRV18GRCzMM4aL05l6m5aReJ9Sk6IBQhz7r3SLUi9bl7RNtKvmkj5p++yueld
         eEUw==
X-Gm-Message-State: AOAM5306a8dnlqipUHkq2KNDq2AMpqU8a1+/s1K2w8OckR2PdRvlWt8K
        1IqGwwcTAOPLivTuPxc9gaHKHWM4Di8ZWuK6ABQegw==
X-Google-Smtp-Source: ABdhPJw0ow6qke/HIvvIMSvtYtQwonfyTTyt6hR9ZCYWU00ixAHsUk61egoYmM2Ut2mEU62KOOmkc3/z5feFHxYzAbY=
X-Received: by 2002:ac2:4c4c:: with SMTP id o12mr1698771lfk.157.1627648586302;
 Fri, 30 Jul 2021 05:36:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210712194422.12405-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20210712194422.12405-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20210712194422.12405-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 30 Jul 2021 14:36:15 +0200
Message-ID: <CACRpkdZmQJMdnskELGvunBvXqobCdE5fRB_AnPscVY7-bxz66g@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] dt-bindings: pinctrl: renesas,rzg2l-pinctrl: Add
 DT bindings for RZ/G2L pinctrl
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Jul 12, 2021 at 9:44 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:

> Add device tree binding documentation and header file for Renesas
> RZ/G2L pinctrl.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>

Looks good to me and I essentially trust Geert to review this
driver and eventually merge it and send it by pull request
as well.

Yours,
Linus Walleij
