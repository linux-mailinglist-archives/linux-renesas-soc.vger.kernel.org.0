Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 10A7F1BA103
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Apr 2020 12:22:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726932AbgD0KWp (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 27 Apr 2020 06:22:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726604AbgD0KWo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 27 Apr 2020 06:22:44 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5AACC0610D5
        for <linux-renesas-soc@vger.kernel.org>; Mon, 27 Apr 2020 03:22:43 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id v63so8797672pfb.10
        for <linux-renesas-soc@vger.kernel.org>; Mon, 27 Apr 2020 03:22:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=1CyxLaZcj63tQcR7tpc4uGoE1KDGBKikBpluCv751iQ=;
        b=Hgm0O5D0lCarAkzn4DV0qMdx7tM3kC1QJVrjbaAa/X38bcsMUwXZDOePZRakepLaEi
         ya2IRGM2AuFx6/UTyzBLHVx9q79FtdJq/l/m3VSUHXUvl5AGOsXg02/t+JpagqTKBY+l
         obX+tcG3SyQnpGzNDAdirBSQEglqgR6wCxsUrwAQQzjt2Bu+XzZsIEHvDpjMra1GLSlQ
         MSEf4ffKitmCDwnSIVAkqJSZNUB/aQfo6Ui2zLT0F5Ryz8LEqvNYgvQGnyKwe77+XYoS
         Vxb+SytqcBGuoccm99VXH3I6Ke6RBkkw2FA3eFkxWF4W/BvMnNrec62dGeUBH+npxyEk
         XcPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=1CyxLaZcj63tQcR7tpc4uGoE1KDGBKikBpluCv751iQ=;
        b=L9eI4rvSSYzLRJYKSOwUoVvUfZgZTLp9Ifyj2C7TGQwJbB2I7bxXZU8o2YSS2jH76c
         xIFcFSOgX0xjTfYjg8DRL7G74QsiuJpn2DpsJWuGA4sOZ9qMaWoTTCDDNLTivLDZ1LFK
         spAI+6MMfHY+XnsPuTSvztzwSsl6jqZi5fBaqgbnYAY3wbklkwyfc7mo5yLZ7d+h/283
         a9tHo9mYVzSe+CRYdERuzcVpFirROFlUrgfpURMyEAY2Hi4ktTtaxk7JMJ6+OW/zrH4z
         Kvi3s6+CRK5aVovRzw+YqNxBmGnhAE9zP88E3GHC4R0QnDyMH4FoGqk1xhjVFkLiNd+K
         AGDw==
X-Gm-Message-State: AGi0PuaktY7tRRhM8HD0oBIsQkQdJIsW5DPQiVmONGN0nfq+pPzFf0Ig
        /ChPpi6uI3TZNQXm6wUGLLrjwg==
X-Google-Smtp-Source: APiQypK3z4yQqpVlHsZhnbToQmUFhKubYEh51/9LQwynKZdCC2YUpDM70yeaRzHItaf4MzlKveltLA==
X-Received: by 2002:a62:fc82:: with SMTP id e124mr23801311pfh.126.1587982963367;
        Mon, 27 Apr 2020 03:22:43 -0700 (PDT)
Received: from localhost ([122.171.118.46])
        by smtp.gmail.com with ESMTPSA id h31sm11276301pjb.33.2020.04.27.03.22.42
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 27 Apr 2020 03:22:42 -0700 (PDT)
Date:   Mon, 27 Apr 2020 15:52:40 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Magnus Damm <magnus.damm@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Marian-Cristian Rotariu 
        <marian-cristian.rotariu.rb@bp.renesas.com>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux PM list <linux-pm@vger.kernel.org>
Subject: Re: [PATCH 10/10] cpufreq: dt: Add support for r8a7742
Message-ID: <20200427102240.jsskbskczvctvcwv@vireshk-i7>
References: <1587678050-23468-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1587678050-23468-11-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdV6J-_gBkzhUXtA8OrxhJVzyrAqjA8oeGJGBp86X-C3Nw@mail.gmail.com>
 <20200427092408.g2vpc6j2c6it4x2i@vireshk-i7>
 <CA+V-a8vwF=u53dZ_U4vX3oAUHrBh5uVUBeOTiDqTZJfV8UUeCA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+V-a8vwF=u53dZ_U4vX3oAUHrBh5uVUBeOTiDqTZJfV8UUeCA@mail.gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 27-04-20, 11:20, Lad, Prabhakar wrote:
> Hi Viresh,
> 
> On Mon, Apr 27, 2020 at 10:24 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> >
> > On 27-04-20, 11:22, Geert Uytterhoeven wrote:
> > > Hi Prabhakar,
> > >
> > > This patch should be merged through Viresh's cpufreq tree (CCed).
> > >
> > > On Thu, Apr 23, 2020 at 11:41 PM Lad Prabhakar
> > > <prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> > > > Add the compatible strings for supporting the generic cpufreq driver on
> > > > the Renesas RZ/G1H (R8A7742) SoC.
> > > >
> > > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > > Reviewed-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
> > >
> > > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> >
> > Prabhakar,
> >
> > Please resend the patch with all dependencies to me so I can apply it.
> >
> This is the only patch which is needed for R8A7742 SoC which needs to
> be applied for drivers/cpufreq. Shall I still repost it or you are
> happy to pick this one up ?

would be easier for me if you repost it. I don't have it in my
mailbox.

-- 
viresh
