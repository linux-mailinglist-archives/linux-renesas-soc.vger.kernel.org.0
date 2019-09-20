Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E6123B942F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Sep 2019 17:40:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392883AbfITPkI (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 20 Sep 2019 11:40:08 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:45413 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392871AbfITPkI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 20 Sep 2019 11:40:08 -0400
Received: by mail-ot1-f67.google.com with SMTP id 41so6517690oti.12
        for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Sep 2019 08:40:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RfZSx7SD8ZuRLBfw2hqluDRlrVuYtieyhKCmX8EcyQk=;
        b=lc9YXlDac9IfbqEUVepYP3eIRrOF21a5G0oWibTy0zlvaW1Z9NIgZR9RzjeqRDi03N
         T2MSFHYK1uq6Xy0bQRChJtCD+bpGnOf2ySgaS5sZCppHUQUEuOA5IbvPNbonYyz/6vUU
         G/Pl0Z4NkUJuhv7LKUnx0k062IcjWaSrO89FQlDM9vWNJTXfknJzTsgpQ/0K/iRHoJOw
         QMNauFdutBALJk3VKeDmCTIaDO+Xdq1QiI+fZxU2vzKSaWNpxmuE2T4m2rr09c3rfBVt
         u5ZGJposqKPD0w8i7hzs8cKe8VXrGBkD6lkv/UJzOtGnKj9RV8O8ePg84oOVva5169m1
         +95w==
X-Gm-Message-State: APjAAAXP8liEJtViKiQ7sRf6HfnFbDcAVwbk8RfWN2+UUWXL6lkwdQ4b
        V2Kx9u5MTsS9Vqq3R1jknZT3wie2RYauawY1Tnw=
X-Google-Smtp-Source: APXvYqxcUIWot9A/TT7TbnILGVty6XQyMsyglEtQTR+leaQHdwLggYJcvaTfmGLfqz6wFRDq9byojhBtMb2Fla1Y5FM=
X-Received: by 2002:a9d:5a06:: with SMTP id v6mr11943307oth.250.1568994007467;
 Fri, 20 Sep 2019 08:40:07 -0700 (PDT)
MIME-Version: 1.0
References: <1568881036-4404-1-git-send-email-biju.das@bp.renesas.com> <1568881036-4404-5-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1568881036-4404-5-git-send-email-biju.das@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 20 Sep 2019 17:39:56 +0200
Message-ID: <CAMuHMdUZXMUeUfoBP0P1028uyE-bNhge4bTj9_w+jM=RAFafDA@mail.gmail.com>
Subject: Re: [PATCH v2 4/8] soc: renesas: rcar-rst: Add support for RZ/G2N
To:     Biju Das <biju.das@bp.renesas.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Sep 19, 2019 at 10:17 AM Biju Das <biju.das@bp.renesas.com> wrote:
> Add support for RZ/G2N (R8A774B1) to the R-Car RST driver.
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
