Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 08ECF47AA8A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Dec 2021 14:44:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233029AbhLTNok (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 20 Dec 2021 08:44:40 -0500
Received: from mail-vk1-f170.google.com ([209.85.221.170]:35722 "EHLO
        mail-vk1-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233027AbhLTNoj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 20 Dec 2021 08:44:39 -0500
Received: by mail-vk1-f170.google.com with SMTP id c10so3371711vkn.2;
        Mon, 20 Dec 2021 05:44:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zrnnwNW5r+M7KomjOpjD0fvHJ5V+2b8e6a+wdptPZcI=;
        b=P4/T/KeAjQdTJbzEtyeEDrn/23v/MEzPwX27xpupmai+7JP3kax1w7aZe6jGn72J4E
         B6L7S53x+ulqPr1b82qYFs+0adE5I56pIvnno0v+FDCqpUeiw8mOoNMFal6CKqUOeBZ+
         hBMEiKJquyO1uXNdUUMXhc4BXhRPWXBR6TM32f3xeyerR/b6dS1Bcgpqo38gyUA4dh+L
         0D4HbhGX0n5InL07RmZjFF2bpH3KdTb3VmOTJr06s6pFaZJ2udG2I7xgTD65T/5+AYlX
         EXQumZ7eBgWqgXtucNEgbo3s6U665wvJir33GRPgJYCcWjkBtuWNUHGy6nw1+RAhkx6Z
         RFiQ==
X-Gm-Message-State: AOAM530x4U7IV5Qa6iaxwGovwfFWj1phuNPytElH7Kv9RSRHOv2qQV6w
        yaAZgt/zAz1J7rD1PbklFsXMbgdJtfYcKA==
X-Google-Smtp-Source: ABdhPJzUaTUP0mqLhvt2N4TxrkDPLUqP5RGcds+ZvBHCpOu+ouptX2aZJip15Mq54fPtw2PLUjhLvg==
X-Received: by 2002:a1f:3094:: with SMTP id w142mr5542664vkw.7.1640007878381;
        Mon, 20 Dec 2021 05:44:38 -0800 (PST)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com. [209.85.222.47])
        by smtp.gmail.com with ESMTPSA id g21sm3423433vkd.26.2021.12.20.05.44.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Dec 2021 05:44:38 -0800 (PST)
Received: by mail-ua1-f47.google.com with SMTP id r15so17766842uao.3;
        Mon, 20 Dec 2021 05:44:37 -0800 (PST)
X-Received: by 2002:a05:6102:2155:: with SMTP id h21mr2896172vsg.68.1640007877712;
 Mon, 20 Dec 2021 05:44:37 -0800 (PST)
MIME-Version: 1.0
References: <20211216160653.203768-1-julien.massot@iot.bzh>
In-Reply-To: <20211216160653.203768-1-julien.massot@iot.bzh>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 20 Dec 2021 14:44:26 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWAPuPCgnRcqUiqY_FXYmOmHb8_=PuhNfAdUNprbsZOJw@mail.gmail.com>
Message-ID: <CAMuHMdWAPuPCgnRcqUiqY_FXYmOmHb8_=PuhNfAdUNprbsZOJw@mail.gmail.com>
Subject: Re: [PATCH 1/2] remoteproc: rcar_rproc: fix pm_runtime_get_sync error check
To:     Julien Massot <julien.massot@iot.bzh>
Cc:     =?UTF-8?Q?Bj=C3=B6rn_Andersson?= <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:REMOTE PROCESSOR (REMOTEPROC) SUBSYSTEM" 
        <linux-remoteproc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Dec 16, 2021 at 5:07 PM Julien Massot <julien.massot@iot.bzh> wrote:
> pm_runtime_get_sync can also return 1 on success, change
> to use pm_runtime_resume_and_get which return 0 only on
> success.
>
> This bug has been discovered by Dan Carpenter by using Smatch
> static checker.
>
> Fixes: 285892a74f13 ("remoteproc: Add Renesas rcar driver")
>

Please no blank lines between tags.

> Signed-off-by: Julien Massot <julien.massot@iot.bzh>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
