Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E7D6346288
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Mar 2021 16:14:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232727AbhCWPOP convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 23 Mar 2021 11:14:15 -0400
Received: from mail-vs1-f52.google.com ([209.85.217.52]:42856 "EHLO
        mail-vs1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232730AbhCWPOA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 23 Mar 2021 11:14:00 -0400
Received: by mail-vs1-f52.google.com with SMTP id b5so9563969vsl.9
        for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Mar 2021 08:13:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=a7Pl9nSG4uW9tYNEQwsOEpynlc3KB3NNkAuclckmslA=;
        b=X0V7qjiQ1Bt+0Fuy430pldWt6mOkrR9nySk9I1uaasasn9NmYoXAmMzUxP0CD4H4Rs
         Xmxgz9WvyT1K+WzTXlnoPkjY9T/iDKVICshrLX7C1JlXBBuupGal306fGqGVbuW0MBTx
         77s23uyps7EHjnFpNvE7IrdVZA+MvVv10vNsNyGZ21M1TfvBBfl9MfbGX8z7h1q3ocb5
         MS8HxltEtStikcH2DP1KbRkhw5bBun9M6846APBJkRRc3mamqVSLUuBKCSAgdCMqF1NM
         SLiA2Y/azKYNxuePnr1i04J7jgtR++ieObZGP0RVElb57g9Dc+13OIuMRunKdrB3ZpdE
         VLfw==
X-Gm-Message-State: AOAM532IkPfgagv5JJiD+XYXM16z6sUFI6DG8PZM0ertxEl6lMMb7OuZ
        HDWSXSrv5RJ4ZLnNizCiN3E48noBvHaY57A6xu67zkoj
X-Google-Smtp-Source: ABdhPJxiTIzr2ZM/RW16WWUiGCvuqpgHkpS0qX2l6KkH2LqMvaQ+yUi+L9APwow7rFgKrCN0jPsiFt5TNCFOGjMqk4g=
X-Received: by 2002:a67:fe90:: with SMTP id b16mr4059345vsr.40.1616512439334;
 Tue, 23 Mar 2021 08:13:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210312131020.1747344-1-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20210312131020.1747344-1-niklas.soderlund+renesas@ragnatech.se>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 23 Mar 2021 16:13:48 +0100
Message-ID: <CAMuHMdXHzdDWH5-YTfA8GozAhWwzi8Rf3KRWZ_PFWpJEYkEvuw@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: r8a77961: Add VIN and CSI-2 device nodes
To:     =?UTF-8?Q?Niklas_S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Mar 12, 2021 at 2:10 PM Niklas Söderlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> Add device nodes for VIN and CSI-2 to R-Car M3-W+ r8a77961 device tree.
>
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.13.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
