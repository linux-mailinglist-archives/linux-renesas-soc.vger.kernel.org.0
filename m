Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EA2284A2CC
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Jun 2019 15:50:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728845AbfFRNui (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 18 Jun 2019 09:50:38 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:45273 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726330AbfFRNui (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 18 Jun 2019 09:50:38 -0400
Received: by mail-lj1-f195.google.com with SMTP id m23so13182987lje.12;
        Tue, 18 Jun 2019 06:50:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=H6baJYY0bHxjGwD2jhFAtoEZX118yPW/WL/m/3qULgw=;
        b=kL+Ns4TEt4ngKD2XzzL1eiu0eOV086VXpGQIhgOz/CtbrGtv9IMwf0ObIp9eYLsF9b
         XfAIl27XzThmgK33LyVSWHzebPxCefkzr6VMUoPsk7FLwZab00VoVKywSasy6/PVCnbv
         U5s17/t/P1VIy9F1FM3mbjlPkWXhHKEDLIqHJs1uxe8oW5Tt/i4x5LMV3k64ZmnAScZU
         uu769zClTSct+y4qqzlC1llRWz+xhL4UwNKPyhPZMSgG00rLkY02jyH6nijgXWUuzwnV
         8VtOZOwbsuRoZr0HS+BQ2WPffurFxBnnRG+aDJotjKliMOKBYnrKwVuyoYYB56JiT8ZY
         E++w==
X-Gm-Message-State: APjAAAUhaLXsgtSyEyZrLQuQvnr4jYVwifJDUKjlxo+qqraxXLMhQEeA
        w8nGuRBktZIraenQQ6sFJQF1P4XQBjpMFUfE2EY=
X-Google-Smtp-Source: APXvYqx3rVUailLpodItFz/fzH9gekjzzCcOovc1MtDS56MO/Oyu3LgGVmvlrQAGIqc6SJsq42XCt4hUojLZNN5DrHA=
X-Received: by 2002:a2e:9a58:: with SMTP id k24mr17705290ljj.165.1560865835709;
 Tue, 18 Jun 2019 06:50:35 -0700 (PDT)
MIME-Version: 1.0
References: <20190617090603.8449-1-horms+renesas@verge.net.au> <20190617090603.8449-3-horms+renesas@verge.net.au>
In-Reply-To: <20190617090603.8449-3-horms+renesas@verge.net.au>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 18 Jun 2019 15:50:23 +0200
Message-ID: <CAMuHMdWTvqZ4Vda=Eui69DDLtaRUFUVgkoZDhZcu5A7SuD7YHQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] dt-bindings: usb: renesas_gen3: Rename bindings
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
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Jun 17, 2019 at 11:07 AM Simon Horman
<horms+renesas@verge.net.au> wrote:
> For consistency with the naming of (most) other documentation files for DT
> bindings for Renesas IP blocks rename the Renesas USB3.0 peripheral
> documentation file from renesas-gen3.txt to renesas,gen3.txt.
>
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
