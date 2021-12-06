Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0099D46972F
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 Dec 2021 14:34:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243583AbhLFNhm (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 6 Dec 2021 08:37:42 -0500
Received: from mail-ua1-f49.google.com ([209.85.222.49]:42995 "EHLO
        mail-ua1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243535AbhLFNhm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 6 Dec 2021 08:37:42 -0500
Received: by mail-ua1-f49.google.com with SMTP id t13so19489702uad.9;
        Mon, 06 Dec 2021 05:34:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pS8Rss5A1BoPPse5q1pKuD2luLMk14bxeQTyewVOD5I=;
        b=3Ct2VNK7fa8we/VF6EaCpxCgqeAVy6wcfS2Srf+aJGlZh8JzKeJb2MpWHdXSQkId3U
         +ts90oKEshKlxQZWuPANQu2Kp2DWd2hO+o6082sAcMF9tNkGHdZOwmXusjDsssqu5Bbw
         gWtLe/+cDJ88ZdPznIzoctoHZS1GsBiWMqYjmJmauhqy3YqDBNM1mPNTsuialy2nNK87
         Dhg/1ZKDMmojREqIox9C3ABOKlKP3IGV5LBzwc6noU2lKUSfQgaM+Ptyvr/JKz6VvKPY
         Mv8nOSrCQwrGfa14bEvS0TtFxyKC3xLeWMKso7XPob68dZf+IVtVP+TXS62bDaqm+xSi
         xpBA==
X-Gm-Message-State: AOAM5335k6jIdz2H8Heec9c2DHHtZekJSRVRzLWMUQ8rcnqN0qjO5arV
        gui9mySXCHPIIBKbgqUV5houUavXimlqwA==
X-Google-Smtp-Source: ABdhPJzpY7wnzMJwZvecx7uf4FwuhmoZaWtoXp17mko81RFhEubsxCDw1j9A/odnHOwKwQxYLQ6Uxg==
X-Received: by 2002:a05:6102:358b:: with SMTP id h11mr36888566vsu.82.1638797652819;
        Mon, 06 Dec 2021 05:34:12 -0800 (PST)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com. [209.85.222.44])
        by smtp.gmail.com with ESMTPSA id i24sm4194343vkk.5.2021.12.06.05.34.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Dec 2021 05:34:12 -0800 (PST)
Received: by mail-ua1-f44.google.com with SMTP id a14so19656937uak.0;
        Mon, 06 Dec 2021 05:34:12 -0800 (PST)
X-Received: by 2002:a05:6102:21dc:: with SMTP id r28mr37033732vsg.57.1638797652196;
 Mon, 06 Dec 2021 05:34:12 -0800 (PST)
MIME-Version: 1.0
References: <20211203115154.31864-1-biju.das.jz@bp.renesas.com> <20211203115154.31864-7-biju.das.jz@bp.renesas.com>
In-Reply-To: <20211203115154.31864-7-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 6 Dec 2021 14:34:01 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU5t-sCGX-RpiX0-yL3pEVKTMzPrb3Pt_eXg4VzBNKuvw@mail.gmail.com>
Message-ID: <CAMuHMdU5t-sCGX-RpiX0-yL3pEVKTMzPrb3Pt_eXg4VzBNKuvw@mail.gmail.com>
Subject: Re: [PATCH 6/6] arm64: dts: renesas: rzg2l-smarc-som: Add vdd core regulator
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Dec 3, 2021 at 12:52 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Add vdd core regulator (1.1 V).
>
> This patch add regulator support for gpu.
>
> On the H/W manual nothing mentioned about gpu
> regulator. So using vdd core regulator for gpu.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
