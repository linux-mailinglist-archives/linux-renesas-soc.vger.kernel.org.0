Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA0C2458D69
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Nov 2021 12:28:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239121AbhKVLb3 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 22 Nov 2021 06:31:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239111AbhKVLb0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 22 Nov 2021 06:31:26 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 958ACC061714
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Nov 2021 03:28:19 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id b1so78753894lfs.13
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Nov 2021 03:28:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IagQM63R+rDjhJUw1VMPJDDpFazIAHieWAnQRQyFphA=;
        b=PFAOxEbUA29b30rxhBtR8jpeMFz07/eFFDDQJAnKfBtRCskpZSpEbXpH0xchxq1vX6
         ObDxcAJdeilTRvGEDpDffya6n9VnUGLW/jItJ0gK3pigN1UpiYMpaqpgSoJudZjtUBCE
         FH4yJ9f2n9A+mQ+y0WJkrxjJk9Cbrj+nCvr9ECf9q1DfbOBIGzzx2uOqesFUOzl7MD5P
         HPTfRtw+XQEbqYzgpL/eYbVxlVikndmIEZ+ApJfNT2S9VDjiR6cq6LCcQ/0O8jVxCi2A
         I9fcmoC3xOdgA+zfvZMnX7rZZefpEQUQOWDDgCUu63ND6vGFsoeAc10oxDb7x4Fn77bW
         97wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IagQM63R+rDjhJUw1VMPJDDpFazIAHieWAnQRQyFphA=;
        b=kulWiMu9iz5Fb+kpXI/Bel6rkKaX3+u9fWTukO+6/QeSSQ9TfWh//Lyc5EWdgxZWwr
         jtiSgmPbGORJnRq3K8tA/Rozwi32IlrKekX2xsPVe/fuzjRSMFefzSIKKSb7SnCSfGSF
         ApwQSyPzFbTI/F7zZCRIOVzDaEZrx+XVx55fK04RJ69TwPBLoKZxV23E7OfMY4BSfg1B
         pMG5wO05u1pKAaCbYW8UNh+LHY5kM6ol4+JlOq0NPh6nxAhc3REsLfER3PjBPNLEKTni
         dBOUhmcXVgmq5kIJWdjtAUr5TEEycD3Xa/wBeyI6k1cCRAO1T8FQvU+pse1uwKfXgAg6
         rjpQ==
X-Gm-Message-State: AOAM532PaJgLu2U77tYZWaavX4b9LyQbEEWjH0/QAMyZttnMsqEIh99W
        Hbd+a1pZHSH+vEanisXoVlGf7m2PTjhi17JaYvdutQ==
X-Google-Smtp-Source: ABdhPJy3c024rax53YED/h5qShT7smb1J1xSLFa5vpqATOSqXWQ6zzjj3kRnEy9P+bc+FTkRM8LPPqCdRz857mHRdrY=
X-Received: by 2002:ac2:4bc1:: with SMTP id o1mr57271385lfq.254.1637580497906;
 Mon, 22 Nov 2021 03:28:17 -0800 (PST)
MIME-Version: 1.0
References: <20211122103905.14439-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20211122103905.14439-1-biju.das.jz@bp.renesas.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Mon, 22 Nov 2021 12:27:42 +0100
Message-ID: <CAPDyKFrcCHBrh9JUDXkMyuURgnnh8uxjcGp_DLKMDz7zw0pWWQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] Rename RZ/G2L SDHI clocks
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <chris.paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, 22 Nov 2021 at 11:39, Biju Das <biju.das.jz@bp.renesas.com> wrote:
>
> RZ/G2L SDHI has 4 clocks which is controlled by PM frame work and is using
> Gen3 compatible string. Now the clock factorisation happened on highspeed
> clock handling and it changes to fallback by getting parent clock, if
> "clkh" is not specified in device tree.
>
> This path series rename the clocks to match with the clock names used in
> R-Car Gen2 and later generations. This will avoid driver changes related
> to clock names.
>
> This patch series based on renesas-devel

Acked-by: Ulf Hansson <ulf.hansson@linaro.org>

Kind regards
Uffe

>
> Biju Das (2):
>   dt-bindings: mmc: renesas,sdhi: Rename RZ/G2L clocks
>   arm64: dts: renesas: r9a07g044: Rename SDHI clocks
>
>  .../devicetree/bindings/mmc/renesas,sdhi.yaml          | 10 +++++-----
>  arch/arm64/boot/dts/renesas/r9a07g044.dtsi             |  8 ++++----
>  2 files changed, 9 insertions(+), 9 deletions(-)
>
> --
> 2.17.1
>
