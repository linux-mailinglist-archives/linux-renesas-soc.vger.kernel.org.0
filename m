Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 53D8F2DFEA2
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Dec 2020 18:01:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725957AbgLURAY (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 21 Dec 2020 12:00:24 -0500
Received: from mo4-p03-ob.smtp.rzone.de ([85.215.255.103]:25088 "EHLO
        mo4-p03-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725892AbgLURAX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Dec 2020 12:00:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1608569841;
        s=strato-dkim-0002; d=fpond.eu;
        h=Subject:References:In-Reply-To:Message-ID:Cc:To:From:Date:From:
        Subject:Sender;
        bh=RSVbiO3ly5PS0HwwdqOP30envTTxeomen4wdZ3IE2Fk=;
        b=F7R1bPJrwHU7znEzr2GpbMqT3u646uNfBJrEsIadpFmFIjgNXgPs7/RHh4qKcaBLFP
        9bIJj7xk40s2jSe8Sib1siKx1mQxg5Y8Zc96zTuZo3oT/qIFv3iwPpTkJtcII0oGUzUG
        BI2oAaxpH8qmatdK769ZeE/9sWn5Y8JOdv8D5g0OO8DZFDRvKT3bh6e0N+KQWMaf4ZMu
        9ch+ad/HAiwFwAHjZVR26BfJL6IyALXh89Wz6GWazeQ+/E4vwzGNfSBgIVVLLHChCd0z
        PqCYjHMFgSOfjeWNPPX0Ai3ULG21s3YP+ZAzJ3xsOOn3csghVoGu4a2WJUOf56SjhKXQ
        vPUQ==
X-RZG-AUTH: ":OWANVUa4dPFUgKR/3dpvnYP0Np73amq+g13rqGzvv3qxio1R8fGk/2qthug="
X-RZG-CLASS-ID: mo00
Received: from oxapp03-01.back.ox.d0m.de
        by smtp-ox.front (RZmta 47.10.2 AUTH)
        with ESMTPSA id j05b20wBLGvI0Kw
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Mon, 21 Dec 2020 17:57:18 +0100 (CET)
Date:   Mon, 21 Dec 2020 17:57:18 +0100 (CET)
From:   Ulrich Hecht <uli@fpond.eu>
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Ulrich Hecht <uli+renesas@fpond.eu>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Wolfram Sang <wsa@the-dreams.de>, hoai.luu.ub@renesas.com
Message-ID: <106063155.165831.1608569838422@webmail.strato.com>
In-Reply-To: <CAMuHMdVSF_8JmR5t1aMPktY=J7=BvUbWLzPGnb9=QnRrLeA2ew@mail.gmail.com>
References: <20201126172058.25275-1-uli+renesas@fpond.eu>
 <20201126172058.25275-3-uli+renesas@fpond.eu>
 <CAMuHMdVSF_8JmR5t1aMPktY=J7=BvUbWLzPGnb9=QnRrLeA2ew@mail.gmail.com>
Subject: Re: [PATCH 2/3] pinctrl: renesas: Initial R8A779A0 (V3U) PFC
 support
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Priority: 3
Importance: Normal
X-Mailer: Open-Xchange Mailer v7.10.3-Rev29
X-Originating-Client: open-xchange-appsuite
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Thanks again for the review.

> On 11/30/2020 9:22 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > +       { /* sentinel */ },
> 
> What about PUDSYS?

Following our off-list discussion, I have left PUDSYS end PUENSYS out until we get documentation for them that is complete and non-contradictory.

CU
Uli
