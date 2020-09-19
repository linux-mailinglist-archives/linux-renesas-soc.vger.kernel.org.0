Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 95AA8270C36
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 19 Sep 2020 11:36:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726157AbgISJgz (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 19 Sep 2020 05:36:55 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.54]:35691 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726129AbgISJgz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 19 Sep 2020 05:36:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1600508214;
        s=strato-dkim-0002; d=fpond.eu;
        h=Subject:References:In-Reply-To:Message-ID:Cc:To:From:Date:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=ODQfCrsWbv+35w9pR/GshOeac4k5tqps7+GruLF3vqo=;
        b=FvuAtNa8LqAVxl6Qb4VSUzC58kBG78haVxGKG2MmuQCWUSVU+S5hyFyYWxQyeITfwk
        bBud3x9jM9ipavVrd8wAT1+4kBzYtUlPliz5om6QbaMfXyCDTVkmonYkAZEi3IWWThyS
        xEzhgkKhnB9wQlEDarQhD1JsZ2vq3+fA8XWLreVO9Q4I3FHhO2YuA4zezycDC5Uh8UEv
        DDE7S4VeFYPtx7qI9RW6KbXJAhCMgJXPi2OKqw2HRmiXRjQYBhQQ1DcQ52a6tN+xDshK
        SFpPpRNJJdA/Xq9vRq1uFGSR7Y755RHc1HlVCY26+XBdf2BxP432vKvxmF58L/sWzHEz
        1GTw==
X-RZG-AUTH: ":OWANVUa4dPFUgKR/3dpvnYP0Np73amq+g13rqGzvv3qxio1R8fCs/87J3I0="
X-RZG-CLASS-ID: mo00
Received: from oxapp05-03.back.ox.d0m.de
        by smtp-ox.front (RZmta 46.10.7 AUTH)
        with ESMTPSA id e0624aw8J9as666
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Sat, 19 Sep 2020 11:36:54 +0200 (CEST)
Date:   Sat, 19 Sep 2020 11:36:53 +0200 (CEST)
From:   Ulrich Hecht <uli@fpond.eu>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org
Message-ID: <1517062461.1109038.1600508214011@webmail.strato.com>
In-Reply-To: <20200917132117.8515-3-geert+renesas@glider.be>
References: <20200917132117.8515-1-geert+renesas@glider.be>
 <20200917132117.8515-3-geert+renesas@glider.be>
Subject: Re: [PATCH 2/2] arm64: dts: renesas: r8a774c0: Fix MSIOF1 DMA
 channels
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Priority: 3
Importance: Normal
X-Mailer: Open-Xchange Mailer v7.10.3-Rev21
X-Originating-Client: open-xchange-appsuite
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


> On 09/17/2020 3:21 PM Geert Uytterhoeven <geert+renesas@glider.be> wrote:
> 
>  
> According to Technical Update TN-RCT-S0352A/E, MSIOF1 DMA can only be
> used with SYS-DMAC0 on R-Car E3.

This patch changes the file for RZ/G2E, though. And that's not mentioned in the cited document.

CU
Uli
