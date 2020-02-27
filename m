Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C8A1F1726E5
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Feb 2020 19:19:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729915AbgB0STV (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 27 Feb 2020 13:19:21 -0500
Received: from mail-oi1-f196.google.com ([209.85.167.196]:43986 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729536AbgB0STV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 27 Feb 2020 13:19:21 -0500
Received: by mail-oi1-f196.google.com with SMTP id p125so124868oif.10
        for <linux-renesas-soc@vger.kernel.org>; Thu, 27 Feb 2020 10:19:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0lsBhCUmR1sr60mJjorCq8+qKSBSXVTeVNdq3RDua/U=;
        b=cu8FOAr5fGc2swFQo65FwNL+Ip3lS+2Vdqf39Pg7dlfLJCdX40tmUagF2ZL+TFYybD
         OmHSaZDWifEax/I3ymOWq2Vs4x8IS+aAha4VlmkfuGGM37+Gzv77qwktxgylCVcyACYI
         E9kjfl81lpPXOC2m392TN6m+JBeXaRIHiJwaU+EwcsgiiS0veVf1bat4BEewItAA/s/7
         ccaQOK/R75zfnShaXU8wkk3AiK+KVrv1JO5rOWt9stGISALAetwu0gJB3nuZ8ySpgB/Z
         CmvmoAmEPZqwwBzs9lOY8XnIrGB2wK2mFNYw0v7UDIpGxN3FFVTq6zisKFHjxI7BCbBH
         Ktxg==
X-Gm-Message-State: APjAAAVN/EqPmfuYeUNjbKTpsaTj0I4tE32Hgwb5/323xRDah1ufjrqu
        GGS2J9rCamQRqJLDBqtAq6KwdLc4+GwAACQZI9s=
X-Google-Smtp-Source: APXvYqwMMBjd1mKLccV09ba/ktbt44EM2nHmKdGFOjXoOJ/Ld8qlRsnA7/so1YFLvBx8SJuDrhcOL0K9L1uSCIl8+0Y=
X-Received: by 2002:aca:ed04:: with SMTP id l4mr287675oih.54.1582827561112;
 Thu, 27 Feb 2020 10:19:21 -0800 (PST)
MIME-Version: 1.0
References: <20200226110221.19288-1-geert+renesas@glider.be> <20200227181018.5nixs7o7lght3mug@localhost>
In-Reply-To: <20200227181018.5nixs7o7lght3mug@localhost>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 27 Feb 2020 19:19:10 +0100
Message-ID: <CAMuHMdXa1Kjmp+9_dWGGF1Dz-6op+-6iSdF56PHSZFgWOAXEgQ@mail.gmail.com>
Subject: Re: [GIT PULL 0/5] Renesas SoC updates for v5.7
To:     Olof Johansson <olof@lixom.net>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        arm-soc <arm@kernel.org>, arm-soc <soc@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Olof,

On Thu, Feb 27, 2020 at 7:10 PM Olof Johansson <olof@lixom.net> wrote:
> On Wed, Feb 26, 2020 at 12:02:16PM +0100, Geert Uytterhoeven wrote:
> > This is my first pull request for the inclusion of Renesas SoC updates
> > for v5.7.
> >
> > It consists of 5 parts:
>
> Only 2 of these were sent to arm@kernel.org / soc@kernel.org: 2/5 and 5/5.
> Mind checking your scripts to make sure you send them to us so they end
> up in our patchwork? (And please resend the ones who weren't).

Strange, I used a single git send-email command for the whole series.

I do see them all of them at
https://patchwork.kernel.org/project/linux-soc/list/,
https://patchwork.kernel.org/project/linux-soc/list/?series=247609 ?
Lore also has them:
https://lore.kernel.org/linux-renesas-soc/20200227181018.5nixs7o7lght3mug@localhost/T/#m2ec32842569b4b4dc25d4ecda668e509edaba98b

Perhaps they got lost on the path to your inbox? Recently I had a similar
problem with some patches, which appeared at the list and patchwork, but
never in my (Gmail) inbox.

Do I still need to resend?

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
