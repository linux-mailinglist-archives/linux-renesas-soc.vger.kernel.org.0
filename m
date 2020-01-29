Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 71A7514C7DA
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Jan 2020 10:11:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726068AbgA2JLy (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 29 Jan 2020 04:11:54 -0500
Received: from mail-ua1-f67.google.com ([209.85.222.67]:34674 "EHLO
        mail-ua1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725930AbgA2JLy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 29 Jan 2020 04:11:54 -0500
Received: by mail-ua1-f67.google.com with SMTP id 1so5917425uao.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Jan 2020 01:11:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=benyossef-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=m8DeBR3ywE5BStJvUpTceu94rxUL71zPmj3cpgCJEJA=;
        b=a++gLIAF1FEOcrFCMq4xVdmkxU5ir6QrUsrbRHj/nnEOI3+Cpf2VX/n/8phxwaHxS4
         GxmHeMr5ec8gdSyXHDKDnIsvhfKdX3oVZLwmw35xOalmu5AKz17wW1i0ZAuZ7MoT/Wm1
         h6+RXq3l2NLi0hbKqoLO55daQGozT6siSDgq1RDFho78WXGvrQeL4Hvd13Rg9ifqRC0z
         H84mccExPAxGhSvaS8JdDjpByKyTR32oLC4bMDBWgL1hseHslLjKj8Dip2T/Q3WeAnuc
         XBc6/rV4YRNH6VhT46wv2rJA6MioHze0Vfu3KCtXRWk+tew6JRBfvLGSabtvFlhbOd6K
         ZlLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=m8DeBR3ywE5BStJvUpTceu94rxUL71zPmj3cpgCJEJA=;
        b=aZTjRjeM3I7Oblzk9nvScspaOXTPZUHRkrcD9WWgZpeNWcENFOWFtno9Q7XSv/MJwe
         MD8brYCqkhNfxNxdd3cFj/c6KaeUnLJqXkPkmcjAevhbZdNOkuYG5q6mGKoa8sL5KBhj
         NuYfluW09LvMvQ82v5sv9NyxQwdHrwIe/bGY7xwIRld8oY1rgljF4LQ0l0bNf9AEX6re
         lTFCTujWHxdUORAF2AMMNcijl7QOqxzO7ssegED1m6kuxGI2wsV35fuyYeZ58qdWlblX
         YmiQHfGHTZIEQSyayDKYM5oQH5qheeff0jRZnR02f30hcXde/zBHQg/LSOqI3IpkdxGf
         YgKQ==
X-Gm-Message-State: APjAAAUU8U1oFc04pr90UX0toGFgkWo9MyPzndfyrT2BYgQnoTLzBbA8
        yZN5Vmn9HlJBamVQm1B/qEZentnGqnhDxUUrk77GkA==
X-Google-Smtp-Source: APXvYqyTkaqaoLOTCKnsL7k/lnpsdDsn2eStLFJDpnZmQNugeoMpf9pQp1jxpAj2Xc4peTCoju25rIPfLKrgLGX82LE=
X-Received: by 2002:a9f:226d:: with SMTP id 100mr15413840uad.107.1580289113246;
 Wed, 29 Jan 2020 01:11:53 -0800 (PST)
MIME-Version: 1.0
References: <20200128190913.23086-1-geert+renesas@glider.be>
In-Reply-To: <20200128190913.23086-1-geert+renesas@glider.be>
From:   Gilad Ben-Yossef <gilad@benyossef.com>
Date:   Wed, 29 Jan 2020 11:11:42 +0200
Message-ID: <CAOtvUMfoND5iJi7p9YRb6C3To6FGTKGBSoD+cBhkHnLXSppKEw@mail.gmail.com>
Subject: Re: [PATCH] [RFC] crypto: ccree - fix retry handling in cc_send_sync_request()
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Herbert Xu <herbert@gondor.apana.org.au>,
        "David S . Miller" <davem@davemloft.net>,
        Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux kernel mailing list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Jan 28, 2020 at 9:09 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
> If cc_queues_status() indicates that the queue is full,
> cc_send_sync_request() should loop and retry.
>
> However, cc_queues_status() returns either 0 (for success), or -ENOSPC
> (for queue full), while cc_send_sync_request() checks for real errors by
> comparing with -EAGAIN.  Hence -ENOSPC is always considered a real
> error, and the code never retries the operation.
>
> Fix this by just removing the check, as cc_queues_status() never returns
> any other error value than -ENOSPC.

Thank you for spotting this!

The error is simply checking for the wrong error value.
We should be checking for -ENOSPC!

What this does aims to do is wait for the hardware queue to free up if
we were asked to queue a synchronous request and there was no room in
the hardware queue.
The cc_queue_status() function used to return -EAGAIN in this scenario
and this was missed in the change.

I'm curious as to how you found this - did you run into some problem
and traced it to this?
This can lead to a setkey() failing in very high load situations but I
expect this occurrence to be very rare indeed since cc_queue_status()
already loops several times waiting for the room to be freeed.


Gilad



--=20
Gilad Ben-Yossef
Chief Coffee Drinker

values of =CE=B2 will give rise to dom!
