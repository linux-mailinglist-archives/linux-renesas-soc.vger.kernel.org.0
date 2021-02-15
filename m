Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2BB0C31C054
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Feb 2021 18:18:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230033AbhBORSG (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 15 Feb 2021 12:18:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232688AbhBORR6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 15 Feb 2021 12:17:58 -0500
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D8C7C061574
        for <linux-renesas-soc@vger.kernel.org>; Mon, 15 Feb 2021 09:17:18 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id m22so11566104lfg.5
        for <linux-renesas-soc@vger.kernel.org>; Mon, 15 Feb 2021 09:17:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=jSkXdonrPap94Ypv8aWp9GDT7yktyQHSyTLwtEdZ/WE=;
        b=SWD3JDxv6nqdrs+65NCTxyMbC65RNS3MHnsPCV5MivOd9nAFFRrE5gcup/PIeSCjgL
         2qCt97+2WLJKAoJWYTtNM8d6v3OX3WwJsVQw6kPiPx6H2HBdtSwuDkxbB7TqWxII5QN+
         am2XWFcnmOwlVm+8IHCIlopm1qTJYUhv7ncahZ0oz0z+49vRUHQXvQJbSPChqlxiiODP
         j9n+FBTci18zMxYNryiq00YhRD5H0+SIBZnVMIx+PWBBiig7Iz/V3Qfted5NDjrHrOdb
         C1FdA3i+QTIuRWiSUQL8rfX9fpcw0SKDHulO/PHaOAeA6NlWDRrAnvFH0CkaK1bis+hO
         PGZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=jSkXdonrPap94Ypv8aWp9GDT7yktyQHSyTLwtEdZ/WE=;
        b=o+x2zLGtwsVfwQPC/TLqeFZKKjpF2ez94tLAolysLhHXFqvslaAoCpY6AxAcqGU5iC
         MgpWrYt9MvhmVEw6S9GSIFd+x1Bw+jr4laLCdNmKFfc1bTg6b4UH3juPUQQOVj2IL2mw
         cfX9KoRQQJUO5JclORPBuL1wTqvLcGWpCro7UXy0IMFHP3BRbBSYrhHUaOSiUmqAAZUa
         G0rfTGvfYuhbSrB53qJNHF2rflNIz1HLwwzaGLbXNLH3nccmItNBpk5xzTWZJqVX9H1J
         IC7OT1dF3nNJpxXHS5rUhj41jHw2931uuramPStEqeZeAVyDZagFID66SXcIDQu1Qs52
         mIqQ==
X-Gm-Message-State: AOAM530BVH79t9GRM6FsXAB2vqZOJ7gVzU1U2bX23ZYisiCq0jysn0gL
        wrjtSaLnLLFpGoXf2d+tri6azi0gCX4=
X-Google-Smtp-Source: ABdhPJxZMtvpa3RyEyihlDEItSBe6WxjJvVd9U43amx4SUUaFxO0+p/OeTEqWiqMcUgJPB6FDFsRBQ==
X-Received: by 2002:ac2:4c0d:: with SMTP id t13mr9813479lfq.74.1613409436604;
        Mon, 15 Feb 2021 09:17:16 -0800 (PST)
Received: from [192.168.1.101] ([31.173.87.97])
        by smtp.gmail.com with ESMTPSA id y17sm2251399lfy.135.2021.02.15.09.17.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Feb 2021 09:17:16 -0800 (PST)
Subject: Re: [PATCH RFT only] mmc: tmio: remove workaround for NON_REMOVABLE
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-renesas-soc@vger.kernel.org
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>
References: <20210215101754.6725-1-wsa+renesas@sang-engineering.com>
From:   Sergei Shtylyov <sergei.shtylyov@gmail.com>
Message-ID: <3c8723ce-2fc0-c43d-5abe-f2cf8771bed1@gmail.com>
Date:   Mon, 15 Feb 2021 20:17:15 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210215101754.6725-1-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 2/15/21 1:17 PM, Wolfram Sang wrote:

> RPM handling has been improved twice since this comment, and also SCC
> handling has been improved a lot. Time to test if we the workaround can

   We the workaround? The royal "we"? :-)

> be removed!
> 
> Not-yet-Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
[...]

MBR, Sergei
