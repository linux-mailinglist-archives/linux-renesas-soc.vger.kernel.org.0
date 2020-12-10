Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 151D92D5ACD
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Dec 2020 13:47:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732652AbgLJMqT convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 10 Dec 2020 07:46:19 -0500
Received: from mail-oi1-f195.google.com ([209.85.167.195]:45717 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726267AbgLJMqT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 10 Dec 2020 07:46:19 -0500
Received: by mail-oi1-f195.google.com with SMTP id f132so5540495oib.12;
        Thu, 10 Dec 2020 04:46:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=t20TvBMjiZ13hupCc+BskyuQ1UVzUWc3bUgCOwnNg1M=;
        b=K5KQzM/fSbjXLasNHsshwrC8oSUpT4ItWyPbOefpuyLlkwdx/G0nfkSu9k3Y8V97wr
         O26wYHmcd4k9FaUfwz8XlJHAw2ROo0hFACrikK9r+aeXR7I12jAtV/z/06O/v3M/m1Hd
         nhrSFZUgJ72CWSUkub7/HGjHH0FiSbnRIZR68RK47/ROTHOnffHOJOUcJ+eJu45SvDMk
         cly7sOND3QeLGZ/EigFCBk73taBkgPmIcBeabsBHlGuIpXpVD+0K4B1yNoV4bNVw8wUZ
         3JaQK/eEnKDQK4hGz3ZljFamoU1BmISUgGV631APmkAOgGo7llvShEyG3Eo2vY0uh5Ly
         QHTA==
X-Gm-Message-State: AOAM530BANn7S2TC18k0py73UYS3jIkEwZGwN/P2WVWAQqfMpRyQmpXx
        7ATWkWhC4bygEhvM7VKUp5qOuXlAmBRiI8fn9cQ=
X-Google-Smtp-Source: ABdhPJxHF7kGj5plK/PyPOfubkEX3f0TfEX/eHZTDrG1ShuRsX9vE5J+41d6kEwye4zp74nwcXi6g0AeflphCE9NyfA=
X-Received: by 2002:aca:ec09:: with SMTP id k9mr5186155oih.153.1607604338633;
 Thu, 10 Dec 2020 04:45:38 -0800 (PST)
MIME-Version: 1.0
References: <20201209195701.805254-1-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20201209195701.805254-1-niklas.soderlund+renesas@ragnatech.se>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 10 Dec 2020 13:45:27 +0100
Message-ID: <CAMuHMdVA0UCZi41JzKgqm7njr1fmSHa-2eA+ECd+AUM3K6Bhtg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: timer: renesas,cmt: Document R8A77961
To:     =?UTF-8?Q?Niklas_S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Dec 9, 2020 at 8:57 PM Niklas Söderlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> Add missing bindings for M3-W+.
>
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
