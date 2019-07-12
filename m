Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4815966F1E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jul 2019 14:47:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727027AbfGLMrH (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 12 Jul 2019 08:47:07 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:38279 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726449AbfGLMrH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 12 Jul 2019 08:47:07 -0400
Received: by mail-ot1-f65.google.com with SMTP id d17so9317088oth.5;
        Fri, 12 Jul 2019 05:47:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NpqJEV86CcXn0SAwvZLZu8iEc8cby9TMMy0iaiPji0s=;
        b=K6YCDj1yzh+gr90obAgFdz59Ac2lgsQFLapcNZpz6sAxo4cRSE8/0aRFzdt+/pX2N8
         Mwz5Dq90kYe6aIjIM7zDg8kiZlfbG13J8uEVOBnuHRxl2NFTft/WU80ylwY69hTApnj8
         OZ5xk0lWfOmpojk9DUYTIAMulgBuzQexA0Cm3t6GeXIW9fm/jCPL3C9lyngohnseWScO
         Ts9DYOoTaEnfYByXppbrxT2FKSGqOez9J56AOxpONPteShYo1BHTDeOV3otjVlO4EKG1
         i0cutJHZG07i31b1XUoRbK/mjVepelFjjaD7Gr7U8rWsSjTTnu4sLGr2idH8K0lIuIL8
         DMqw==
X-Gm-Message-State: APjAAAUviVD8hCvP0GIe6DRve1ddaMa3IVwBBODp5v0o7hAkTx04SGIp
        OdJTXRpMjGj6IZx/6igE/ghpQAkC4k12+Qk/OlI=
X-Google-Smtp-Source: APXvYqyu2r56Yrp+4elGCEF9bhs0Uobt2GKSq22iffvi0tmCkdePpyJCn/e3Xkz9qevQRjh8HEP1QMzOAhaMXpbx8cU=
X-Received: by 2002:a9d:5c11:: with SMTP id o17mr7888539otk.107.1562935626269;
 Fri, 12 Jul 2019 05:47:06 -0700 (PDT)
MIME-Version: 1.0
References: <1562321720-18735-1-git-send-email-biju.das@bp.renesas.com> <1562321720-18735-3-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1562321720-18735-3-git-send-email-biju.das@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 12 Jul 2019 14:46:55 +0200
Message-ID: <CAMuHMdV1yHropcCto-pXOK3SeXZAc6DVhYTef8C6rEwhUk_0Hw@mail.gmail.com>
Subject: Re: [PATCH 2/3] arm64: dts: renesas: hihope-common: Add BT support
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
> This patch enables BT support for the HiHope RZ/G2[MN] boards.
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
