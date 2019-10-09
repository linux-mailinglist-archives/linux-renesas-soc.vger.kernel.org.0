Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 35516D0EF5
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Oct 2019 14:37:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729831AbfJIMhy (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 9 Oct 2019 08:37:54 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:33468 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729686AbfJIMhy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 9 Oct 2019 08:37:54 -0400
Received: by mail-ot1-f68.google.com with SMTP id 60so1576800otu.0;
        Wed, 09 Oct 2019 05:37:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6CwE+WleS72Cglq2ryyesM0awR2kSRD2Yxkluzn7APk=;
        b=V4XcxGZU4ITqNFPbWuvxOXqilCVHxGQH0w4Rq71e2fEfwWjG/s+NaImRqttwTVoNqH
         rsgR431PydtjTAijA/r8qPYkoQ8cdIbluTObU81wIB2I+D6J8GDFpJW6H7cVWvNE1mvA
         jmMI7OlQjNusphSfO2wUaDzgAXIl91y3W251HTkRGlWUN+pxaP6ESipeNAIVJHbxFhb2
         +J6AWXGTJKDNJC+DTSKPeQISXKSLDWqRXUAFnCVVzaQ8r2sV+XY1KmTUvXQzSlrGGuup
         F4Y3OIeDtAEsiQpl/L01KPBGsG9S+J5ibR2ZOSCff9w6RsNK9x4EOEBRZtqVjH6raPQm
         NGzg==
X-Gm-Message-State: APjAAAWjqZGooCE26DIZ2TdvwJTdPwzaP/NxCtMRuWFXJWLkE6B1O1k/
        Fkqg7m+64VCjruYMc11ExyQBi04gl53WRqwuHJjTJLJT
X-Google-Smtp-Source: APXvYqz5zw2Tt6D2rLTW+lX5UbJnIgsJKXgKxwXFD6DeSpxd/t7NC5YdV+EwbiruZ6Z37KEukRCmkal9wV8IPrLkV+g=
X-Received: by 2002:a05:6830:1b75:: with SMTP id d21mr2669103ote.145.1570624673208;
 Wed, 09 Oct 2019 05:37:53 -0700 (PDT)
MIME-Version: 1.0
References: <1570029619-43238-1-git-send-email-biju.das@bp.renesas.com> <1570029619-43238-3-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1570029619-43238-3-git-send-email-biju.das@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 9 Oct 2019 14:37:42 +0200
Message-ID: <CAMuHMdV82CtQkQeYyvNbhr43Mb_=xGtBk3CgxgySh8dLjVQ+Ng@mail.gmail.com>
Subject: Re: [PATCH v3 2/9] arm64: dts: renesas: r8a774b1: Add DU device to DT
To:     Biju Das <biju.das@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Simon Horman <horms@verge.net.au>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Oct 2, 2019 at 5:20 PM Biju Das <biju.das@bp.renesas.com> wrote:
> Add the DU device to r8a774b1 SoC DT.
>
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.5.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
