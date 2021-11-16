Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C9978452FFD
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Nov 2021 12:12:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234716AbhKPLPR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 16 Nov 2021 06:15:17 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:57850
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234765AbhKPLO4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 16 Nov 2021 06:14:56 -0500
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com [209.85.167.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 1C80E3F1FC
        for <linux-renesas-soc@vger.kernel.org>; Tue, 16 Nov 2021 11:11:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1637061119;
        bh=nrGxaoqv3fyhOTJzGXUVPLJO6wTEQyr0HU27b7o02x0=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version:Content-Type;
        b=hbrn1t+18qDJd0Ge/O1xdaWLb9IKKjALuvT4agR0ZAbYAZ320fKpc/6tiuFH1WgVN
         Fjx8oVunKf1wT25WlWK75vvbxCR8F8t54rOHyJLFC2ymud2kT6LJ4G9tHYWZN0Igof
         N20C5SkcSRJj/QhHpzzUCATRrQivYg2Sqs2mGjontn5bMzeXDb9uHrbjift/BM3muS
         Rzg3x67vaYb7k8B0CMZA+PgCXdLTWFWq1IYA7jJMEsj8ChTlWdxU2rEK87fNnZxb6+
         duy+C0Ja/sW+pSzPYYMdCXfT4EXFgzocfBU9lHmLzGkAUHGWGZCfmMAgAPDvuKuz7t
         CjjyGh5tvMvTA==
Received: by mail-lf1-f70.google.com with SMTP id j9-20020a05651231c900b004037efe9fddso8044051lfe.18
        for <linux-renesas-soc@vger.kernel.org>; Tue, 16 Nov 2021 03:11:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nrGxaoqv3fyhOTJzGXUVPLJO6wTEQyr0HU27b7o02x0=;
        b=Zq/lSpUP2D9T0xk7KBDMy/BEkqigJ0RKK08DWjL1+CP2o6tbo7UbAnS1Jjmw4fesmq
         hItKUOA6CdPHU+h6j2Jpm6HvnerpIwxbmoC3drJwlqfeu23nOV9IFzQn62iAkYo4WuNJ
         yjKeHTUWqc2IMr9wvhQ2B5yksRR3xkhearr0mT6YyXkBRIDi7f20zXjqvi2y7LBN7YO6
         U3ZAjr87fDxtrk4Zl+nJL5iOtQOT1gqsfOLbwTsD9unLBp++jPPCI1vNS8VRar1XpWV5
         6wSOxXrLqD0rPpW4ed63Gc4SVP5h9EF//hBTpM6U/63FIMnXWONJ2Ecv7IUQ+wCSsGBS
         yE1w==
X-Gm-Message-State: AOAM530vPqxkM2nJqVpusZzSUw079qunqfteXanQ7MTfTn/7Z5mk7Fds
        LWDcTHk0aAZoe8sWxOZFiPeFMtOisAXh/BD6x0opwXzCqyNDgota01maVir60bgKsuRSSQOWA8v
        v1SUd3NmlV5sPjw9j/PTar1a/DQG9AH4LW7/yQgSlBOIdRaen
X-Received: by 2002:ac2:55a5:: with SMTP id y5mr5719676lfg.468.1637061118565;
        Tue, 16 Nov 2021 03:11:58 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwFB8CGB99pv7Z7UsgUdq1tSHOm4adL/MVMH5OYqBZECJqMcRYQf5zZBqfhkDpckCfM0VsW7A==
X-Received: by 2002:ac2:55a5:: with SMTP id y5mr5719653lfg.468.1637061118424;
        Tue, 16 Nov 2021 03:11:58 -0800 (PST)
Received: from localhost.localdomain (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id m8sm1724540lfq.27.2021.11.16.03.11.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Nov 2021 03:11:57 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Richard Weinberger <richard@nod.at>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Sergei Shtylyov <sergei.shtylyov@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Prabhakar <prabhakar.csengg@gmail.com>,
        devicetree@vger.kernel.org
Subject: Re: (subset) [PATCH v2 7/7] memory: renesas-rpc-if: Add support for RZ/G2L
Date:   Tue, 16 Nov 2021 12:11:21 +0100
Message-Id: <163706107706.69862.835899154165201477.b4-ty@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211025205631.21151-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20211025205631.21151-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20211025205631.21151-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, 25 Oct 2021 21:56:31 +0100, Lad Prabhakar wrote:
> SPI Multi I/O Bus Controller on RZ/G2L SoC is almost identical to
> the RPC-IF interface found on R-Car Gen3 SoC's.
> 
> This patch adds a new compatible string for the RZ/G2L family so
> that the timing values on RZ/G2L can be adjusted.
> 
> 
> [...]

Applied, thanks!

[7/7] memory: renesas-rpc-if: Add support for RZ/G2L
      commit: b04cc0d912eb80d3c438b11d96ca847c3e77e8ab

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
