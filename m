Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EFFAC456336
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Nov 2021 20:11:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233220AbhKRTOG (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 18 Nov 2021 14:14:06 -0500
Received: from mail-ua1-f45.google.com ([209.85.222.45]:37732 "EHLO
        mail-ua1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231429AbhKRTOG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 18 Nov 2021 14:14:06 -0500
Received: by mail-ua1-f45.google.com with SMTP id o1so16065239uap.4;
        Thu, 18 Nov 2021 11:11:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aALbyZ3NIfiZFcJfa+x+QcmDP5hpfneUpwrnOH1hkkk=;
        b=DOENl0kEIy+bSrlXPgGr3nkgGUybgfbzfDx8Y3NyyX1RT8Lg7ZVSLJiVSlApZDoxbe
         4zDjKofEKf1kskV2Z4iId1W2IaEk9NMezPAUsv0z9+eplBGM1pa2SRTc480leh15gfSb
         bl6OCY+hmv/u5pM4P+k9guf5dZObbekBDF+W2MMWxsdFCfjWTYu/fIqMx65Haoqpz/gL
         W5ANQnMgGd/Ln86+st0pGjZYZqk/RURQkIIew/Sje8QK1z+T6Z5l6P1BGCdoBBVQAXY0
         gMIwMMdGIzDM5CVy+WoXV+fL8buiuTqjZlPKqOGT+jlhTr8/4DJEbNdtlnSk8QKYDnL0
         yVBQ==
X-Gm-Message-State: AOAM530e954oELUfLGA0sAyOxBgiv2uivFBNhpsxNiwA/R21ppQm3K+N
        54A+49wAx2TMx6RE0FldWG4m9T9iuuAjIA==
X-Google-Smtp-Source: ABdhPJzw+v9q2POD15LHK3pPOvEAq9IDafpbo/pvRPivWTe9+Dn0g3KRptfbHzMBRwyAoDmEcna0xQ==
X-Received: by 2002:a05:6102:2c6:: with SMTP id h6mr86133948vsh.13.1637262665064;
        Thu, 18 Nov 2021 11:11:05 -0800 (PST)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com. [209.85.222.52])
        by smtp.gmail.com with ESMTPSA id g21sm498493vkd.26.2021.11.18.11.11.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Nov 2021 11:11:04 -0800 (PST)
Received: by mail-ua1-f52.google.com with SMTP id t13so15978500uad.9;
        Thu, 18 Nov 2021 11:11:04 -0800 (PST)
X-Received: by 2002:ab0:5552:: with SMTP id u18mr38813633uaa.78.1637262664323;
 Thu, 18 Nov 2021 11:11:04 -0800 (PST)
MIME-Version: 1.0
References: <20211116074130.107554-1-yoshihiro.shimoda.uh@renesas.com> <20211116074130.107554-12-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <20211116074130.107554-12-yoshihiro.shimoda.uh@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 18 Nov 2021 20:10:52 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXydcjKwum+afn-Lx4T7TGz5EDcddRBQrzcNngB=REY+w@mail.gmail.com>
Message-ID: <CAMuHMdXydcjKwum+afn-Lx4T7TGz5EDcddRBQrzcNngB=REY+w@mail.gmail.com>
Subject: Re: [PATCH 11/16] soc: renesas: rcar-rst: Add support for R-Car S4-8
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Shimoda-san,

On Tue, Nov 16, 2021 at 8:42 AM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> Add support for R-Car S4-8 (R8A779F0) to the R-Car RST driver.
> The register map of R-Car S4-8 is the same as R-Car V3U so that
> renames "V3U" and "r8a779a0" with "Gen4".
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Thanks for your patch!

> --- a/drivers/soc/renesas/rcar-rst.c
> +++ b/drivers/soc/renesas/rcar-rst.c
> @@ -12,7 +12,7 @@
>
>  #define WDTRSTCR_RESET         0xA55A0002
>  #define WDTRSTCR               0x0054
> -#define V3U_WDTRSTCR           0x0010
> +#define GEN4_WDTRSTCR          0x0010

V3U_WDTRSTCR handling is not present upstream, as it should be
handled by the boot loader (ATF?), like on other R-Car Gen3 SoCs.
Likewise, GEN4_WDTRSTCR should not become present upstream.

So please split this in two patches:
  1. A patch against upstream, just adding basic R-Car S4-8 support,
  2. An optional second patch to enable GEN4_WDTRSTCR in
     renesas-drivers, to serve as an interim solution until the
     bootloader is fixed.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
