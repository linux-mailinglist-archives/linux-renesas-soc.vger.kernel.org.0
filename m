Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 110E31CB1AF
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  8 May 2020 16:25:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726942AbgEHOY7 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 8 May 2020 10:24:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726767AbgEHOY6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 8 May 2020 10:24:58 -0400
X-Greylist: delayed 180 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 08 May 2020 07:24:58 PDT
Received: from mo6-p00-ob.smtp.rzone.de (mo6-p00-ob.smtp.rzone.de [IPv6:2a01:238:20a:202:5300::11])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62470C05BD43
        for <linux-renesas-soc@vger.kernel.org>; Fri,  8 May 2020 07:24:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1588947896;
        s=strato-dkim-0002; d=fpond.eu;
        h=Subject:References:In-Reply-To:Message-ID:Cc:To:Reply-To:From:Date:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=lhXFjhMceHfaOQT7DstHoXQXk+uN44YDU0i3K/XzV1Q=;
        b=S1yJjO6AMf93dYXQRodqkZM/ybARK0AZQ17wiDhol75NoMhoQuqdG/G1zgEb8SttE/
        PO51BgmezjckyCQ3edKTtdhZ4Ij3bgwyG1kiss/icKhcbc/rx54kOWvFZmN00YQ0V5Xo
        pSXBTjiDmHawBDhdcjBzDSc+mWcKV9WyMZS0Sc6BLwhAi8/iHXGq7U/bwhB940M2FV4m
        hjWJyUp+OQIB0lW/EUsNRbfFna7rAjFMYdxB6E6uGmD5ku/hyTRXnBXp2KsytiC87t3c
        qRPW8N74NGHZ13asY2oGg1+bsgtgdBO3PCsTAHCPvtl8pvF+84GuMtUJvp/V5VBNcl3n
        hORA==
X-RZG-AUTH: ":OWANVUa4dPFUgKR/3dpvnYP0Np73amq+g13rqGzvv3qxio1R8fCt/7N+Odk="
X-RZG-CLASS-ID: mo00
Received: from oxapp04-03.back.ox.d0m.de
        by smtp-ox.front (RZmta 46.6.2 AUTH)
        with ESMTPSA id Z0acdaw48ELn52H
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Fri, 8 May 2020 16:21:49 +0200 (CEST)
Date:   Fri, 8 May 2020 16:21:49 +0200 (CEST)
From:   Ulrich Hecht <uli@fpond.eu>
Reply-To: Ulrich Hecht <uli@fpond.eu>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Ulrich Hecht <uli+renesas@fpond.eu>
Cc:     linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Message-ID: <2052458931.972202.1588947709194@webmail.strato.com>
In-Reply-To: <20200508095918.6061-1-geert+renesas@glider.be>
References: <20200508095918.6061-1-geert+renesas@glider.be>
Subject: Re: [PATCH] ARM: dts: r8a7740: Add missing extal2 to CPG node
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Priority: 3
Importance: Normal
X-Mailer: Open-Xchange Mailer v7.10.2-Rev25
X-Originating-Client: open-xchange-appsuite
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


> On May 8, 2020 11:59 AM Geert Uytterhoeven <geert+renesas@glider.be> wrote:
> 
>  
> The Clock Pulse Generator (CPG) device node lacks the extal2 clock.
> This may lead to a failure registering the "r" clock, or to a wrong
> parent for the "usb24s" clock, depending on MD_CK2 pin configuration and
> boot loader CPG_USBCKCR register configuration.
> 
> This went unnoticed, as this does not affect the single upstream board
> configuration, which relies on the first clock input only.
> 
> Fixes: d9ffd583bf345e2e ("ARM: shmobile: r8a7740: add SoC clocks to DTS")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Ulrich Hecht <uli+renesas@fpond.eu>

CU
Uli
