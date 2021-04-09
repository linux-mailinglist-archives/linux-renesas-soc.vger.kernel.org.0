Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2072A35A293
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 Apr 2021 18:04:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233859AbhDIQEy (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 9 Apr 2021 12:04:54 -0400
Received: from mo4-p00-ob.smtp.rzone.de ([85.215.255.21]:20206 "EHLO
        mo4-p00-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232796AbhDIQEy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 9 Apr 2021 12:04:54 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1617984277; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=UT1mfGtxwkDDQMfXny4EECvRq7uhnxKYoS3LfNwwkYnguh1ZZcvBzZ3A4CZrY+PLA1
    FJphqHT9nh0pG6UzwBXS1ub90UF8sPb3TqzmDIIf9RLhTfzjvmxs9ZU6Gxt7KQtgdJEu
    OgoA57gjkNd9J7lwsHqeWo23zuBmJaymu+Lh8nTdAQ88dxLUpqZwwuuwUR+aepoLps8E
    z/d/QbkuZEmILvzvTy5WjzH3HGdzxEPbDlLd1qWbZuyFuNUDw3qC8wqFf8D+qZ+IWCvs
    v4QK5CPlEbCR3qH5MtNz0HoiDiPikZHJG+TUUNDggsTWn1xqezKQTsnO8WpexKqIHiaK
    pPpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1617984277;
    s=strato-dkim-0002; d=strato.com;
    h=Subject:References:In-Reply-To:Message-ID:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=PWECKl1/J3SGQk9puybBr9ahv+6Be2q/C9Zl23P0y+g=;
    b=E1035uKw34pGnRoROT+ogTzyh3EYAhN2E109cSIO9eLQ8WkwDMv2MGhWlMt2oTeKOv
    mzsoQIayOstwkGX5ZEywu7qPo/zYusbw6E9RFlt96r0kenxyLbLE2VQcXRuoHykEwi2i
    TjYe3mMEa+4NROOSDlnR9IuHuWi3vNwgmfgcyZkgOsF0fgvKWQFndkYEOWujjfsv7vo4
    TXpZ4u/jMKzeXXeYEy1DsVEkhudE6jH1yxUflx23EKQWjMn0FTN6v9f4lLHZuRThMV7O
    X9J5eLwbA4E/kYO20uSfzurvHh8ilcELtu/lOOD9Qp3nxCl0joTVnvlVwrXy2JZQpMuA
    VMvw==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1617984277;
    s=strato-dkim-0002; d=fpond.eu;
    h=Subject:References:In-Reply-To:Message-ID:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=PWECKl1/J3SGQk9puybBr9ahv+6Be2q/C9Zl23P0y+g=;
    b=JrHmVV1HHNUpdGpU7exLpkExqQFc7Ne+Z9jziTIC/DgTvT6gJlgj8SpYeRluhKBDgc
    JEebgyo2lmBj8kx7ZXu9/LToUQqoc2thNozzyNOq9IK0h+1YXNWNVxJP8tTOPscLQxWJ
    1nHSngi6JcSWluC9jQr+Rf5qsjOwgoDhy+4aNn+0J4/VYda6RoNBAsQsd/nuG9+a9rfP
    VapbFnBrBNwzXvEYr8gJMm6mBvbVBmyUo10xjbySWnb14VC2Tnoiu9wO1+cSbQTS9zSz
    jsFTz5m6mR8eV5ESBiVy8umsv2VmVXPPh/pY5JU4hApAep+KMt6MmOtx3X0MNfR+x+vM
    L66A==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":OWANVUa4dPFUgKR/3dpvnYP0Np73amq+g13rqGzvv3qxio1R8fGl/w2B+Io="
X-RZG-CLASS-ID: mo00
Received: from oxapp02-03.back.ox.d0m.de
    by smtp-ox.front (RZmta 47.24.0 AUTH)
    with ESMTPSA id m01edax39G4bAyS
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
    Fri, 9 Apr 2021 18:04:37 +0200 (CEST)
Date:   Fri, 9 Apr 2021 18:04:37 +0200 (CEST)
From:   Ulrich Hecht <uli@fpond.eu>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Ulrich Hecht <uli+renesas@fpond.eu>
Cc:     "wsa@kernel.org" <wsa@kernel.org>,
        "geert@linux-m68k.org" <geert@linux-m68k.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>
Message-ID: <785709679.143677.1617984277200@webmail.strato.com>
In-Reply-To: <OSAPR01MB3683F5855937833872F4FE23D8739@OSAPR01MB3683.jpnprd01.prod.outlook.com>
References: <20210409082524.3480-1-uli+renesas@fpond.eu>
 <OSAPR01MB3683F5855937833872F4FE23D8739@OSAPR01MB3683.jpnprd01.prod.outlook.com>
Subject: RE: [PATCH] serial: sh-sci: correct units in comment about DMA
 timeout
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Priority: 3
Importance: Normal
X-Mailer: Open-Xchange Mailer v7.10.4-Rev21
X-Originating-Client: open-xchange-appsuite
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


> On 04/09/2021 2:16 PM Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com> wrote:
> Thank you for the patch!
> 
> > From: Ulrich Hecht, Sent: Friday, April 9, 2021 5:25 PM
> > 
> > Since the transition to hrtimers, the calculation does not involve jiffies
> > any longer, which has led to confusion. State the times in ms instead.
> 
> IIUC, the unit of rx_timeout was changed from milliseconds to microseconds
> when hrtimer is used.

D'oh!

> So, almost all comments was not needed.
> 
> Also, I'm wondering if the following condition is not needed or not.
> This is because this was "20ms". But, perhaps, the driver will not
> set rx_timeout to "20us" or small.
> 
>         if (s->rx_timeout < 20)
>                 s->rx_timeout = 20;

A more helpful version of the comment is in 3089f381fbaf5:

/*
 * Calculate delay for 1.5 DMA buffers: see
 * drivers/serial/serial_core.c::uart_update_timeout(). With 10 bits
 * (CS8), 250Hz, 115200 baud and 64 bytes FIFO, the above function
 * calculates 1 jiffie for the data plus 5 jiffies for the "slop(e)."
 * Then below we calculate 3 jiffies (12ms) for 1.5 DMA buffers (3 FIFO
 * sizes), but it has been found out experimentally, that this is not
 * enough: the driver too often needlessly runs on a DMA timeout. 20ms
 * as a minimum seem to work perfectly.
 */

I think we still want that, but it should of course be 20000, not 20.

CU
Uli
