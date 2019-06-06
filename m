Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BC89D3712C
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Jun 2019 12:02:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727952AbfFFKCM (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 6 Jun 2019 06:02:12 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:33672 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726972AbfFFKCL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 6 Jun 2019 06:02:11 -0400
Received: by mail-lj1-f195.google.com with SMTP id v29so1426408ljv.0;
        Thu, 06 Jun 2019 03:02:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=m81Ou0XGG7I9SfwR21fkGVLykW9DoBiKbEWcv11+3Go=;
        b=ohM3QPizXheVM5zoHvGRU+OP7M/TGoszEgBpbM7XNWnePiXKoLIy41SazdAMC7b+bz
         iQcgimZfSoPnG258MewxyZsInsaUr0ghEwXFcokQS09Rg42UpfK9+/MWrvkS6VwSsWCP
         dy6I49rkVgJL/lDmiIx3hWinj2Qj2bG2kQK3qoq8M9VVY6imfYBZMue+OE5rJFy+PPLI
         0l5ki5X0l6DKvAS/bqltLbfMb62NJjyaI6qIgENIDkEvPWeAc8r9NgljlBIT1hUOhVMT
         Dt4ZWjjjZonMFndcby6yZeaY/jREP911cVDoO7Gd8FQCjW9tohiFFKQ4uWAlVyjzBkYh
         yGbw==
X-Gm-Message-State: APjAAAXMKNT0TjfOe0nT0VVEH6xZ6rf1lDSjLU6N6JaCiGmI287Z8Qqi
        MNlzf8H5fk4clCgwdieP3tYHCJhKR0/QB2OGlqs=
X-Google-Smtp-Source: APXvYqynZKmBiRteYaNlvFZNvkwpjqeQpgmvMv+E09i4SAFgHYfNG+PI3TxVc8ilUqEoAoMP/cPNa4Iysw7DmOSdoTY=
X-Received: by 2002:a2e:960e:: with SMTP id v14mr24378893ljh.31.1559815329654;
 Thu, 06 Jun 2019 03:02:09 -0700 (PDT)
MIME-Version: 1.0
References: <1559228266-16724-1-git-send-email-biju.das@bp.renesas.com> <1559228266-16724-4-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1559228266-16724-4-git-send-email-biju.das@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 6 Jun 2019 12:01:57 +0200
Message-ID: <CAMuHMdW=5R82QLZre5Azr4VKAXQn+gmavTBzRy7uGZmrVCWDsA@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: dts: renesas: Add HiHope RZ/G2M sub board support
To:     Biju Das <biju.das@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>, xu_shunji@hoperun.com,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, May 30, 2019 at 5:05 PM Biju Das <biju.das@bp.renesas.com> wrote:
> The HiHope RZ/G2M sub board sits below the HiHope RZ/G2M main board.
> This patch also adds ethernet support along with a dtsi common to
> both HiHope RZ/G2M and RZ/G2N sub boards.
>
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> Reviewed-by: Chris Paterson <Chris.Paterson2@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
