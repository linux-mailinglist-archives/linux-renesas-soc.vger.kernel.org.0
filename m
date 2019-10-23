Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 50720E12F4
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Oct 2019 09:19:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731524AbfJWHTs (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 23 Oct 2019 03:19:48 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:40404 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388218AbfJWHTs (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 23 Oct 2019 03:19:48 -0400
Received: by mail-ot1-f67.google.com with SMTP id d8so5342452otc.7;
        Wed, 23 Oct 2019 00:19:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IJM538QGULV0yrGWRkYjucTY4pfTVAVqowSX27qxGcI=;
        b=lX8iiTwu31DjjIZxfgeHcrLGw7xey8M9UOnBBInxmY9fEFBl6j/yxBRVCwSbXJf3y/
         JavXl1zH0bEDv3e/3MU2LuC2Cc8cKjxbhnCC+oB2ktfyrmBKgOVvjMor8og2f7BjrP6p
         RdwlKjqglteCGU4Un6jR500VWTOztSVac15zYLbgZrrpP5wMlsxCCEAh6BTyx8cKtEzM
         /1ChZwuWJpCht6k0iMOEEHUdd7Zxb2QE09NpOsq7ML39XupQIz1wreFetOvOnmArBmbl
         qr2x5HhFXKEAUdeCLYTNdd03jhqwjRnMAG2gi0lCJDd+RUqU5lCZP8JIBnpV1NR4is2Z
         mFxQ==
X-Gm-Message-State: APjAAAXO01mnbomajnU3LULAfNW0vW/rrmDxZAwHXsphqlGiXZjqu2aq
        t41hWtgpwvsO6Djw0SMHxIeerIt3PZhz8YP37eA=
X-Google-Smtp-Source: APXvYqyezP/IJtJGFbND0BnrS7vBOKCGGe2gKuP0Gg18dh7D0xWZJ0cBvY2EKgMpfNdQkOxkWdXGGjzLs4kBXeQmzXY=
X-Received: by 2002:a9d:422:: with SMTP id 31mr5644316otc.107.1571815187625;
 Wed, 23 Oct 2019 00:19:47 -0700 (PDT)
MIME-Version: 1.0
References: <1571761279-17347-1-git-send-email-fabrizio.castro@bp.renesas.com> <1571761279-17347-2-git-send-email-fabrizio.castro@bp.renesas.com>
In-Reply-To: <1571761279-17347-2-git-send-email-fabrizio.castro@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 23 Oct 2019 09:19:36 +0200
Message-ID: <CAMuHMdVggP40u8_+9yZFAO5_E0_qbnDM5hy1k+n6RWkYKOssYw@mail.gmail.com>
Subject: Re: [PATCH 1/2] ata: sata_rcar: Add r8a774b1 support
To:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc:     Jens Axboe <axboe@kernel.dk>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>, linux-ide@vger.kernel.org,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

dt-bindings: ?

On Tue, Oct 22, 2019 at 6:21 PM Fabrizio Castro
<fabrizio.castro@bp.renesas.com> wrote:
> Document SATA support for the RZ/G2N, no driver change required.
>
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
