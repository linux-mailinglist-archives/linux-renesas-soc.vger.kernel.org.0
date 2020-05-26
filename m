Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 51D3F1E25BA
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 May 2020 17:42:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730378AbgEZPly (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 26 May 2020 11:41:54 -0400
Received: from mail.kernel.org ([198.145.29.99]:39252 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730125AbgEZPlg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 26 May 2020 11:41:36 -0400
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 97EB4208C7;
        Tue, 26 May 2020 15:41:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1590507695;
        bh=gZ8aNmKdT4zxOHADWbLT5Y6H7LmM9caifHy5dcL7o1w=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=Rz0KVAKpuQWjbYVqG4KX84a/Z2Zt/9Ql+miy0TU2C8vgkSO0PKYNUlF+XR1rC8KGE
         mh5sj0zdQJcaRR4rzJF+iAFeCl4Ewnku9jGmDJ+IE0NVkPLvrYsaAFvztrx3rMj64U
         L8w9Hs820XIx3lSpLEb6FRx8eXc56ZIvb4NDhCtw=
Received: by mail-ot1-f54.google.com with SMTP id v17so16702199ote.0;
        Tue, 26 May 2020 08:41:35 -0700 (PDT)
X-Gm-Message-State: AOAM531xjewdXXNAVed+SjfPj9YTZrP3lN95WPzw0Rc1y+0tzutO1EXp
        gCDL/Rq61GcR6zkBErk9lAWLWoG/xXoKvawOTw==
X-Google-Smtp-Source: ABdhPJyw5d4vkXtjRoAzpvfuHmTQkWPHTHP8fjfXFmWwTl18r8lTB38VHOpsCiY4+6yITwPGZ8kGTMGihvRi8sPe2BQ=
X-Received: by 2002:a05:6830:18d9:: with SMTP id v25mr1226309ote.107.1590507694863;
 Tue, 26 May 2020 08:41:34 -0700 (PDT)
MIME-Version: 1.0
References: <20200522220103.908307-1-anders.roxell@linaro.org>
 <20200524222025.GA3116034@ubuntu-s3-xlarge-x86> <292277.1590449865@turing-police>
 <20200526053850.GA2368760@ubuntu-s3-xlarge-x86>
In-Reply-To: <20200526053850.GA2368760@ubuntu-s3-xlarge-x86>
From:   Rob Herring <robh@kernel.org>
Date:   Tue, 26 May 2020 09:41:20 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJ9LnCpH92bXfk4ryXrTgzbPM03=PYLTzQXazuznJM=hg@mail.gmail.com>
Message-ID: <CAL_JsqJ9LnCpH92bXfk4ryXrTgzbPM03=PYLTzQXazuznJM=hg@mail.gmail.com>
Subject: Re: [PATCH] power: reset: vexpress: fix build issue
To:     Nathan Chancellor <natechancellor@gmail.com>
Cc:     =?UTF-8?Q?Valdis_Kl=C4=93tnieks?= <valdis.kletnieks@vt.edu>,
        Anders Roxell <anders.roxell@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        "open list:MEDIA DRIVERS FOR RENESAS - FCP" 
        <linux-renesas-soc@vger.kernel.org>,
        Sebastian Reichel <sre@kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

" On Mon, May 25, 2020 at 11:38 PM Nathan Chancellor
<natechancellor@gmail.com> wrote:
>
> On Mon, May 25, 2020 at 07:37:45PM -0400, Valdis Kl=C4=93tnieks wrote:
> > On Sun, 24 May 2020 15:20:25 -0700, Nathan Chancellor said:
> >
> > > arm-linux-gnueabi-ld: drivers/power/reset/vexpress-poweroff.o: in fun=
ction `vexpress_reset_probe':
> > > vexpress-poweroff.c:(.text+0x36c): undefined reference to `devm_regma=
p_init_vexpress_config'
> >
> > The part I can't figure out is that git blame tells me there's already =
an
> > export:
> >
> > 3b9334ac835bb (Pawel Moll      2014-04-30 16:46:29 +0100 154)   return =
regmap;
> > 3b9334ac835bb (Pawel Moll      2014-04-30 16:46:29 +0100 155) }
> > b33cdd283bd91 (Arnd Bergmann   2014-05-26 17:25:22 +0200 156) EXPORT_SY=
MBOL_GPL(devm_regmap_init_vexpress_config);
> > 3b9334ac835bb (Pawel Moll      2014-04-30 16:46:29 +0100 157)
> >
> > but I can't figure out where or if drivers/power/reset/vexpress-powerof=
f.c gets
> > a MODULE_LICENSE from...
>
> Correct, it is exported but that file is being built as a module whereas
> the file requiring it is beign builtin. As far as I understand, that
> will not work, hence the error.
>
> The issue with this patch is that ARCH_VEXPRESS still just selects
> POWER_RESET_VEXPRESS, which ignores "depends on", hence the Kconfig
> warning and not fixing the error.
>
> I am not that much of a Kconfig guru to come up with a solution. I am
> just reporting it because arm allmodconfig is broken on -next due to
> this.

Commit "ARM: vexpress: Don't select VEXPRESS_CONFIG" needs to be
reverted. I've asked Arnd to revert it.

Anders patch is still needed for arm64.

Rob
