Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C13D35BB9A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 Apr 2021 10:04:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235386AbhDLIEl (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 12 Apr 2021 04:04:41 -0400
Received: from mo4-p00-ob.smtp.rzone.de ([85.215.255.25]:35906 "EHLO
        mo4-p00-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230034AbhDLIEk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 12 Apr 2021 04:04:40 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1618214659; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=TC5kjK8pTnJ+fbGLu+qV/5rpBRqFKvbm2Ls3mnaAQ0KqSz1lyU/u00jKQ7UcoQqVp8
    Tx7bR9zyjwXYHzyCSi77kFlUXpr2guOedhCKif1iAoRteI6tCURCCqevqvkP8ahpUp/5
    bT2lEszwgOlkq4op0LVrDWn1doD6lmxJDRw5OG6OB95AnPqyucSxQAbS0TVZFEQwC4EZ
    1bS63xWQS8J1iyTi4zDO4nPAiekn8gTYfKiDXmByZU4SrfAN1vUbysedooHKWRZvy1eA
    MHc9MprcRkyrCMvxX+A1AZEz2gOF9Fm+NmcfQC/G4NQ2yqJ9XS3CcCTNkdNu6i/OiVOI
    hAsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1618214659;
    s=strato-dkim-0002; d=strato.com;
    h=Subject:References:In-Reply-To:Message-ID:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=8bonpD1uBpLuS0DvmCtdSzAHKD3kFan7gzbk1uMEsJM=;
    b=kW7m2bzl23Gc4mExNQgUL1JeupLiHqrNirNU4SfZnL9DVVpB6qUWhZLThlQkq6+kF9
    CKjXvNcCtScP9T2JgC0k9Ygn2UtcVDZNh+JgtNClGgxH1MVBy94FiROZk/L90kJRKMIS
    Uv7LbvjbpGOiCKOkhQzWsmYIk6gayoYKLjqaPZEamIdEWfRAaC+77fRn09qQiw/9QLAq
    kbqQjn5bdT4v98i3wJ3+K7P9SIdEtY/xAH9RDX2UFuv4QFD+a8yYkHBBmExTLuhcfIHO
    K+GqoBqoVGPOi5hKZEbTUej51lEjyzMsktwecNRxAoMopRYfKVL7HWkeApmNwgdJXhJ7
    R3DQ==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1618214659;
    s=strato-dkim-0002; d=fpond.eu;
    h=Subject:References:In-Reply-To:Message-ID:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=8bonpD1uBpLuS0DvmCtdSzAHKD3kFan7gzbk1uMEsJM=;
    b=cFSXp11WS2kuNIRmsJT13e2i3rBkVpTzquJi0fE52h3S94pnVsP6x4pa2J99PV9csc
    tpsijML0ACXPKTLEg8CtTxCQqty1A8TJOsIrVy2WpabJn3RGMnqPjw0gZkA5CGgApitm
    t3SBa6h0SOBVmO+66MCHfmi3UxWa0z4/NYa8gL84LHzKouO1rCx2YOVclXxdJutW8YF2
    B0z3BRtsidZMsV62t580WbO7Xgur73RIZZIDuvvkSI8oRgNUl7TxDNYeCrhOuKc6C7o4
    FnnE93mm1rpiRHG2rTW/oViMg8oLWMluPKKHAujgPHoTC2Uq7NraovnoygquEa2XiT8q
    4xMA==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":OWANVUa4dPFUgKR/3dpvnYP0Np73amq+g13rqGzvv3qxio1R8fCv/x28jVM="
X-RZG-CLASS-ID: mo00
Received: from oxapp06-01.back.ox.d0m.de
    by smtp-ox.front (RZmta 47.24.0 AUTH)
    with ESMTPSA id m01edax3C84IIU8
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
    Mon, 12 Apr 2021 10:04:18 +0200 (CEST)
Date:   Mon, 12 Apr 2021 10:04:18 +0200 (CEST)
From:   Ulrich Hecht <uli@fpond.eu>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     "wsa@kernel.org" <wsa@kernel.org>,
        "geert@linux-m68k.org" <geert@linux-m68k.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>
Message-ID: <1395082345.239625.1618214658794@webmail.strato.com>
In-Reply-To: <OSAPR01MB3683AE83C298C792F4DA3344D8709@OSAPR01MB3683.jpnprd01.prod.outlook.com>
References: <20210409082524.3480-1-uli+renesas@fpond.eu>
 <OSAPR01MB3683F5855937833872F4FE23D8739@OSAPR01MB3683.jpnprd01.prod.outlook.com>
 <785709679.143677.1617984277200@webmail.strato.com>
 <OSAPR01MB3683AE83C298C792F4DA3344D8709@OSAPR01MB3683.jpnprd01.prod.outlook.com>
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


> On 04/12/2021 8:23 AM Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com> wrote:
> Hmm, when we use HSCIF with 10 bits, 3000000 baud and 128 bytes FIFO,
> the rx_timeout value will be set to 1536 (us). So, if we set rx_timeout
> to 20000 (us) as a minimum value, the sh-sci' behavior will be back to
> non hrtimer support, IIUC.
> 
> Perhaps, describing uart_update_timeout() and the jiffies value of
> uart_port->timeout with 115200 baud here may cause misreading??
> I didn't understand the purpose of uart_port->timeout yet thought.
> But, at least, the current driver uses hrtimer to improve latency
> for HSCIF, the driver should not set 20000 (us) as a minimum value.

Not having looked at this stuff in a while, I was under the impression that the rx timeout is an error condition, when it is in fact part of normal (DMA) operation. I think it was indeed the reference to uart_update_timeout() that threw me off...

So if my understanding is correct now, we should scrap the minimum timeout code entirely because the condition it is supposed to prevent cannot occur any longer due to the switch to hrtimers. Did I get that right?

CU
Uli
