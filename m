Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 37F9C7D85A
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  1 Aug 2019 11:18:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731093AbfHAJSv (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 1 Aug 2019 05:18:51 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:46188 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729792AbfHAJSv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 1 Aug 2019 05:18:51 -0400
Received: by mail-wr1-f65.google.com with SMTP id z1so72730869wru.13;
        Thu, 01 Aug 2019 02:18:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=r10Qd6YYdYObm/kh4AJAjNm3GS30LOuKxx3VhCdZ9K8=;
        b=PlBrNg+7H7JGrwH+gSEo5EZVMbHvcOj2OFxlwG/tRmQqR457c3Z6/YVnjfCTMsiZoX
         4MpgpRMiAN9/G4T5q0JhW8qD2/ygqIFbxXiAAXy0KVLy6/iVTbTh+jn4TqMNvAhTzYwx
         ewPdTxWBbJPtL8awzCqoobjn5nKcnYMXuiHjOiu8xmcNjv8Su7BflMz0ldepVqsJknHe
         4cY/5dWcGR9K1Et5bw2+dWfRqE8OPZgtf2KcRvyxV3Feu0u2KM2cS1yToK918O7ZBu3A
         OXAndSN5xxyFgURwWwBjzPVuyyd8Mb919a3PthDVjJowaiB/hADZOFsvhOIzgNjwl3fu
         U17g==
X-Gm-Message-State: APjAAAXJkq/mQPxBmipnsexkjjH0zgxnSWgs3yKZfOwPOBFrMJI1fa6m
        CGqltr6v9jM1S8QkBoGlfwGL0QVq4zb9G3ab/Zs=
X-Google-Smtp-Source: APXvYqyF0VUJ/JXcdoyEBWs3YLUcWDWSgeotOTO8iBg5kxyw1WcPITJd42lrocRejGbuI6khCDdX3HUeDCivKTRzupI=
X-Received: by 2002:adf:cd81:: with SMTP id q1mr138066606wrj.16.1564651128767;
 Thu, 01 Aug 2019 02:18:48 -0700 (PDT)
MIME-Version: 1.0
References: <20190801091337.27786-1-horms+renesas@verge.net.au>
In-Reply-To: <20190801091337.27786-1-horms+renesas@verge.net.au>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 1 Aug 2019 11:18:36 +0200
Message-ID: <CAMuHMdXNbqmS4T50+1PXp1-o1NLwbYCKqV=6e1Vj_vuicUxMOQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: usb: renesas_gen3: Rename bindings
 documentation file to reflect IP block
To:     Simon Horman <horms+renesas@verge.net.au>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        USB list <linux-usb@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Aug 1, 2019 at 11:13 AM Simon Horman <horms+renesas@verge.net.au> wrote:
> For consistency with the naming of (most) other documentation files for DT
> bindings for Renesas IP blocks rename the Renesas USB3.0 peripheral
> documentation file from renesas,gen3.txt to renesas,usb3-peri.txt

from renesas,usb3.txt

> This refines a recent rename from renesas,gen3.txt to renesas-gen3.txt.

Actually it was renamed from renesas_usb3.txt to renesas,usb3.txt.

> The motivation is to to more accurately reflect the IP block documented in

double to

> this file.
>
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>

With the above fixed:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
