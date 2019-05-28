Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 584DE2C0E2
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 May 2019 10:08:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726282AbfE1IIn (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 28 May 2019 04:08:43 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:33213 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726576AbfE1IIn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 28 May 2019 04:08:43 -0400
Received: by mail-lj1-f195.google.com with SMTP id w1so16798929ljw.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 28 May 2019 01:08:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jxRdLO81GaMwi25+pHF6tyabtHcRY5PiY9DnX9mbDaE=;
        b=TaJdaojEUW/+CS9FzUqxW2BLPd5uKNOFnksO/8iLWRSkzm+lUetKQev2JFt0Wytk2/
         QQ8Y9kJKv62FlPA0wODRlMueyJPT2ZUb7lmLvGiKePyWfdUVI8KE5fXG+AJVQUlNcU96
         WSrSxpSGL85df3AzNifzM4VcFz4t6je44xIEwAYBgtZ1KXAOLzsfXE+X3QCeMdSYJ4gw
         rJRhd1KzoZehkI/KcX7D3SIhLO3MX+zdNkNYtxw1rxT9J730k90EGNb3dSohPcqVj+2K
         2/EJB28n2R0F2AIzyKcacjRNmb55DwoRPWq+QpgzbRpiQXC9bHaEEOXiPtj55q/1JlfD
         JioA==
X-Gm-Message-State: APjAAAXSbDALv4wnsjTIva0ohIJOtbFRFcJ1Qx9s3ov5g2Is3w5/5L5v
        Y2et6p9kHufQ/91EIGsF6TAjH3wXUcedhnfC/Ts=
X-Google-Smtp-Source: APXvYqymnIsHnIptohD+ZvCPE/vzwdkhqMTohAuXSeeplJGZYPhUDn5vCS9XnIBXws7SNfPGmO24LuOyutztcv2tv38=
X-Received: by 2002:a2e:249:: with SMTP id 70mr60782672ljc.178.1559030921424;
 Tue, 28 May 2019 01:08:41 -0700 (PDT)
MIME-Version: 1.0
References: <1558104187-2842-1-git-send-email-ykaneko0929@gmail.com>
In-Reply-To: <1558104187-2842-1-git-send-email-ykaneko0929@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 28 May 2019 10:08:29 +0200
Message-ID: <CAMuHMdUmmwmm2bx+g=G-py5FiQ5Ynrmxr262j61P5=y5GTA6OQ@mail.gmail.com>
Subject: Re: [PATCH/RFT] arm: dts: renesas: r7s9210-rza2mevb: sort nodes of
 rza2mevb board
To:     Yoshihiro Kaneko <ykaneko0929@gmail.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Kaneko-san,

On Fri, May 17, 2019 at 4:43 PM Yoshihiro Kaneko <ykaneko0929@gmail.com> wrote:
> This patch sorts the nodes of arch/arm/boot/dts/r7s9210-rza2mevb.dts.
>
> * Sort subnodes of root ("/") node alphabetically
> * Sort following top-level nodes alphabetically
> * Sort subnodes of pinctrl alphabetically
>
> Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>

Thanks for your patch!

> This patch is based on the devel branch of Simon Horman's renesas tree.

This looks good to me, but in the mean time renesas-devel has progressed.
Can you please respin?

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
