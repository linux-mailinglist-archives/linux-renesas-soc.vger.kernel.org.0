Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 35BC23CF7F7
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Jul 2021 12:36:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235892AbhGTJzk (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 20 Jul 2021 05:55:40 -0400
Received: from mail-ua1-f50.google.com ([209.85.222.50]:35819 "EHLO
        mail-ua1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237110AbhGTJxV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 20 Jul 2021 05:53:21 -0400
Received: by mail-ua1-f50.google.com with SMTP id n61so7910238uan.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 20 Jul 2021 03:33:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pmHo5GUvFZHOR8PcNG7vNoWlCfVmuGoNyUwGrF1CPW8=;
        b=DkpFb9PM+bNUeV+7rxF08Hdcw6QgtHIXVP8HYq3HT81ArXNmWTsLE7VNbmiyJHfqSr
         X2bvJqpUn8TFtQzE28mszur+ubxbXeYvQuXEuyX913uCbo3wxPCXkstXdZeBMsvXLNBs
         KikcKev6ofktEGqtOfZ0NvL8HW3QY5z7IvZjYQ1VwAUiyhryA7esdVZ0ojpuY4BxrES9
         OGwWttBV4eF545gm+Qat6K99/2m0PVBrgI9RUPvJv/qzSwpxOpz3rOjggXfHxT2li9gz
         IBrYMGLVAkxIX90Ncb5q2dew7IZlSl0aFks5077N4e2zOfXOCbV+OncXlrodc1kxy4FN
         fJGg==
X-Gm-Message-State: AOAM531DgxiNy+gTnne7hkQKsm8mqVV5eReB0cB+eOUQAaTVDKA07pU+
        +c8N/j0aE/JenQXEm3NIv4igQapf6OvhsT+uDSE=
X-Google-Smtp-Source: ABdhPJyLzqCJuy7HPLw1rQ6mwnEAzmrvj7A9e//3XNhz+wuF8Ckctl3T8Rx2Mtw+B0vb0x3bnHwP7FarWcRYNry4kmU=
X-Received: by 2002:ab0:6710:: with SMTP id q16mr7338808uam.106.1626777239075;
 Tue, 20 Jul 2021 03:33:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210714090843.438076-1-yoshihiro.shimoda.uh@renesas.com> <TY2PR01MB36927CAB91A6416E636CE77FD8E29@TY2PR01MB3692.jpnprd01.prod.outlook.com>
In-Reply-To: <TY2PR01MB36927CAB91A6416E636CE77FD8E29@TY2PR01MB3692.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 20 Jul 2021 12:33:47 +0200
Message-ID: <CAMuHMdX-vGdEC-48DnRi-Ku1guF6P0DYmXvgq7xFa7EaDg1HCw@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: r8a77961: Add iommus to SDHI/MMC nodes
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "magnus.damm@gmail.com" <magnus.damm@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Shimoda-san,

On Tue, Jul 20, 2021 at 12:27 PM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> > From: Yoshihiro Shimoda, Sent: Wednesday, July 14, 2021 6:09 PM
> >
> > This patch adds iommus properties to the r8a77961 sdhi nodes.
> >
> > Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
>
> I realized that the r8a77961.dtsi is missing iommus properties on dmacN and avb nodes.
> Can I make incremental patches? Or, can I add these properties into this patch as v2?

Feel free to send a v2 (with updated summary/description), as I haven't
reviewed this patch yet.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
