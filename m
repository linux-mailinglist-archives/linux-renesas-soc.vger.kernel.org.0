Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 03914CE031
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Oct 2019 13:24:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728005AbfJGLYH (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 7 Oct 2019 07:24:07 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:44435 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727993AbfJGLYE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 7 Oct 2019 07:24:04 -0400
Received: by mail-ot1-f67.google.com with SMTP id 21so10574516otj.11;
        Mon, 07 Oct 2019 04:24:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WqZ0XzDlhlGr2a1UtHuNmSm/QkiyD/3AO/AvtUWGMvU=;
        b=ZruBQMLTkL2O+Ncgce5p7l2X8489/G2WVtVlnzmna+Jk9GxNbSlEyaYwV6An8249g3
         +tpBXU7bgRTFQNFGUrNilFP4BusC3mK7okNpkokufkxwNky3A0xAWVmD6yaWtSejmqJK
         YO+2zTrfM3Evz8kPmjeSXJzEwwLiEmn+XZuocEy7J2EIvnco2ZDKO4gJ9BtBJp8f0KgA
         caIxAVSZ3omHLvepe9tKIqN33so9iuubk+9S52vQqUXBANllunE3cgUIpI/YQln1mOPo
         H0FJ7FPBE5a0X5OMcqxNsUW9VLqXQ/qcg4qDO1U8EG4vsG08TeeJpOymZukFJ+/tj1Kk
         Vw5Q==
X-Gm-Message-State: APjAAAWgegwAbBSwnfPbE3f3FwJDbGOT0+oCzj1D7RGR0Ll0mddOaGgX
        LR+4kBdTBp2hAqkvsP65X2nUcLK4QBq/u48CFZ4=
X-Google-Smtp-Source: APXvYqwKsQE8YVPm8SadzZ9iSAkoysBnVWMPCezXYII+db+bef1DDM2wQFUwYqudzDMDtlKDPdsu5/eZiKvQtR7C2yw=
X-Received: by 2002:a9d:17e6:: with SMTP id j93mr20857794otj.297.1570447442614;
 Mon, 07 Oct 2019 04:24:02 -0700 (PDT)
MIME-Version: 1.0
References: <1570173363-4633-1-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1570173363-4633-1-git-send-email-biju.das@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 7 Oct 2019 13:23:51 +0200
Message-ID: <CAMuHMdUC8PgaJ=_bPDtTOeagtpnX_B19P63sYkZXGGqjNxw6bQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: irqchip: renesas-irqc: Document r8a774b1 bindings
To:     Biju Das <biju.das@bp.renesas.com>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
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

On Fri, Oct 4, 2019 at 9:16 AM Biju Das <biju.das@bp.renesas.com> wrote:
> Document SoC specific bindings for RZ/G2N (r8a774b1) SoC.
>
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
