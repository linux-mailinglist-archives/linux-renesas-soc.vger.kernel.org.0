Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D41648208B
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  5 Aug 2019 17:42:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726847AbfHEPmP (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 5 Aug 2019 11:42:15 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:54819 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726559AbfHEPmP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 5 Aug 2019 11:42:15 -0400
Received: by mail-wm1-f68.google.com with SMTP id p74so75190841wme.4
        for <linux-renesas-soc@vger.kernel.org>; Mon, 05 Aug 2019 08:42:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JHB3YRpbA21rEsaEiwqW6v/ZPe4iBbBAdrfJyabclTk=;
        b=KZmAfEiTEFPX2UhG/NsxAQVxlZBbrAWpV7+szIvuke2PboTOZLSkON90m0YDYZA0oz
         aY3fASau25GtOexoY8qrOzqJkxUp5AmOgn8zRnsZR/B2iRVJHOUVYjoZe8RXVAULDPHQ
         wztyTAq4/G1oJQw9EbLliH16pDkc0F9lBs30wnn3ZaqT4lYlVQbth3uFKw5cWC7tuDHG
         gakNNgTQJkrYXOxTcBzF1kYyYh6Aq6ZaUVODnGJwly2dt1U4rfNl+tlfRC1CMAVZDxEx
         rf52WBJFJE9B7RdBVu1jWysCcCJgOoZZBnOh3p/q9xteopf/4vtqvEB6aGabOFUhoaks
         sDew==
X-Gm-Message-State: APjAAAVlMgZXYO4kpXZ7SkZUHCrQd5WkYLXLcAKuU6kr8yKVPtO5Dvfv
        uSNrZBpYQHfCFKhKZljZzbddgVad5pGi9jIezyI=
X-Google-Smtp-Source: APXvYqyR3czauETeNno2VqKp42T9K8ZwyBJUAOQGVb0sbclvRABUM6jaQGFDcxRuaZ5TVxq1I1+mGklafO7Vqkvs5Q0=
X-Received: by 2002:a7b:c310:: with SMTP id k16mr18342131wmj.133.1565019733345;
 Mon, 05 Aug 2019 08:42:13 -0700 (PDT)
MIME-Version: 1.0
References: <1564669397-22515-1-git-send-email-ykaneko0929@gmail.com>
In-Reply-To: <1564669397-22515-1-git-send-email-ykaneko0929@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 5 Aug 2019 17:42:00 +0200
Message-ID: <CAMuHMdUzXbXJWvJ=KooB-1p7Upjtv4mebyW-A2ArJCVUxNKPYQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: r8a77970-v3msk: sort nodes
To:     Yoshihiro Kaneko <ykaneko0929@gmail.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Aug 1, 2019 at 4:23 PM Yoshihiro Kaneko <ykaneko0929@gmail.com> wrote:
> Sort nodes.
>
> If node address is present
>    * Sort by node address, grouping all nodes with the same compat string
>      and sorting the group alphabetically.
> Else
>    * Sort alphabetically
>
> This should not have any run-time effect.
>
> Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.4.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
