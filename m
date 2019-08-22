Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 645DE98C41
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Aug 2019 09:12:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729829AbfHVHMR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 22 Aug 2019 03:12:17 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:45264 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726332AbfHVHMQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 22 Aug 2019 03:12:16 -0400
Received: by mail-ot1-f67.google.com with SMTP id m24so4508630otp.12;
        Thu, 22 Aug 2019 00:12:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NknsyWkZ+xBVq2BmTNJUVibRVuu5kMInH32as/5ZjAU=;
        b=cLa5zT8AJFQJFdvFjZfv8oUE+ahDdVtpRcrabebAGZjnrmgnADVA0N6JIRGwzVkstn
         9xe8KJys5dtckQqAGHxDk6fGdvu35Oqr2R26P5RC4dLULvgMOHpi+afmeKZbU7vA57y3
         KbvVRaByXI7PY0WaLddTifuX/YEUTDn7S8AdTa1IacoBo++swCuVeRuDEMFylBWQp6Xx
         TdqKzmFM5XQJ/DmB2ERzGN4h9RPWT1DCNHwHd64X1xrYzyFiUNFE3RHJ6zyvtcxU2nLk
         D0blVoMml4boVwPQ/dwORHpb5siOxC/w/myeJdG+9d8Z3m9pQ95ppiBTVcIJTrihkw/V
         3azw==
X-Gm-Message-State: APjAAAVLVTFjtHcEKmx9ph7yDVV8V01ohpAUXIlmz57O4RZHz0hLzSDX
        5yIQ+MIy3a7YZl8Orz+33Wr8fXb83gMbycnV20o=
X-Google-Smtp-Source: APXvYqzb1u4mrLRs50aYq9h/RGQbypEZgWcFgLI22he5CrkhuQHi5h0fcP0VS/bOhS2B8MnnbU9LXigUmfwCRmrHj7E=
X-Received: by 2002:a9d:7a90:: with SMTP id l16mr30789258otn.297.1566457935726;
 Thu, 22 Aug 2019 00:12:15 -0700 (PDT)
MIME-Version: 1.0
References: <156630449239.17444.11157306180861080402.sendpatchset@octo> <156630456771.17444.15687151782258703992.sendpatchset@octo>
In-Reply-To: <156630456771.17444.15687151782258703992.sendpatchset@octo>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 22 Aug 2019 09:12:04 +0200
Message-ID: <CAMuHMdU6k5BJopgwTgKVVpbmmdN+nj24H5YUiJM8wCNP0fT9zQ@mail.gmail.com>
Subject: Re: [PATCH v2 7/7] clocksource/drivers/sh_cmt: Document "cmt-48" as deprecated
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Simon Horman <horms+renesas@verge.net.au>,
        Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Aug 20, 2019 at 2:34 PM Magnus Damm <magnus.damm@gmail.com> wrote:
> From: Magnus Damm <damm+renesas@opensource.se>
>
> Update the CMT driver to mark "renesas,cmt-48" as deprecated.
>
> Instead of documenting a theoretical hardware device based on current software
> support level, define DT bindings top-down based on available data sheet
> information and make use of part numbers in the DT compat string.
>
> In case of the only in-tree users r8a7740 and sh73a0 the compat strings
> "renesas,r8a7740-cmt1" and "renesas,sh73a0-cmt1" may be used instead.
>
> Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
> Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
