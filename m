Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1132F2F2E55
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Jan 2021 12:49:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730958AbhALLsN (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 12 Jan 2021 06:48:13 -0500
Received: from mail-ot1-f52.google.com ([209.85.210.52]:45708 "EHLO
        mail-ot1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726999AbhALLsN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 12 Jan 2021 06:48:13 -0500
Received: by mail-ot1-f52.google.com with SMTP id n42so1928556ota.12;
        Tue, 12 Jan 2021 03:47:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kITFcItWCDiIrGzXGAqzjzblLBxmSkqTR7kMu7IZ0KU=;
        b=nkeAXZrlkK/D0XmpT8f1gwBrujM9YzqSnw3m5D2na2YFBh500t23k6uJtqC1injTXS
         +b4DG+bJRSRU7ZjixWCTSMrabFRqAfzl609M0/difdNqKJKcaLOOmtf4OuHQiIGhLxoy
         fxTYDseJ0+aPxFOuVbCuvoUHWL6kBFKi9x2vmKLW6d2vZkuhsfTHrmIUsFoUtfjlQo92
         L+SYjorDDdRNiKFohWlxfNozUHhNUsoQIZa2kYLcxIzuC++/swgURNnyTedrdX8JrI4R
         IckFMtTg5pLdhCru9QA+Z7vJFvx9rSH71VwWAMynRJUpig7tYdakvyey36PAkR3JJqy5
         LyTQ==
X-Gm-Message-State: AOAM530glrjVAC0t33OhtgQ9JwwyyKETmMtqmiQ8p3Vy/F9BbxdWOQgn
        X98xxBwbIw4LPN7b/D09FP7VbBshZOx+RjKQboM=
X-Google-Smtp-Source: ABdhPJxFXv2WupJo2L6P+kjKXryJv3KlFZkd/RRP1Hz5MSkxyBvFr77bJHZv5jitctr2UTAf5V2IfQgGTQ9DhVUczAU=
X-Received: by 2002:a05:6830:210a:: with SMTP id i10mr2480141otc.145.1610452052356;
 Tue, 12 Jan 2021 03:47:32 -0800 (PST)
MIME-Version: 1.0
References: <20201227174202.40834-1-wsa+renesas@sang-engineering.com> <20201227174202.40834-7-wsa+renesas@sang-engineering.com>
In-Reply-To: <20201227174202.40834-7-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 12 Jan 2021 12:47:21 +0100
Message-ID: <CAMuHMdXs57dPYR6Ms=mMb-JDdnQKL-jWW+duCvQusDJ_R1BjDg@mail.gmail.com>
Subject: Re: [PATCH 6/6] arm64: dts: renesas: falcon: Enable MMC
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Takeshi Saito <takeshi.saito.xv@renesas.com>,
        Koji Matsuoka <koji.matsuoka.xm@renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram,

On Sun, Dec 27, 2020 at 6:42 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> From: Takeshi Saito <takeshi.saito.xv@renesas.com>
>
> Enable MMC on the Falcon board.
>
> Signed-off-by: Koji Matsuoka <koji.matsuoka.xm@renesas.com>
> [wsa: double checked & rebased]
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>  .../boot/dts/renesas/r8a779a0-falcon.dts      | 41 +++++++++++++++++++

As the EMMC is part of the CPU board, it should be added to
r8a779a0-falcon-cpu.dtsi instead of r8a779a0-falcon.dts.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
