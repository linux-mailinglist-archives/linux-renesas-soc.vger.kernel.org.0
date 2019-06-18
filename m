Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C81E44A16C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Jun 2019 15:02:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726047AbfFRNCq (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 18 Jun 2019 09:02:46 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:38631 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725913AbfFRNCq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 18 Jun 2019 09:02:46 -0400
Received: by mail-lj1-f196.google.com with SMTP id r9so13049646ljg.5;
        Tue, 18 Jun 2019 06:02:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CDqHm8+ip6SCQ3I5gh8lgmTeuHMzPoC3O3WIFWj375M=;
        b=Mi2sunjZ/HEexEdH712O1UDtCJSYzo/jA3zOjPjYMOkUtsU6eq8bn+y+WGFADywTOR
         SV40AXAGrpIhAQP5VOKj2EP4NEaVaSgjMn85+NxmWEtGBiJE2QklSvN1UkfeKqpKmvMr
         HmIGj95ND3MshZH/+A3sjqePabonzNY+zZXGowfzOF27UvSGfzlMdEpEVtTinc0Humlp
         DCIJdqOCz6A1hvt0dm3qWy9EdaNEHsTbf7IA5riZRQSunlZN22tAA70YtiMNNO7oNTui
         C7Qh/AaLOIAlCWQ0O9nnM4I4b7tomWzhpA3XYrO6U+OHQf2497U8E9lS75jaOLU6BS2m
         eSCA==
X-Gm-Message-State: APjAAAV86qHpd/hN5AblrsfhNAblWrzk9Hu86doGV5h+uGSzNHtrQnQ3
        uBnLefV4coz/Pa5hsS77zLTYQQnyLmGUO2/A9ag=
X-Google-Smtp-Source: APXvYqylXzCGOiF4DVuDdOtbtX25/thk1AsNjLCYhJb0QyEONIrz81/WbGmTmNymerZx5sUFX+M9TI/wJo7cDEZ3TLA=
X-Received: by 2002:a2e:b0f0:: with SMTP id h16mr39252710ljl.21.1560862964837;
 Tue, 18 Jun 2019 06:02:44 -0700 (PDT)
MIME-Version: 1.0
References: <156076216767.4736.16337667537984218274.sendpatchset@octo> <156076223184.4736.11067127180512614106.sendpatchset@octo>
In-Reply-To: <156076223184.4736.11067127180512614106.sendpatchset@octo>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 18 Jun 2019 15:02:32 +0200
Message-ID: <CAMuHMdWMLWqQS9n9W1q7x4A8x_88cDrSQfoK1t0deTQx3HG=Fw@mail.gmail.com>
Subject: Re: [PATCH 7/8] dt-bindings: timer: renesas, cmt: Add CMT0 and CMT1
 to r8a77995
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Jun 17, 2019 at 11:02 AM Magnus Damm <magnus.damm@gmail.com> wrote:
> From: Magnus Damm <damm+renesas@opensource.se>
>
> This patch adds DT binding documentation for the CMT devices on
> the R-Car Gen3 D3 (r8a77995) SoC.
>
> Signed-off-by: Magnus Damm <damm+renesas@opensource.se>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
