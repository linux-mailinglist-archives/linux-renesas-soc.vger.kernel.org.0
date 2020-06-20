Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B290201FCE
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 20 Jun 2020 04:33:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731914AbgFTCdd (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 19 Jun 2020 22:33:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726545AbgFTCd3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 19 Jun 2020 22:33:29 -0400
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com [IPv6:2607:f8b0:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F4A7C06174E
        for <linux-renesas-soc@vger.kernel.org>; Fri, 19 Jun 2020 19:33:28 -0700 (PDT)
Received: by mail-oi1-x243.google.com with SMTP id a3so10237722oid.4
        for <linux-renesas-soc@vger.kernel.org>; Fri, 19 Jun 2020 19:33:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2izEUWmO2Z44gqGlokNsKJYCiU6NrD8s4mWVTOtP2bc=;
        b=s4CI5rQA2oC41KDlMQtutcRiKWu4nTD2gRPf4ZpqQDclSutlsWz1q11wzgg5SpCVrB
         vpeDt+HymrhzhRDYYUBdo59HdTt0DKIP9S7ovJhlf+iWvlUFTRf8Y71/jf1fFZwEY10e
         hhAkJVTG412nIzCKVtxkFtzppe88Lq+gKhAMPNOcTZg8cTl/WRpIPw5cnA6PzJdMmkhN
         6DsLyIGqhAnVoZ/zZZHo4VTNotbyFjC9sM7ABBV/YYqmwi2Qx+4EvdhqbG81HTkHEOvw
         7ZO1lvU7Yf8FccTZzJCLyFSpwHF0yXqadkpxWIwk7X4UEPNRJ9W8kos63kFnqxjfJqOr
         pfCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2izEUWmO2Z44gqGlokNsKJYCiU6NrD8s4mWVTOtP2bc=;
        b=SQvvVJ+aUyRftVkIUAjzCBjhDwDFDBTgg+7ejkADW0giortJvokTy3XCYlxyzFNvrL
         M4JnlxccfJV67H44AxSu0CI7NKv7+edCZ1e0twh4s60GJRPzdvZgxEVWbCtx282AsbfY
         vOtHAfEc54JGLcTR3jM6NFqCR2bpM2xbC1Kf78D/IS//NAlrXbiaAoSp5AL7qU7g3r0e
         ZL+73ALVLL9yXf831uBArZBJ0inKWAJVI2jZ9cV9KGP6g7t64YFk8iWOoD3u1DaXsIEq
         sksgq/Od51gfMq7cSAv5DEoZN32INTn5JIntop4Ss0QvawvKbnnvZo2fcabP51d96d7J
         nc7Q==
X-Gm-Message-State: AOAM533+1z54RwQQfn14IkuSifx15c+g8R4eSgFYjPMshSC+8cYYjFmv
        q+OwiDNQTLVBqOQT+bxSK35XLwJrF8d2yxhsqBilbQ==
X-Google-Smtp-Source: ABdhPJzwMAGZETqCd57hDnIimD39x1lQ0rN7GHIBUMMaKf6xyMUxmekPnQIwoFszeceaY/MtRbLUsNoHsJe1HYXdiw8=
X-Received: by 2002:aca:35d4:: with SMTP id c203mr5227824oia.30.1592620407638;
 Fri, 19 Jun 2020 19:33:27 -0700 (PDT)
MIME-Version: 1.0
References: <20200515053500.215929-1-saravanak@google.com> <20200515053500.215929-5-saravanak@google.com>
 <CAMuHMdUnbDvn6GdK51MN-+5iRp6zYRf-yzKY+OwcQOGrYqOZPA@mail.gmail.com>
 <CAGETcx9JKbNQWQwNah7pO5ppVSAe86R-OmMujZPYNkuTCLwKnQ@mail.gmail.com>
 <CAMuHMdU2gF=aTeVxRvtzAMLGY=GyBDfBwrYZxoRkL1tV7dL56g@mail.gmail.com>
 <CAGETcx-rHFthf-aLb_S-ST6Evozvgis5XX5u0LNxyvfMoJOLKQ@mail.gmail.com>
 <CAMuHMdXW0jM-A5cvYtFVcgc1Gm3tKkvr0+kWpeJqpJDzNOuYeA@mail.gmail.com> <CAGETcx8W96KAw-d_siTX4qHB_-7ddk0miYRDQeHE6E0_8qx-6Q@mail.gmail.com>
In-Reply-To: <CAGETcx8W96KAw-d_siTX4qHB_-7ddk0miYRDQeHE6E0_8qx-6Q@mail.gmail.com>
From:   Saravana Kannan <saravanak@google.com>
Date:   Fri, 19 Jun 2020 19:32:51 -0700
Message-ID: <CAGETcx87JNfKEu4brQ3S-9wObv=OwXkAoDBSREQH5dAD68TPsA@mail.gmail.com>
Subject: Re: [PATCH v1 4/4] of: platform: Batch fwnode parsing when adding all
 top level devices
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Len Brown <lenb@kernel.org>,
        Android Kernel Team <kernel-team@android.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        Ji Luo <ji.luo@nxp.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Jun 19, 2020 at 1:07 PM Saravana Kannan <saravanak@google.com> wrote:
>
> I think instead of deferred_probe_work_func() moving the device to the
> end of the dpm_list, I think the device probing successfully is what
> should move it to the end of the dpm_list. That way, the dpm_list is
> actually ordered by when the devices become functional and not the
> random order in DT or random probe order which can get pretty
> convoluted with multiple deferred probes. This feels right and will
> make suspend/resume more robust against DT ordering -- but I'm not
> sure what other wide ranging impact this has for other platforms.

Geert,

If you want to play around with a potential fix to test my hypothesis,
I think it's just adding this one line to driver_bound():
============
klist_add_tail(&dev->p->knode_driver, &dev->driver->p->klist_devices);
device_links_driver_bound(dev);
+device_pm_move_to_tail(dev);

device_pm_check_callbacks(dev);
============

-Saravana
