Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DFADB2C6240
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Nov 2020 10:52:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726014AbgK0Jvz (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 27 Nov 2020 04:51:55 -0500
Received: from mail-oi1-f195.google.com ([209.85.167.195]:38009 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725889AbgK0Jvy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 27 Nov 2020 04:51:54 -0500
Received: by mail-oi1-f195.google.com with SMTP id o25so5269809oie.5
        for <linux-renesas-soc@vger.kernel.org>; Fri, 27 Nov 2020 01:51:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=E8KTWgEuMJPvoXsHjcEY4hpnxEWGZgNFoxeklraEpMQ=;
        b=XYKtj+DCXdwVLcDsNYRX7rW5WOqcURUzgTw1cnUGCf0wTWt8FQK9cMoPJK9InJc2bx
         9Eo+SBz60NBDiHGvBIVkEIL5PvNOmsNVkSLs8F0sFP2v1mECbdOYc5ETNuOMufrb6VY/
         DLPQzXMIgYE1bhtWMfeR9i8e0kpoGGOWNbPw+Ngm2yhK6pPOoflGma9Rfa90y0kyuXhd
         8APi2xHJuWfbBxUNTmW+9cs5zIkKUnP9FtGrOCKMFLh/Sdt+jGK3nj3RWDaG3cbBsltc
         NmjhGaMUrHCY2hoLshkmULYSOyDv3ZaLsROIxuodjKadbU/dbSOd5otFKWmrb2F7IQG8
         uLMg==
X-Gm-Message-State: AOAM533cGhs2/qklhfTFdQVTgyoR/I0JWMitDFmsUN7gXZzFw39Egclt
        n7n3VNwFQuXwC8Ckv1pAHlMNZDvhbyHxJccCItTcXe4wnUk=
X-Google-Smtp-Source: ABdhPJwtJRoXK5zcTjUZ6/sS4eMsxT7fy1NAGUZsZ5GMRFhz0NIEIeBzPvuiEw+x+iwGlII5d7toRQDyWHpFfQ6uS4w=
X-Received: by 2002:aca:c3c4:: with SMTP id t187mr4611189oif.148.1606470714055;
 Fri, 27 Nov 2020 01:51:54 -0800 (PST)
MIME-Version: 1.0
References: <20201126172058.25275-1-uli+renesas@fpond.eu> <20201126172058.25275-2-uli+renesas@fpond.eu>
In-Reply-To: <20201126172058.25275-2-uli+renesas@fpond.eu>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 27 Nov 2020 10:51:43 +0100
Message-ID: <CAMuHMdWWjdD_wGzPRBK_fM7aWc9u8nFcQ+8Y8pxvFXqWa4d2sw@mail.gmail.com>
Subject: Re: [PATCH 1/3] pinctrl: renesas: implement unlock register masks
To:     Ulrich Hecht <uli+renesas@fpond.eu>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Wolfram Sang <wsa@the-dreams.de>, hoai.luu.ub@renesas.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Uli,

On Thu, Nov 26, 2020 at 6:21 PM Ulrich Hecht <uli+renesas@fpond.eu> wrote:
> The V3U SoC has several unlock registers, one per register group. They
> reside at offset zero in each 0x200 bytes-sized block.
>
> To avoid adding yet another table to the PFC implementation, this
> patch adds the option to specify an address mask instead of the fixed
> address in sh_pfc_soc_info::unlock_reg.
>
> Signed-off-by: Ulrich Hecht <uli+renesas@fpond.eu>

Thanks for your (clever) patch!

Perhaps a comment should be added to sh_pfc_soc_info.unlock_reg,
to document this dual behavior?
Or should we just always use masking, as that seems to be suited
for all SoCs using unlock_reg?

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
