Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 655D714DF58
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Jan 2020 17:43:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727267AbgA3QnP (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 30 Jan 2020 11:43:15 -0500
Received: from mail-yb1-f193.google.com ([209.85.219.193]:34822 "EHLO
        mail-yb1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727263AbgA3QnO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 30 Jan 2020 11:43:14 -0500
Received: by mail-yb1-f193.google.com with SMTP id q190so1676007ybq.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 30 Jan 2020 08:43:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dAkoTJZXXC8pAie0MxZm+ns3OGuUhEoZUpXun7fS/so=;
        b=dtbCGYT0MciH9KjQUXOaMT+fL/nydck89BQMu27zg4gJSTrGPVCs95wVvzzLf1UG/B
         qk3t3k6OoM2clcb5ir9ftv2s3FR4nk9Y6fKs1OwUSgla8H60aeVczEOWcujPUX4Jy1E8
         SNuVaiY2MeeT5SkC5OTh+0ywWY0A9cMFMe0WxSHhTXV29i+tWexYB976nGHzYxzdkLor
         DeyAzN+PEOXSBbsWQF9sPCbs7F+0OUdTzhwYMmQYZAOLA2dRkrUsHssiIyJPRw73wLW3
         bd4jlaF39MTiNxdObDEIIAzx/j/Mo0DN9piWpXFjZkoHCLTZVp397qx5qbnr8+d3lRct
         IoFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dAkoTJZXXC8pAie0MxZm+ns3OGuUhEoZUpXun7fS/so=;
        b=DhReng3MM+s9cub++4VeOuCF9Qs85lRoAQa8hE2kBOczPG9IOWBEKt/uY6XttxgDyw
         lnaX6sHbv8O3EIVQqhWWPu0S9NAH+JcBvkNMfKLV8zuMkxeqzDwpx5r5lZfch56VSzJS
         36S8zEczyYRPB6ElfjeLFHSKkUUo9V+rTlKpLZEfWxQQ22tHfFsYIU+Wla16Z2JFbJUi
         7oEtZKudvTznrDAy1oS/eQUiXjPde9a610Qr4iP9BuZ8UWk4wxe6HP3Crzi/eTPBW8hF
         DWeuLitf19P5XXTqXRHhnjH9LuuoL1K5e6j6wuSgSoNKFAAVmjiWmcRpI6hbNZE4jVUY
         COjw==
X-Gm-Message-State: APjAAAWXEKiDumWG9YJ9kde2hP3zrJZlwjIpeVB4vNKe1kgLWdwp4cJP
        dVp9Dtf42N5qDVzpz4W+ip2avdhile2M/F7oOF5ZUV8F
X-Google-Smtp-Source: APXvYqz7cFNhADLChzqRrZwg9cGy/NYutjxxN098GFg13g0Zji9npPS6Idi0XmbWJnvU81vfR4Z/2+GdXfpFdj/Gv2U=
X-Received: by 2002:a05:6902:6c4:: with SMTP id m4mr5008083ybt.274.1580402593410;
 Thu, 30 Jan 2020 08:43:13 -0800 (PST)
MIME-Version: 1.0
References: <20191030184844.84219-1-edumazet@google.com> <CAMuHMdVK=dUxhJh1pjLe4bGn3V=FHJ_90oga0USRBw-wSqd8Pw@mail.gmail.com>
 <20200130162740.GA6429@lst.de>
In-Reply-To: <20200130162740.GA6429@lst.de>
From:   Eric Dumazet <edumazet@google.com>
Date:   Thu, 30 Jan 2020 08:43:02 -0800
Message-ID: <CANn89iJW24mUW9TGt8D9jHRdvd31Czf8S7XEU1_kJBThZiTwSg@mail.gmail.com>
Subject: Re: [PATCH] dma-debug: increase HASH_SIZE
To:     Christoph Hellwig <hch@lst.de>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Eric Dumazet <eric.dumazet@gmail.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Jan 30, 2020 at 8:27 AM Christoph Hellwig <hch@lst.de> wrote:
>
> On Tue, Dec 10, 2019 at 03:55:08PM +0100, Geert Uytterhoeven wrote:

>
> Can someone just send a patch to switch this to a dynamic allocation?

Yes I can do that, thanks for the reminder.
