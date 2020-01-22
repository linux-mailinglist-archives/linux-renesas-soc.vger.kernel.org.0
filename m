Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C115614498B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Jan 2020 02:47:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728668AbgAVBr0 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 21 Jan 2020 20:47:26 -0500
Received: from mail-pl1-f193.google.com ([209.85.214.193]:47001 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728609AbgAVBrZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 21 Jan 2020 20:47:25 -0500
Received: by mail-pl1-f193.google.com with SMTP id y8so2167531pll.13
        for <linux-renesas-soc@vger.kernel.org>; Tue, 21 Jan 2020 17:47:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=landley-net.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=5ebG0ux6M6dxneH91X14V/sxx6cPKVYFQexW0YVajLc=;
        b=b+YQGhCqgrIpkuHOYBXH/Gxolcs4BbukRUxnfbKnWiVCWNqBNwZhEztC7PERH1ATmQ
         r2kXUlZmMmenB3+6ns06ZfyRLckF4FQJwTg/js62d8CS0DC9q1DpS6nYo0BPuKvcK3yR
         ECQC6+jNi/45/PWkTyZVFx6av+N5XEvLAHyywB5IUmQJ9MMbDymXWvXjbjuGreNwaq68
         1nFI9eG3mkbNV7agqHykiqIt9QDJApKggbELo87uQMbpONf5F0LeL0BBAzhB8UgnRHSk
         N5t8Maz5ZYv/0kU/5PDN7UZH/Z67eA5YdciCHAKNUOYaTMrlapSlIeWeKyrevdnABlV4
         btxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=5ebG0ux6M6dxneH91X14V/sxx6cPKVYFQexW0YVajLc=;
        b=F/dQxgU9TKhtLTKDlVFmTicTRkrp+onkshBGtG2C1VvfBXg3ebVbFKnAF7YZtCEIry
         nnrP6/By0LQJ3eV5sHrgSZwnwv9g4ACD82RcGZl9rk5xhXGxguTrqMBg2RgTvakeJ8Pp
         PHcwPnq917GyJ1pOYLGmII/xyA2d+l6zysNTGBZUon0zgFURosKvnQyJRhG8XL3EcMDG
         Y/8wIGFh6eJO89DIL6+VG4yhdkKsBV41OHJ4yVjYoQim/dqpSkNOW0ZX1O9H8OhJYVFW
         bVqFIL+osCCSAQKtIKa0omyT0Xlx8k672yncJJx/u97GznoaAVUS3jvHGmxcIH0ZFV51
         DB9w==
X-Gm-Message-State: APjAAAVDFJ60cwgnjsWSJR+j/PaXS6lbutVlSCapKJ40P1LFNc4C8rN6
        ppeYdKzzFD85zGGbbaduq/OPDQ==
X-Google-Smtp-Source: APXvYqwRicdFgpjTI4R2YeesuVWicQUPqvuPqPTiGrEZXsacF+6sOG7i3P2oNqibeYgh7wFwRC4GHg==
X-Received: by 2002:a17:902:9a8c:: with SMTP id w12mr8414172plp.19.1579657645140;
        Tue, 21 Jan 2020 17:47:25 -0800 (PST)
Received: from [192.168.11.4] (softbank126112255110.biz.bbtec.net. [126.112.255.110])
        by smtp.googlemail.com with ESMTPSA id g11sm42642687pgd.26.2020.01.21.17.47.22
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 21 Jan 2020 17:47:24 -0800 (PST)
Subject: Re: [PATCH resend 0/3] SH: compile fixup patches
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Andrew Morton <akpm@linux-foundation.org>
Cc:     Linux-SH <linux-sh@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>
References: <87o8uyylat.wl-kuninori.morimoto.gx@renesas.com>
From:   Rob Landley <rob@landley.net>
Message-ID: <656cb059-366e-06b1-0d8f-741454c472b8@landley.net>
Date:   Tue, 21 Jan 2020 19:51:45 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <87o8uyylat.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 1/19/20 7:21 PM, Kuninori Morimoto wrote:
> 
> Hi Andrew
> Cc: Yoshinori, Rich
> 
> I'm posting these patches to SH ML from few month ago,
> but SH maintainer is not working in these days...

There are two, they're still working, I spoke to Rich yesterday.

It is entirely possible you've convinced them to spam-block _you_ for repeatedly
saying that...

Rob
