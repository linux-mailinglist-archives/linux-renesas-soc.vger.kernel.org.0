Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2D797BF311
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Sep 2019 14:33:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726001AbfIZMdN (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 26 Sep 2019 08:33:13 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:37341 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725836AbfIZMdN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 26 Sep 2019 08:33:13 -0400
Received: by mail-oi1-f194.google.com with SMTP id i16so1910362oie.4;
        Thu, 26 Sep 2019 05:33:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ixPDmQpv6IvDjhKFXbWD1AybNlS7P0vOCrlo5gsvbsk=;
        b=AnCdgDMs3xRf7eh1zKx7SE4LXpRrMR6ZZo4midgmCTTxwSi/MpSo6p8CV2WyoeRLPj
         PGtlyxrThAkSwD+FRJwOdJXGEomK9I5E/DWObugFFRVdoa2GBHW0fwNrZslTDZQ0y65O
         Q70IFdXJ+dYlOreIesBpFkk27ZblIpIXyTpk8VKsTFWylrTHNl5kbGkYZ2CRL9UqRoPh
         UJ3JnqTViYeHagzBhnGh6C10ydRDU29hVZWW+W9qwtPRmFFHfbdEe6c5l0KvHcZY8e6k
         DPqgaC/jsZ4KAnqT9IUTVaFP6Y4IukV7my7OKbKCKp5Ky0czrV+QD45pmdL5hoeafbcG
         POJA==
X-Gm-Message-State: APjAAAWQQaUdUXnC8ZkMnYix+A+X7chtIU+071zKTN8MmlZr74KaGef8
        bt3hgGZ++azzU4Z+llmsz7IZT+YSy4ZTj9UG5hbCuxMd
X-Google-Smtp-Source: APXvYqwGEqVd49LhDEE/K0Ft4JGHd6npO9KPK2pPwJRKdKbBExnqP7ysj+YLyLQdDq+k/d5MTDFrGH8TzS67xlvD110=
X-Received: by 2002:aca:3908:: with SMTP id g8mr2531022oia.54.1569501192594;
 Thu, 26 Sep 2019 05:33:12 -0700 (PDT)
MIME-Version: 1.0
References: <1569249052-1037-1-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1569249052-1037-1-git-send-email-biju.das@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 26 Sep 2019 14:33:01 +0200
Message-ID: <CAMuHMdWGiH86R6dNh6P7X_zR94CL6MCyPKQvkSXPMPPBNsF94w@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: timer: renesas: tmu: Document r8a774b1 bindings
To:     Biju Das <biju.das@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
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

On Mon, Sep 23, 2019 at 4:31 PM Biju Das <biju.das@bp.renesas.com> wrote:
> Document RZ/G2N (R8A774B1) SoC in the Renesas TMU bindings.
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
