Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DB80CBF349
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Sep 2019 14:46:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726354AbfIZMqG (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 26 Sep 2019 08:46:06 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:34289 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726209AbfIZMqG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 26 Sep 2019 08:46:06 -0400
Received: by mail-oi1-f194.google.com with SMTP id 83so1967531oii.1;
        Thu, 26 Sep 2019 05:46:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xbUM+zwEckrsI9HdGsT66xud/A2/3/zcfZM8ljcjHEU=;
        b=NuB56+3qzrHVr9xO68oDpTkqZh584n5Lt/+1Lf/J9Dxfnu66uJIxAjE6ZShj3CfH+P
         2wrRIkvDuX2YQfJHd6bIR2MkuKH5o1a8jTWTim48yDKRm3mT1B1iM8QP/dorr4P80D4H
         vDld2BwwseKL1CBWYjjain8yl+73Fdj5jJpeG9nkN+tEewj1IliwWNPWKYuIlp09TaiE
         sl7OggMu4z25aMpY74cyfL6QxrfTIfGL/DA9c4f4GH+OxTXnF2ibRNaDjzjpWdiwxiVQ
         NXZEaZwBEaSbWo2H6bjOIFDQzmVM8rtOVxen9mLdLMeLqJ+gE9L9NzABiyojNX8lSnES
         h2ZQ==
X-Gm-Message-State: APjAAAVYEPsWHGitzxkTuk3WmJsLhrSA3VadqcQALk+CzkOayGkdgXac
        s3vSnSS4f5t1C1xq2MbVmrsfmKvk2Yxb2+duO8w=
X-Google-Smtp-Source: APXvYqwHTnDQZ58LKu/l0rzoOT57MVy7pjRDqoXCr++7HLhzRiD6176jKB+p/Uigj4usCCBKIrtVZjRRqNLSnhijyKU=
X-Received: by 2002:aca:dad4:: with SMTP id r203mr2548202oig.102.1569501965706;
 Thu, 26 Sep 2019 05:46:05 -0700 (PDT)
MIME-Version: 1.0
References: <1569310854-37057-1-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1569310854-37057-1-git-send-email-biju.das@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 26 Sep 2019 14:45:54 +0200
Message-ID: <CAMuHMdWtH=1FAx=QNNxRV4YCmnRUNqwTUjr7-dRcQwCxtt5yDA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: iommu: ipmmu-vmsa: Add r8a774b1 support
To:     Biju Das <biju.das@bp.renesas.com>
Cc:     Joerg Roedel <joro@8bytes.org>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Linux IOMMU <iommu@lists.linux-foundation.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Sep 24, 2019 at 9:41 AM Biju Das <biju.das@bp.renesas.com> wrote:
> Document RZ/G2N (R8A774B1) SoC bindings.
>
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
