Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C4235B0E58
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Sep 2019 13:56:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731411AbfILL43 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 12 Sep 2019 07:56:29 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:38492 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731377AbfILL43 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 12 Sep 2019 07:56:29 -0400
Received: by mail-oi1-f195.google.com with SMTP id 7so16863466oip.5;
        Thu, 12 Sep 2019 04:56:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=S1u80ilTf7G0ZNN0O4iJG8ezHwT90ZnChBDdldmbdiM=;
        b=lZxQp8c7OHDrwJ8cRDMu/FKdMSGVJzn0y0jkX4L04Fpa25lEfRaejsjz7ff96tWJAl
         AM79z1jPzutZIbZ+tpMimpZj8NiJt/LmTsQvUEhHSJlQF4Gnl2M2SHX55dT56EmhhL7e
         Kh2pRcHklazISI+/WIiC4vvuhivv/3OnYrcJBjH4l1YQGFu4q+SFuvanO6xGE+32J9F0
         lur6QKwM2XACQKIXCVmtFhdAt9XXNYMqvhrE+jCKXLkCrWd5690DuqVHAVVDIm3yUyQT
         Ec8og/TlzQTYbCoYikNHiOZ6yDGhOCHIeyjysnzagSBO9XGX0oFS2KZVTq2IoLYrYafW
         PYLA==
X-Gm-Message-State: APjAAAUPAIl4qXxVZXVefFYy20Y5TsZtUs1YaFtnZ2WaE5EUwRv5Kay/
        Oxm/3MZypncq4gpAi7cmSVfssHq2f+pgeMWKcWs=
X-Google-Smtp-Source: APXvYqymEmu8yP8kOCKU3SZPHOFLXhmadtL34z8YlpNUfAcz68fuN1P9jyLC9n1+IY2XaDbxa+IApNS+a0I+vR0Q8FQ=
X-Received: by 2002:aca:dad4:: with SMTP id r203mr8545498oig.102.1568289387824;
 Thu, 12 Sep 2019 04:56:27 -0700 (PDT)
MIME-Version: 1.0
References: <20190912103734.1879-1-kieran.bingham+renesas@ideasonboard.com>
In-Reply-To: <20190912103734.1879-1-kieran.bingham+renesas@ideasonboard.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 12 Sep 2019 13:56:16 +0200
Message-ID: <CAMuHMdWb9qBDZqOs072u_pCRTaGGArAdUBLWbA5kGoU=KM4Y3A@mail.gmail.com>
Subject: Re: [PATCH] arm: dts: renesas: r8a77980: Remove r8a77970 DU compatible
To:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Sep 12, 2019 at 12:38 PM Kieran Bingham
<kieran.bingham+renesas@ideasonboard.com> wrote:
> The r8a77970 was added with an compatible string for a differnet device

different

> rather than adding the correct compatible to the driver.
>
> Remove the unnecessary compatible which is for a different platform.
>
> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> Please note, this patch should not be integrated until the renesas,du-r8a77980
> compatible string makes it into the DU [0].

Hence postponed.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
