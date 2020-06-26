Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB0D020AF71
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 26 Jun 2020 12:13:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726917AbgFZKNk (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 26 Jun 2020 06:13:40 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:42722 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726553AbgFZKNk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 26 Jun 2020 06:13:40 -0400
Received: by mail-ot1-f67.google.com with SMTP id t6so8084837otk.9
        for <linux-renesas-soc@vger.kernel.org>; Fri, 26 Jun 2020 03:13:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=r0z2YyCdGC+xU3ACdwlZEI1kOh3mIWBIFw/ZGb32d3U=;
        b=OjyloDzLrOASubhQR1BuVfsMMeQ8G35HeUxQTDs292c9+qAym+Ord4menAqTmifmWn
         FCDqdVt5vHE1vJReyTCmnDQ/w23nKezOlyxMFUlx0M4cZ0UP0vzoKJxY69GiB3AK5/Il
         JrgVBN/WTSi398XWSqbg7zT2lcWm49vRI+NhrzQCFHzAXJwGCKLC2dzm6EfvatjFpYnJ
         TgcwWRFu/cFpo1be6qM+BMcsi5KNtUyRufzE8G376ef3gU7nw65VUbD3hsnBZ9AnL2Yq
         aEWFlcGZXIA8klj6atXousf4z9F76Xxi1AK8qGN2Zl6NikXdQd554uVI7eAFp4bwuK13
         MAlg==
X-Gm-Message-State: AOAM532Tr9NKWAg8DfJzP3G9WzbIP+1f5L3ftepvoEcgdTjYdM3WhsyV
        rdCzdlBrb+gfMNsoAPhcX+FjaCO5Bgoxdusyrn14rw==
X-Google-Smtp-Source: ABdhPJzK6XKnotHvwxIUZCpYVhiP/BVvzavep/gIy/ZFe5xWhYp5qP5OeOT7l1rhJectloVYDpW+T4zIpphUmdVt27A=
X-Received: by 2002:a9d:2646:: with SMTP id a64mr1615175otb.107.1593166419680;
 Fri, 26 Jun 2020 03:13:39 -0700 (PDT)
MIME-Version: 1.0
References: <1593163942-5087-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1593163942-5087-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 26 Jun 2020 12:13:28 +0200
Message-ID: <CAMuHMdU0OEA7seCDadrSsNYXHQJOuSRrm8O439PK_pf3NoLxsg@mail.gmail.com>
Subject: Re: [PATCH/RFC v4 0/4] treewide: add regulator condition on _mmc_suspend()
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Shimoda-san,

[reducing audience]

On Fri, Jun 26, 2020 at 11:32 AM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> Note that v5.8-rc2 with r8a77951-salvator-xs seems to cause panic from
> PCI driver when the system is suspended. So, I disabled the PCI
> devices when I tested this patch series.

Does this happen with current renesas-devel and renesas_defconfig?
(it doesn't for me)
Do you have any PCIe devices attached? (I haven't)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
