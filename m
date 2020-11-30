Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9845F2C7FD3
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Nov 2020 09:28:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726474AbgK3I2U (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 30 Nov 2020 03:28:20 -0500
Received: from mo4-p00-ob.smtp.rzone.de ([81.169.146.163]:33607 "EHLO
        mo4-p00-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726332AbgK3I2U (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 30 Nov 2020 03:28:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1606724666;
        s=strato-dkim-0002; d=fpond.eu;
        h=Subject:References:In-Reply-To:Message-ID:Cc:To:From:Date:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=l5arlystRqfBEf2sfz6x1EjXGTfh0lrExuBwEI0B2L8=;
        b=XWAIUxXjnRevCqluznLkSBTYcFbCejNh0Z+l2Ir6l1zDfH3jFKk7ksQzTLv1iCh6up
        jjXPP5Latp2R9PwyM1xQ7FWPpygFq2/sgQin5eI6uGV4mp3h6puzEElWm41yiI3x1632
        rgEeFVHZEd0+YDrE4M3y3SyMsWzs/RZ9392J4T/vss6/+1wMsTp8VQmTAAnPOg39dSnl
        e3fVQL5xK2vqjx7wu/Y2mnb+1bEt68HCzkjRVxs47Ml5DbBtVtPuX8qAptt+HQCzbRf5
        Zj+hYb6h0q11zBetxbfvTQ5sPUeMJHpkQB4oq0URpNYisL9WZNirZyt8+1B4gkZBlIKE
        wsbg==
X-RZG-AUTH: ":OWANVUa4dPFUgKR/3dpvnYP0Np73amq+g13rqGzvv3qxio1R8fCs/83N2Y0="
X-RZG-CLASS-ID: mo00
Received: from oxapp05-01.back.ox.d0m.de
        by smtp-ox.front (RZmta 47.3.3 AUTH)
        with ESMTPSA id 60ba70wAU8OKdWN
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Mon, 30 Nov 2020 09:24:20 +0100 (CET)
Date:   Mon, 30 Nov 2020 09:24:20 +0100 (CET)
From:   Ulrich Hecht <uli@fpond.eu>
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Ulrich Hecht <uli+renesas@fpond.eu>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Wolfram Sang <wsa@the-dreams.de>, hoai.luu.ub@renesas.com
Message-ID: <5754923.305606.1606724660476@webmail.strato.com>
In-Reply-To: <CAMuHMdWt+NBD4u4iCf=OdSyFBBW0HU3HwWYyOK3tX87cUOSMwg@mail.gmail.com>
References: <20201126172154.25625-1-uli+renesas@fpond.eu>
 <CAMuHMdWt+NBD4u4iCf=OdSyFBBW0HU3HwWYyOK3tX87cUOSMwg@mail.gmail.com>
Subject: Re: [PATCH 00/11] pinctrl: renesas: R8A779A0 (V3U) device support
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Priority: 3
Importance: Normal
X-Mailer: Open-Xchange Mailer v7.10.3-Rev28
X-Originating-Client: open-xchange-appsuite
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


> On 11/27/2020 11:33 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> 
>  
> Hi Uli,
> 
> On Thu, Nov 26, 2020 at 6:22 PM Ulrich Hecht <uli+renesas@fpond.eu> wrote:
> > This series adds V3U pin control support for EtherAVB, CANFD, DU, HSCIF,
> > INTC-EX, MMC, MSIOF, PWM, QSPI, TMU and TPU.
> >
> > It has been ported from the BSP and has been compile-tested only. It
> > depends on the "pinctrl: renesas: basic R8A779A0 (V3U) support" series
> > posted earlier.
> 
> Thanks for your series!
> 
> > Ulrich Hecht (11):
> >   pinctrl: renesas: r8a779a0: Add EtherAVB pins, groups and functions
> 
> This patch depends on i2c support, which was not included in your series?

Whoops, screwed up the format-patch there...
I'll post the I2C patch separately for review and include it in v2 of this series.

CU
Uli
