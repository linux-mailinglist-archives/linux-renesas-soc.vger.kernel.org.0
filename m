Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D93B15E3E8
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Jul 2019 14:29:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726605AbfGCM3E convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 3 Jul 2019 08:29:04 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:46345 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726473AbfGCM3E (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 3 Jul 2019 08:29:04 -0400
Received: by mail-ot1-f68.google.com with SMTP id z23so2096178ote.13;
        Wed, 03 Jul 2019 05:29:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=pKHVWszZZEtGMfrkxlS6Mr1MOgzz8lcLJEA6ynRIBiw=;
        b=ISUKMQp/IWzkdqGvB+v0kSGPMc1/abtK+hcQKd4A0LdbMmhJyAih0bqNE/Iucen+/Y
         9dmisA1rmVtcErXef0GumYywzY/j7aMl02O3bzS7oD+weySnALhfgPwSVT1QgqVRmZAw
         ERF/YyEmgCpJziXtFd6TrdljKvWeVwN2EilADeXr+SfFLB474mJOJ4LEEUeQ5FTJ3ZUG
         lnSr0ppqNGyRQHbwyZ3TZ6rF6CogiwPRDWTW4TI9ZNFd4xZyLt2c+Gy/wTSsTNxqUXJ4
         P2tq9gRAiS/lmc+qZ6JRuYpoAr7nrtrYu6oKr7z5HeYMqMrDgecxsOcIyUes3OGKMb73
         4IJQ==
X-Gm-Message-State: APjAAAX+U38DFu/hX4YuLTC7GH/MjF6kvdZMVgMepNCzKuOMShQz2h2k
        47vQUxLtUycSMkWXdyensbnhB8vKWBGQVttA1p7BtSd7
X-Google-Smtp-Source: APXvYqxfyGKRIQlSeSi4rdMAJk89SgbdTTUtOXFiMGg+V5s+74l/jRcvT8vNlzEoWGFUeChWyQOfxr8pJhQnQZp1WEY=
X-Received: by 2002:a9d:704f:: with SMTP id x15mr8468680otj.297.1562156943524;
 Wed, 03 Jul 2019 05:29:03 -0700 (PDT)
MIME-Version: 1.0
References: <20190703083514.32385-1-horms+renesas@verge.net.au> <20190703083514.32385-3-horms+renesas@verge.net.au>
In-Reply-To: <20190703083514.32385-3-horms+renesas@verge.net.au>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 3 Jul 2019 14:28:51 +0200
Message-ID: <CAMuHMdVgx9N0yeeei5qcg1yz2WEdDf0gQ6GcwUOAz7u09S_D4A@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] dt-bindings: usb: renesas_gen3: Rename bindings
 documentation file
To:     Simon Horman <horms+renesas@verge.net.au>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        USB list <linux-usb@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Simon,

On Wed, Jul 3, 2019 at 10:35 AM Simon Horman <horms+renesas@verge.net.au> wrote:
> For consistency with the naming of (most) other documentation files for DT
> bindings for Renesas IP blocks rename the Renesas USB3.0 peripheral
> documentation file from renesas-gen3.txt to renesas,usb3-peri.txt
>
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
>
> ---
> v2
> * Accumulate review tags
> * Use renesas,usb3-peri.txt as new filename as suggested by Shimoda-san

Unfortunately the previous version has already made it into usb-next
23c46801d14cb647 dt-bindings: usb: renesas_gen3: Rename bindings
documentation file

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
