Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 14922FB70
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Apr 2019 16:27:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726541AbfD3O06 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 30 Apr 2019 10:26:58 -0400
Received: from mail-ua1-f67.google.com ([209.85.222.67]:33438 "EHLO
        mail-ua1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726264AbfD3O06 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 30 Apr 2019 10:26:58 -0400
Received: by mail-ua1-f67.google.com with SMTP id x6so2217899uaq.0;
        Tue, 30 Apr 2019 07:26:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=H4HbBFiCzju8ZL1a+EOizc5ito1FMRv3zWByGRAJeVw=;
        b=kcEbIdDd8RzhYrZz1m/YLhmTZmCiLgkZzkw4IRGeppEGqga0rlUHHKCxCRl2ymsjlK
         JFBw3yBFMfyGtmoZ7xITI5a2TJ4SGuiYT0P+UB+U9bNgG0VT4fcu8VRZ2NMYZeu4YiTp
         lczHykpn/1QI7LYGiqfsVSD37l2HkbUZVkXMvNbgL5oO5gV5AQ5c/KJHQaL1btC5gBZr
         5455uuO797woBFyIJ02S+zjQ0EGw63nuE8DLhWbMwJEigovnV7fW+rjpjzNTRV+/IzVW
         0ouZ82wTUbmrzZHxSt/yG0iBWmVUw+83pPYtJbhi6kZD83BrWtoHSCl4PP24XCV3lhWD
         Qm/g==
X-Gm-Message-State: APjAAAU5nBxn2VcD6WSA5ile28cHZw+vX1thYkP7RiBZjpPqbBvUn5di
        Yb8WGRMtIfLBL9Q05wxOFoKLbrLmRyOOJ3dQCM0=
X-Google-Smtp-Source: APXvYqws9/d57fhjDYr+9ZpE9Hy8wZHRnGrApOAUOz9BXP7srT5+ejj6H4NfSXsns5f0HhBh3VxCyUv3bR6+E90stH4=
X-Received: by 2002:a9f:352a:: with SMTP id o39mr6740842uao.78.1556634417017;
 Tue, 30 Apr 2019 07:26:57 -0700 (PDT)
MIME-Version: 1.0
References: <1554443049-25127-1-git-send-email-cv-dong@jinso.co.jp> <1554443049-25127-5-git-send-email-cv-dong@jinso.co.jp>
In-Reply-To: <1554443049-25127-5-git-send-email-cv-dong@jinso.co.jp>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 30 Apr 2019 16:26:45 +0200
Message-ID: <CAMuHMdX_Xwirb4-U3Fv0ixWW62LG2s_8fOzqAK1_VO=cg30JxQ@mail.gmail.com>
Subject: Re: [PATCH 4/4] dt-bindings: timer: renesas, cmt: Document
 r8a779{5|65|90} CMT support
To:     Cao Van Dong <cv-dong@jinso.co.jp>
Cc:     Mark Brown <broonie@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        =?UTF-8?B?56iy5ZCJ?= <h-inayoshi@jinso.co.jp>,
        =?UTF-8?B?RHVuZ++8muS6uuOCvQ==?= <nv-dung@jinso.co.jp>,
        Hoan Nguyen An <na-hoan@jinso.co.jp>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Apr 5, 2019 at 7:44 AM Cao Van Dong <cv-dong@jinso.co.jp> wrote:
> Document SoC specific bindings for R-Car H3/M3-N/E3 SoCs.
>
> Signed-off-by: Cao Van Dong <cv-dong@jinso.co.jp>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
