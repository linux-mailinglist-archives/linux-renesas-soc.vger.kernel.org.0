Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC50A3AE438
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Jun 2021 09:35:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229621AbhFUHht (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 21 Jun 2021 03:37:49 -0400
Received: from mo4-p00-ob.smtp.rzone.de ([85.215.255.22]:24030 "EHLO
        mo4-p00-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229618AbhFUHhs (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Jun 2021 03:37:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1624260737;
    s=strato-dkim-0002; d=fpond.eu;
    h=Subject:References:In-Reply-To:Message-ID:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=wZhrR7+d9WLz6ci3mKkCqh+0IwR+CzXEwolzwkFSp8Y=;
    b=PrFXWWlcMzhNAUf1JCYIFtXJCmeBAOmRT886l8XMK9eBB52e0qGQy6hc7AInor/6c9
    m5CwK6PQx+qe+d/QQTROcmwFd7k7mYsA5x7qW1/9BhPo9dQB9SaUeNPofNrm/l5m+OnB
    v/4qKIWQh4UXdMwoMHCNKhuxziL//JtZ7Ws6sUL5MJEsmU0L55nsY+ZCdZC/4zNmm3OW
    pmNteT6xz3yiXMJYuhVtbU6k0JH2qowJcvTpv7uolJWcKV67cparit+Ga5c1v/5N6aCd
    SPO6i7Cp3tuWM5dtlUKMMy21DI1KF5QclSPZ+orSGPtjCtdCIiOQ8fs0WOuMHbk832If
    P51g==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":OWANVUa4dPFUgKR/3dpvnYP0Np73amq+g13rqGzvv3qxio1R8fGl/w2B+Io="
X-RZG-CLASS-ID: mo00
Received: from oxapp02-03.back.ox.d0m.de
    by smtp-ox.front (RZmta 47.27.3 AUTH)
    with ESMTPSA id x09e06x5L7WGCgI
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
    Mon, 21 Jun 2021 09:32:16 +0200 (CEST)
Date:   Mon, 21 Jun 2021 09:32:16 +0200 (CEST)
From:   Ulrich Hecht <uli@fpond.eu>
To:     Adrian Hunter <adrian.hunter@intel.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-mmc <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Message-ID: <563832257.373371.1624260736936@webmail.strato.com>
In-Reply-To: <bbfbed66-5058-1263-159c-dabd345286c8@intel.com>
References: <20210618082317.58408-1-wsa+renesas@sang-engineering.com>
 <CAPDyKFqkW9uwtJyWPFKggi2AJMtO4NJLW-6hviWgGSfoHyDm1A@mail.gmail.com>
 <bbfbed66-5058-1263-159c-dabd345286c8@intel.com>
Subject: Re: [PATCH] mmc: disable tuning when checking card presence
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Priority: 3
Importance: Normal
X-Mailer: Open-Xchange Mailer v7.10.4-Rev25
X-Originating-Client: open-xchange-appsuite
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


> On 06/21/2021 9:15 AM Adrian Hunter <adrian.hunter@intel.com> wrote:
> Can we clarify, is the only problem that the error message is confusing?

AFAICT there are no ill effects of the retune failing apart from the error message.

CU
Uli
