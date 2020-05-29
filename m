Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 080431E7E62
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 29 May 2020 15:15:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726990AbgE2NPh (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 29 May 2020 09:15:37 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:44832 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726467AbgE2NPg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 29 May 2020 09:15:36 -0400
Received: by mail-ot1-f68.google.com with SMTP id f18so1845827otq.11;
        Fri, 29 May 2020 06:15:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=49RdcpXaSsv8n0+9Svc8c226Mooo3bw3+KfG0LmEHBg=;
        b=N/8B3nmfPyKUn01oXLs9z0b92mBJrbXrib/7/m/pSOK8Xsn7yxBags2+mc5DXiBv/w
         XSKq4crdXttV6Fe4f+GANyZvWgTiZqyZOkspMFUXtGqGdNkER/FPS7PidnQHvpGyHBlS
         koHT4l9TlWup9VijCVemkaFu+f95GlQY583JcwRw//3TBsPxDXGP2p3rxB3ZXmEfiHkS
         k9BJvibZNvqNLkA9c+ml2NikiABfTjx063KFydDgDdNmTvf6B2dDk/HDBfSNCjsPoxRx
         VcmgLlxoaA/aDAFrb+Z44fr0Dp+fJHSi9EUBTMReFeYmKvzLK7RbX2viqEgeqSET51we
         mfPA==
X-Gm-Message-State: AOAM530TYdupHWnkYSwCoRTVa7T4ICpmZrKafT0Ac3Fuhk3st//6aJCW
        cEbE7gZyr0dKeSglfcJWi17+bqTUXq/Qbk0rQsOcOQ==
X-Google-Smtp-Source: ABdhPJy9r8uif0PDOCfxyGQ3SCUhIxSizUHgxywxMK8H5ulX1pmWMhohG7vyprf0iT6fNyV8tJ1FjRGIe/kvE6JlD04=
X-Received: by 2002:a05:6830:1151:: with SMTP id x17mr6090773otq.250.1590758135755;
 Fri, 29 May 2020 06:15:35 -0700 (PDT)
MIME-Version: 1.0
References: <1590614320-30160-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1590614320-30160-3-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <1590614320-30160-3-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 29 May 2020 15:15:24 +0200
Message-ID: <CAMuHMdU5NgySkQoUy8KnUksEQ2a1GPQN0tk8jLXHxxwSqtnDew@mail.gmail.com>
Subject: Re: [PATCH 2/4] ARM: dts: r8a7742: Add thermal device to DT
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Prabhakar <prabhakar.csengg@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, May 27, 2020 at 11:19 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> This patch instantiates the thermal sensor module with thermal-zone
> support.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.9.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
