Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 059773228C3
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Feb 2021 11:22:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230014AbhBWKV0 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 23 Feb 2021 05:21:26 -0500
Received: from mail-ot1-f47.google.com ([209.85.210.47]:38996 "EHLO
        mail-ot1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230459AbhBWKVY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 23 Feb 2021 05:21:24 -0500
Received: by mail-ot1-f47.google.com with SMTP id h22so6698451otr.6;
        Tue, 23 Feb 2021 02:21:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=w8nEdAaLe6eeQjEA1KVyS65nuSgIpVnfOfJ4wAmdRPY=;
        b=bOgQoYfXAik9BXfFbxCS17sXAthDgEyBUgR0T/0WhExAv7CEzIE1TejfCVQMZvFxv8
         EgReSzTBy49Byc268TDhJMjwQmDHDNb6cLv6gMYUc5uwyt3JnWa0LPFMl9tn66KHexfy
         VDn1CKhAV10ankYGvJfvKzxwTc5LYvZibUBxoYUSJHCEckDNgSJRabKCbIU3r3EFZqah
         nz0YqP8TT4TIxdng35QNjrKF3GC08rS6kjWD10whbpdvxc3EFbJkT+l6mAPtH3eiwhoD
         DfTFrgnjCMd1od3oO0bSuKTOkNFIJTMnGHZxh0EQQ3FLVY7f5mpYRYxEJDR2k3aMJz/y
         sbhw==
X-Gm-Message-State: AOAM530/deXMKm4HL28dMQChUFjzPuLOla2KBpgazhyR9rE9lThhqgWU
        CSJUqm5lV3HeCE6JBokI4cYIOpFxqLJSb2yiqc0=
X-Google-Smtp-Source: ABdhPJyjyHEqT/E6ioJ6Ge6h1TdlColzaosg90L4oDPns+hNXOfC3wAm3oKjYYUlt+7tRHs45ptVah2goUXKgjg0VQs=
X-Received: by 2002:a05:6830:148d:: with SMTP id s13mr19747426otq.250.1614075643614;
 Tue, 23 Feb 2021 02:20:43 -0800 (PST)
MIME-Version: 1.0
References: <20210222113955.7779-1-wsa+renesas@sang-engineering.com>
 <20210222113955.7779-3-wsa+renesas@sang-engineering.com> <CAMuHMdVFuof3C7JPw9BLUM0vBaiD+ZpUX2nSf8hiAZ4qw9doSQ@mail.gmail.com>
 <20210223101709.GA2486@ninjato>
In-Reply-To: <20210223101709.GA2486@ninjato>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 23 Feb 2021 11:20:32 +0100
Message-ID: <CAMuHMdV0Js5ro4PKOr02nCVRfO158B-5kh+F6TsLzdrJq=40bg@mail.gmail.com>
Subject: Re: [RFC PATCH v2 2/2] mmc: renesas_sdhi: do hard reset if possible
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux MMC List <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram,

On Tue, Feb 23, 2021 at 11:17 AM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> > Perhaps you want to add a "select RESET_CONTROLLER" to "config
> > MMC_SDHI"?
>
> Isn't "select" too strong for an optional feature? I'd think so.

It depends.  Why would you want to use the reset controller instead
of the custom reset in the first place?

Hmm, reminds me your patch doesn't explain the "why" part ;-)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
