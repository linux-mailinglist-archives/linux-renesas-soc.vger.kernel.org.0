Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF4EF1E7D8F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 29 May 2020 14:48:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726712AbgE2Msn (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 29 May 2020 08:48:43 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:36650 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726467AbgE2Msn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 29 May 2020 08:48:43 -0400
Received: by mail-oi1-f195.google.com with SMTP id a137so2445969oii.3;
        Fri, 29 May 2020 05:48:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nQnnhZYiSaAVNfmOynBhMEuWSSLFHfXzuga/6Jf95e8=;
        b=tUeW104byl8qoElqvzV1FukAmX39opmMfmzYbkcjXpYiyx4VjgIRqObeuFwGbQxmEW
         h2Mm1gpgt8Ob0eQkehqoHEd5LKobAj4Rh/3YLqEYW5KN8WySxBExVhx08jDSbEySuaYW
         MzRwZpWOfibNU0jlbXga0feGQBSo5jDzcXa4m1AlNzy6z8zSc9vFhLuumfWc593Ecghl
         hm7rzURlRD+UwvGgMRcvbsdxZ36Piu2eLQtmeA4EH8MX57AsV+PUyEeVusK6WOl6TSBb
         eyzcXV7Ubi4oO3aR6pIpS6YnYEEFgMUj43TDmdiycWUBOC7Cv6qqme+gdOmHxURQY+6i
         aO5w==
X-Gm-Message-State: AOAM531EFGSFeXepJ52qdS9ymgz8qgyzImv77Wq/yFbXAodNZyYcuPgS
        ZJ8GKYW5Dp5P2WsAWAzI1XGkW0jUIQo01XryRLM=
X-Google-Smtp-Source: ABdhPJygD5qVee9JLy1UhfZq3AVAg+UringKygup+26OO3s37IRuDaetiYy8zEMeGYSzfDJQcmnRb3RskGicpxpM3Ts=
X-Received: by 2002:aca:644:: with SMTP id 65mr5053121oig.148.1590756522627;
 Fri, 29 May 2020 05:48:42 -0700 (PDT)
MIME-Version: 1.0
References: <1590614320-30160-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1590614320-30160-2-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <1590614320-30160-2-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 29 May 2020 14:48:31 +0200
Message-ID: <CAMuHMdWxNh8zbEdNU2SH_jKi3zFVDj-cW3g+Bx+uVsN+-TZoJg@mail.gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: thermal: rcar-thermal: Add device tree
 support for r8a7742
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Prabhakar <prabhakar.csengg@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, May 27, 2020 at 11:19 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> Add thermal sensor support for r8a7742 SoC. The Renesas RZ/G1H
> (r8a7742) thermal sensor module is identical to the R-Car Gen2 family.
>
> No driver change is needed due to the fallback compatible value
> "renesas,rcar-gen2-thermal".
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
