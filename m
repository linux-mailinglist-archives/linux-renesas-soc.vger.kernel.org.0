Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6D8E14A166
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Jun 2019 15:02:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726091AbfFRNCB (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 18 Jun 2019 09:02:01 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:34607 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726007AbfFRNCB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 18 Jun 2019 09:02:01 -0400
Received: by mail-lj1-f194.google.com with SMTP id p17so13060598ljg.1;
        Tue, 18 Jun 2019 06:01:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NFzkrAzSO8YXePtG87oO3te5x8Q1LwvBWa3CPTiiG2Y=;
        b=szcSYAr3QO5i9ZMY5WGTcWD1q3B6lAZYWgHx2aTinCkrezzzQphTBL/IwxBEICvZTZ
         KBJif/R/cJNItDTni/eeeDPUzl2fjzy2FoW9EHJvMi33KKes+pj+iLp+HFYwtXnMzRvz
         A8xj/ZgSjH4TT1MIgWiqrRV8JcYyhJ8jhx19sKy6X+GcJq/l2h8AeZ33Ot0ZHLfypsGl
         d2DmA8gS+VX3y5wUQWrD3xVG4TGjl1fPjDbxujy37WDj0C/5NmxbPgQUaT4bLF4BZT4d
         eD384QimCbzLRDvxPhTQnWpAleKNf27QICpkFUBl6JotNFSKMGQxlW+WjVwc7VR4AWzf
         sn5A==
X-Gm-Message-State: APjAAAVtWjDoUpyuO/jE6ZRqTzwRFloE5NoicU5icVuEOAgP/s8//RbR
        qRQrgyf0fIOdBwNSGmPDAT9id8OgZjcdPU8A2pY=
X-Google-Smtp-Source: APXvYqygAzJvzeuExAaYG/P3vnTdOVJpTzhSSISYg8murQ2LKIQEC58tCCaIlHlURIupDmc+PA4VXa1h7KCYE/hVYGE=
X-Received: by 2002:a2e:2b57:: with SMTP id q84mr16047011lje.105.1560862918545;
 Tue, 18 Jun 2019 06:01:58 -0700 (PDT)
MIME-Version: 1.0
References: <156076216767.4736.16337667537984218274.sendpatchset@octo> <156076221311.4736.11788780573341776795.sendpatchset@octo>
In-Reply-To: <156076221311.4736.11788780573341776795.sendpatchset@octo>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 18 Jun 2019 15:01:45 +0200
Message-ID: <CAMuHMdXzOzUjA67yk9qaRHdVS_kYhYw=5F5bTj0cgTasO=fFEg@mail.gmail.com>
Subject: Re: [PATCH 5/8] dt-bindings: timer: renesas, cmt: Add CMT0 and CMT1
 to r8a77965
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
> the R-Car Gen3 M3-N (r8a77965) SoC.
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
