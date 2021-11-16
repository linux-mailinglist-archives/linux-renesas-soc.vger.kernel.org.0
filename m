Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C1545452F20
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Nov 2021 11:31:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234185AbhKPKeo (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 16 Nov 2021 05:34:44 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:56598
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234138AbhKPKen (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 16 Nov 2021 05:34:43 -0500
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com [209.85.208.197])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id ACFC9405F6
        for <linux-renesas-soc@vger.kernel.org>; Tue, 16 Nov 2021 10:31:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1637058705;
        bh=g5kT88EclUTS2mZGyESS2Hco+eCrz9DKbUmHpnwpdJI=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version:Content-Type;
        b=T3K/NAbZ9JkTwqPo6/PR2fssfdYo90IgBnD7Nylg7Bej4XrYc+oAIC3XPcCc/JzJl
         xaER/H8fscF/jQjkA8R700vVGQ7l0vbsSj5jV+lp/A2BiSW4hYUR5AMPNNDdq4ygYF
         JLvWO/7Wm/9TmflamuEENM0pdBDfS8gYp82RlIgK/mD5i0BETchqemXCTvvxLq6cs0
         I2gopi6MB3rq9KBKU157+TEET/sClLByzfbFyu64CvnM2eDylgIKFWdhFSVkPdKwls
         owVBbgnX9KW1k5/1P3sS3ZCd3+UWNMaXVVU5aUVycF6Yorr0DemB1v9uIPDmMuBDUc
         BNGdqBLfsnvkw==
Received: by mail-lj1-f197.google.com with SMTP id b16-20020a2ebc10000000b00218d00045c4so6039105ljf.5
        for <linux-renesas-soc@vger.kernel.org>; Tue, 16 Nov 2021 02:31:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=g5kT88EclUTS2mZGyESS2Hco+eCrz9DKbUmHpnwpdJI=;
        b=Kq4/4nS5KurEWtfRtpDRarU6nOsN9iYB8+x4m9ivp9JO0HuYFNFAZJoQhrLmh8KM7C
         u8IK6bn7GGfv8B0IswWN7rsJRWUExsb6GF1pd2hc3N2wzGY/cL/DIpvnw2VGhCqWc/HS
         GAIAW0gXV8CbrwcTlgNq2J6iiCmIt8vNg7ulQ29Zt1bRpBIB8g/2oJWqkHuUGs7G8zLZ
         Jw8K6bvQETfsx+W99iFcf6/fMHXjyTMn4TuHo/GSm0fUpNtE18G+9ma6TO1QWmbqIZ8M
         Au8FF/O6Kwe8zC3ra5r1AR8elwxXWExFE3vZl8u2lGVm4mxwaMq8l6EWiBo/mg/tRR/r
         hWAA==
X-Gm-Message-State: AOAM532Cn6HHJ5EMd7388aCmnd04oF1jO9vnXXfj2YBhmt0oOvKHFJt7
        fbFHs1QQytj4mCgpHYvAPHGTTIaaU244NbJ5susLiEnD8uhGT7msW0FX+IsfDEXHWW/T6rft3LN
        keJHB6WlhIr3XCSu9bD/hya2jrHIwHvxC0r1nf3YCkHMPknqH
X-Received: by 2002:a05:6512:3a91:: with SMTP id q17mr5473891lfu.425.1637058705238;
        Tue, 16 Nov 2021 02:31:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwUH80JQXZBEvDWfVj29pNQ2Zba/7Rx08vt0/WpoIec8KWneuc1zgQFATOcJm/krv8sKR6wdQ==
X-Received: by 2002:a05:6512:3a91:: with SMTP id q17mr5473855lfu.425.1637058705021;
        Tue, 16 Nov 2021 02:31:45 -0800 (PST)
Received: from localhost.localdomain (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id j5sm1114418lfe.219.2021.11.16.02.31.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Nov 2021 02:31:44 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Mark Brown <broonie@kernel.org>,
        Richard Weinberger <richard@nod.at>,
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
Subject: Re: (subset) [PATCH v2 5/7] memory: renesas-rpc-if: Return error in case devm_ioremap_resource() fails
Date:   Tue, 16 Nov 2021 11:31:04 +0100
Message-Id: <163705866144.26823.3259399993902920486.b4-ty@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211025205631.21151-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20211025205631.21151-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20211025205631.21151-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, 25 Oct 2021 21:56:29 +0100, Lad Prabhakar wrote:
> Make sure we return error in case devm_ioremap_resource() fails for dirmap
> resource.
> 
> 

Applied, thanks!

[5/7] memory: renesas-rpc-if: Return error in case devm_ioremap_resource() fails
      commit: 818fdfa89baac77a8df5a2c30f4fb798cc937aa0

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
