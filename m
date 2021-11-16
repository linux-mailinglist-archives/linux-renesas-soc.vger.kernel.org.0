Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 40D9A452F19
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Nov 2021 11:31:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234175AbhKPKeo (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 16 Nov 2021 05:34:44 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:41434
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234157AbhKPKek (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 16 Nov 2021 05:34:40 -0500
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com [209.85.167.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 377573F1A5
        for <linux-renesas-soc@vger.kernel.org>; Tue, 16 Nov 2021 10:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1637058703;
        bh=z+K3n14wNxyJpFthL4d/JKrdOFIgfqkYidh/vwHh0o8=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version:Content-Type;
        b=Se1cPDujcfh+xmtclW5H1YWTw/u8W21jJim8WQFKyovTVAWBfep4ko14C3/EW/Y7V
         kGLyuA3AHRTcgJMR7cFit2M42pS+/8DG696TvqLyAGCRETrujvI9nglhsRmxu/b0HP
         KGuFOgJGbrYBnOeGtFneMtEK00gbRoWP/afc7TPPBaX4uCod6pOJvpf8yOSxWLEozC
         76hopsUzc3Mcbiq7YD9ydV4R/82g/6Go3AEl8YIkOdjgCrzFY/nItO2rOipssX8Sc6
         HzI1BvpKQT6NjEJvap38KWmdk6savcCzfN7ah2L8pF9aidrmK6GcO7SJV1AMq9xsX8
         FNzgxpYT4Zy3Q==
Received: by mail-lf1-f69.google.com with SMTP id x7-20020a056512130700b003fd1a7424a8so7975157lfu.5
        for <linux-renesas-soc@vger.kernel.org>; Tue, 16 Nov 2021 02:31:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=z+K3n14wNxyJpFthL4d/JKrdOFIgfqkYidh/vwHh0o8=;
        b=7TrIdr6w5DCbPFsms/6l/4VY9DiH4OKBVcQJUt0WeKRnrb1OiKuUuZiD2ozOT9nz9B
         GAiGjJfGQDDhAGjDbCIe3cmig6lKTni0K4JbLS8ZjrvZdUsezv+nQrPRaf3lx94vq9Ac
         34UUlw+j360n2/RsgFKr2JzFTSF890nvjOcz0U1C/RXrASArJeDPwQTkDxqu4LZFTHMJ
         ch6bjt6Frg7VWcCQGc5056hUJXBOZJCdtElYV0jun9/CGy4JVBGlBC+qyuNwkVpqsfax
         DpPDmgoWmf/Pg/A0CGtUfrrGNAzGTkWq8LXopeWunLJigw0r6MHFmRQzuWJG0NSZc3Xx
         nrrA==
X-Gm-Message-State: AOAM530XyZypdZ+B+cRJy2qjzRCkoVa6YfVzH31sFdtPhI6aqA9YYddD
        8HtXJCGNoZCC0Ok6/z0ksZsGvZn59Zioc6tcofGlTblKdFFeZTK6V0RP+TRpr5bMYnDFtb9WPV4
        nnn0EOFLUJSWtfK7xtJ9ICcKEMUBn4pdPKHgKouN8xb1ugS3F
X-Received: by 2002:a05:6512:2601:: with SMTP id bt1mr5653780lfb.147.1637058702684;
        Tue, 16 Nov 2021 02:31:42 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyVpknv8td/Cxpbi8ipZR258BpylSboXrsot6U5M9i5s8+zkf0/9R+6Q6RjQtFYrAR4CqJBFg==
X-Received: by 2002:a05:6512:2601:: with SMTP id bt1mr5653761lfb.147.1637058702540;
        Tue, 16 Nov 2021 02:31:42 -0800 (PST)
Received: from localhost.localdomain (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id j5sm1114418lfe.219.2021.11.16.02.31.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Nov 2021 02:31:42 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Mark Brown <broonie@kernel.org>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Sergei Shtylyov <sergei.shtylyov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        linux-mtd@lists.infradead.org, linux-spi@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        devicetree@vger.kernel.org
Subject: Re: (subset) [PATCH v2 1/7] dt-bindings: memory: renesas,rpc-if: Add support for the R9A07G044
Date:   Tue, 16 Nov 2021 11:31:02 +0100
Message-Id: <163705866144.26823.6564269821681639208.b4-ty@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211025205631.21151-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20211025205631.21151-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20211025205631.21151-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, 25 Oct 2021 21:56:25 +0100, Lad Prabhakar wrote:
> SPI Multi I/O Bus Controller on RZ/G2L SoC is almost identical to
> the RPC-IF interface found on R-Car Gen3 SoC's.
> 
> This patch adds a new compatible string to identify the RZ/G2L family
> so that the timing values on RZ/G2L can be adjusted.
> 
> 
> [...]

Applied, thanks!

[1/7] dt-bindings: memory: renesas,rpc-if: Add support for the R9A07G044
      commit: c271aa1f73515bcb35f977f30825832d41a2f504

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
