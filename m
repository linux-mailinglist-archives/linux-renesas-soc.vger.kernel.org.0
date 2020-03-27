Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D729B19536E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Mar 2020 09:57:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727352AbgC0I5I (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 27 Mar 2020 04:57:08 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:45369 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727173AbgC0I5I (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 27 Mar 2020 04:57:08 -0400
Received: by mail-ot1-f66.google.com with SMTP id c9so8910235otl.12;
        Fri, 27 Mar 2020 01:57:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=izeup1KQFus0kGKXvVrifWL12yagJ2SWKHRlBlFsQ7A=;
        b=ASCH2o0n9Z9QOTTat7ddmLkwnnmZAbDaN4tXG1GBlI8oHoEljOU3NCjmuaN4VjfV/J
         fJE51NxN6dDGpV04Uk5FHKlyMaL/1qol/LgYODosHSucr2412XzmKzXhWMHq4YYsNXFQ
         fNaQA8SzCEtBmNIxPIkH7qmathMiVTKUAJtcJXomL8ABJ6/Jg1osn4sUzjbrOiQQIl/R
         NnX4vbvmgU/zxSQGAH/A+EvqHia5fW2hXrIxnceaVar1QnPWA9G2qSaCJ2zZtZXTSmuH
         t1JcguJnG9nyrBbQBKSj4CVho3LEkXtYsD6vSGJeQ3DlS597nxCv59XoE2qYOPuwu7OG
         Dilg==
X-Gm-Message-State: ANhLgQ0X9lWdLrXpf3mePTxtG6u9d0SPbR7Q6T9kFqzGvFpMYdT+un66
        qzx6X29bfaJs5Q7hS8xiYPsCk/adoAMQLnO9RZw=
X-Google-Smtp-Source: ADFU+vtRXnY5Gsd4Zqz4/pB9DfWoU+cbpEvmFbE1k/2dRYZmCo9A+WUhFkpFaCXHeVyR5H3/9+2MQAgVGBrorjXwKOs=
X-Received: by 2002:a9d:5c0c:: with SMTP id o12mr9490344otk.145.1585299427436;
 Fri, 27 Mar 2020 01:57:07 -0700 (PDT)
MIME-Version: 1.0
References: <1585286923-11740-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1585286923-11740-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1585286923-11740-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 27 Mar 2020 09:56:56 +0100
Message-ID: <CAMuHMdWsFt9uj2s_SM_Zkj_YR_fs7m51YBMAKK3zyz-kmK4NJw@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] dt-bindings: phy: renesas: usb3-phy: convert
 bindings to json-schema
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Kishon Vijay Abraham I <kishon@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Mar 27, 2020 at 6:29 AM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> Convert Renesas R-Car generation 3 USB 3.0 PHY bindings documentation
> to json-schema.
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Reviewed-by: Rob Herring <robh@kernel.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
