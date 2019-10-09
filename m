Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1CDD3D0E48
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Oct 2019 14:06:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729854AbfJIMGC (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 9 Oct 2019 08:06:02 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:35409 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727286AbfJIMGC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 9 Oct 2019 08:06:02 -0400
Received: by mail-ot1-f67.google.com with SMTP id z6so1497255otb.2;
        Wed, 09 Oct 2019 05:06:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7kwaAOYZZzurDEK3VmoqO8GjY8j5VIVnxX6XxM3FAgM=;
        b=fPgfibeQPhkEm9X1+f5mHdLivJvdPOS6aAPr/SK1iENzCgtsIdUjkJlg/G0kVxLBRY
         8KesjeCra8XHacFMLq2FzwkDWlBgwMYg9TuaOPWb40BDLszsFO060XgVPd+DRcSj25aW
         jMqvyR0UKcPD9dWMM+l99kAegRNNOqoud7a4vnLdqWf0nzAl3vbxcqpE4/1L9/N5iBHm
         3SwrIjznbX0ds//74kKE1VpmXoZfWAfQ11Osx383PN61SRWNEneHr1sneHt4IUqkM5EN
         J9CaDAu/xP6kPgvBPaVVHFnCN2DWgJccbGEFY/x6l9dgLY4xGZRs5F88nS0+e9ZuGnma
         vUgw==
X-Gm-Message-State: APjAAAX/7WW+fdgXlHn3ViSCYVcOcGqtaPmZFc0DKpj80dAMAHfuqju2
        8IWNr1Op3HXnxr30RJGTjkVI+DFAhbi2aOKiYMQ=
X-Google-Smtp-Source: APXvYqzbBGJ4Ut3Qkm+2Vk6CpkCzUUlbd0wn+g3BlJFt2db0sHd4F7C6svLY/cSjqdkTSCHTrfjbB/tT3Clo7FRAexQ=
X-Received: by 2002:a9d:7a82:: with SMTP id l2mr2504062otn.297.1570622761572;
 Wed, 09 Oct 2019 05:06:01 -0700 (PDT)
MIME-Version: 1.0
References: <1569250648-33857-1-git-send-email-biju.das@bp.renesas.com> <1569250648-33857-2-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1569250648-33857-2-git-send-email-biju.das@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 9 Oct 2019 14:05:50 +0200
Message-ID: <CAMuHMdUQpyrnMpGB3khujnmAP3kRV6Vp0FBf8_snD1Ro5=wU3A@mail.gmail.com>
Subject: Re: [PATCH 1/4] arm64: dts: renesas: r8a774b1: Add OPPs table for cpu devices
To:     Biju Das <biju.das@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Sep 23, 2019 at 4:57 PM Biju Das <biju.das@bp.renesas.com> wrote:
> This patch adds OPPs table for CA57{0,1} cpu devices.
>
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.5.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
