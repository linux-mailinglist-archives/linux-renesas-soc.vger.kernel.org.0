Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B568A261717
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Sep 2020 19:25:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731762AbgIHRYh (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 8 Sep 2020 13:24:37 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:33394 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727088AbgIHRUt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 8 Sep 2020 13:20:49 -0400
Received: by mail-ot1-f68.google.com with SMTP id m12so12557162otr.0;
        Tue, 08 Sep 2020 10:20:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LdIU9vQqmEF6Wb9rgoYOmoAokt3YY8uLZ42vJELJPcw=;
        b=DMubPtXSYBnklx8RsXBVhETybhtzSmPIOHQO5hh580TaRMWkvBZTXjmn6aucLI/D+D
         fPGhtc/xW9ypHzBeTmp46o+DUD2h1pcgNnSIZblZrckhjae0CwUQVMzNzXmaOOWd0Ruk
         HUWMtyItZFuVd8I344pdON/KT/RRIWvxhYW63EWn5zKA0fSw3BR2/bjGsHx/M1GleDyJ
         C8CI1FNclKf9idd2jm7aY70x6MhvGak8xSG5VtKv3+f2U2ZffNJaUGTWrZiX93v3pA+o
         2/6IU/fIlWqwWTJFtz25QXz0PFHjQ3CI8pybaxNoKQR5ntuRFz+PJ9VHDZ6nv32Ao1oa
         XJ0g==
X-Gm-Message-State: AOAM533iBFhCkpRo2603eVrJzvobEb98uKklaxfb8FpaXU4D9Z3fNcy5
        rgYdRqSJDcVAUpdTLNuCCst4BmAwpgwd8TuWHtKIm5aLAN0=
X-Google-Smtp-Source: ABdhPJyO0agHfnn+rc/8SvPGLV/RqefiUMhcCO/qMdmPNp8wfnxitD0ijBuDMlHxqhgSaEJAVSI8q0o3SM0n8A6n9Z4=
X-Received: by 2002:a05:6830:1008:: with SMTP id a8mr53866otp.107.1599585648726;
 Tue, 08 Sep 2020 10:20:48 -0700 (PDT)
MIME-Version: 1.0
References: <1599470390-29719-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1599470390-29719-15-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1599470390-29719-15-git-send-email-yoshihiro.shimoda.uh@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 8 Sep 2020 19:20:37 +0200
Message-ID: <CAMuHMdUXUvU5dPkBFdW_ZVhnBKpFEPVLD3mdOkhrmakZjCHErg@mail.gmail.com>
Subject: Re: [PATCH 14/14] arm64: dts: renesas: Add Renesas Falcon boards support
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Shimoda-san,

On Mon, Sep 7, 2020 at 11:20 AM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> Initial support for the Renesas Falcon CPU and BreakOut boards
> support.
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Thanks for your patch!

> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/falcon-cpu.dtsi
> @@ -0,0 +1,44 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Device Tree Source for the Falcon CPU board
> + *
> + * Copyright (C) 2020 Renesas Electronics Corp.
> + */

As this board contains the CPU, I had expected

    #include "r8a779a0.dtsi"

here.

> +
> +/ {
> +       model = "Renesas Falcon CPU board";
> +       compatible = "renesas,falcon-cpu";

+ renesas,r8a779a0.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
