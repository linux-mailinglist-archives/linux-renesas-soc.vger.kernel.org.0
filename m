Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A8FFBD0F08
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Oct 2019 14:44:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728200AbfJIMoG (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 9 Oct 2019 08:44:06 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:33768 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727878AbfJIMoF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 9 Oct 2019 08:44:05 -0400
Received: by mail-oi1-f195.google.com with SMTP id a15so1622457oic.0;
        Wed, 09 Oct 2019 05:44:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=icN27BrZ6Y7pxtEUa7O+ySDdsAcLuOxBOPHh5mGCMPw=;
        b=EoTkv061sTuB60U/Ue56nY/yFxsUnEQoBB7rkwyQ00IoA8w9qSCKmI6gyTOsxrFvUS
         cnKZdEZ/yfGX0cy3wSg6CglLhqQohKv63pxcOkTHkZszOW1/GXflpLIYIPzJrd3AKhkN
         sP4SjLOON7XP/Fiy2BH2TJZ0+PD627vBUNnQGgSrUwemfK8qiwAr/t+YxvfjBs5Tw0zt
         DDoRsO4XyZrf8yi6tbW+IVOeUXIqmPyBhEUOsWFKyfhuHVUU6wAs0GIyzLHraUdI+zzt
         AhTkxAFDjq1C5EYxZNIeTGYzsAdteC9q9DyHo3xmlwMg/Ku59U2KE5semR9phyYqoT4n
         6dUA==
X-Gm-Message-State: APjAAAUESC+Bh1ozk2vypWUyO4bfsuoyABpON3WV4U9zdy8UAgBPaVGA
        THaGcnLWV5+hyq1ubfn3xPSLydl7LQgxvOlsQQA=
X-Google-Smtp-Source: APXvYqzFNmrXKoysYtQrP911odQBjo57ZZe67oUkrYXrFk4cMbVodd6J/I/OLgBsHMqVLfSHsoCZ4hFkLoKFJSC+/BI=
X-Received: by 2002:aca:4bd2:: with SMTP id y201mr2171797oia.102.1570625043421;
 Wed, 09 Oct 2019 05:44:03 -0700 (PDT)
MIME-Version: 1.0
References: <1570029619-43238-1-git-send-email-biju.das@bp.renesas.com> <1570029619-43238-6-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1570029619-43238-6-git-send-email-biju.das@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 9 Oct 2019 14:43:52 +0200
Message-ID: <CAMuHMdW930P+9sH5ADTOer4PJr+KFC-e=cVbw_LHHdyr-zzF0Q@mail.gmail.com>
Subject: Re: [PATCH v3 5/9] arm64: dts: renesas: r8a774b1: Add FDP1 device nodes
To:     Biju Das <biju.das@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Simon Horman <horms@verge.net.au>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
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

On Wed, Oct 2, 2019 at 5:21 PM Biju Das <biju.das@bp.renesas.com> wrote:
> The r8a774b1 has a single FDP1 instance.
>
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.5.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
