Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 046D941D0C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Jun 2019 08:58:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407696AbfFLG6F (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 12 Jun 2019 02:58:05 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:36286 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2407716AbfFLG6F (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 12 Jun 2019 02:58:05 -0400
Received: by mail-lf1-f66.google.com with SMTP id q26so11203489lfc.3;
        Tue, 11 Jun 2019 23:58:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mMxYwsXSiAM3aFPR8WGujvmOFv5SJC3VffNuExM8RmE=;
        b=N323JRIB0wFgttjjU3S/o7Uu+KiLstGrI+TOi+v9+QtPwpkmVqFYNeQSMBO4EjdtMR
         aifTHe3XusQIL4z+N2j8TnooKqxrC84e4gXMtVl9z4DrimU2N0YEO8VbtLoQ4XKdYk+Q
         62dVNg/plGozWkGQgrbiN5/CvXt4G4K8MfpyguzWyD6/8UbYDWkM+Isp+Qhd2dhT3mSr
         UXhojLc77kcxcEmwZecpPVNYwzW5fy4Xb9v43EHPXCX4C8CgsyKOzzUkIQzoilXLYA9S
         csxqD4Heh3+kGAZKBFDSZxg0eTHX57LSxavYkX1vPEgsZCJwYAZkDqseYfuFOt/LqWmU
         9i0A==
X-Gm-Message-State: APjAAAVVKn+gz7CQHPnGqRcItCrrCym4qtFU8ciBXDY6ZTmXdxo2KA70
        k8/EHt2+/HkOweVdrXZy91JMumMZaliyrm2dYy+TqA==
X-Google-Smtp-Source: APXvYqzQBliPXhGscDLHOCgcGCYIoJilBXoyVt8UpkumQhJg6rf7nQfoyixwqXjkfr3/qVGwj5JXINQWQ/xtH0k40u0=
X-Received: by 2002:a19:c142:: with SMTP id r63mr43326074lff.49.1560322681984;
 Tue, 11 Jun 2019 23:58:01 -0700 (PDT)
MIME-Version: 1.0
References: <1560241338-63511-1-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1560241338-63511-1-git-send-email-biju.das@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 12 Jun 2019 08:57:49 +0200
Message-ID: <CAMuHMdVwoEsoTpQspHda6LnuT8Wc_Fg-koNiQ96NMMqBjoM0rA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: hihope-common: Add RWDT support
To:     Biju Das <biju.das@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Jun 11, 2019 at 10:27 AM Biju Das <biju.das@bp.renesas.com> wrote:
> Enable RWDT and use 60 seconds as default timeout.
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
