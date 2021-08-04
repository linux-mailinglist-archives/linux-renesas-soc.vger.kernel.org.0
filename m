Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E76D3E05C1
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Aug 2021 18:20:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236333AbhHDQUk (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 4 Aug 2021 12:20:40 -0400
Received: from mo4-p00-ob.smtp.rzone.de ([81.169.146.162]:17323 "EHLO
        mo4-p00-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234064AbhHDQUj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 4 Aug 2021 12:20:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1628093840;
    s=strato-dkim-0002; d=fpond.eu;
    h=Subject:References:In-Reply-To:Message-ID:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=g0GYnP3dGz4ruBQtKclIclh6QBiJA0JW+al2ag0oTZY=;
    b=cuE7JVMb+idPOq9Oukoozu1JgSfdNdGBocyXXXHMq1kWHaGEocr3RiI/UFybAVKhuY
    mKFTQc5AiR6r8dfSO9/HFVGC+0z/wykExt30AuEEHEvOnJUPM62o7XjpiiHGsJjKEEaV
    YSEH45bRMqxygtWWI7VDjPCEVyN/94ncDfcFmxHMaa0fS1mMwHed5zD01DrPTHUJvg3m
    D1tA5NrHE1XmekNn+TQ/aTKTi4uz1wSzXBDTkjPTEzOzQlAuPp1w98oA8+Z0tNBHtKDh
    YFkBLoBb8qI4WBKzkO9JqUCT4xrQAC4cgrUw2bGvQtN9kb6Ff1D5ncAb+UMw4qBzZapG
    0s4A==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":OWANVUa4dPFUgKR/3dpvnYP0Np73amq+g13rqGzvv3qxio1R8fCt/7B6PNk="
X-RZG-CLASS-ID: mo00
Received: from oxapp04-01.back.ox.d0m.de
    by smtp-ox.front (RZmta 47.31.0 AUTH)
    with ESMTPSA id v006c2x74GHJ2G4
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
    Wed, 4 Aug 2021 18:17:19 +0200 (CEST)
Date:   Wed, 4 Aug 2021 18:17:19 +0200 (CEST)
From:   Ulrich Hecht <uli@fpond.eu>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Wolfram Sang <wsa@kernel.org>
Cc:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>
Message-ID: <1091982155.203247.1628093839914@webmail.strato.com>
In-Reply-To: <TY2PR01MB369279B6F76FD5C3044FCDDDD8F19@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <20210514155318.16812-1-uli+renesas@fpond.eu>
 <YQQah2Q8qmQPEl7F@ninjato>
 <TY2PR01MB3692486033934E1C007EBF6AD8EF9@TY2PR01MB3692.jpnprd01.prod.outlook.com>
 <821963380.577567.1627903098435@webmail.strato.com>
 <TY2PR01MB369245D958BD9EB77488CB43D8F09@TY2PR01MB3692.jpnprd01.prod.outlook.com>
 <TY2PR01MB369279B6F76FD5C3044FCDDDD8F19@TY2PR01MB3692.jpnprd01.prod.outlook.com>
Subject: RE: [PATCH] mmc: renesas_sdhi: increase suspend/resume latency
 limit
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Priority: 3
Importance: Normal
X-Mailer: Open-Xchange Mailer v7.10.5-Rev17
X-Originating-Client: open-xchange-appsuite
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


> On 08/04/2021 7:29 AM Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com> wrote:
> > From: Yoshihiro Shimoda, Sent: Tuesday, August 3, 2021 8:17 PM
> > 
> > So, I'll test this patch with my test environment tomorrow.
> 
> Unfortunately, this patch failed on mmc_test driver.

Confirmed on Salvator-XS M3-N. :/

> I'm not sure, but perhaps we have a potential issue on runtime PM with SDHI driver?

It sure feels like it.

CU
Uli
