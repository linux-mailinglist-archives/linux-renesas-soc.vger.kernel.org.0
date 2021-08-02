Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B1553DD482
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 Aug 2021 13:18:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232553AbhHBLSa (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 2 Aug 2021 07:18:30 -0400
Received: from mo4-p00-ob.smtp.rzone.de ([81.169.146.218]:17150 "EHLO
        mo4-p00-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233255AbhHBLSa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 2 Aug 2021 07:18:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1627903098;
    s=strato-dkim-0002; d=fpond.eu;
    h=Subject:References:In-Reply-To:Message-ID:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=Ucwn6Ack2yVMmcy+MDrXHYsh6wsuWfQk97JEUKaWrMM=;
    b=KxXmRiXMgBQAI0M8OTBJjbs4X6rBJGJVTg44TjhgNsJ355bKVrjFdQBVnJAZHxnTRr
    7qoaCyXL3lE8SAcq5k+m0ueHo1Wr4YZswK8ZbX+Sb0kBJ1GVquhnJ8SIFIeymrCYZ8S2
    VruEDMk7UERUCl7BUqtpgMe3DfNnkzzNl+P6L93eX5pKFZVX3SCoklI+fPir/LEdEKwH
    yvSDtIOm5OlWO9V0RYDm19xiSTZf869BB1iDbuRWqneU0zH5i5oZw9/E/HCXUjQMa135
    EcVeV5jOKdluuR3JPy+4DOwKwjlJAJZa+jpzFcdGAuN6ERjnAm/c+bEKa8/iYJAGBwwy
    48mQ==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":OWANVUa4dPFUgKR/3dpvnYP0Np73amq+g13rqGzvv3qxio1R8fCt/7B6PNk="
X-RZG-CLASS-ID: mo00
Received: from oxapp04-01.back.ox.d0m.de
    by smtp-ox.front (RZmta 47.28.1 AUTH)
    with ESMTPSA id n07311x72BIIDwY
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
    Mon, 2 Aug 2021 13:18:18 +0200 (CEST)
Date:   Mon, 2 Aug 2021 13:18:18 +0200 (CEST)
From:   Ulrich Hecht <uli@fpond.eu>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Wolfram Sang <wsa@kernel.org>
Cc:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>
Message-ID: <821963380.577567.1627903098435@webmail.strato.com>
In-Reply-To: <TY2PR01MB3692486033934E1C007EBF6AD8EF9@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <20210514155318.16812-1-uli+renesas@fpond.eu>
 <YQQah2Q8qmQPEl7F@ninjato>
 <TY2PR01MB3692486033934E1C007EBF6AD8EF9@TY2PR01MB3692.jpnprd01.prod.outlook.com>
Subject: RE: [PATCH] mmc: renesas_sdhi: increase suspend/resume latency
 limit
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Priority: 3
Importance: Normal
X-Mailer: Open-Xchange Mailer v7.10.5-Rev17
X-Originating-Client: open-xchange-appsuite
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


> On 08/02/2021 7:34 AM Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com> wrote:
> 
>  
> Hi Wolfram-san, Ulrich-san,
> 
> > From: Wolfram Sang, Sent: Saturday, July 31, 2021 12:28 AM
> > 
> > On Fri, May 14, 2021 at 05:53:18PM +0200, Ulrich Hecht wrote:
> > > The TMIO core sets a very low latency limit (100 us), but when using R-Car
> > > SDHI hosts with SD cards, I have observed typical latencies of around 20-30
> > > ms. This prevents runtime PM from working properly, and the devices remain
> > > on continuously.
> > >
> > > This patch sets the default latency limit to 100 ms to avoid that.
> > >
> > > Signed-off-by: Ulrich Hecht <uli+renesas@fpond.eu>
> > 
> > Adding Shimoda-san to CC.
> > 
> > Shimoda-san: can you kindly run your SDHI tests with this patch applied?
> 
> Sure!
> 
> However, I have a question about this patch.
> Would you know how to measure the latencies?

IIRC I simply put a printk() in default_suspend_ok() that dumps td->suspend_latency_ns and td->resume_latency_ns.

> I enabled function trace of rpm and checked the log, but I could not observe
> any behavior changes with and without applying this patch.

So you are saying that for you, the clock is suspended as expected when removing the card, even without this patch?
If so, I wonder if there are variations between boards...

CU
Uli
