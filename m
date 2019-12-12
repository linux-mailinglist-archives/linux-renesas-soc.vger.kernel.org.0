Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6B17611D212
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Dec 2019 17:19:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729857AbfLLQTG (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 12 Dec 2019 11:19:06 -0500
Received: from mail-oi1-f196.google.com ([209.85.167.196]:39791 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729591AbfLLQTG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 12 Dec 2019 11:19:06 -0500
Received: by mail-oi1-f196.google.com with SMTP id a67so847318oib.6;
        Thu, 12 Dec 2019 08:19:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=V6mXcyFHURt7wNS5bFeTnPVdoJMNw0zAfh1vJmQ26lM=;
        b=gZPI4r5eaw9K7dJo/rh6CpP5ZavRYztoU/VocsvdaKGJgXyTo1zk+MaXz4lZzrfpYS
         n3ma/civuduJcONoJ9UcMECOGRKoCtWs+pV9zxidxKmP9j8998i+GuyJdWKJVvVhMXY6
         kl+0Vv9D5Sg5WOLLhNC7kdbHSAuR/CKgoKyPVJX5NR3rq/1gjBi86efGZ5S2AwP28ZdO
         7BMQ2djTiewKMjRrx23MtIB1NhnwHXLy2Iv6lNLim85JaZBtmoriNe0sZD/dyRzwFAn5
         eDwhroAwY3+kppSaRDVua5wMHaCNAuDIMB8xaG2KccaNqXjArJQ2AWn4VN0SbU9So0W4
         FpJw==
X-Gm-Message-State: APjAAAWYF4/yRoCiGZNn29FsWAkIszTgwTjpVJ2t9ZV/AgbiTOWA81A2
        TuoXnxKJif7fJ6nY+noNJGSudh2qmP8b5dqkb9E=
X-Google-Smtp-Source: APXvYqw5VClDGbQpWKwIP85q0cyMHOS3MRztEfDm3by5BJCak/k94Omx3F8Lyu1OQsKI9Pmj137sJ+SUDPMmccWs954=
X-Received: by 2002:aca:48cd:: with SMTP id v196mr5637847oia.102.1576167545247;
 Thu, 12 Dec 2019 08:19:05 -0800 (PST)
MIME-Version: 1.0
References: <23236201-a387-7257-35a4-ee4ed2f6bfd0@ideasonboard.com>
 <20191209163755.GF5483@sirena.org.uk> <fb87c957-40e8-587e-5789-33b740f8326d@ideasonboard.com>
 <20191212155656.GE4310@sirena.org.uk>
In-Reply-To: <20191212155656.GE4310@sirena.org.uk>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 12 Dec 2019 17:18:43 +0100
Message-ID: <CAMuHMdXwNPKfL5Xijtb2RFvf5MDEuiqUZ9DOdWdWxD=RRhScwQ@mail.gmail.com>
Subject: Re: Regulator probe on demand (or circular dependencies)
To:     Mark Brown <broonie@kernel.org>
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Mark,

On Thu, Dec 12, 2019 at 4:57 PM Mark Brown <broonie@kernel.org> wrote:
> On Wed, Dec 11, 2019 at 10:42:43PM +0000, Kieran Bingham wrote:
 sort of wondering if something like this could optimise away some
> > of the -EPROBE_DEFER iterations at a more global level, but I don't know
> > how or if that would work anyway.
>
> In theory someone could try to do some sort of sorting with the DT
> graph, people keep talking about it but nobody's done anything that I'm
> aware of.

"of_devlink" has landed in v5.5-rc1, cfr. commit a3e1d1a7f5fcccaf ("of:
property: Add functional dependency link from DT bindings").

I gave it a try on some boards lately.  It improved the deferral situation on
Koelsch, but made it worse on Salvator-XS.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
