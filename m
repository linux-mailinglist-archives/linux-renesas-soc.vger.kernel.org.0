Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B3E01D0E31
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Oct 2019 14:04:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731043AbfJIMEu (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 9 Oct 2019 08:04:50 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:34064 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730490AbfJIMEt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 9 Oct 2019 08:04:49 -0400
Received: by mail-ot1-f67.google.com with SMTP id m19so1497025otp.1;
        Wed, 09 Oct 2019 05:04:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=q8FTdSY6XN6/eDlgeh8RSX47FXM44up9sU1rauzfpKA=;
        b=MAdGlNchcOF1qEHJGZHTAzemWvfFmpA428P0rU4WCKR0JSqQrMuyC1JP9Nqec1A8oR
         63gJzAmd6FuyIJhDXtuaKf9ew1jMowFfBh61lWX+p1oPo3wAsFrCoe2ORPbQ/2ZgCpg7
         VQr82VGpU0nTbnjaTJ1IZaXR267TrOrChbDjAQLk4cu/kcXShodpkcozpDoumfjPsmNY
         7EiuNwVO7OyQAhOfMozfsd9LTdFo3qp/TZpXEToDL4xXLJR9zm39VE0SnN1Jh4ztZmYZ
         mvlSZGU3Jjscq+TMu2ioH94W0RUDZkxGtFamWOE3dW5ENQCsLZcsDRQGSrjGI2V2Ikn5
         iH2A==
X-Gm-Message-State: APjAAAWNWFAAincEyeRUAinkIqFvl2uO/B+OM84hXRWfb9Cv34HCSutq
        TCuDJdvjoTEHcUvZS/DyEn4uVwZmYXIhf5zyOrQ=
X-Google-Smtp-Source: APXvYqzFAqNS4jqf9q9Sif0vs5CRpi2AisEP5HnrE6pv78YMGv1jwppU3+4u6ulCvBRYTjpjQ7qTO6jQTGJCsLUzEg0=
X-Received: by 2002:a05:6830:1b75:: with SMTP id d21mr2546762ote.145.1570622689199;
 Wed, 09 Oct 2019 05:04:49 -0700 (PDT)
MIME-Version: 1.0
References: <1569831527-1250-1-git-send-email-biju.das@bp.renesas.com> <1569831527-1250-5-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1569831527-1250-5-git-send-email-biju.das@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 9 Oct 2019 14:04:38 +0200
Message-ID: <CAMuHMdXGu6dR3F44V-krzVYDhsQR-gsDu6PfsgjV3iU-fVWPBw@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] arm64: dts: renesas: r8a774b1: Add Ethernet AVB node
To:     Biju Das <biju.das@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
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

On Mon, Sep 30, 2019 at 10:19 AM Biju Das <biju.das@bp.renesas.com> wrote:
> This patch adds the SoC specific part of the Ethernet AVB
> device tree node.
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
