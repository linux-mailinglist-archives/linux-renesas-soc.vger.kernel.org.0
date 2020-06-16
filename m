Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 327B21FBF8C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Jun 2020 22:01:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728144AbgFPUA2 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 16 Jun 2020 16:00:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730507AbgFPUAZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 16 Jun 2020 16:00:25 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FB29C06174E
        for <linux-renesas-soc@vger.kernel.org>; Tue, 16 Jun 2020 13:00:24 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id a9so21833ljn.6
        for <linux-renesas-soc@vger.kernel.org>; Tue, 16 Jun 2020 13:00:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=from:subject:to:cc:organization:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=BmSBD7h3njitpLi5QsmTDnHJWiGkucDb02pMa3UrBRI=;
        b=WhqH5S0fm4kJwR2Us6nTMFyavpr+p2ob9Rh92WurpdcnnW5dg4ylnEawx9M3rYu501
         d4GfjWWMYHeTubZjlkm4f02fv5NNyjqtykLc+PaQIFEYXzuZ8q37LAxd71Yfce3XRm1E
         agmR/gKyan3/H8rWKzJvDHDLW/cDk0Y8E1iguSPdKAECAJgAjD96Xat6TCetvIpDyOJ2
         A9zPP4Gku7Nd4TI4lCddOFavCkmP+z6JUCfXrJbzslogeCEwe5GBtXxDY6835ZdMBZTs
         SmDAl+uMz9DZT0zSNM3bLpOxSwCB2QmprJxY1rhM2mf1RmMGX5voK9sF7YGACEuKmaSj
         T1xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:organization:message-id:date
         :user-agent:mime-version:content-language:content-transfer-encoding;
        bh=BmSBD7h3njitpLi5QsmTDnHJWiGkucDb02pMa3UrBRI=;
        b=mHJy3YToxP8gQWbGAvOdeh1VEjRG4r/DXY1i5/wp7mSe/7Ea479OJM6g/OdGEtV7h4
         /isALm8CnctWUE2+f1yv/ooXk7Ax9cLcgKt3Defqhqln8a59sGeVfYqIc7TACGvZpRWX
         N3T2RcJJ0q/d0GWFHsSVUsxwXyj3ToV9lmnRy/NPFQaVsSlG3iH31xSCx+msOEqq2qBm
         b5gEM6YsKCAzey1pvm+QPUKvqywbRgEQp4FXY+fQFbIKZm6j+h5OWuQmu++M+kJeb2Zg
         i2W20tig6K2md4AKXQbU5yFuiA3n1viXQWF1hSgpgf+G+hCJD/qKUAaXwPTcS7A8AMqo
         sPFw==
X-Gm-Message-State: AOAM533LCsw6y4o9f/vYjXsDsxgKr9ZywxMhf5yhk3+jk5pd88jwxWB9
        C8bLIuuUXACLxMr+Hpq01AQHJA==
X-Google-Smtp-Source: ABdhPJy8D91PJpYVXRICr86OQToa9hkNd7RwcHACmvb8FHbjd7ERv0jv9sQ0T5ab4xzjIL4LEGIIZw==
X-Received: by 2002:a2e:a495:: with SMTP id h21mr2286305lji.436.1592337622099;
        Tue, 16 Jun 2020 13:00:22 -0700 (PDT)
Received: from wasted.cogentembedded.com ([2a00:1fa0:44fe:a796:a57:d8fd:42a6:762c])
        by smtp.gmail.com with ESMTPSA id b26sm5480405lfp.40.2020.06.16.13.00.20
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 16 Jun 2020 13:00:21 -0700 (PDT)
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH v5 0/2] Add Renesas RPC-IF support
To:     Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        Mason Yang <masonccyang@mxic.com.tw>,
        linux-spi@vger.kernel.org, Chris Brandt <chris.brandt@renesas.com>,
        linux-mtd@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
        Mark Brown <broonie@kernel.org>
Organization: Cogent Embedded
Message-ID: <9969c8a1-e6be-38a9-ced5-ce8c5ff07046@cogentembedded.com>
Date:   Tue, 16 Jun 2020 23:00:20 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello!

Here's a set of 2 patches against Linus' repo. Renesas Reduced Pin Count
Interface (RPC-IF) allows a SPI flash or HyperFlash connected to the SoC
to be accessed via the external address space read mode or the manual mode.
The memory controller driver for RPC-IF registers either SPI or HyperFLash
subdevice, depending on the contents of the device tree subnode; it also
provides the abstract "back end" API that can be used by the "front end"
SPI/MTD drivers to talk to the real hardware...

Based on the original patch by Mason Yang <masonccyang@mxic.com.tw>.

[1/2] dt-bindings: memory: document Renesas RPC-IF bindings
[2/2] memory: add Renesas RPC-IF driver

MBR, Sergei
