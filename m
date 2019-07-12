Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CB20566FD2
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jul 2019 15:14:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727494AbfGLNOq (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 12 Jul 2019 09:14:46 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:38102 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727189AbfGLNOp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 12 Jul 2019 09:14:45 -0400
Received: by mail-ot1-f67.google.com with SMTP id d17so9396980oth.5;
        Fri, 12 Jul 2019 06:14:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mCDTZrnw2ZqJecI7/4B5QXCRnwkaHfr+IJlociDFsMg=;
        b=lvxWZv0Bp9jTksgH4nrvlC4fYaJSS5ZX4UHrz3loIithcPtw7SYn0n8Ss1iwcKjKsG
         ZxBiUoOSKug/IBB5XeOhjXisREdePAdzNO1uNOiP3vxnKFpG6/jWknbYmKmrQ6ieh7oh
         oeEJypxyMw5jhMtSdOrYvCzMzu1YEuTNBM0kzgsTUgKOVs0RPYEusuu1RZg0dC5VCuHa
         i3OmdcJsdmOq7S8JJTgIUiZpX5E5Kq+xmP0VxVBetyH8im1vh4Vs6GliLJICswGYPPmy
         L/arauBJKxF6LMYKVmsFi9UJCxWtnQHVpfyqvDVEmUWZVzxOn7PmYHg3UKbN6l4kfMXH
         CTzA==
X-Gm-Message-State: APjAAAWOSzciwu/77QdJedVznXzV92QLMnwzkeadUjdtNGpKW7JZNdNf
        5VWFNHqyQu7vJ1GHIcroDnjrxVnWs+gbC6YAgZQ=
X-Google-Smtp-Source: APXvYqwBqWEnAC92lUmqhaHGiE00scu20tsCv5T5Gj/I6f5hDMXSPxetTkOIP/+eIFZgjQKRnrOzjIofy5YXXscg9Wc=
X-Received: by 2002:a9d:7a90:: with SMTP id l16mr8530437otn.297.1562937285003;
 Fri, 12 Jul 2019 06:14:45 -0700 (PDT)
MIME-Version: 1.0
References: <1562333979-28516-1-git-send-email-fabrizio.castro@bp.renesas.com> <1562333979-28516-2-git-send-email-fabrizio.castro@bp.renesas.com>
In-Reply-To: <1562333979-28516-2-git-send-email-fabrizio.castro@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 12 Jul 2019 15:14:33 +0200
Message-ID: <CAMuHMdWqpyC5=nA_pFM9Y-9LbU83xDHL1jN1OUA1mAbx17Sycw@mail.gmail.com>
Subject: Re: [PATCH 1/3] arm64: dts: renesas: r8a774a1: Use extended audio
 dmac register
To:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Jul 5, 2019 at 3:39 PM Fabrizio Castro
<fabrizio.castro@bp.renesas.com> wrote:
> Basic audio dmac register only supports busif from 0 to 3,
> in order to use busif4 ~ busif7 extended audio dmac registers
> need to be used.
>
> Based on similar work from Jiada Wang:
> 7a516e49d975 ("arm64: dts: renesas: use extended audio dmac register")
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
