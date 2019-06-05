Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5845F35D9D
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Jun 2019 15:14:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727870AbfFENOc (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 5 Jun 2019 09:14:32 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:35343 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727740AbfFENOb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 5 Jun 2019 09:14:31 -0400
Received: by mail-lj1-f193.google.com with SMTP id h11so23131723ljb.2;
        Wed, 05 Jun 2019 06:14:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=93d7tLmKQr/+IWt271KV3CzM8H0+HzHxWft12eizgEE=;
        b=TdZOxFRYT0NJCEt1fJgGSywZxfQAdZLoYLvyCu6X2msZRKC2mmulleOHqUQM5hXEDc
         15XhlVln4JV9h12e9hnS2GIFK/ku4bdiHcsD5VSOEZojZ2ZB9/Kz//uS5/EfiAGE4Uny
         3KfYt934c22Rf73q8u8jSuEZFuxtIm/pBoKs3HOlo9hMae5o2ZL+jJ6TQURtoLhNXflt
         XFlb24JvGvIzlPEwgbM7TXQ6faHq+HLYlIkE7togl2p7exQtIaOCwdxFA1TC4dl44HKg
         dE7an20RrN++3u5pJPnWf0vV1D21QgZfs8zwFZ7eaS2VBE6U5pJ4Tg3T/NWkzrL7HZE4
         iapQ==
X-Gm-Message-State: APjAAAV1E8EP7byuDRXEzDTgnWbUN0598Izb2vpjghnR4X55g1O0qmw3
        ZR6GJ+2RbG0FMgO5KdryCHbKmEnebklYObUuzTT/Eg==
X-Google-Smtp-Source: APXvYqwa2VfSdiPlN4JStotBu/pFtVuLc0kutN6yQCzbHu6GaL9AfZEt8YhhrvNY6yGGxXAc1P6By0nHjNmjOcEsGvI=
X-Received: by 2002:a2e:960e:: with SMTP id v14mr21250706ljh.31.1559740470139;
 Wed, 05 Jun 2019 06:14:30 -0700 (PDT)
MIME-Version: 1.0
References: <20190604200914.64896-1-chris.brandt@renesas.com> <20190604200914.64896-2-chris.brandt@renesas.com>
In-Reply-To: <20190604200914.64896-2-chris.brandt@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 5 Jun 2019 15:14:17 +0200
Message-ID: <CAMuHMdXocLb+d7Qv9=qe+bYG27pJO5sMUDkdWmj1WFqZ9JiQTw@mail.gmail.com>
Subject: Re: [PATCH 1/2] ARM: dts: r7s9210: Add IRQC device node
To:     Chris Brandt <chris.brandt@renesas.com>
Cc:     Simon Horman <horms@verge.net.au>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Jun 4, 2019 at 10:09 PM Chris Brandt <chris.brandt@renesas.com> wrote:
> Enable support for the IRQC on RZ/A2M, which is a small front-end to the
> GIC.  This allows to use up to 8 external interrupts with configurable
> sense select.
>
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
