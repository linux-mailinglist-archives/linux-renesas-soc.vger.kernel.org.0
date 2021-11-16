Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0CD21452F23
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Nov 2021 11:31:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234147AbhKPKer (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 16 Nov 2021 05:34:47 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:56638
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234159AbhKPKep (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 16 Nov 2021 05:34:45 -0500
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com [209.85.208.197])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 3CC043F499
        for <linux-renesas-soc@vger.kernel.org>; Tue, 16 Nov 2021 10:31:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1637058708;
        bh=92zi+uaozVd3dQpRcG3KZ4gZNNYCSn9kCZHl66TmEQ4=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version:Content-Type;
        b=eSHrNXAaa7jcE23FJU6xMLwAh58fSEIpwvNDYd2SLdr+rc3pY/Ga8zMfWzT1cmTFK
         oHq1nZvququpBpEg3suchbo+S0I2X/CYmyiaH6SXAoUv4AbD24mEzTV6j0ZnJkfYsl
         LBXJf8oV0SHdmv4EjW8BECZkwOXuLO9jzZkUGNKkHq3bnknfqEbo5mAvaONc+qE8sx
         SkXeDwJJg3fKPFfIRPweyf6LsetSVkR3tRyzFUpY+1dwM9NjzNWurepe9T+IdRvloP
         mxbzJSmcS6jZp4Jb4dQfOl4gUTr1BsC+6yrr8bjVnQetNW0DMTjo/m4fovnUEC3mBa
         AwkkS2Z14xkNw==
Received: by mail-lj1-f197.google.com with SMTP id d20-20020a05651c111400b00218c6372b7eso6084710ljo.16
        for <linux-renesas-soc@vger.kernel.org>; Tue, 16 Nov 2021 02:31:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=92zi+uaozVd3dQpRcG3KZ4gZNNYCSn9kCZHl66TmEQ4=;
        b=fJGRMUNVKTS+y4xXlXnx9fGLETatIxEXeMVin/MJ0jzv6HSms1iNxYCdKUQYjgQ9eH
         c5jZOIzgcXnrFqKwJ8tc5Zd0kaxaMZTTzpqRYe2h6iiWI3bFK778ZQdt+T6eBY/NvzhS
         wATkqAL4NMvSgH8ZwigRM/O8NNMmWNB2xUEOPDVkvjNBFGvuttWvzXTyUOsef/rvYDjT
         xDXKpEehiLS8JhdhoLsfhN8bHRahmCTxiFpGDSjpBTDpaQBQHSx5pIeN81bCTk76z0yt
         RsWCiys8YTRTUPt8BtITsVPj/k4fghecNPp4EY9mFexw5yW6fRjQpe9Q90/JlJLYqQMd
         bVgQ==
X-Gm-Message-State: AOAM531uC/+oIBr+T7U/WGHw6SR20/s8enkuTbI586VX0/hAoqQqH8m7
        XB1Tn4YSWIMwwXdkRKaTpCITxNuv79U2+Vn3pGmS7LZXMhsHZ4Y2m30lHanPEX2OloJxOOjxyeu
        QDXTejYA8jIGLqg8R7GI7vtPwvrlp67ZQmR4uFjKVPe9c+ibT
X-Received: by 2002:a05:6512:1093:: with SMTP id j19mr5749221lfg.340.1637058706565;
        Tue, 16 Nov 2021 02:31:46 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwFJQ83v72RjqgTGJjKyb8RGySZcPwWRf/nb5XIMU/rZuTUXd/qfX1IRjsZ+BlY4jF7IoGErg==
X-Received: by 2002:a05:6512:1093:: with SMTP id j19mr5749196lfg.340.1637058706395;
        Tue, 16 Nov 2021 02:31:46 -0800 (PST)
Received: from localhost.localdomain (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id j5sm1114418lfe.219.2021.11.16.02.31.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Nov 2021 02:31:45 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Richard Weinberger <richard@nod.at>,
        Mark Brown <broonie@kernel.org>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Sergei Shtylyov <sergei.shtylyov@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        linux-mtd@lists.infradead.org, linux-spi@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        devicetree@vger.kernel.org
Subject: Re: (subset) [PATCH v2 6/7] memory: renesas-rpc-if: Drop usage of RPCIF_DIRMAP_SIZE macro
Date:   Tue, 16 Nov 2021 11:31:05 +0100
Message-Id: <163705866144.26823.8540217279898779126.b4-ty@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211025205631.21151-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20211025205631.21151-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20211025205631.21151-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, 25 Oct 2021 21:56:30 +0100, Lad Prabhakar wrote:
> RPCIF_DIRMAP_SIZE may differ on various SoC's. Instead of using
> RPCIF_DIRMAP_SIZE macro use resource size to get dirmap size
> which is already part of struct rpcif.
> 
> 

Applied, thanks!

[6/7] memory: renesas-rpc-if: Drop usage of RPCIF_DIRMAP_SIZE macro
      commit: 5da9b59b23d8112709034a07338e03dcc65fa11f

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
