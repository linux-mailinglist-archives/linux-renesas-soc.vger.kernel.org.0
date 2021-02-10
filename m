Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 733793161ED
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Feb 2021 10:18:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229611AbhBJJSp (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 10 Feb 2021 04:18:45 -0500
Received: from mo4-p00-ob.smtp.rzone.de ([85.215.255.24]:21066 "EHLO
        mo4-p00-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230235AbhBJJPo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 10 Feb 2021 04:15:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1612948308;
        s=strato-dkim-0002; d=fpond.eu;
        h=Subject:References:In-Reply-To:Message-ID:Cc:To:From:Date:Cc:Date:
        From:Subject:Sender;
        bh=ksVLQIGKM6kEiyt9+nRQ/u2KJw5M1esBBiSkOpbfAFI=;
        b=MTlRC1sO7xWQA7U/KD0pSLriKKbtNBYfE6xBTsfKEmXbmladjxv1mba/k2Nwd08jMT
        AFGYg/Kl33JiS7rT4qrjiTpydI2hfksUKx4NwFTbEX0+7nfgyyMBswrUsMa2CzyOvIyj
        iR2CKZAqWTa/j1cO2m/f/gVfkLAcYAW+Aq4yn3KZac4uQ8JX9lf7ijvT4NBeRpklEDy3
        Sunms1sNczFRU+1RNI+iVLOp/9tFdl37cxV0a4ihsiHUA7hLakkprqzJ2dR/8GDCOEwB
        iV7xKGA9+6AKsOsAQfu9BSbt5QF9a32ZA8LvYcwaFtSam1aWUEVN6diGtl9VzmOs2xqK
        m/vw==
X-RZG-AUTH: ":OWANVUa4dPFUgKR/3dpvnYP0Np73amq+g13rqGzvv3qxio1R8fGk/2qthug="
X-RZG-CLASS-ID: mo00
Received: from oxapp03-01.back.ox.d0m.de
        by smtp-ox.front (RZmta 47.17.1 AUTH)
        with ESMTPSA id c05ce8x1A9Bm3d0
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Wed, 10 Feb 2021 10:11:48 +0100 (CET)
Date:   Wed, 10 Feb 2021 10:11:48 +0100 (CET)
From:   Ulrich Hecht <uli@fpond.eu>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Ulrich Hecht <uli+renesas@fpond.eu>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     linux-renesas-soc@vger.kernel.org
Message-ID: <1749889389.830679.1612948308452@webmail.strato.com>
In-Reply-To: <20210204135409.1652604-1-geert+renesas@glider.be>
References: <20210204135409.1652604-1-geert+renesas@glider.be>
Subject: Re: [PATCH/RFC 0/6] ARM: r8a73a4: Add SMP support
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Priority: 3
Importance: Normal
X-Mailer: Open-Xchange Mailer v7.10.3-Rev31
X-Originating-Client: open-xchange-appsuite
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


> On 02/04/2021 2:54 PM Geert Uytterhoeven <geert+renesas@glider.be> wrote:
> Questions:
>   - Do we want to bring up the Cortex-A7 cores, too? We don't on R-Car
>     H2 neither.

What still needs to be done for that?

[I recall having issues bringing up the A7 cores on my old APE6 board (that has since failed and been returned to Renesas). The kernel failed to bring up the A7 cores if enabled at boot, but I was able to enable up to three (any three) of them one-by-one via sysfs. I'm not sure if that was specific to that board, though.]

CU
Uli
