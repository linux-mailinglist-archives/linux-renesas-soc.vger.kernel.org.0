Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1D72482060
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  5 Aug 2019 17:36:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727802AbfHEPgd (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 5 Aug 2019 11:36:33 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:51567 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727328AbfHEPgd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 5 Aug 2019 11:36:33 -0400
Received: by mail-wm1-f67.google.com with SMTP id 207so75220457wma.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 05 Aug 2019 08:36:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9rSCX6R2XZOTJnRaLplOC9AtcGOL4okCuqc4EieSckM=;
        b=Fnh2SM/WWwcmMsPTlh3MBaMTw9Pp0efPR9xOD2kZS0IK3Dt8m07KcRd/TaR7LZqjqx
         nL57Nm7MJYQuJoSkwaB/yeCAwz5LDbqQhihzKkFqzS9tV3gh8bHILj4hMz9Yf9xvqqYa
         7KvpIgt0U+Yiw24cZnN5akbzi/xQ/5gHh8ko36NhVJOSfz6+1SRMucrO+ml6s2Cupp0b
         MAO3LuCEvdnwnx7pCRbSGynC6BTvYJv2hYYsKC2Ex0L5YIp8zNQ1lLJd5IZB3pZx3Wg5
         LQX8Nub09KL2/33KeRqgbQO3bpUybLv3ODvA14M2wTq1poWpdBjjSjRCmN5v9mpUigLX
         A1cA==
X-Gm-Message-State: APjAAAVvOnnc24MdedTfvwoZDle2tzM1qnjhUNY07eCa4emmkITOT/nd
        m75SYNnWlZC55VgRxNt7+8b5z8uefbfIa8O0uik=
X-Google-Smtp-Source: APXvYqxlQ+OcOIe3dUoSdiHi/0Cbv5zBJhjrsU4lJIZrBIBi/9YZ3uT0lMrKsiPwHgYW675R1Pskw1OhCRCw5K8FPuU=
X-Received: by 2002:a1c:a7c6:: with SMTP id q189mr19652057wme.146.1565019391790;
 Mon, 05 Aug 2019 08:36:31 -0700 (PDT)
MIME-Version: 1.0
References: <1564669495-22718-1-git-send-email-ykaneko0929@gmail.com>
In-Reply-To: <1564669495-22718-1-git-send-email-ykaneko0929@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 5 Aug 2019 17:36:19 +0200
Message-ID: <CAMuHMdWn=ZKVwEuq5wKq+5=6+kMpz8aOrN=YY01Q__71hHY-Gg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: r8a77995-draak: sort nodes
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

On Thu, Aug 1, 2019 at 4:25 PM Yoshihiro Kaneko <ykaneko0929@gmail.com> wrote:
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
