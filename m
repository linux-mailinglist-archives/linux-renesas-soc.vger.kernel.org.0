Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 85AFD2F3665
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Jan 2021 18:04:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390600AbhALRCE (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 12 Jan 2021 12:02:04 -0500
Received: from mo4-p01-ob.smtp.rzone.de ([81.169.146.167]:15422 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390336AbhALRCE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 12 Jan 2021 12:02:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1610470751;
        s=strato-dkim-0002; d=fpond.eu;
        h=Subject:References:In-Reply-To:Message-ID:Cc:To:From:Date:From:
        Subject:Sender;
        bh=UkWCcrJcU9m0Y0vOuZmzeym5qj2mGtq8eHDxG6lhrUw=;
        b=EXvDWXTq1BE6VbJRwRmKbLwtKLR63PNpGeS1HYR5wTfNAgN4++MZoKqTC0QEuwBNlU
        fZQfW2b5Sl0bCsgLZ6Pcyihi9WeQjcHet91lBr0MWgw5r2Tp/CNPbRGFwVso0mr5UxIM
        VnBzs7U4tMwfuAMpCZvWH335cwU+q7l/LVgZNiftJcBgiwdi5E4G7JcnXgbX2xuznE8L
        h1NXYu4xaAVUdwR/8YyXTo4WwM/nLGZcfZYe8BpE4y6ulPYseC8W1xM6BNiVPmFash2G
        fVhTV3QXN2AF3AXBb20T3todoXG0ImqYvg/sk2jp0yWHQnyNAXaIUJYh2L914UYwPV1b
        RPGQ==
X-RZG-AUTH: ":OWANVUa4dPFUgKR/3dpvnYP0Np73amq+g13rqGzvv3qxio1R8fGl/wuMlg=="
X-RZG-CLASS-ID: mo00
Received: from oxapp01-01.back.ox.d0m.de
        by smtp-ox.front (RZmta 47.12.1 AUTH)
        with ESMTPSA id z08ea3x0CGx6NU2
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Tue, 12 Jan 2021 17:59:06 +0100 (CET)
Date:   Tue, 12 Jan 2021 17:59:06 +0100 (CET)
From:   Ulrich Hecht <uli@fpond.eu>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Wolfram Sang <wsa@the-dreams.de>, hoai.luu.ub@renesas.com
Message-ID: <684637980.401595.1610470746688@webmail.strato.com>
In-Reply-To: <CAMuHMdUXd96hb88R=+FvoNRrpcar+AyXn97Abf2MN9F2i1rfYQ@mail.gmail.com>
References: <20201221165541.27679-1-uli+renesas@fpond.eu>
 <20201221165541.27679-3-uli+renesas@fpond.eu>
 <CAMuHMdUXd96hb88R=+FvoNRrpcar+AyXn97Abf2MN9F2i1rfYQ@mail.gmail.com>
Subject: Re: [PATCH v2 02/12] pinctrl: renesas: r8a779a0: Add EtherAVB pins,
 groups and functions
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


> On 12/22/2020 11:10 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> AVB0 and AVB1 also support MII.  Do you plan to add them later?

I do.

CU
Uli
