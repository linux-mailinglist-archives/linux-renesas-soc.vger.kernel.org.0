Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 51A0A260ECD
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Sep 2020 11:39:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728886AbgIHJjM (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 8 Sep 2020 05:39:12 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:45919 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727995AbgIHJjL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 8 Sep 2020 05:39:11 -0400
Received: by mail-ot1-f67.google.com with SMTP id g96so14274334otb.12;
        Tue, 08 Sep 2020 02:39:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=M93+1fX+KeKKW9ageQq4fHrBTowEiDfykj/07rsl8l0=;
        b=CGP0REQgjXDg2ZtL6xlh5GT7ulUPi7iwgdNMwziW/KUtXYP4SQtZWpxft8ETuc6mGB
         3Ur3MhT3x2zd9ghFsRjXKqUjKjzTkRJjNIRoo3Do+3v5DtsgBwQm8cGaVrzhmjzf0eSe
         yFxmB92nXveZ5RgyMxVVUB+yFiJ/Q6SUvLm2+QK6T+1VQ1q9q0lmm98sg5VpOxVsf5Pm
         HxfpxPhhKD/m+C0X+lAOcpIRFt2MJ+BfcPkkUlxBtK93cenyTMsd4dElRVFs/EktTAgb
         pVJmqvAENSWgJ+qpxzhnswnxWksrAT0mentUKOlJj2YZS6lq28Y16QKxYPC8v1FIa7oh
         qMQg==
X-Gm-Message-State: AOAM531sURDPUumUSKQ8G0K6/EsdOGYJbCUtzC3Z7qOeK/kNhpxwNI1A
        xVuu4tc1BH0a9KutmKVO/lKs/AWs8iJ5A8I6gu4=
X-Google-Smtp-Source: ABdhPJzPP0irCTq9mSUUbcCXLB8Sz83zvFb5qqcJbvuhCXDIhS8pTrOl8vZmkPa3z4BqjvihqxHIF9XxcLH/At/n0eY=
X-Received: by 2002:a05:6830:1008:: with SMTP id a8mr16151015otp.107.1599557951215;
 Tue, 08 Sep 2020 02:39:11 -0700 (PDT)
MIME-Version: 1.0
References: <1599470390-29719-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1599470390-29719-9-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1599470390-29719-9-git-send-email-yoshihiro.shimoda.uh@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 8 Sep 2020 11:39:00 +0200
Message-ID: <CAMuHMdWNxHdG8kFWG0fZuCFPFKkbfiVcP-xoCwZCy+w8vMaLag@mail.gmail.com>
Subject: Re: [PATCH 08/14] dt-bindings: serial: renesas,scif: Document
 r8a779a0 bindings
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Sep 7, 2020 at 11:20 AM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> R-Car V3U (R8A779A0) SoC also has the R-Car Gen3 compatible
> SCIF ports, so document the SoC specific bindings.
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
