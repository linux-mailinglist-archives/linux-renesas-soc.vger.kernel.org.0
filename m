Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CCEF32C8618
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Nov 2020 15:01:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726442AbgK3OAT (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 30 Nov 2020 09:00:19 -0500
Received: from mail-oi1-f194.google.com ([209.85.167.194]:38535 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726007AbgK3OAT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 30 Nov 2020 09:00:19 -0500
Received: by mail-oi1-f194.google.com with SMTP id o25so14225810oie.5
        for <linux-renesas-soc@vger.kernel.org>; Mon, 30 Nov 2020 06:00:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sg/QXPFo4L+Kf4RtbUUMndzXFfwhVZUTSrPODsU6sxo=;
        b=fTHwiXRTt/iR/fbOnJG/xZkdMtAEJIxvr5U+VgYtyab/TvLSPVsvwl+36LYTTVAFwf
         20I2BnNwDN2Zfkk/IlOqRtzq8zmNuyjwApdkJARCN+zHYtS6ojXDI6c997IFArPsM0tA
         /uCN9kwFAGDavAgn5VhYj0geTV4WlN/Is4iJuEoeFQujrk0Uv5ICAC7+WMkLwXrl68o7
         CDPeIZ3fCuT5Nf2xlYcEjaFcnberOnmXNbhWdsydr3hq2qzNHaMnJDt/+NYb1puwk/qY
         OgiHkkiP9GJS1mI3jh2DuU5X2jMHmYHfSMzBocQfFU6uVt6i02H/L3hh/dMwNXQaZjyG
         CScw==
X-Gm-Message-State: AOAM530J7cgXjhGgc38g7l0MKbwxzosWlAboR4Ln17JXpIMuNF6BfFVf
        VC2mEs4PClJsHBsTw888AhaIHLBwpKu3F6dRNc6Diivq
X-Google-Smtp-Source: ABdhPJzqWtut92STzoRoL5+a6wvrbzarG2WdzzveZJQe6zpBUKKF4eMOyFP+FKUT+ymGxj/XndxpT0JUkM9EgmgSKUw=
X-Received: by 2002:aca:1c0f:: with SMTP id c15mr14639542oic.54.1606744778501;
 Mon, 30 Nov 2020 05:59:38 -0800 (PST)
MIME-Version: 1.0
References: <20201126172154.25625-1-uli+renesas@fpond.eu> <20201126172154.25625-12-uli+renesas@fpond.eu>
In-Reply-To: <20201126172154.25625-12-uli+renesas@fpond.eu>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 30 Nov 2020 14:59:27 +0100
Message-ID: <CAMuHMdXVAKAL3La-=vL8yGEawh=BYGLCmL3gw3QaPbkN2Cv3+Q@mail.gmail.com>
Subject: Re: [PATCH 11/11] pinctrl: renesas: r8a779a0: Add TPU pins, groups
 and functions
To:     Ulrich Hecht <uli+renesas@fpond.eu>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Wolfram Sang <wsa@the-dreams.de>, hoai.luu.ub@renesas.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Nov 26, 2020 at 6:22 PM Ulrich Hecht <uli+renesas@fpond.eu> wrote:
> Add pins, groups and functions for the 16-Bit Timer Pulse Unit outputs
> on the R-Car R8A779A0 (V3U) SoC.
>
> Signed-off-by: Ulrich Hecht <uli+renesas@fpond.eu>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
