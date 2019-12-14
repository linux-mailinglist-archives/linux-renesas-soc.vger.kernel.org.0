Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D581011F0AA
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 14 Dec 2019 08:08:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725876AbfLNHIu (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 14 Dec 2019 02:08:50 -0500
Received: from mo4-p00-ob.smtp.rzone.de ([85.215.255.20]:13313 "EHLO
        mo4-p00-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725871AbfLNHIu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 14 Dec 2019 02:08:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1576307324;
        s=strato-dkim-0002; d=fpond.eu;
        h=Subject:References:In-Reply-To:Message-ID:Cc:To:From:Date:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=xoyv/3s59blSQ6n6Btq7mNh0UEMyxLKUvn0Ar4iYJSY=;
        b=mz9AefMFRyFat51BPgCy+lY0MQbghlT6je+ad6XTRO0AuWUN662LRzy+tcueStdq7h
        R5gdpd+5pIGhxPfoyY5y1Ps+ote09kCn96haTkarddJmRJP2p9qJPvH4YEcxtcsvcjcv
        GIEek/+wgxzNfADbiB5EQcAZwy24G64qqB0H/cwlTd0TxPuVJbw8I+5AQEkfu/dqKHXA
        CAArcoRZCVnI1MFfajvYQLE0FVozVoOVW9niQTuQQ9bniGVbWe5KIXH5SStnDnble6al
        fQSxKhXQmAlKIEd1MhWmQ/9AxCKIEPBbN2gToIZ6dodOO9wlKBeKdE6mM1dFdFE3V5tg
        FC+Q==
X-RZG-AUTH: ":OWANVUa4dPFUgKR/3dpvnYP0Np73amq+g13rqGzvv3qxio1R8fGl/w6F/Yo="
X-RZG-CLASS-ID: mo00
Received: from oxapp02-01.back.ox.d0m.de
        by smtp-ox.front (RZmta 46.0.7 AUTH)
        with ESMTPSA id 308726vBE78i6Yz
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Sat, 14 Dec 2019 08:08:44 +0100 (CET)
Date:   Sat, 14 Dec 2019 08:08:44 +0100 (CET)
From:   Ulrich Hecht <uli@fpond.eu>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Message-ID: <506390662.44203.1576307324771@webmail.strato.com>
In-Reply-To: <20191213164115.3697-1-geert+renesas@glider.be>
References: <20191213164115.3697-1-geert+renesas@glider.be>
Subject: Re: [PATCH 0/7] arm: dts: renesas: Group tuples in
 reg/ranges/dma-ranges/states properties
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Priority: 3
Importance: Normal
X-Mailer: Open-Xchange Mailer v7.10.1-Rev25
X-Originating-Client: open-xchange-appsuite
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


> On December 13, 2019 at 5:41 PM Geert Uytterhoeven <geert+renesas@glider.be> wrote:
> 
> 
> 	Hi all,
> 
> To improve human readability and enable automatic validation, tuples
> in various properties should be grouped.  While "make dtbs_check" does
> not impose this yet for all properties, it does for some, hence
> triggering me to fix (I hope) all of them.
> 
> Unfortunately even after this, a few "... is too long" warnings are
> still printed (e.g. for PCI "ranges"), which I believe are false
> positives.
> 
> This series is against renesas-devel-2019-12-13-v5.5-rc1[*] with
> "[PATCH] ARM: dts: rcar-gen2: Fix PCI high address in
> interrupt-map-mask" applied on top.
> 
> Thanks for your comments!

For the whole series:
Reviewed-by: Ulrich Hecht <uli+renesas@fpond.eu>

CU
Uli
