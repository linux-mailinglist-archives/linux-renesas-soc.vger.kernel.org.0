Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C70F166F47
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jul 2019 14:54:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727279AbfGLMyl (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 12 Jul 2019 08:54:41 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:36189 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727057AbfGLMyk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 12 Jul 2019 08:54:40 -0400
Received: by mail-ot1-f67.google.com with SMTP id r6so9343042oti.3;
        Fri, 12 Jul 2019 05:54:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=feDbdkSVTosWDez5MLubLp1GBzoWIw6qYC5Za/vxjV4=;
        b=a8EjjIIwCllHS91A+am5rC6fXAzth2NEeEbCjfC4hUS/tQac0OMu5l55gS4XZ/KRJH
         ui5e9ED+dveoG1ejoCyRwXh7CeizfICMRZZiVkxsoBpotwQ1kutRVIslwyFtw7xb4Iam
         WlXAQ+UTVvFLccCFOnSgwJ1Fhbx77pAcMk+aotnoz7WP6X8c4zjgbJTqCEhkempIyC05
         UxG3SpsATIltQoSPEVU9Wx6v12Dja+fqZDrrAxHHBQmYa3/KT23v2IXEkxhZlbw6zYEH
         OMEA6yoRAg1I2o0rJtPvm42ijWOekhmTvvczY4BrgpeCNj7BJ/hBjyML2vnv3RCUgPTZ
         g7AA==
X-Gm-Message-State: APjAAAUtJ+p7UztZwXRYn1YWPoUBjxuJv50iUVZPefZoyVktdxeIfye5
        kYGkaMHfrE5aboQETLBr0Djxp+zzAoY7kZRt4f0=
X-Google-Smtp-Source: APXvYqzrCfPmuG9cPm5Ik6O7axxU31y7JMykE3rvw8afQOpH81k2YF8MdfXKpeylwEtRmCl6CgHI40Pg+vgnsgZCzZw=
X-Received: by 2002:a9d:69ce:: with SMTP id v14mr8564582oto.39.1562936080300;
 Fri, 12 Jul 2019 05:54:40 -0700 (PDT)
MIME-Version: 1.0
References: <1562321720-18735-1-git-send-email-biju.das@bp.renesas.com> <1562321720-18735-4-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1562321720-18735-4-git-send-email-biju.das@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 12 Jul 2019 14:54:29 +0200
Message-ID: <CAMuHMdWbZo1WK-fVGEXFwnjJy8ubazvq4aniCh1i5zw8m=-pVw@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: dts: renesas: hihope-common: Add WLAN support
To:     Biju Das <biju.das@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
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

On Fri, Jul 5, 2019 at 12:20 PM Biju Das <biju.das@bp.renesas.com> wrote:
> This patch enables WLAN support for the HiHope RZ/G2[MN] boards.
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
