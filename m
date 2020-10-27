Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ACADD29AA3C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Oct 2020 12:06:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2898917AbgJ0LGE (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 27 Oct 2020 07:06:04 -0400
Received: from mail-yb1-f194.google.com ([209.85.219.194]:40914 "EHLO
        mail-yb1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2898906AbgJ0LGD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 27 Oct 2020 07:06:03 -0400
Received: by mail-yb1-f194.google.com with SMTP id n142so873358ybf.7;
        Tue, 27 Oct 2020 04:06:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fAkQFeXsZSoQo8Ixdy03bk73JABL5fKKNRt0WsI4OiI=;
        b=VBcRUwl3G/ASm/P4F+TRY+35HgJJw1i9VwUdF0TXFNcj6XYD9F6A7Rr2GPlat/vi/o
         GVhosFgQzJHEYg9HfHClfJMvDKe4kncSB1gzArBgNRve3OA3zcwA+MvsZXiru4HBKoeO
         4NfZXJEAXAGUcPL7XlQvrDWNVUjgZ2FgX0n01NPpPJV9mJstmUiUE4l7wGgYr+eFXUtX
         ltIlSMp2eUc9JaosiIlA9s3Rk+uP4uzUCyOVQcH3kjjDWn+E3IEjRnAbuYVU7Lqs3NsX
         I5gDqpUvrLv9lWjERT1nzxKSariSY+dP/grT1khLqleqxJMIFaVTosttzrOdMYKitVYk
         o8PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fAkQFeXsZSoQo8Ixdy03bk73JABL5fKKNRt0WsI4OiI=;
        b=OPAOz2j9WsNE2/ueF/mbxOGk9iknb+p4QN7WsY2qOg3n9wqJJUQMGfPhm37AzJFlCk
         GXiDp4ElrjhKNNUwugaVMvapTseL/N4D3dh4ARmJPcGZAJ1qu2S1KON8vyj1MyC4oD61
         W5TEpjv2yFmoo7IFi763nhM1K6Gpv4yF/0pfz/LgKxp9rllbRBd1rH7yVszL4JeFlcP3
         H2+JBy032/gAAIz9RJI0YkGAbLy/PSBbcPLIfsKMh+s/eX5CPCl5i6a9goF26ljTzhSw
         wpA9HuN2y468H2UHE2USzvDWxuHBvGDJsUdH4u3IXkT1rPeOqvOQd/K3ozp88SdkkvBH
         W2ww==
X-Gm-Message-State: AOAM5338Iva/hBDyA2ql7ZkceUlJytKNF4wy3SYjZbd0/XYlzJ9B8R+S
        QCzyE/KRm9nWqznGV/wqLQVGzLFpEVFRPUSJlzY=
X-Google-Smtp-Source: ABdhPJzlRGGpU7APibB8Rghrp1dbvcZQoFnUblTEQYRpQdsNX75ZevUNZ9hpwdTWWW6AR5c4Cy3oFtT77pOZ/KLqfak=
X-Received: by 2002:a25:41c9:: with SMTP id o192mr2236771yba.127.1603796762491;
 Tue, 27 Oct 2020 04:06:02 -0700 (PDT)
MIME-Version: 1.0
References: <20201023075530.19295-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20201023075530.19295-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Tue, 27 Oct 2020 11:05:36 +0000
Message-ID: <CA+V-a8t+2ioNTw1m9Xz0_Go=p6dSRWobL15Va5aE3GcWzOHTpA@mail.gmail.com>
Subject: Re: [PATCH 0/2] RZ/G2x add optee node
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

On Fri, Oct 23, 2020 at 8:55 AM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
>
> Hi All,
>
> This patch series adds optee node to HiHope RZ/G2{HMN} and EK874 boards.
>
> This patch series applies on top of [1].
>
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/geert/
>     renesas-devel.git/log/?h=renesas-arm-dt-for-v5.11
>
> Cheers,
> Prabhakar
>
> Lad Prabhakar (2):
>   arm64: dts: renesas: hihope-common: Add optee node
>   arm64: dts: renesas: r8a774c0-ek874: Add optee node
>
As agreed on the irc (optee nodes should be coming from firmware
stack) let's drop these patches.

Cheers,
Prabhakar

>  arch/arm64/boot/dts/renesas/hihope-common.dtsi | 7 +++++++
>  arch/arm64/boot/dts/renesas/r8a774c0-ek874.dts | 7 +++++++
>  2 files changed, 14 insertions(+)
>
> --
> 2.17.1
>
