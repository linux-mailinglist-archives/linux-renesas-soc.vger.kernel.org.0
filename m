Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9B20198C36
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Aug 2019 09:09:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728512AbfHVHJT (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 22 Aug 2019 03:09:19 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:35074 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727401AbfHVHJS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 22 Aug 2019 03:09:18 -0400
Received: by mail-oi1-f193.google.com with SMTP id a127so3624388oii.2;
        Thu, 22 Aug 2019 00:09:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Odi1zm5kNxT56P4RawsvIjvMtfBtVv2o70eDUobjKNk=;
        b=Fw2HnD92GovBtJbznMZlZ2znns07LLsIxyEL2S5oJh59HEFOarudQMdycp87HcmrNM
         xDUSvnN2MsdfI5rBLDOin+0HCgeRtAn66zs3zXcanXHOwYcVRbxfJdqFdKFq2Pbr8KXG
         CGLXqM2n9zuVB4y/HArLrsbU/syUXZ45+4KiXmR7iMldUtOWbxcLzWsud61Addqhwc+g
         jao+hy54/1rAAhyyey8oPVI+g0Um1HCHVSHZYEsiupRmM4/vwTNnbWY0pLGCcN7ySGAQ
         3uzgMMk269+rENi1aULq2sDThZHg+zD8UYk+fFkyrmJ6AtiAAfsdNsCodqWAbpDcigNC
         XFng==
X-Gm-Message-State: APjAAAU080BiH4WEnurh/nYrp4vxFfoM08b5ncxNQvD47MDQCfhUepBF
        101jgcA1291AaUmX6gneyM/P33Vrwcc4gWJ5Gi4=
X-Google-Smtp-Source: APXvYqyrdO65gOQhblbDupGny0LzlTDdRzUwnJtcgF6/nnHjbviZqyuAnjhjTztKG/HCJzyaJ0YCVW05n883IyifrnI=
X-Received: by 2002:aca:b154:: with SMTP id a81mr287433oif.148.1566457757978;
 Thu, 22 Aug 2019 00:09:17 -0700 (PDT)
MIME-Version: 1.0
References: <156630449239.17444.11157306180861080402.sendpatchset@octo> <156630451480.17444.3045034693349256156.sendpatchset@octo>
In-Reply-To: <156630451480.17444.3045034693349256156.sendpatchset@octo>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 22 Aug 2019 09:09:06 +0200
Message-ID: <CAMuHMdV3go4MODaW-9X_h-zHkHam825OEh9qgLtnoZQ2F9fCTQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/7] dt-bindings: timer: renesas, cmt: Update CMT1 on
 sh73a0 and r8a7740
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Simon Horman <horms+renesas@verge.net.au>,
        Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Aug 20, 2019 at 2:33 PM Magnus Damm <magnus.damm@gmail.com> wrote:
> From: Magnus Damm <damm+renesas@opensource.se>
>
> This patch reworks the DT binding documentation for the 6-channel
> 48-bit CMTs known as CMT1 on r8a7740 and sh73a0.
>
> After the update the same style of DT binding as the rest of the upstream
> SoCs will now also be used by r8a7740 and sh73a0. The DT binding "cmt-48"
> is removed from the DT binding documentation, however software support for
> this deprecated binding will still remain in the CMT driver for some time.
>
> Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
