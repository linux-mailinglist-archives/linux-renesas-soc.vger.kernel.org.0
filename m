Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 70F384A159
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Jun 2019 15:01:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727584AbfFRNBA (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 18 Jun 2019 09:01:00 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:46921 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729062AbfFRNA7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 18 Jun 2019 09:00:59 -0400
Received: by mail-lj1-f194.google.com with SMTP id v24so13004093ljg.13;
        Tue, 18 Jun 2019 06:00:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YkYzZ6Vk7JQd0lMlOxPrAQbv3mFBIZdHpy6QfPOEsGA=;
        b=KCrKe0bY3lye5gWXYn9ZVWiT6uzlh/mnwM4ncJO3/F5/kHtCXGFQ/UnN8646WmfEOJ
         PKgELDlu8T3ELtvzFcIWqyN114tzGtbe0KoDMYONnLeLNPeDMv/8wi9xcC29SldW51SN
         Yk4RyZ/zZZTxB6jprLKXoZ49OJlfEpkxWKqQ+WEz0JPEA3Kj/oxCQwUNYpUhE6LMZ9Zo
         HAfsc496ihrtE1/UvY0CPKsTOsNOX+MpFRuXCvFjglD/eOup3JoA56bKdSPuHOXCHR0+
         8IR8sJjaLCkcfRgpT6JhkqVz9EEovrF/d2G4A444Z0179oQ5iXinZ5kUP/wwK1JT+kYj
         uwGw==
X-Gm-Message-State: APjAAAWJdqGHhIcMCsA/OA9wePBt/xS8WA9OouYyID9fGq7C051nTKB1
        8NSqZFH0EnOLUo3tjVIY1/wdjXLMKlYX0UA/7G4=
X-Google-Smtp-Source: APXvYqx/VqV03mCqbsT7ZwbJOAcvuD9fyAn0ea7B9tFxc5RqfU7vh6IcdA5/6yW/3jsuwu1EgkBxnGyhPblWdgYyJhM=
X-Received: by 2002:a2e:9685:: with SMTP id q5mr14488032lji.227.1560862858080;
 Tue, 18 Jun 2019 06:00:58 -0700 (PDT)
MIME-Version: 1.0
References: <156076216767.4736.16337667537984218274.sendpatchset@octo> <156076220389.4736.5742093495634461883.sendpatchset@octo>
In-Reply-To: <156076220389.4736.5742093495634461883.sendpatchset@octo>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 18 Jun 2019 15:00:44 +0200
Message-ID: <CAMuHMdXkG8HSuzrSKe8k_dTFMBiGth-CsqyLxFiafq9zEA4ccQ@mail.gmail.com>
Subject: Re: [PATCH 4/8] dt-bindings: timer: renesas, cmt: Add CMT0 and CMT1
 to r8a7795
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
> the R-Car Gen3 H3 (r8a7795) SoC.
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
