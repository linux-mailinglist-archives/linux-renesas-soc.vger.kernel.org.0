Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B75E260E93
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Sep 2020 11:23:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728676AbgIHJXu (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 8 Sep 2020 05:23:50 -0400
Received: from mail-oo1-f68.google.com ([209.85.161.68]:41051 "EHLO
        mail-oo1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728670AbgIHJXt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 8 Sep 2020 05:23:49 -0400
Received: by mail-oo1-f68.google.com with SMTP id t3so3790419ook.8;
        Tue, 08 Sep 2020 02:23:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9Iz0ruY3yvKXS6LyI8Ocmtn6E9Rp8lkvxXQ/gea+7FY=;
        b=pLkd7PmCwWTgY5jN8rOtBpdXNWYMpLsMt50B3ExBA3bm3tE+SkzktfyMikP3c+0cpR
         Xcki79AN1J94nhBc08X3T9dLAGpT+C12MBjI/wZah0/iU1e1x033KLHG4ZCcpcQeMv7x
         D1T7CTsMnTz8mlYenq7cI8jzPL5jW62B8gHoqJ+zG6a/ifEAuJYQ6s+jplN51mhvO+qc
         L1oqUjl2zmWl1/rk2epcjNLz9E34ujEcOF+RpyNZcFji/ELJsC3kzhWVIhFXbhm8NZ27
         1BP9IoZOPU9Qd5DnFqolsYEJBq2s/gwfQ9fj2M0rr9y60N5w1tQdKWiOSX/2hL7UcdwJ
         f55A==
X-Gm-Message-State: AOAM531GVo5wP20c5vME0KbVqGiyF7CmA7Dr3UXH1CFfBpF6Nr4d8AJA
        +9Lki1/GOPRAov1Fy0WCVL5m/UzbDHi4jbAF0Jo=
X-Google-Smtp-Source: ABdhPJysafklVmp1jmJLUFf4djRpvRwwxsWfQQKiAG/RC5YiNo605e9vnQLXzNGkTZ5O3odGIqJOJNxj2eBvLdpTAAk=
X-Received: by 2002:a4a:5403:: with SMTP id t3mr18005858ooa.11.1599557028413;
 Tue, 08 Sep 2020 02:23:48 -0700 (PDT)
MIME-Version: 1.0
References: <1599470390-29719-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1599470390-29719-7-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1599470390-29719-7-git-send-email-yoshihiro.shimoda.uh@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 8 Sep 2020 11:23:37 +0200
Message-ID: <CAMuHMdVRco32Dm+UyN5OUpbhVcJCuCm-jNF6+R5=m74vqjEEoA@mail.gmail.com>
Subject: Re: [PATCH 06/14] dt-bindings: clock: renesas,cpg-mssr: Document r8a779a0
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

On Mon, Sep 7, 2020 at 11:20 AM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> Add binding documentation for the R-Car V3U (R8A779A0) Clock Pulse
> Generator.
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- a/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.yaml
> +++ b/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.yaml
> @@ -47,6 +47,7 @@ properties:
>        - renesas,r8a77980-cpg-mssr # R-Car V3H
>        - renesas,r8a77990-cpg-mssr # R-Car E3
>        - renesas,r8a77995-cpg-mssr # R-Car D3
> +      - renesas,r8a779a0-cpg-mssr # R-Car V3U
>
>    reg:
>      maxItems: 1
> --
> 2.7.4
>

FIXME check clock-names


--
Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
