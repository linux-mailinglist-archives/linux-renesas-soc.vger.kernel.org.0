Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D4390F290D
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 Nov 2019 09:26:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726800AbfKGI04 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 7 Nov 2019 03:26:56 -0500
Received: from mail-lf1-f66.google.com ([209.85.167.66]:40289 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726734AbfKGI0z (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 7 Nov 2019 03:26:55 -0500
Received: by mail-lf1-f66.google.com with SMTP id f4so899818lfk.7
        for <linux-renesas-soc@vger.kernel.org>; Thu, 07 Nov 2019 00:26:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=phBcDJeV7MBF9bQlMf3ij0UKdSYwA8jjd7G8D30t7c4=;
        b=w831tmAcyO3WLobHnTFPXruCYHGzWnUTx/uZyJ/iUgE03JdHww/AN01RKTeoGK7q1Y
         ZKPihTKqt27Xq7S028dxWg0FcqROJrXYML0gFgvwwZ95AWUo0BxoMpLlJ2CiOvyvj3DV
         Pqp4z9yseR+vxvE//5tdnk2/vy3vkEwz8tieVo5bgouEo5C/ztCMvH5niylhD3JKyEek
         2tNBNlYN+m3B9N9Mqk++ZMScppwq06kAl3s2tZxl+Crg26SsGDktlVLmRnkXQwm2i75s
         wY8bQkWdc1ydO3iGEnfTH3Vq4SndDluLLJ8Q+tKS4i6/evlJASOohKZALrHx2L0ECP01
         q9Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=phBcDJeV7MBF9bQlMf3ij0UKdSYwA8jjd7G8D30t7c4=;
        b=Dula92GEDIP46m9s6DmQrVIpGI3S8qrBadrIhLVjD6XIMbSH3EgDnfrt3CVdE6bDtp
         MRarI1ZbCgP+wESg9LoFLz8JEHxyRfzJ9A4nHgPP/VvURYcHhfVpb9aKoViNRZ2gWrD4
         XlnmgVuI5HSY7O62kZp8Tr/miL1XuZJgl2IPdyyDlOC+IkXFfyI5BAy+l9eOqORf0Ael
         p4VfLddrXZM+Z/iDJ3O7FHsdI/iSCFxgMpFQ/JTgfCx3Z21XAmjfG0/9Ikdo530BGS3b
         qivMyegwJRc9WfIlf6xrnu1GYRIZimNcgsa+R5DUPtQ56VI4QhP2WLMWVd4Iz8GQXF6N
         ZMfw==
X-Gm-Message-State: APjAAAV7lA8WWJ6Y4QUh5jR0EasMr2Wuvdj5xaPTFmw/euyqILKUKxdz
        3NpOyBpSuU9rQ5KHya3SWUamaiyXLWBzik/cE71bxpoAhdA=
X-Google-Smtp-Source: APXvYqzOH6yF2eurwi6G7Zy/OVyjeTcC1ZJhGmUN59KPuUZStRkxzGBAq+3zPJWvq1cDxiYLHmvPgnV1gSqFJY+xKlM=
X-Received: by 2002:ac2:4a8f:: with SMTP id l15mr1437066lfp.5.1573115214130;
 Thu, 07 Nov 2019 00:26:54 -0800 (PST)
MIME-Version: 1.0
References: <cover.1573029228.git.matti.vaittinen@fi.rohmeurope.com>
 <20191106120846.5bunrqj3uz4khih5@earth.universe> <ddcd02cc6c709837a28cae2cbfa672c506927659.camel@fi.rohmeurope.com>
 <20191106142441.GC32742@smile.fi.intel.com>
In-Reply-To: <20191106142441.GC32742@smile.fi.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 7 Nov 2019 09:26:43 +0100
Message-ID: <CACRpkdZ2F3zR2bdHgUV9GJX8iSojiM34BTWizTV_z+j7sS4jtw@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] Add definition for GPIO direction
To:     "andriy.shevchenko@linux.intel.com" 
        <andriy.shevchenko@linux.intel.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "andrew@aj.id.au" <andrew@aj.id.au>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Nov 6, 2019 at 3:25 PM andriy.shevchenko@linux.intel.com
<andriy.shevchenko@linux.intel.com> wrote:
> On Wed, Nov 06, 2019 at 12:25:18PM +0000, Vaittinen, Matti wrote:

> > If no one
> > else will take the pinctrl part then I can probably do pinctrl patches
> > for v5.6 cycle.
>
> For pin control Intel, since we send PR to Linus and it won't be different to
> him, we would like to see patch per driver.

It is generally good to bundle these changes because so many
driver maintainers are passive. (Not Intel!)

If you are concerned, what about we just make a separate patch
for the drivers under drivers/pinctrl/intel and bundle the rest?
Possibly Geert want the sh-pfc changes separately as well
as he build his own pinctrl changes.

Rough consensus and working patches.

Yours,
Linus Walleij
