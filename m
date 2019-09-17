Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AEFDFB4EC1
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Sep 2019 15:06:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727383AbfIQNGw (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 17 Sep 2019 09:06:52 -0400
Received: from mail.kernel.org ([198.145.29.99]:52362 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727338AbfIQNGv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 17 Sep 2019 09:06:51 -0400
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3243F218AF;
        Tue, 17 Sep 2019 13:06:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1568725611;
        bh=ZHIePGln3f4h07VukY0MeVhuUP5fwb7l29HzhWWd+ow=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=JAlJT20sTa2zdk54zgz8tx/Q5mf7OHyTAW1t/0/CEnkce/q1nSeD/Cu1ZJ7rSEntH
         0Mt//EVsO387NnByBgGPVTOR6AdYcN3qPmHMf3cghxcV6pN9jqe6EN38rZxXba+1/v
         D9RoL9Fb4fbykkbzOVtb2/l9Y6axCk/ZGY4AoArw=
Received: by mail-qt1-f180.google.com with SMTP id j31so4291677qta.5;
        Tue, 17 Sep 2019 06:06:51 -0700 (PDT)
X-Gm-Message-State: APjAAAUthIHqKzGcZuIhGylWWjLu7AAIGlZaH44beLRZ1tZd8mTIzDpf
        SM+3aC6/k5ZThNDIMyEK4SradtS+xuiJutX9pw==
X-Google-Smtp-Source: APXvYqxnS0Z5LmkDuQ50y6Gr4mI8Kgy0qSiRhYSoIZh0SJy6AW488AB8oDYlSbtoB2ySP/ohUFmAtoK+kR+slsdpxlk=
X-Received: by 2002:a0c:9e20:: with SMTP id p32mr3037773qve.39.1568725610350;
 Tue, 17 Sep 2019 06:06:50 -0700 (PDT)
MIME-Version: 1.0
References: <1568724492-32087-1-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1568724492-32087-1-git-send-email-biju.das@bp.renesas.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Tue, 17 Sep 2019 08:06:38 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJHtThoDphNt+iTkeU7E7Ojr=sVVMz95-r95OEd7XpS8A@mail.gmail.com>
Message-ID: <CAL_JsqJHtThoDphNt+iTkeU7E7Ojr=sVVMz95-r95OEd7XpS8A@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: arm: renesas: Add HopeRun RZ/G2N boards
To:     Biju Das <biju.das@bp.renesas.com>
Cc:     Mark Rutland <mark.rutland@arm.com>,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        "open list:MEDIA DRIVERS FOR RENESAS - FCP" 
        <linux-renesas-soc@vger.kernel.org>, devicetree@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Sep 17, 2019 at 7:55 AM Biju Das <biju.das@bp.renesas.com> wrote:
>
> This patch adds board HiHope RZ/G2N (the main board, powered by
> the R8A774B1) and board HiHope RZ/G2 EX (the expansion board
> that sits on top of the HiHope RZ/G2N). Both boards are made
> by Jiangsu HopeRun Software Co., Ltd. (a.k.a. HopeRun).
>
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> ---
>  Documentation/devicetree/bindings/arm/renesas.yaml | 8 ++++++++
>  1 file changed, 8 insertions(+)

Reviewed-by: Rob Herring <robh@kernel.org>
