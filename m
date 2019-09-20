Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A117AB9186
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Sep 2019 16:19:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728821AbfITOTd (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 20 Sep 2019 10:19:33 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:39652 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728297AbfITOTd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 20 Sep 2019 10:19:33 -0400
Received: by mail-ot1-f66.google.com with SMTP id s22so6321489otr.6;
        Fri, 20 Sep 2019 07:19:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BzB31z3sVdWe77IeCnt9cm7LCOT5gYcMOK0stpI5ND4=;
        b=T8Pfl/DjS/tV/AFWbf/qxx/1aW3whFMP/q+tLBSsGj+lm6TBUU+yfLi2SGRzKBrjKN
         veeP92Wo0ZHFQ7x1Rw2mYWS+eCNVnF8ucP7u78awFYw8XRmWgO3ENtSEdDHEtWPy0enV
         /F5iZpfo3PRz85i0yYimDDSoxG5LnNyLzvicE0EJjmBiAuZW3q5YWbdZIkpk36zbwezo
         iRbL/5xKYRtU8kXq0uQznuuf5NXGYZTbF+d3qbqCxuvHz4fQleCLA7q9CXwJ4Jwt/eoT
         zNNhkbN+zwuvtqa8aQZqUkGcLH+1tdqU2ylXblL6cd/WxdS3zInY+oXWIdRzybF4kqnT
         EurA==
X-Gm-Message-State: APjAAAUSPqlZmsoebGXRE+dlEG96QyDZEizPVSy4gukPvuxC8lkyecMr
        J6i6M72uQpCgwkroSnLBrsc7yxZhw2EGWFtII1Y=
X-Google-Smtp-Source: APXvYqysdyZHTCbeSgdbJB9LG0YGHkhr58DoXCPYCu9RXMEygbkbDs0zbac8xRtfJxl+BeYi1lx9Tb011UOS6p2pwbI=
X-Received: by 2002:a9d:5784:: with SMTP id q4mr10945574oth.107.1568989172838;
 Fri, 20 Sep 2019 07:19:32 -0700 (PDT)
MIME-Version: 1.0
References: <1568881036-4404-1-git-send-email-biju.das@bp.renesas.com> <1568881036-4404-2-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1568881036-4404-2-git-send-email-biju.das@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 20 Sep 2019 16:19:21 +0200
Message-ID: <CAMuHMdVgXrq74xCC1q9GKpxLo5-xWdibtvaYXXSuAbhjgOf8JA@mail.gmail.com>
Subject: Re: [PATCH v2 1/8] dt-bindings: power: rcar-sysc: Document r8a774b1 sysc
To:     Biju Das <biju.das@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
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

On Thu, Sep 19, 2019 at 10:17 AM Biju Das <biju.das@bp.renesas.com> wrote:
> Document bindings for the RZ/G2N (a.k.a. R8A774B1) system controller.
>
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.5.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
