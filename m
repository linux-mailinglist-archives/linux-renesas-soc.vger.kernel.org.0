Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A7DC6411455
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Sep 2021 14:25:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235522AbhITM0t (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 20 Sep 2021 08:26:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235204AbhITM0t (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 20 Sep 2021 08:26:49 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 744F1C061574;
        Mon, 20 Sep 2021 05:25:22 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id bx4so15864875edb.4;
        Mon, 20 Sep 2021 05:25:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=sjxm2CPGEqNmN39+wQosQN0k3TqmDMi00hAHGOM6RNE=;
        b=fVgTfxy4xKbk244lemHrnob7suMDKO7pI6DrClcXKn/xNCwgQT3gWmyOzkkvzYV84E
         AhYt4SN5X7I9A5sAJRyfR4BrK34wxWfMfzUHEVGYO7hlLfUuf1aMeFQT9ujpqcSe5B25
         34OPBbaNv3PHYaniRwckL6kFDy4qwABgx/h3io4aH358kkARlHiH9SMFqAzuH0x6Vtp/
         T+BfRPdlOLQ6bD5/VbTTsENc0oaEhkaJjzLi2+B8YsyJQVW9QrdA7syjyskREc/+H0ry
         6G4PynCZDUQct3N5QLELbAekJVZ1vojOmRTKG0dIKoB+1kTyDx6KErA0wepmaEJNpJ7u
         IhSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=sjxm2CPGEqNmN39+wQosQN0k3TqmDMi00hAHGOM6RNE=;
        b=2Zj9l89wwk0yVUnM2SIsAgBd+dfVEeS4pMff2ZAbcTljXb94KNeESmrPleM7ppR35g
         URbmrLABq5wKqkBHGt1QOchDFe3+2rsUOaAxHo3btP/QmGsez9qvDMvqfoQR+ltv7iRf
         osznc8RNx8bVwImM25YsVJrBzf2dX06bAscyakHJVdkTc3KgQpZABSM+Y1pJF/+JNGlq
         vqj6TU6zehi5mJKMpkYZ0VciIQVoctE9TCSrL1igttXBC4y3TWpFBWh99a8hmtDrsydN
         8CNrsOGmavt9A2bcGktUDWZqgktvN9T9qVrJLcHX2tO9Rf1y1mATa+GKJu8tM9Hbztq4
         n+QQ==
X-Gm-Message-State: AOAM531a4LjVs3UDZqSKPYnvJIhnFm6u2DsEXDEvH+ytQMKrD6aCh1m9
        f5fYvr7bekMvJP1p8aFdVHZrjcbG0Ymam3IEjrvyzVMH
X-Google-Smtp-Source: ABdhPJx5S6Yi9grI/kQVIAeFYNM7Y4/Re5oTX9gacZcOz39l62sjKv4qHUYWr3UN4tNOJMLi+sJTQkOEVApQrHMBAow=
X-Received: by 2002:a17:906:e82:: with SMTP id p2mr27932667ejf.50.1632140720891;
 Mon, 20 Sep 2021 05:25:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210825122757.91133-1-aford173@gmail.com> <CAMuHMdV1Cd23aaVKq1PyXHrc6W9FyikKOCpD0-PZqkgbVFbA5Q@mail.gmail.com>
 <YUB8Z8ArmIbjI6i+@ninjato>
In-Reply-To: <YUB8Z8ArmIbjI6i+@ninjato>
From:   Adam Ford <aford173@gmail.com>
Date:   Mon, 20 Sep 2021 07:25:09 -0500
Message-ID: <CAHCN7xJZ1+B+bo3EoBELvhx2OXkP5p8TsSC=_AcZEjpCjk15Jg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: beacon: Fix i2c2 speed calcuation
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Adam Ford <aford173@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Sep 14, 2021 at 5:41 AM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> On Wed, Aug 25, 2021 at 02:47:21PM +0200, Geert Uytterhoeven wrote:
> > CC Wolfram
> >
> > On Wed, Aug 25, 2021 at 2:28 PM Adam Ford <aford173@gmail.com> wrote:
> > > The desired i2c2 speed is 400KHz, but when measured on a scope, it
> > > is incorrect.  The driver can use the i2c-scl-rising-time-ns to help
> > > calculate the proper setting to get exactly 400KHz.
>
> The question for me is: Has it been measured that SCL rising time is
> really 50ns or has it been measured that the bus clock is now exactly
> 400kHz?

The person who originally reported this to me moved on, so I don't
know if he measured both the rise time or just the clock speed.  I
know originally, the clock speed was measured to be 426KHz instead of
400KHz, and with the change to the rise time, the measured clock speed
was exactly 400KHz.  I do not know if the measured rise time is really
50ns or not.

adam


>
