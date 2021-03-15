Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E4A1C33B089
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Mar 2021 12:02:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229728AbhCOLBk convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 15 Mar 2021 07:01:40 -0400
Received: from mail-vs1-f48.google.com ([209.85.217.48]:42999 "EHLO
        mail-vs1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229512AbhCOLBK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 15 Mar 2021 07:01:10 -0400
Received: by mail-vs1-f48.google.com with SMTP id v123so16084791vsv.9
        for <linux-renesas-soc@vger.kernel.org>; Mon, 15 Mar 2021 04:01:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=xvXoGgFAoCemelY9tEuilpWhb/CNeJ7kGaNvb6WXGG0=;
        b=t2c+vvoVAR2T1gVpU5TRdhyd5vkqKO2PfhbyK5lIx0qO3tyIDqTFoEWteUKNbfhVR4
         DiY1JC9mMituzxUkzuyO0fwGD1R5+rVCIWDOLEx6oX4brNEMrOAjUNCMmiiXZ8BIFxfT
         5NJlfYIyjaBzAWFJX6855h0TAq66htCsBfJmMaI8WD4NvXBVVZ6HpPcNGbfk/yW8oPiY
         HLSKwoa727DG6YfddyLvrkkMjA38RoCO8sW6Kl1iEW2berpi9JToGUbFjpW+jsz+i93B
         i6bWlesoPBDHQ1vg7KTlRalV/JOw+iGqwbKT1NjNRKK07gy+sJ/KCcEpcSyZyfKudKjI
         niCw==
X-Gm-Message-State: AOAM532TUuPPX2l9k+m8X4s6vClWF3IzkaExQlTI0fwD+AuznIu2BL0J
        ET86yfJNWdwOCGtSwv9ZiG13N3aEO0q8ECHp7GBcxvfCsSo=
X-Google-Smtp-Source: ABdhPJwnbkNFUAB2Km/eTl0xIKRgxAGn0AFk3wqQarxc4/KXcU6SihmiWSheaRsTGvgJI6wf5Gvm6C0brBcf9+PRfM0=
X-Received: by 2002:a67:f7c6:: with SMTP id a6mr4422985vsp.42.1615806070143;
 Mon, 15 Mar 2021 04:01:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210312174735.2118212-1-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20210312174735.2118212-1-niklas.soderlund+renesas@ragnatech.se>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 15 Mar 2021 12:00:59 +0100
Message-ID: <CAMuHMdUAGj299QFptRRffk8V-HH+0GMuH68OrH9SGSxuR4TDTQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: r8a77980: fix vin4-7 binding
To:     =?UTF-8?Q?Niklas_S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Vladimir Barinov <vladimir.barinov@cogentembedded.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Niklas,

On Fri, Mar 12, 2021 at 6:48 PM Niklas Söderlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> From: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
>
> This fixes the bindings in media framework:
> The CSI40 is port number 2
> The CSI41 is port number 3
>
> Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
> Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Thanks for your patch!

Fixes: 3182aa4e0bf4d0ee ("arm64: dts: renesas: r8a77980: add CSI2/VIN support")

I believe there are no upstream users of csi41 on R-Car V3H yet?

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.13.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
