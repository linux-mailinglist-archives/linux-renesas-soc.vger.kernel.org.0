Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 41E2129ED18
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Oct 2020 14:40:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725613AbgJ2NkU (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 29 Oct 2020 09:40:20 -0400
Received: from mail-oi1-f196.google.com ([209.85.167.196]:42473 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725601AbgJ2NkU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 29 Oct 2020 09:40:20 -0400
Received: by mail-oi1-f196.google.com with SMTP id c72so3188104oig.9;
        Thu, 29 Oct 2020 06:40:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3RYf3vNl8HqQ8zBK55sLVdQ8ARXkNafJFWOB62pZROQ=;
        b=Y/z0iYGpDdStB/BbYAcdll/EVp+xGxM4/4iLZgcHJSFs8vtCFQscamrYCzNWZQVeN+
         t9i4e4fKP85XqWr3Wcj5fGO7foXdpH5aosakQBcqWbZ5/xsISLHzyAR8zIDfwFmdLqsZ
         2S3TccrHp3ssGE/gnzqV9yHQ+9C0Fzdd3eVkfW6DmUG7vLshp+oRASMW9sBLq8EgFgya
         Q4+lfGRpvqqlyvkifcZ+oHL3IZdklEEMSYawgGIbl/lF8+HStA8dGy4Bf6Mop5n/gEtB
         0DP+E6yBycgaQ646OAPhws4Ggd3QYWih+MqWecHKNdQRHDtY4atNFUGyAw5Tv5Oyl6QO
         kKjA==
X-Gm-Message-State: AOAM533SNZCNMLTSwtuydTPApJp2T+SoI6eXmh533cGtD25tg4Kgg07g
        5cBXXNIxEjcnGQxPG5/8+TE/gYpnsSxiBMYzfIs=
X-Google-Smtp-Source: ABdhPJwpnCkm2+nq/s0rgic3wklX9AumKIjdux9Ax86/aTa8YdKnJhvB20zUGFOTSsAlxWtv/zSZJiV4ql5LtrOzQ3M=
X-Received: by 2002:aca:f203:: with SMTP id q3mr2859552oih.148.1603978818953;
 Thu, 29 Oct 2020 06:40:18 -0700 (PDT)
MIME-Version: 1.0
References: <20200920134905.4370-1-biju.das.jz@bp.renesas.com> <20200920134905.4370-7-biju.das.jz@bp.renesas.com>
In-Reply-To: <20200920134905.4370-7-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 29 Oct 2020 14:40:07 +0100
Message-ID: <CAMuHMdUi=SKqcyKJxi83L4m_+ETe3MPM-A3sXrGTcCyqWvxGaQ@mail.gmail.com>
Subject: Re: [PATCH v4 6/6] arm64: dts: renesas: beacon-renesom-baseboard:
 Move connector node out of hd3ss3220 device
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Sun, Sep 20, 2020 at 3:49 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Move connector node out of hd3ss3220 device in order to comply with usb
> connector bindings.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.11.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
