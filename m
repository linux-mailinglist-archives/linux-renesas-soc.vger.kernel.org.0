Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B7CA42E0D90
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 22 Dec 2020 17:52:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727773AbgLVQu6 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 22 Dec 2020 11:50:58 -0500
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.54]:28636 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727735AbgLVQu5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 22 Dec 2020 11:50:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1608655683;
        s=strato-dkim-0002; d=fpond.eu;
        h=Subject:References:In-Reply-To:Message-ID:Cc:To:From:Date:From:
        Subject:Sender;
        bh=Jx8dWRtRt2qzB0AjZU2WTKYCMz1K1Zbit4Qjuz08hQ0=;
        b=S7lppfclpV30dTW1M88dldVUyKBq9ZhoNOZnmEO4i7ElP+4vj4zP0RN1PO6CpsHM23
        o5Lhs1sJfiYSuNI4Mhc/6l4gekLH3qZe5tgbtqtIb2Jp7LKQXujrooFKJBpFw1hIdWs/
        b2fMW+Sf+26M08gw0Imf1Rcxr3Ni8evGdUMsjQMneJJr0tSmXGN72R4RNZk5iD3vb9Kp
        8EA1EZD7MkZwDFi5fLX2PBeVBHwMmZzxy3wMPQ8N2MlmlxSrnbZ5ABS8gSo+2X3RxAQT
        YXVlc/If82F9DapNKwFigJk0oCa35x1X79RRXeezkhVpBNrp698SNME/Tc7/chSrojpl
        pJhw==
X-RZG-AUTH: ":OWANVUa4dPFUgKR/3dpvnYP0Np73amq+g13rqGzvv3qxio1R8fGk/2qthug="
X-RZG-CLASS-ID: mo00
Received: from oxapp03-01.back.ox.d0m.de
        by smtp-ox.front (RZmta 47.10.3 AUTH)
        with ESMTPSA id n0843bwBMGlw0Nt
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Tue, 22 Dec 2020 17:47:58 +0100 (CET)
Date:   Tue, 22 Dec 2020 17:47:58 +0100 (CET)
From:   Ulrich Hecht <uli@fpond.eu>
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Ulrich Hecht <uli+renesas@fpond.eu>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Wolfram Sang <wsa@the-dreams.de>, hoai.luu.ub@renesas.com
Message-ID: <1854725464.217715.1608655678597@webmail.strato.com>
In-Reply-To: <CAMuHMdX-9=2NfxeeWjWV5rsRx8TLjdtJ_ZmdK9xJvAvLhkFJ+A@mail.gmail.com>
References: <20201221165448.27312-1-uli+renesas@fpond.eu>
 <20201221165448.27312-3-uli+renesas@fpond.eu>
 <CAMuHMdX-9=2NfxeeWjWV5rsRx8TLjdtJ_ZmdK9xJvAvLhkFJ+A@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] pinctrl: renesas: add I/O voltage level flag
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


> On 12/22/2020 12:44 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> Alternatively, .pin_to_pocctrl() could return mV_low and mV_high?
> That would require updating all subdrivers, though.

Exactly. :)

CU
Uli
