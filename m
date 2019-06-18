Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B400C4A146
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Jun 2019 14:59:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726446AbfFRM7N (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 18 Jun 2019 08:59:13 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:35014 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725988AbfFRM7N (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 18 Jun 2019 08:59:13 -0400
Received: by mail-lf1-f66.google.com with SMTP id a25so9195872lfg.2;
        Tue, 18 Jun 2019 05:59:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WUbWEk1zXKCoyE3lsLMt2cmv9NQdb7rFeXfvWkdSlaU=;
        b=KKRR/vm3bULK6d9lMO8da293jIdPo7Xdw/sgr4TQq2G3ILTCCpyMyvBn30BNe98//W
         gIEQCbLJxEUCAL0RsaFUgeR787g3e3UVUn5TsVkRHNjZkpCHwPR2Zy6aVUXKVu8gbCT3
         lMUS3jlUbDksOseUI5kW07Y3G8Slo4sDuPR1f093TwsT/LIyrJ/tHTURzXQp/Ujf6wj8
         VpyM1B3RswrGxJIKYNctveNrZ5nfsMyoWkA0XTsoLfQ5TfGf2aAM7k6i4bV4Ly7G1hiw
         KUM1bAnI66yn7OCpI383+7rcywDNZTfS1J7uQ6Efk8n6FHYTsDnVxiHlelshtqym3GgZ
         qUag==
X-Gm-Message-State: APjAAAUj4itvmHPZo5x/wgRmE3ye5/NVeHkDivBVmDy2ici5TChxNwui
        VYOEz0YKH8Pkg7y9+5LYwzxmbvze49a0c7J/4j/f7w==
X-Google-Smtp-Source: APXvYqxB96wb2u5p/MDZa7WkG2EDSYidqvr5W5f5b1Ra5X5RHhHjZeqS4nOng6yhqJuf8m7ClK5CQcmT5VRLhi5ts6U=
X-Received: by 2002:ac2:44b1:: with SMTP id c17mr10770798lfm.87.1560862751115;
 Tue, 18 Jun 2019 05:59:11 -0700 (PDT)
MIME-Version: 1.0
References: <156076216767.4736.16337667537984218274.sendpatchset@octo> <156076219472.4736.14727682068388338615.sendpatchset@octo>
In-Reply-To: <156076219472.4736.14727682068388338615.sendpatchset@octo>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 18 Jun 2019 14:58:58 +0200
Message-ID: <CAMuHMdU08k3u=9sTqG-hADabdastZdAw4atZxV3d_LcXMYrUxg@mail.gmail.com>
Subject: Re: [PATCH 3/8] dt-bindings: timer: renesas, cmt: Add CMT0 and CMT1
 to r8a7792
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
> the R-Car Gen2 V2H (r8a7792) SoC.
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
