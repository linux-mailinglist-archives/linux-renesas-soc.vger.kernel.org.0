Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D573D370D2
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Jun 2019 11:50:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727922AbfFFJu3 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 6 Jun 2019 05:50:29 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:37421 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727829AbfFFJu3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 6 Jun 2019 05:50:29 -0400
Received: by mail-lj1-f194.google.com with SMTP id 131so1385598ljf.4;
        Thu, 06 Jun 2019 02:50:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DNX+Ts9WPtQYgcnm+9eAeCHQbn5os1RzU+aXajFNx8M=;
        b=AcMkR0QZBVtK1+lzEYKaO0qon/h8JSXApWxw2qHLzoMNTHv5mQ81cZtNIQx4xDLU8Y
         OQQDb81hrZ+BTXJsM8sN/JP/0ui88edO5PiGDQDICHvkZlak7THK+Qjp2XnFN/vV7Jr3
         zR4HU/anAvkPistfPDjIJE3RG6hidG4d4qBvX1UfNMkl6TENWh18blz53Ab5reBsqD1y
         0y5o1NHWWvdNhAPhnNKfhMnQh0pVTK9nkyOX+wWI62tMTSPgXTqI4roYVLo5XMeqtmt0
         6Tvff1CzU0abMRCE/rEgUkk145aohJmE/jW5OKTN52VdFXmJgv1CmMs36pUq3k5Qk92V
         U8OA==
X-Gm-Message-State: APjAAAX5UEL+QA9VFRnd5gxv4lXEi7+QRilD5tC5I/2/KendmgpoWsnn
        kHvhHIelhPJZ6/C02VyTs7dWxVTwQXKA/n9S9iA=
X-Google-Smtp-Source: APXvYqxGUsg72LTflHixT9Icpou42+4NdCNIalceAsjTo0vFz0n0Yt5R8HYly3nA547PVvUio49MLKElzw+JBpTh7LE=
X-Received: by 2002:a2e:91c5:: with SMTP id u5mr12902756ljg.65.1559814627301;
 Thu, 06 Jun 2019 02:50:27 -0700 (PDT)
MIME-Version: 1.0
References: <1559228266-16724-1-git-send-email-biju.das@bp.renesas.com> <1559228266-16724-3-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1559228266-16724-3-git-send-email-biju.das@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 6 Jun 2019 11:50:15 +0200
Message-ID: <CAMuHMdVubg9CDLswdR30AMpG5_FELWGBtiFqo3XYa=jGhaFLSw@mail.gmail.com>
Subject: Re: [PATCH 2/3] arm64: dts: renesas: hihope-common: Add pincontrol
 support to scif2/scif clock
To:     Biju Das <biju.das@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>, xu_shunji@hoperun.com,
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

On Thu, May 30, 2019 at 5:05 PM Biju Das <biju.das@bp.renesas.com> wrote:
> This patch adds pincontrol support to scif2/scif clock.
>
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> Reviewed-by: Chris Paterson <Chris.Paterson2@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
