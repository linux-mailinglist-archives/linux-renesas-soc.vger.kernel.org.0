Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 84C9B188C8
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 May 2019 13:12:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726054AbfEILM6 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 9 May 2019 07:12:58 -0400
Received: from mail-ua1-f66.google.com ([209.85.222.66]:36817 "EHLO
        mail-ua1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725869AbfEILM6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 9 May 2019 07:12:58 -0400
Received: by mail-ua1-f66.google.com with SMTP id z17so645586uar.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 09 May 2019 04:12:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2GNapSTWdZW+nfvnOZyYJdFFg0+Mfj5JFMwWRI5ntto=;
        b=UORuZB3m3CeL0MULSj9yYh91m585Uws6Vc8/dKgvCPsJhQ926oE1KxI0clWMVHcsZN
         BbwUsYUG2T2DIVPVSh5qf9VAVCtiyAZTVXM6g5qq/Al0KWXl8v7BeIzyK7SUZGz+ueGS
         qPMZuME56HwNrHDTJt7+TM07BZaqT3QdfCNqd/jYePnBKYg/mHxjTOSrAH0gGEC4tr6Z
         jdMg8gWIjnetI6txRcYLU/HCskiBMfabKP9Fensalq9/QktYbDkyZK/453cZ0vT8v8GB
         y7b4VEHuCl+Kll9MiB1mgQm6qaw99KT5EJYdkpuFnb3OjlgjVfzWWoMi2EUf46wxL9qE
         m2SQ==
X-Gm-Message-State: APjAAAVFeGfbjGrpO0JWZIMhwIeiUCuH6AKAnHCn+E7ZkRs4NZ4INRKy
        TaII+5NB6otKakIzB3sgNc7vekqNwjMfRvn73NA=
X-Google-Smtp-Source: APXvYqxs2BwR9KFho9QUZKAjVXGcEUPzucDa+2TRN5gs5hlRMDoHX8XsbZGI721UhcE8ELyDaqsmWC70YA55q4LtxZc=
X-Received: by 2002:a9f:352a:: with SMTP id o39mr1537803uao.78.1557400377371;
 Thu, 09 May 2019 04:12:57 -0700 (PDT)
MIME-Version: 1.0
References: <20190320071605.4289-1-jonas@norrbonn.se> <20190320071605.4289-3-jonas@norrbonn.se>
 <CAMuHMdVH85iFJngkU6W61ybwR2j3YQ7=cugPxgC57hUgBOc5KA@mail.gmail.com>
 <1f33e1e5-d7bf-76a0-c4d3-ecbc35fbfd4f@microchip.com> <CAMuHMdU83vLeVSqMZuJwR4yd382mau-OE1saMAOC2+6HodsHvg@mail.gmail.com>
 <fac5fa6d-95e9-cfb0-4d5a-6b16d4470190@norrbonn.se> <CAMuHMdUEdNr5rgCdaGAFJ-WK4oL2DC419smk+QYOJ7qJvkWA8A@mail.gmail.com>
 <a9ad3641-1eb8-782c-9dfd-0db41256d3f1@microchip.com> <ad49240c-2073-4045-c11c-fb6bad231321@microchip.com>
 <CAMuHMdVcp--qRo3m8kSQ=++Vx33kvxBWEHFVHfh-j=pq1x-GPQ@mail.gmail.com>
 <898831ba-b8bb-7c2b-e623-2e6c26da91b5@microchip.com> <CAMuHMdXFwFAPzYPKqj+FZgSq01VAD0izS3ELyOg1YBwTAQ_QkQ@mail.gmail.com>
 <8b004a57-0fd9-04fe-d031-1d98d890f826@microchip.com> <CAMuHMdXghAWmNJLUq_uOUVPrrNTAcFq=QqCGjLU51FchvOu3=g@mail.gmail.com>
 <6a8d9a6c-5281-88d2-51ae-e2afad847a8f@microchip.com> <CAMuHMdVBguF4ZQHTqwr6GAJKuUcvBGu-5p0GeYRmZ3dG8tXa2g@mail.gmail.com>
 <7649e84f-debb-cec8-d6d6-d33d9dce4259@microchip.com>
In-Reply-To: <7649e84f-debb-cec8-d6d6-d33d9dce4259@microchip.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 9 May 2019 13:12:43 +0200
Message-ID: <CAMuHMdVPrR=58_+P+D9Gos89n4Yv7wYzLORXmY=JKxZZ2ydKPg@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] spi-nor: s25fl512s supports region locking
To:     Tudor Ambarus <Tudor.Ambarus@microchip.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Jonas Bonn <jonas@norrbonn.se>,
        MTD Maling List <linux-mtd@lists.infradead.org>,
        Marek Vasut <marek.vasut+renesas@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Tudor,

On Thu, May 9, 2019 at 12:31 PM <Tudor.Ambarus@microchip.com> wrote:
> On 05/09/2019 12:11 PM, Geert Uytterhoeven wrote:
> > On Thu, May 9, 2019 at 8:56 AM <Tudor.Ambarus@microchip.com> wrote:
> >> When the configuration register QUAD bit CR[1] is 1, only the WRR command format
> >> with 16 data bits may be used, WRR with 8 bits is not recognized and hence the
> >> FFs. You probably set quad bit in u-boot, while others don't. We can verify this
> >> assumption with the patch form below. Can you try it?
> >
> > And /dev/mtd0 reading works fine.
> > Thanks!
> >
>
> I'm glad that it worked, thanks for the help. I'll do a patch to fix this case,
> but probably it will qualify for -next. Is -next ok for you?

Given the issue is present only in -next, fixing it in -next is fine for me.
Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
