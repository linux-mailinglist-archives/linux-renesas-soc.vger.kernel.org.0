Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E6668A6A85
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Sep 2019 15:55:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729113AbfICNzh (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 3 Sep 2019 09:55:37 -0400
Received: from mail-qk1-f195.google.com ([209.85.222.195]:38611 "EHLO
        mail-qk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728576AbfICNzh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 3 Sep 2019 09:55:37 -0400
Received: by mail-qk1-f195.google.com with SMTP id x5so1891787qkh.5
        for <linux-renesas-soc@vger.kernel.org>; Tue, 03 Sep 2019 06:55:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=W4djG6ZZe2G2gdy6fVGBa6oBSzsWeFZIoEuiRWqzUmw=;
        b=Ayp3uURnK1GneLQXrDNGwDNeuCzfX73PMGfLQQTCf08yuODQH514lxt1qELWQbOPB9
         z8UWNqVUoPRYlovQObHxB9vV2R+uW2EgqpDzTPKJhT9JlFe/wJZsp8kjkqVXHE5pXsX0
         gtjwYFXiStKMiLY8mkLwUv1bC1Noad5S205ergrmzXQ5TMil+LBZItAqUQD635et9wVY
         3+HlN4U+AR0bIeYuF4xTGG4D38YbEVlqB6KYpbxxRCsIlObJRo1W2y1jDr+Z33abKjq8
         qhYrODS3T00g3yLuxw3ggo/DTAoqzX29St2HAxFgFQo8AY0wgq5mT8G/YM8IomrCDJ08
         Cn2Q==
X-Gm-Message-State: APjAAAWlu0+BzgdHtnNswhIE7JSro3FkwqBrB9HR75nUzExJituihQDW
        5n+qhz65A2a4yQT7alchI2U+8048TlBvCTajKZ8=
X-Google-Smtp-Source: APXvYqw3Wt+AX8S7d8jl6wURQWky6ECg/mMathv3FyXlrtUiM0WRmgwq1DDlinWPFKmXIChVp0x0zHSGiXhF3Dzbs6s=
X-Received: by 2002:a37:4051:: with SMTP id n78mr32602455qka.138.1567518936107;
 Tue, 03 Sep 2019 06:55:36 -0700 (PDT)
MIME-Version: 1.0
References: <20190823123643.18799-1-geert+renesas@glider.be> <20190823123643.18799-6-geert+renesas@glider.be>
In-Reply-To: <20190823123643.18799-6-geert+renesas@glider.be>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Tue, 3 Sep 2019 15:55:20 +0200
Message-ID: <CAK8P3a3_6fDdQRHq63NmZK0zPehTF82X+eQ3K6g6M0WzkXiHCg@mail.gmail.com>
Subject: Re: [PULL 5/5] Renesas DT binding updates for v5.4 (take two)
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     arm-soc <arm@kernel.org>, arm-soc <soc@kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Aug 23, 2019 at 2:37 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
> The following changes since commit 8cb7ec14188649cf2151464050413e2814fd7cf1:
>
>   dt-bindings: can: rcar_can: Complete documentation for RZ/G2[EM] (2019-07-29 15:36:39 +0200)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-dt-bindings-for-v5.4-tag2
>
> for you to fetch changes up to 7ac2d56f783d6d546e89a4e44fb46532667aa7a5:
>
>   dt-bindings: can: rcar_can: document r8a77470 support (2019-08-23 14:25:05 +0200)
>
> ----------------------------------------------------------------
> Renesas DT binding updates for v5.4 (take two)
>
>   - Renesas DT binding doc filename cleanups,
>   - R-Car Gen3 and RZ/G1 updates for the R-Car CAN and CANFD DT
>     bindings.

Pulled into arm/dt, thanks!

      Arnd
