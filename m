Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D0829C9B96
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Oct 2019 12:05:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729858AbfJCKC3 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 3 Oct 2019 06:02:29 -0400
Received: from mail-ua1-f66.google.com ([209.85.222.66]:45417 "EHLO
        mail-ua1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729850AbfJCKC2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 3 Oct 2019 06:02:28 -0400
Received: by mail-ua1-f66.google.com with SMTP id j5so679755uak.12
        for <linux-renesas-soc@vger.kernel.org>; Thu, 03 Oct 2019 03:02:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ASe6c7I7L0EhCrUF5XHzywoDopPPIgsL+/85Te/kEJI=;
        b=E5MZYBtYnP9Kx6HGb8mldQfMGUpUqvYEMXZPN2TavJocc5j0TM23dfl51BxuITMgqR
         FQyWg7QM2ggfrFBnC12LK062KNTRBxToUx7DpRA/n4ek00vnmfzgtf7UWU3uiBvBzNV8
         XyannvvcqBcdj+9+6IrKyWjXdJwdYAoqw+mIzp31aF/OvxAmwFCUX1gR5NRQri0mF7L4
         th1nAiPDA7LYoJeZuOxttB6b5GqSsUz9KLHgHXWVoly8FNN0C5q6v+j0JqE1KlajfRkP
         hpx6JRUkOq5hBzjzksRFIogIWfHOzAZKGZkR3zwvJ2jYhYrei2/y6c4LoKBdXUgjSBbx
         i3dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ASe6c7I7L0EhCrUF5XHzywoDopPPIgsL+/85Te/kEJI=;
        b=nh2IvwJylqzQUIWs6vjyiMsn6u2M66TOxQgZyb/9cplj/QQL6oVFMPdGal2w+fXKth
         WiCAml8LyxXb84l6Oq0cCjpEtARSBtd26mNcFPoolDGVakjrXvbdmhe3QkYlPQE03Md3
         m5CFtzyI6vEL+lxxxZUVzn4ECrED8oggkm/kQdtPjixeCSwmRU7V4WD5IPa5dhdtjfBA
         /ZN8uC05ZzJKSt/aCitZWXczOMYhYU6sT/mTn0h0OG/xOt6gXEvaLMbEh4lyx+6fJNtC
         4iodT+MSe9oA0AgbTFbpeRz9/dmdkP8LudxSB2l8AaPxz86gJ4gbNX2X1VPIkRkJZx2h
         lF8w==
X-Gm-Message-State: APjAAAUhNPaP48gzTacY7mjbEq3Qfb32FcamSrd5T1fRT5vZpIGCbmAn
        9ZVHSZWgEb5+6c/5TP1J2Ck6qx0lK72QGQoxz6Pw+Q==
X-Google-Smtp-Source: APXvYqziS3fHRidRt4q0HiM4i8JRcmP+OWueXD44mBPQh9EhssfaJIHmpRVtUCSHgrdM1OV8IZmo2KEgQEZsmpHlGgY=
X-Received: by 2002:ab0:6190:: with SMTP id h16mr2425291uan.129.1570096947431;
 Thu, 03 Oct 2019 03:02:27 -0700 (PDT)
MIME-Version: 1.0
References: <1569307615-38914-1-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1569307615-38914-1-git-send-email-biju.das@bp.renesas.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Thu, 3 Oct 2019 12:01:51 +0200
Message-ID: <CAPDyKFqu+MdSc0e+C5AcGbY7UH6KG8fcp96pd4vyUMoHayVwqg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: mmc: renesas_sdhi: Add r8a774b1 support
To:     Biju Das <biju.das@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, 24 Sep 2019 at 08:47, Biju Das <biju.das@bp.renesas.com> wrote:
>
> Document RZ/G2N (R8A774B1) SoC bindings.
>
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  Documentation/devicetree/bindings/mmc/renesas,sdhi.txt | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/mmc/renesas,sdhi.txt b/Documentation/devicetree/bindings/mmc/renesas,sdhi.txt
> index dd08d03..bc08fc4 100644
> --- a/Documentation/devicetree/bindings/mmc/renesas,sdhi.txt
> +++ b/Documentation/devicetree/bindings/mmc/renesas,sdhi.txt
> @@ -11,6 +11,7 @@ Required properties:
>                 "renesas,sdhi-r8a7744" - SDHI IP on R8A7744 SoC
>                 "renesas,sdhi-r8a7745" - SDHI IP on R8A7745 SoC
>                 "renesas,sdhi-r8a774a1" - SDHI IP on R8A774A1 SoC
> +               "renesas,sdhi-r8a774b1" - SDHI IP on R8A774B1 SoC
>                 "renesas,sdhi-r8a774c0" - SDHI IP on R8A774C0 SoC
>                 "renesas,sdhi-r8a77470" - SDHI IP on R8A77470 SoC
>                 "renesas,sdhi-mmc-r8a77470" - SDHI/MMC IP on R8A77470 SoC
> --
> 2.7.4
>
