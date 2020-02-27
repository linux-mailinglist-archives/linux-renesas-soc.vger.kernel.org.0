Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A3DF01727BC
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Feb 2020 19:38:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729402AbgB0SdW (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 27 Feb 2020 13:33:22 -0500
Received: from mail-io1-f66.google.com ([209.85.166.66]:33888 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729306AbgB0SdW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 27 Feb 2020 13:33:22 -0500
Received: by mail-io1-f66.google.com with SMTP id z190so581836iof.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 27 Feb 2020 10:33:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lixom-net.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=E7WO/NUxGv82Kf1dVrT+16+HfZ68MhNea8HytDwhqyw=;
        b=dDlTY+HgwgsvQ5xJ8+Hk1X+IRSOVAMCit/kiKPiZmFv2sjbZZqgHkNQR/RafnMCRZY
         hwdlikXVytW/mOAzi/NlUvfQpKaIriHabsmG/zfSsACtuxMuAPVHZYFo2wN/HW+SYNsQ
         9OslPFaPXicUrUv+kQQGObGg7bXRXoMuaKmD5jiuAzXD7xqnp+XjAE5I1yXeUMaF+WAf
         QXF0zuZMsdxBDgteXJHgLBFj6MD5AaKn+QIEHppS9A9BkWkrOeQsILX1HzZ9AYXkYHJX
         YRJ0RWxZdIW/QslG3vFML8SuUSTcYpAS8+YgE+6/wrlyjqYp9myE9D/RFX4hhzdK619u
         pKbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=E7WO/NUxGv82Kf1dVrT+16+HfZ68MhNea8HytDwhqyw=;
        b=UMhfL0Ge99QdYIa9FSlBoOgSn04hxuVNnL/LMSnE3c/u7/MmoA3EICL7kdnIp3Dgmd
         aw0VPUUfPm8Nn6RIZyiqtcHIni1kyv1xYXddqzRZtte7W/FmVcrkcCWA2PeOSFG1WP9V
         +DqO1lo6twJaLCJtx2gxd7AzwP6t4FhnQim2RFcOKNRARnorkMYdKrJkiqEjzjmRHfHj
         RIyatEHLOjOLRLtD0CTBvaZbHsz2G8E7okntWz3bqmgQtQ91q3wsRyUtlfP7fA5HQig3
         h2OcZWFla/Y22IY+IQpNTIjgpePqI9aQrZ501qGLkXadKqwS0r3iUMpAxhClT2Sbx82A
         /ItA==
X-Gm-Message-State: APjAAAXvDDyrDd4Z00F3GUX2rjf+no9bjPzbZFE4bfp/ZSUrrQ++i0Md
        8KAjE02nj8v614BfvjNOfdFYhjU83d/nS45Lii7BQg==
X-Google-Smtp-Source: APXvYqz0JZSMiGAn9FLjoYzJKMf64V4rXpI5AxwNpHCGrUsfgeFrJ/5Bi1clENFNl5NoGK6MW/yqNoXQYEb7zczBpL8=
X-Received: by 2002:a5e:d614:: with SMTP id w20mr496610iom.278.1582828401861;
 Thu, 27 Feb 2020 10:33:21 -0800 (PST)
MIME-Version: 1.0
References: <20200226110221.19288-1-geert+renesas@glider.be>
 <20200227181018.5nixs7o7lght3mug@localhost> <CAMuHMdXa1Kjmp+9_dWGGF1Dz-6op+-6iSdF56PHSZFgWOAXEgQ@mail.gmail.com>
In-Reply-To: <CAMuHMdXa1Kjmp+9_dWGGF1Dz-6op+-6iSdF56PHSZFgWOAXEgQ@mail.gmail.com>
From:   Olof Johansson <olof@lixom.net>
Date:   Thu, 27 Feb 2020 10:33:10 -0800
Message-ID: <CAOesGMjVm1TMjhBtFG9-acw=c7COhkcoErdmkJjz0ZG0QraH3Q@mail.gmail.com>
Subject: Re: [GIT PULL 0/5] Renesas SoC updates for v5.7
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Konstantin Ryabitsev <mricon@kernel.org>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        arm-soc <arm@kernel.org>, arm-soc <soc@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        users@linux.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Feb 27, 2020 at 10:19 AM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
>
> Hi Olof,
>
> On Thu, Feb 27, 2020 at 7:10 PM Olof Johansson <olof@lixom.net> wrote:
> > On Wed, Feb 26, 2020 at 12:02:16PM +0100, Geert Uytterhoeven wrote:
> > > This is my first pull request for the inclusion of Renesas SoC updates
> > > for v5.7.
> > >
> > > It consists of 5 parts:
> >
> > Only 2 of these were sent to arm@kernel.org / soc@kernel.org: 2/5 and 5/5.
> > Mind checking your scripts to make sure you send them to us so they end
> > up in our patchwork? (And please resend the ones who weren't).
>
> Strange, I used a single git send-email command for the whole series.
>
> I do see them all of them at
> https://patchwork.kernel.org/project/linux-soc/list/,
> https://patchwork.kernel.org/project/linux-soc/list/?series=247609 ?
> Lore also has them:
> https://lore.kernel.org/linux-renesas-soc/20200227181018.5nixs7o7lght3mug@localhost/T/#m2ec32842569b4b4dc25d4ecda668e509edaba98b
>
> Perhaps they got lost on the path to your inbox? Recently I had a similar
> problem with some patches, which appeared at the list and patchwork, but
> never in my (Gmail) inbox.

This is how the email I got looked like:

From: Geert Uytterhoeven <geert+renesas@glider.be>
To: "Linuxkernel+Patchwork-Soc via Email Integration"
<patchwork-soc@linux.kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
linux-arm-kernel@lists.infradead.org,
linux-renesas-soc@vger.kernel.org, Geert Uytterhoeven
<geert+renesas@glider.be>
Subject: [GIT PULL 1/5] Renesas ARM DT updates for v5.7
Date: Wed, 26 Feb 2020 12:02:17 +0100
Message-Id: <20200226110221.19288-2-geert+renesas@glider.be>
In-Reply-To: <20200226110221.19288-1-geert+renesas@glider.be>
References: <20200226110221.19288-1-geert+renesas@glider.be>
Precedence: Bulk
List-Unsubscribe: <https://linux.kernel.org/g/patchwork-soc/unsub>
Sender: patchwork-soc@linux.kernel.org
List-Id: <patchwork-soc.linux.kernel.org>
Mailing-List: list patchwork-soc@linux.kernel.org; contact
patchwork-soc+owner@linux.kernel.org
Delivered-To: mailing list <patchwork-soc@linux.kernel.org>
Reply-To: patchwork-soc+owner@linux.kernel.org


It no longer had the {arm,soc}@kernel.org recipients on it, instead
the internal-only mailing list that connects soc@kernel.org with
patchwork. Very odd. Reply-to rewrites are undesirable too.

Konstantin, anything on your side that can shed light on this? My mail
filters locally expects to see soc@kernel.org and arm@kernel.org
recipients still intact in the to-line, and it's really odd that 2 of
the 5 emails looked as expected.


-Olof
