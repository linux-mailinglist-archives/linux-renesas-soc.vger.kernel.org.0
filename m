Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E46A21642FE
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Feb 2020 12:07:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726691AbgBSLH2 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 19 Feb 2020 06:07:28 -0500
Received: from mo4-p02-ob.smtp.rzone.de ([85.215.255.80]:22258 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726530AbgBSLH2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 19 Feb 2020 06:07:28 -0500
X-Greylist: delayed 447 seconds by postgrey-1.27 at vger.kernel.org; Wed, 19 Feb 2020 06:07:27 EST
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1582110446;
        s=strato-dkim-0002; d=fpond.eu;
        h=Subject:References:In-Reply-To:Message-ID:Cc:To:From:Date:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=6T71QD2Vo8dmsgSNbE8j1x5equ3md8IsMMhzsthbYfQ=;
        b=cunYgKJiT2VVUiYOdXY3q91Ni5A4dfrY/tMiDwcTXL8W3Pm5th3cnlXdegh8GQsquq
        UdJlWn/ix05HXhleBY3/p8k41GaOjr4IHCaIiFmC0m9WjJF9FevvyAG7fdvTG37mnWBu
        Bcar0w4Mlm4YYfEYejH69ICmeiBndNGPKfL6ovEIBrTnE/zgBluuyxlKPmwBoivF1BOv
        fiELHFrg+CVxMLZdHZ7tBjHbrzcV321zYYMPoX+iySSqIYHcX12pEtTVx+lnbLiapXxC
        8pIcLX4A5Uhn8ZGAIDHVFCvGRjxhyPYGzXcPMN86LwccDVeURcJt3tk6ScKZjZiSLvh/
        lP/Q==
X-RZG-AUTH: ":OWANVUa4dPFUgKR/3dpvnYP0Np73amq+g13rqGzvv3qxio1R8fCv/x64iFM="
X-RZG-CLASS-ID: mo00
Received: from oxapp06-03.back.ox.d0m.de
        by smtp-ox.front (RZmta 46.1.12 AUTH)
        with ESMTPSA id L09b9cw1JB1L63F
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Wed, 19 Feb 2020 12:01:21 +0100 (CET)
Date:   Wed, 19 Feb 2020 12:01:21 +0100 (CET)
From:   Ulrich Hecht <uli@fpond.eu>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Message-ID: <1867901409.273361.1582110081464@webmail.strato.com>
In-Reply-To: <20200218133019.22299-5-geert+renesas@glider.be>
References: <20200218133019.22299-1-geert+renesas@glider.be>
 <20200218133019.22299-5-geert+renesas@glider.be>
Subject: Re: [PATCH v2 4/4] arm64: dts: renesas: rzg2: Add reset control
 properties for display
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Priority: 3
Importance: Normal
X-Mailer: Open-Xchange Mailer v7.10.1-Rev26
X-Originating-Client: open-xchange-appsuite
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


> On February 18, 2020 at 2:30 PM Geert Uytterhoeven <geert+renesas@glider.be> wrote:
> 
> 
> Add reset control properties to the device nodes for the Display Units
> on all supported RZ/G2 SoCs.  Note that on these SoCs, there is only a
> single reset for each pair of DU channels.
> 
> Join the clocks lines while at it, to increase uniformity.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

FTR: I can't review this one, I don't have the datasheet.

CU
Uli
