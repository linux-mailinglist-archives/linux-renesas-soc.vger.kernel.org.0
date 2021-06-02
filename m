Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 13568398ED9
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Jun 2021 17:40:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232129AbhFBPmD (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 2 Jun 2021 11:42:03 -0400
Received: from mo4-p00-ob.smtp.rzone.de ([85.215.255.23]:19477 "EHLO
        mo4-p00-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232115AbhFBPmC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 2 Jun 2021 11:42:02 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1622648414; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=MOeEg3PdjT7RW5v2yDR5IZhxOchWfZW+M6fkOrZo+qm1bQa5Jqm4iwhxSl0SCy4QNT
    MXJBuTBvaw7e4olKfBVYsv375UP0C+wk44hAaJJ9XgDkxsA4WH9xBhgqgwQeYnppErAd
    9Y2+/PiMCQu5xQVf9fG0fkcsCTCXWPGoiKev85FpvguQEwpAEYdkHAtFzQ8xHIsUlVYd
    dva/0MNjtj/Ur85gV6rtYEDDsSxNUeC20TCH28cALeucLcGGOqYLC2E+Vy9x/F9IeUsE
    o8lL4jX5sc6jZV7vWwyUVO8CAZ/5MdzHSlorjMI/iM4gHP+2BrsSz//R57ZxZiRY/p+b
    MIGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1622648414;
    s=strato-dkim-0002; d=strato.com;
    h=Subject:References:In-Reply-To:Message-ID:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=T4QFjJdjTOLIaLLvxn3bSUlN+BqUHhpZL0mv+OCU+tA=;
    b=SgKckdaj8BMTHedAfNfdeQNtu6kak4D5nheH9oEvY6HKyTRNqT1xphU+3kD/ftDOE2
    7I21A4QmR2y0bFa+iK4KPaLt6V+MCpjptkh0HL7grQxkWoBW0U2FdMQ6pehuM0ztlfjf
    muUzmuLWlcdjG+oyyv1u5phzKCb9wrfOVdZX52zlLqPE9h/TRDMBo2ygC6dpb/bBEh0Q
    3Mx6dtSx5Rdbv8Td/4j0D6drINkOSJAmyn3RnZyD5la/OscJSjPUISC0+aOIif+15mcR
    3/8QEryo+DKgitEzR4wSTzHtgrGO234EbLo6fZeI1uWIdY8/wIjVVAGTQctZNmT5H2Oa
    VhQA==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1622648414;
    s=strato-dkim-0002; d=fpond.eu;
    h=Subject:References:In-Reply-To:Message-ID:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=T4QFjJdjTOLIaLLvxn3bSUlN+BqUHhpZL0mv+OCU+tA=;
    b=EP2sfYBaJEVUqBw0x0FpFA4d6Iu9VUynV2QUoLWby8Hl7oWxzO4TtloqA+cBd5Qyfl
    FEFD2fF52wlgjQAm7/ooG63zRlBukzvNRgB0cJZFF7668pT2QTyuVVgOodwRVyp8L+8m
    I7Vj+k0qKT0m7CjWfXTggytC8+qMy5/K0MajyAYUY3qohXwMM8PO4duWOZ9o6vFbnBZE
    AIeYsj/ArS0p21WtnFlya+GQy8kAY7G611q1h3DjLmMZsYyXFJIxo8IDBouE0gpUrykV
    PDjG5vYiR5gzSJODOZJxUHkzEqHF675D3TSkrh45F4S2JqG3jiRwdr+bBTFESwEp+BcH
    1XrQ==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":OWANVUa4dPFUgKR/3dpvnYP0Np73amq+g13rqGzvv3qxio1R8fCt/7B6PNk="
X-RZG-CLASS-ID: mo00
Received: from oxapp04-01.back.ox.d0m.de
    by smtp-ox.front (RZmta 47.27.2 AUTH)
    with ESMTPSA id j09f72x52FeE44n
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
    Wed, 2 Jun 2021 17:40:14 +0200 (CEST)
Date:   Wed, 2 Jun 2021 17:40:14 +0200 (CEST)
From:   Ulrich Hecht <uli@fpond.eu>
To:     Wolfram Sang <wsa@kernel.org>, Ulrich Hecht <uli+renesas@fpond.eu>
Cc:     linux-renesas-soc@vger.kernel.org, linux-mmc@vger.kernel.org,
        ulf.hansson@linaro.org
Message-ID: <461686971.488794.1622648414815@webmail.strato.com>
In-Reply-To: <YKUf9TVcKetApd1J@ninjato>
References: <20210514155318.16812-1-uli+renesas@fpond.eu>
 <YKUf9TVcKetApd1J@ninjato>
Subject: Re: [PATCH] mmc: renesas_sdhi: increase suspend/resume latency
 limit
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Priority: 3
Importance: Normal
X-Mailer: Open-Xchange Mailer v7.10.4-Rev24
X-Originating-Client: open-xchange-appsuite
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


> On 05/19/2021 4:25 PM Wolfram Sang <wsa@kernel.org> wrote:
> On Fri, May 14, 2021 at 05:53:18PM +0200, Ulrich Hecht wrote:
> > The TMIO core sets a very low latency limit (100 us), but when using R-Car
> > SDHI hosts with SD cards, I have observed typical latencies of around 20-30
> > ms. This prevents runtime PM from working properly, and the devices remain
> > on continuously.
> > 
> > This patch sets the default latency limit to 100 ms to avoid that.
> > 
> > Signed-off-by: Ulrich Hecht <uli+renesas@fpond.eu>
> 
> Well, yes, I can confirm that this helps wrt the "always-enabled" clock.
> However, when removing UHS cards, I now see this regression:
> 
> [    8.659916] mmcblk2: mmc2:0001 00000 29.8 GiB 
> [    8.677304]  mmcblk2: p1
> [    9.622918] mmc2: tuning execution failed: -5
> [    9.627385] mmc2: card 0001 removed
> 
> It is interesting to see the "execution failed" error when *removing*
> the card. Before removing, access to the card seems fine. I haven't
> checked further, so I can't say yet if this is a related or seperate but
> now undiscovered issue.

I have traced this, and it seems to be triggered by mmc_sd_detect(), which is called by mmc_rescan() and does this:

[...]
        /*
         * Just check if our card has been removed.
         */
        err = _mmc_detect_card_removed(host);

        mmc_put_card(host->card, NULL);

        if (err) {
                mmc_sd_remove(host);
[...]

_mmc_detect_card_removed() calls mmc_sd_alive(), which tries to send a command to the SD card to see if it's still there, which in turn triggers the retune. IOW, this is expected to fail, and the error message is misleading.

CU
Uli
