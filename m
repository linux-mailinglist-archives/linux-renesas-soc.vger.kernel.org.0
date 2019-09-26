Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E4266BF329
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Sep 2019 14:40:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726251AbfIZMkj (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 26 Sep 2019 08:40:39 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:37827 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725945AbfIZMkj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 26 Sep 2019 08:40:39 -0400
Received: by mail-ot1-f68.google.com with SMTP id k32so1856639otc.4;
        Thu, 26 Sep 2019 05:40:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Tjar5vOvYjte8zpZAV+QkDQ1vCYinUJV81Pu14/JHo8=;
        b=IUEuQqqLgsggSP8kh8+YKFKsBkaDRjGKariSFLa9FqFoUttmVPo0AdaNpb6czCbggE
         B1D0Dj5pL0BG17qG7HNBE1Bo8X7PRnao3HelOZUxXgBwIh32ZoO0uLEmPsqjLmy8Xsfs
         DOYrbhbgNZmoNXx3wQ7ldSJloVX8e2hA0Hf4ch8ZePs5Fhhe9YOZJ8AXbVg8EDngkkpP
         9bjYnXVUL9OssqDaKuFtSvdXAOp+29/JOAPA1ObtZVgxmMtghbqGvhnh7j/dnZg3Unvu
         uTlaZg9J2Mq5OTk63uh5BwIHAK8SWWF1FALb06IFB0DwbwEpQZkshOvcGAAF0QfijYEc
         V/Tg==
X-Gm-Message-State: APjAAAU/n/bxzu4PJNHAqKKooeFLU7g57VElzc/U4aEU7pUCuvqoWv0Q
        yz4u6/2vmQh3qkSclOn9So9ITPdod8peu5R8B8Y=
X-Google-Smtp-Source: APXvYqysscjYqqtAX9aZNqnCUfS9l7FaQJaPJcmoR8p4K0r+15bKE2JDM8iz1PIrvIoEaupZMwAO0MriKrGi9soTP8Y=
X-Received: by 2002:a9d:5a06:: with SMTP id v6mr225417oth.250.1569501636510;
 Thu, 26 Sep 2019 05:40:36 -0700 (PDT)
MIME-Version: 1.0
References: <1569307615-38914-1-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1569307615-38914-1-git-send-email-biju.das@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 26 Sep 2019 14:40:25 +0200
Message-ID: <CAMuHMdVXE1QSdZB4Sis4zHUWwp-jL-Zd2VCNTrsd6bmZBEMfrw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: mmc: renesas_sdhi: Add r8a774b1 support
To:     Biju Das <biju.das@bp.renesas.com>
Cc:     Ulf Hansson <ulf.hansson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Linux MMC List <linux-mmc@vger.kernel.org>,
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

On Tue, Sep 24, 2019 at 8:47 AM Biju Das <biju.das@bp.renesas.com> wrote:
> Document RZ/G2N (R8A774B1) SoC bindings.
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
