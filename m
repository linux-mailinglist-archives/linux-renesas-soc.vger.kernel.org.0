Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7AA44265B94
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Sep 2020 10:27:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725854AbgIKI12 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 11 Sep 2020 04:27:28 -0400
Received: from mail-oo1-f65.google.com ([209.85.161.65]:46885 "EHLO
        mail-oo1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725550AbgIKI1X (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 11 Sep 2020 04:27:23 -0400
Received: by mail-oo1-f65.google.com with SMTP id q34so2090103ooi.13
        for <linux-renesas-soc@vger.kernel.org>; Fri, 11 Sep 2020 01:27:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yfhgOcllqK6uGUwMP40E3+Yi02Z2R2dlkfkdlkMuTTo=;
        b=p0kSLZHNGHI0KmYrmjSzaJmG69LGPSZLwOXubNh/XBoxi82bbqGufyb5ZbWZEfchqS
         ECGRnIxG7EFWwWhSSNPJGQaKWkqDUepnBaxubTQtYDGEfyOsXWAMuhOesjmNZh85mk1t
         P6Z58kWOxDBca4Tw8xMTJSmnaGtYDDVds4r5TthOKRIQzJxq/aQRtisQuMmxHJgdZXtI
         3P/dqGIdRfNiPIeExEySzJRi0/O9rrH9D/Z0ckRzAEHUpsI/N6tZ6z/peDxN1rePxt0j
         gTccj8Fyx6ZJMwEuIGyVCOg1bhzSMgQShKtZxsuDb1N2Czu2CpWgx1bVnFnA8TyX/E+W
         9OIg==
X-Gm-Message-State: AOAM532BZ44pxKNQeuTa+CGJWaeKYK/MBIFnQi+sSmpAJFNLOpFjYHJE
        Z6mSl5ueNKbdPoYxzY2uqJY4n5m+8faHzAxYaAofK08p
X-Google-Smtp-Source: ABdhPJxapjVSZTa22SDx0trU1KY6IJiSjLaJNeak1t/x7XJeZzK/7cNpdLTxI9kqWmvoUe1MFx2jEWgEPFSDe33mkL0=
X-Received: by 2002:a4a:5403:: with SMTP id t3mr887633ooa.11.1599812842589;
 Fri, 11 Sep 2020 01:27:22 -0700 (PDT)
MIME-Version: 1.0
References: <1599810232-29035-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1599810232-29035-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1599810232-29035-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 11 Sep 2020 10:27:11 +0200
Message-ID: <CAMuHMdX-VqTs6m2NdrO7xNMjdPrgsrt3u0MzZR7_Ztzz+_duPA@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] clk: renesas: cpg-mssr: add register pointers into
 struct cpg_mssr_priv
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Shimoda-san,

On Fri, Sep 11, 2020 at 9:44 AM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> To support other register layout in the future, add register pointers
> of {control,status,reset,reset_clear}_regs into struct cpg_mssr_priv.
> After that, we can remove unused macros like MSTPSR(). No behavior
> changes.
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Thanks for the update!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in clk-renesas-for-v5.10.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
