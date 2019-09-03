Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2AE76A7477
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Sep 2019 22:16:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726009AbfICUQW (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 3 Sep 2019 16:16:22 -0400
Received: from mail-qk1-f182.google.com ([209.85.222.182]:44687 "EHLO
        mail-qk1-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725977AbfICUQW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 3 Sep 2019 16:16:22 -0400
Received: by mail-qk1-f182.google.com with SMTP id i78so15883218qke.11
        for <linux-renesas-soc@vger.kernel.org>; Tue, 03 Sep 2019 13:16:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=I9L2785C2btxqBJKiEhwb2rjpjRWvRDLJ8LvKhBnR7M=;
        b=uHnKa/lTI5UsezQlAUWwqZuWN4LvPnz1aVViZMhmXPCf20z4z43LDLipcU3+bBwyst
         3FphQqvB6alzCYIN+XiyPfMw57GzDjw4t5U1hzs0zChKVRZSvqTJ9JvICP9uSOzDXdhK
         +J+/F+5EGVTIb7D3Wx2gv/nfS2RPurdJk0kg7PSwjlCxkRVMcWV/SKiQpH6MGGBDMfqx
         mWSHRH12zG5xDRlrqyKVmdreYXmOeNQZfkNx1Uu25GTPkrs54XxIh6+Q0v7fMcLo2uy5
         RiU0lerfp+xaIaYlfPoWJh5n4GG0fGgx6N57U7km2/nEWLYwAApzaxJ6Kh4bgR8vdC0R
         WUpw==
X-Gm-Message-State: APjAAAUh0nCCv/Ou7nWF7iNTxgiOxkUfc0cuWNlsTwxQaix7uWOsllTF
        /Nb7/QKvjfdG0lGXNwqq9wekMxqc5yU4ZBP2jL0=
X-Google-Smtp-Source: APXvYqyCsexWiK7L/aZ31I67kNz7n9fqy5VUIY3KlNYVdon2D0ObdblZSsyJQJcmItPQAQ4GUxvNqwAQOaslFisGvIA=
X-Received: by 2002:a05:620a:b:: with SMTP id j11mr36419743qki.352.1567541781734;
 Tue, 03 Sep 2019 13:16:21 -0700 (PDT)
MIME-Version: 1.0
References: <20190823123643.18799-1-geert+renesas@glider.be> <20190823123643.18799-5-geert+renesas@glider.be>
In-Reply-To: <20190823123643.18799-5-geert+renesas@glider.be>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Tue, 3 Sep 2019 22:16:05 +0200
Message-ID: <CAK8P3a2zDhj_1M0d6t9MFuWCK0kkFVnFtzP7OYE4O47Goy6vdw@mail.gmail.com>
Subject: Re: [PULL 4/5] Renesas driver updates for v5.4 (take two)
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     arm-soc <arm@kernel.org>, arm-soc <soc@kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Aug 23, 2019 at 2:36 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
> Renesas driver updates for v5.4 (take two)
>
>   - Improve "always-on" PM Domain handling on SH/R-Mobile SoCs,
>   - Automatic errata selection for Cortex-A7/A9,
>   - Small fixes and improvements.
>

Pulled into arm/drivers, thanks!

      Arnd
