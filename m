Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E0CA52DFE96
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Dec 2020 18:01:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726575AbgLUQ7t (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 21 Dec 2020 11:59:49 -0500
Received: from mo4-p03-ob.smtp.rzone.de ([85.215.255.101]:28412 "EHLO
        mo4-p03-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726567AbgLUQ7s (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Dec 2020 11:59:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1608569807;
        s=strato-dkim-0002; d=fpond.eu;
        h=Subject:References:In-Reply-To:Message-ID:Cc:To:From:Date:From:
        Subject:Sender;
        bh=WsJ4dfA+wtnjpuK0WXXnlzKi8aks8K8mh8iQBXqJmz4=;
        b=Lz4jblwmHbHH+sVYA9Huk5ShM+i39Xp3cZNwjGvXiPwxnB1crEETqKjwtP1XxOg0DL
        93gaP8qhkpE23mUdUKd4tN6mJu4qMora1K8T6tJaRDGCNWEVeSuY542HenXNtzWdmhox
        ht5TycYvhpL5rA8Dr90NAzQTRvArSlf/jMobcRHHr3cHoJYbYlVFUcDP3nHdWNbzjPkZ
        PHoMU/0xCeIhZhYayj4oV2mucbxtCG8Zlp5NLqO17SD2CTRbp9z/0laHV5/C4IG/Ei87
        hX0fARgsN1eFcnGkLviAJ3zdpIOwaEuEvsMyfEbb/FmPATLFLzgC8fT2B8Lf/U9zjgV9
        vdZg==
X-RZG-AUTH: ":OWANVUa4dPFUgKR/3dpvnYP0Np73amq+g13rqGzvv3qxio1R8fGk/2qthug="
X-RZG-CLASS-ID: mo00
Received: from oxapp03-01.back.ox.d0m.de
        by smtp-ox.front (RZmta 47.10.2 AUTH)
        with ESMTPSA id j05b20wBLGuh0Kh
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Mon, 21 Dec 2020 17:56:43 +0100 (CET)
Date:   Mon, 21 Dec 2020 17:56:43 +0100 (CET)
From:   Ulrich Hecht <uli@fpond.eu>
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Ulrich Hecht <uli+renesas@fpond.eu>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Wolfram Sang <wsa@the-dreams.de>, hoai.luu.ub@renesas.com
Message-ID: <1886217078.165797.1608569803367@webmail.strato.com>
In-Reply-To: <CAMuHMdWLVkZ2ZkrCCykLVYhehpr6=f-jGT07cKoH45P-moo+VA@mail.gmail.com>
References: <20201126172058.25275-1-uli+renesas@fpond.eu>
 <20201126172058.25275-3-uli+renesas@fpond.eu>
 <CAMuHMdWLVkZ2ZkrCCykLVYhehpr6=f-jGT07cKoH45P-moo+VA@mail.gmail.com>
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

Thanks for the review.

> On 12/01/2020 9:54 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> The above are 2.5/3.3V pins, and they are not handled correctly by
> sh_pfc_pinconf_[gs]et(), which always assumes 1.8/3.3V.
> 
> I think the simplest solution would be to split the
> SH_PFC_PIN_CFG_IO_VOLTAGE flag in two flags, and the pin_to_pocctrl()
> callback in two callbacks, one for 1.8/3.3V and one for 2.5/3.3V pins,
> but you may have a better idea?

I added new bits to the pin config that specify the voltage. That way we can easily extend it if we ever get the eminently more useful 5V, 12V and 230V pins...

CU
Uli
