Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B2124CA302
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Oct 2019 18:14:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387819AbfJCQLU (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 3 Oct 2019 12:11:20 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:37790 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387808AbfJCQLT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 3 Oct 2019 12:11:19 -0400
Received: by mail-pf1-f195.google.com with SMTP id y5so2080118pfo.4
        for <linux-renesas-soc@vger.kernel.org>; Thu, 03 Oct 2019 09:11:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:from:to:cc:subject:user-agent:date;
        bh=WCl0BJ/xg5z2POfrHRFKcHi5xkDivkEW/iGK30/2GP0=;
        b=Pq/jSr1xmzlqjDuxBQh7dFDV5hRyr6MZtXVubXctjAF8kRjt+U6xL1O1zUsbiV9qug
         ygNsoBsTe8l9J4vQh++/GIEgBZ3tc+dCBa+tnW6tuf4O22v4fqwHlcvMDTQXutYl4bj7
         bWJISwhs7L3e2klQ4E9mPH1vemoDoOFTbhMxY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:from:to:cc:subject
         :user-agent:date;
        bh=WCl0BJ/xg5z2POfrHRFKcHi5xkDivkEW/iGK30/2GP0=;
        b=FzUNCYKqSxxcIyMB5fCXsazuLpFqeWYF3mg2+K+9SDcYCn9lf7/RxdVwuroGnFjbrl
         +nd3j52PmwyB7PQORk2+mCPiI81y5j/xc99O4S2ntuebzkUHrVluxY7If3utoPG0KQdl
         uWQiceKm0kKXe730JATtqp9mwaKhi05t4kbTSxn7P5XxnmcYMjlnqQWMlvWVkdhDrio0
         7NaIJSDggXbbR57VO9fAqPhKGy022jVBDtQ/Npwx/qIujMe8Y1vEtY6Q3Vc0Rzt2gpL9
         RVxGTH9ajyS7uBQDWsW6P4YktsqxBJa9C6AYFPk2l5JfhaGN/MgKGkNaOR4gxO+5Ahdd
         M1Hw==
X-Gm-Message-State: APjAAAXmP13FEuEYIrsw75Y4lgSTYlgAmk11eIARaC81bm05K+J4JxoD
        333zCReB1kHNMrV9UrxwORqzXmH2nZA=
X-Google-Smtp-Source: APXvYqwgRSbE1eF4YKGVz+xu6rX+ntZRdmjPXT4BO1EQpfB2LWEVRFrJK7RpkgO+T9w/1Sx9rAIAHg==
X-Received: by 2002:a17:90a:ba94:: with SMTP id t20mr11602435pjr.8.1570119078443;
        Thu, 03 Oct 2019 09:11:18 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id j25sm4527578pfi.113.2019.10.03.09.11.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Oct 2019 09:11:17 -0700 (PDT)
Message-ID: <5d961da5.1c69fb81.f4dce.d93e@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20191001180622.806-1-geert+renesas@glider.be>
References: <20191001180622.806-1-geert+renesas@glider.be>
From:   Stephen Boyd <swboyd@chromium.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Joerg Roedel <joro@8bytes.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-renesas-soc@vger.kernel.org,
        iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH] iommu/ipmmu-vmsa: Only call platform_get_irq() when interrupt is mandatory
User-Agent: alot/0.8.1
Date:   Thu, 03 Oct 2019 09:11:17 -0700
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Quoting Geert Uytterhoeven (2019-10-01 11:06:22)
> As platform_get_irq() now prints an error when the interrupt does not
> exist, calling it gratuitously causes scary messages like:
>=20
>     ipmmu-vmsa e6740000.mmu: IRQ index 0 not found
>=20
> Fix this by moving the call to platform_get_irq() down, where the
> existence of the interrupt is mandatory.
>=20
> Fixes: 7723f4c5ecdb8d83 ("driver core: platform: Add an error message to =
platform_get_irq*()")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

