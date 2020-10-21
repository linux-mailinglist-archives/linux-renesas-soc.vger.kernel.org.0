Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E3B6A29508E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Oct 2020 18:16:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2408952AbgJUQQj (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 21 Oct 2020 12:16:39 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.54]:22566 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404280AbgJUQQj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 21 Oct 2020 12:16:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1603296997;
        s=strato-dkim-0002; d=fpond.eu;
        h=Subject:References:In-Reply-To:Message-ID:Cc:To:From:Date:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=DQdq+tPBJ6MiHbNzJ5iOYcMK3ishMBlTtNyoZ/TQR9I=;
        b=VOTcFDMjewcIrtGUSVWhzdJHWvWk+1sOi82efgjjfegb1CTBv2n5jpkQGODh2+hFrZ
        OxkZPjs1sT0OBaG46XmCdRj4QP4GIMH9cuURiGdczcphDI72lHLLHU1lyZwL3Yeg/lS4
        7q1CJNs2YTb4zekIoHU5Ku9u+8tYIY6OfV2x+KXW7uekntgVyRFomW0CnHylJM76+W5t
        GqXStVnkXiiixAKsVH7Udj4HL+QLKdT0PnF6QrKJVm/PpkNhpnSyTmX8i1dQ/DWJc5RR
        CBFRYKVrQORQwQCn3P+NolyMOKgYmsjeBIwn5t9yo+xyZou2QoSc/o4Uwf1H/FfUkvwR
        iAeQ==
X-RZG-AUTH: ":OWANVUa4dPFUgKR/3dpvnYP0Np73amq+g13rqGzvv3qxio1R8fCs/87J3I0="
X-RZG-CLASS-ID: mo00
Received: from oxapp05-03.back.ox.d0m.de
        by smtp-ox.front (RZmta 47.2.1 AUTH)
        with ESMTPSA id a056fbw9LGGS0Au
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Wed, 21 Oct 2020 18:16:28 +0200 (CEST)
Date:   Wed, 21 Oct 2020 18:16:28 +0200 (CEST)
From:   Ulrich Hecht <uli@fpond.eu>
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Cc:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Phong Hoang <phong.hoang.wz@renesas.com>
Message-ID: <739271836.305801.1603296988528@webmail.strato.com>
In-Reply-To: <CAMuHMdWovS9TDK0twf97XzNWhTmUQLCJLCYirgWPtsB9C5_Viw@mail.gmail.com>
References: <20201019120614.22149-1-geert+renesas@glider.be>
 <20201019120614.22149-6-geert+renesas@glider.be>
 <CAMuHMdWovS9TDK0twf97XzNWhTmUQLCJLCYirgWPtsB9C5_Viw@mail.gmail.com>
Subject: Re: [PATCH/RFC 5/6] gpio: rcar: Add support for R-Car V3U
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Priority: 3
Importance: Normal
X-Mailer: Open-Xchange Mailer v7.10.3-Rev25
X-Originating-Client: open-xchange-appsuite
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


> On 10/20/2020 10:22 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > Should input be enabled unconditionally, as recommended by the Hardware
> > Manual for backwards compatibility with existing software?
> > As per (errata?) commit ae9550f635533b1c ("gpio-rcar: Use OUTDT when
> > reading GPIOs configured as output"), the gpio-rcar driver does not use
> > the INDT register to read the status of a GPIO line when configured for
> > output.
> 
> More investigation:
>   1. On SH7734, R-Car Gen1, R-Car Gen2, and RZ/G1, INDT only reflects
>      the state of the input pin if the GPIO is configured for input
>      (documented, verified on R-Car M2-W),
>   2. On R-Car Gen3 and RZ/G2, INDT always reflects the state of the
>      input pin (documented, verified on R-Car H3/M3-W/M3-N),
>   3. On R-Car V3U, input enable can be configured explicitly through the
>       new INEN register (documented, unverified).
> 
> Given register accesses are slow, I think it makes sense to enable input
> explicitly and unconditionally on R-Car V3U, and always use INDT to read
> pin state on R-Car Gen3 and V3U.

That sounds like a good solution to me.

CU
Uli
