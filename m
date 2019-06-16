Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EB73D4745B
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 16 Jun 2019 13:27:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725874AbfFPL1c (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 16 Jun 2019 07:27:32 -0400
Received: from mail-ot1-f43.google.com ([209.85.210.43]:35701 "EHLO
        mail-ot1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725861AbfFPL1c (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 16 Jun 2019 07:27:32 -0400
Received: by mail-ot1-f43.google.com with SMTP id j19so6772101otq.2
        for <linux-renesas-soc@vger.kernel.org>; Sun, 16 Jun 2019 04:27:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=erfU7rxivGb4lVNGkqCqD0p/OXnXjIQY0I8TQwxXibo=;
        b=TM6GAxz2tdvGBnARsJ072K6Ip7rmVvVyXjCwqMHF1sxXm4uJa2mKtuuHcOVOJYIQ9c
         iMxlaszf9XKPbVaCIkH5IuAlMZeeNkLt/NZe352noi5HuFVDuTUIpdWbILcgOLuG8NP4
         MeEvrslg3/jxe11A+Rf7MZsbvZhRjZljyMcPbnROxkp4jOj2gBIoeLSMp/SjH9/BtkCf
         3HzwRt46q2Chfo4B0IFAICokFwBvOdvnVA8bl9yo2kpdq5Q9VRv/3VKYh7i56UQoFigE
         HNywAt8QPDhVvv3mEfn/1UYRwk29R8hnEr0yv1Ojzf5018wHK3ZzAoZms7dFOCWIPtnH
         JCVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=erfU7rxivGb4lVNGkqCqD0p/OXnXjIQY0I8TQwxXibo=;
        b=pyqOc1LYOXjcdC6UZ5919m+j1jWc/341IYt49WHTq7LKUsJZKt2XcOxnOdF17CWfLy
         S1Zu+7/h9ZbI6Us8UmnXaeqiAGvzk+BWp4k33Bzb1ruxbAchPvkTWgcui/pKHS0wqM+9
         di8bzqfGXJ3PcKzoPN8s61Pp6+rd/XJD6j0JfIL1BnElCAl5bynbzhU4XGXmpVcRA5FH
         OLwGkItqGwu06vkGaAI72aXpLFRozGDDc8PGghcxw33FQpIt6YqFUaHzWg7NVDWnTDyY
         k+Bpy8h43fbatG8yvpxDMIZv7CaOdjzvoUxSITIk3p6c6JIDEvB/vfsYXbKxYJeLYWSG
         YvGA==
X-Gm-Message-State: APjAAAUX6gn3frnSmbulwE3NMGfeh8G4tyvqXuHZTXTOUeyEWw23fF+D
        a1iAc6nr4jiEeyDMVtITY6F9dnuaQTD42oJrLAI=
X-Google-Smtp-Source: APXvYqxxlKCJHbqOewgzT68GnL0QEJNSIftErIs6sehSFbNCIVo0qT6trodlTjQ6ngOIEmqb26jrL9hCS3KS0QmHhes=
X-Received: by 2002:a9d:6959:: with SMTP id p25mr31795546oto.118.1560684451265;
 Sun, 16 Jun 2019 04:27:31 -0700 (PDT)
MIME-Version: 1.0
References: <1560084198-2930-1-git-send-email-ykaneko0929@gmail.com>
 <20190611123022.oo4arh76w72vlkg5@verge.net.au> <20190611140252.GL5016@pendragon.ideasonboard.com>
 <20190612121157.y6iiftulcsv3ty5w@verge.net.au>
In-Reply-To: <20190612121157.y6iiftulcsv3ty5w@verge.net.au>
From:   Yoshihiro Kaneko <ykaneko0929@gmail.com>
Date:   Sun, 16 Jun 2019 20:27:20 +0900
Message-ID: <CAH1o70KAnhfvdbXCMeNZxEm9d1pgN7qmuMJBLjjVnPFwAhz48A@mail.gmail.com>
Subject: Re: [PATCH/RFT] arm64: dts: renesas: r8a77990: Fix register range of
 display node
To:     Simon Horman <horms@verge.net.au>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Simon-san,

2019=E5=B9=B46=E6=9C=8812=E6=97=A5(=E6=B0=B4) 21:12 Simon Horman <horms@ver=
ge.net.au>:
>
> On Tue, Jun 11, 2019 at 05:02:52PM +0300, Laurent Pinchart wrote:
> > Hello,
> >
> > On Tue, Jun 11, 2019 at 02:30:27PM +0200, Simon Horman wrote:
> > > + Laurent
> > >
> > > On Sun, Jun 09, 2019 at 09:43:18PM +0900, Yoshihiro Kaneko wrote:
> > > > From: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> > > >
> > > > Since the R8A77990 SoC uses DU{0,1}, the range from the base addres=
s to
> > > > the 0x4000 address is used.
> > > > This patch fixed it.
> > > >
> > > > Fixes: 13ee2bfc5444 ("arm64: dts: renesas: r8a77990: Add display ou=
tput support")
> > > > Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> > > > Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>
> > >
> > > Thanks,
> > >
> > > This looks fine to me but I will wait to see if there are other revie=
ws
> > > before applying.
> > >
> > > Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
> >
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>
> Thanks, I have applied this for inclusion in v5.3.
>
> > > Is a similar fix also appropriate for D3 (r8a77995)
> >
> > Yes it is.
>
> Nice.
>
> Kaneko-san, could you prepare a patch?

Got it, will do.

Regards,
Kaneko

>
> > > And a variant that reduces the register size to 0x5000
> > > for M3-W (r8a77965).
> >
> > M3-W has registers at 0xfeb60000. You could reduce the size from
> > 0x80000 to 0x70000 but I don't think it's worth it.
>
> Got it, lets leave M3-W as is.
>
> ...
