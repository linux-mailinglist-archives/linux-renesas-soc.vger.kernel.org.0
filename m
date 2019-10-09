Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 95C95D0E99
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Oct 2019 14:22:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729566AbfJIMWd (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 9 Oct 2019 08:22:33 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:37329 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727286AbfJIMWd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 9 Oct 2019 08:22:33 -0400
Received: by mail-ot1-f68.google.com with SMTP id k32so1531461otc.4;
        Wed, 09 Oct 2019 05:22:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xC1UlE1u0JStb57nVPQ7CBGmDgiAu3OcmWsjU39D7TQ=;
        b=C5YfhMNwOn5rCl+jPAOyaQvqW+Lpk9u1Svhl1Ngyyznlv7Pp8zEIHR7bgdZ7vVDIsj
         4/cvbDdOI+LLgisn1l5EBrC27dyTmAbjtRKtbasLxWQu4dD7zgrL9abseGbueuX/LJLE
         Qx5NtAf5qNtxKSdoEYpOlQ0QWNIn5TSIt20+1/UkNj9/fL8L0JNUq6u0wqIusilfmav1
         foDaEgxCjbCjNMxYYyRiG4JMCXSQ5NqHKcpT8r2jrlQ2tF9LvTkazEt5d5HvGcvFoT1A
         DzrjayeSY8G+wdYiuSCYjTc3C6ekrPBuyUcZ9LCjgqxCLtwuqz5MSou1sAXhrHZXRD3O
         N5lw==
X-Gm-Message-State: APjAAAVlDEo3+TQitj1lTyaI3xLcxzXYbM73ZHwtkydxjwzuaCW5wpT6
        KK4TiWG8GS+hPxwW4MjvMok5D2xXEFk7HzttsGE=
X-Google-Smtp-Source: APXvYqyQGwipLgN1wicN2waQYaBVy7rTHWOXkeVYsQO7NAbqbXJmdsjjCVYhbuprpQIHEJDyquuYbEMDxYX5J1tTV6c=
X-Received: by 2002:a9d:70d0:: with SMTP id w16mr2433733otj.107.1570623750637;
 Wed, 09 Oct 2019 05:22:30 -0700 (PDT)
MIME-Version: 1.0
References: <1569313375-53428-1-git-send-email-biju.das@bp.renesas.com> <1569313375-53428-8-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1569313375-53428-8-git-send-email-biju.das@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 9 Oct 2019 14:22:19 +0200
Message-ID: <CAMuHMdWsncjG8CtfSZt4iC9ZvWWyM8sM9gmwRCaY_H=jhSn+9A@mail.gmail.com>
Subject: Re: [PATCH 7/7] arm64: dts: renesas: r8a774b1: Connect Ethernet-AVB
 to IPMMU-DS0
To:     Biju Das <biju.das@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
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

On Tue, Sep 24, 2019 at 10:23 AM Biju Das <biju.das@bp.renesas.com> wrote:
> Add IPMMU-DS0 to the Ethernet-AVB device node.
>
> Based on work by Magnus Damm for the r8a7795.
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
