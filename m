Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5E50E4A087
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Jun 2019 14:15:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725919AbfFRMPG (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 18 Jun 2019 08:15:06 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:38943 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725913AbfFRMPG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 18 Jun 2019 08:15:06 -0400
Received: by mail-wm1-f67.google.com with SMTP id z23so2992797wma.4
        for <linux-renesas-soc@vger.kernel.org>; Tue, 18 Jun 2019 05:15:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1cAPKhfxit+xHeNRj6BxsWJGw4CX++n1dsKppn5EZ/8=;
        b=eryRipSUPWO7rZjHB9dPlj85BTsiO4mb9yd3U61M3caI9ZBAaMmWRCi98dXuYLDuF5
         APUcfVgzNLRQ3NnE5+3DJ4T1x/q15jQe3mZCAcB/DWIAlmtI3nu6kqZ6qJglKWCU4AaE
         7jUV+X9LJRYKdbYu5c05yPnbPt9oO3x+CG11ldXXZtsuO4rEwAwLW/GMO/YwamRLinSm
         hsMUPjVsIWVxFtnNyfcU7B5s2CXyA/cvZFhm3v0vV6o2EVwVRoBInLoP9GT2H40bJvN8
         3DdQ50kaVHKwGNuOtgcskqwaoEOHzZshT1EsXwzmwBosY6cf9UXw2BFV2WeVbLb5UgJn
         d4jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1cAPKhfxit+xHeNRj6BxsWJGw4CX++n1dsKppn5EZ/8=;
        b=YJNW1iMeoW5/qjBU2e/rpJpMyqmQ4k5LuMdyrfRPbMOYT18EqYyZBc6FLDFHao0eVj
         zRcqv4y+C5OGFfrqsAY0xu2wYGfsV9AVAwRt/s0aO1TsFjZsaWgqFmwhgIu0mPaXTnPc
         qHE5Jpy7LKX8IP6WxmZmMTJbxoPra/zTlKMZroMYkSnqWJZ2xcZKPBQbNTI430Exjilf
         bdQiH+zqCW6xGexG+qGPrUUezARldi4sDFGgDAEWUc/z071yfkof3KVAbLAWPy8AKFCA
         D7BnQA7UlmD2i9ebw45a2Sxq4DzPdVp01eFoXX6Zk7c6e7WvHRgrTRg19gpbOq64RKUR
         HT3Q==
X-Gm-Message-State: APjAAAVB10acBqfry8TpZEibxEGkioygB12dixAZgiy/0w9AoXSI0Ekr
        DZunl4gQMUIZ35Lza81zqbwN8UFI0GAjxM3rVUI=
X-Google-Smtp-Source: APXvYqyTSIrWBmKAINYm+Xl90OQjAyfC6GXEtrIUjNbPDaXTjp3NfZKbg3+B1IqSWErpnssiVa8MqqxrU/Syb91CS8M=
X-Received: by 2002:a1c:c915:: with SMTP id f21mr3112290wmb.123.1560860104011;
 Tue, 18 Jun 2019 05:15:04 -0700 (PDT)
MIME-Version: 1.0
References: <156076560641.6960.5508309411424406087.sendpatchset@octo> <20190618103109.pdhlhnz623ypqrju@verge.net.au>
In-Reply-To: <20190618103109.pdhlhnz623ypqrju@verge.net.au>
From:   Magnus Damm <magnus.damm@gmail.com>
Date:   Tue, 18 Jun 2019 21:14:51 +0900
Message-ID: <CANqRtoSspY_ccm+g0BFXt8VpQ9O-7Ta_rose+KVDOGjeX4VQ_A@mail.gmail.com>
Subject: Re: [PATCH 0/3] clocksource/drivers/sh_cmt: Minor DT compat string update
To:     Simon Horman <horms@verge.net.au>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Jun 18, 2019 at 7:31 PM Simon Horman <horms@verge.net.au> wrote:
>
> On Mon, Jun 17, 2019 at 07:00:06PM +0900, Magnus Damm wrote:
> > clocksource/drivers/sh_cmt: Minor DT compat string update
> >
> > [PATCH 1/3] clocksource/drivers/sh_cmt: SoC-specific match for CMT1 on r8a7740 and sh73a0
> > [PATCH 2/3] clocksource/drivers/sh_cmt: Remove "cmt-48-gen2" support
> > [PATCH 3/3] clocksource/drivers/sh_cmt: Document "cmt-48" as deprecated
> >
> > Move over to new CMT1 bindings on r8a7740 and sh73a0 and get rid of old
> > stale stuff such as "cmt-48-gen2" while keeping "cmt-48" around but document
> > it as deprecated.
> >
> > Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
>
>
> Hi Magnus,
>
> I think this series should include the Clocksource maintainers as
> recipients:
>
> Daniel Lezcano <daniel.lezcano@linaro.org>
> Thomas Gleixner <tglx@linutronix.de>
>
> And LKML for good measure.

Hi Simon,

I totally agree. I was suspecting some opinions might come out about
the CMT compat string changes in the DT binding document. I'll repost
this series and include the above folks/ML once the CMT compat string
changes in DT binding document are agreed.

Cheers,

/ magnus
