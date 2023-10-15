Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 28F267C98EB
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 15 Oct 2023 14:22:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229561AbjJOMWx (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 15 Oct 2023 08:22:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229555AbjJOMWx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 15 Oct 2023 08:22:53 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BB93A9
        for <linux-renesas-soc@vger.kernel.org>; Sun, 15 Oct 2023 05:22:52 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35753C433C8;
        Sun, 15 Oct 2023 12:22:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1697372571;
        bh=Vq1x8fNAr/F5R14kzqqNRk9z6bIRBIK9ilwYC/Yu/n8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=KUUIcofa5nhhHisGxJQ1HY7JhZZ8wEN/koWoaRST6AsmY13ju+N3Uih7pphdxf8Ck
         TfP3h7NaqakIsIVlHTC3Aw34UuX0iPjcL0Jw7c3sceNbf7qfUEOAH+3NHz5bAS2T8n
         1HYGpgModnd2INeLjnamqfCSqa+jhfmJ4khpqgWEQepmUjiOHlsUjGSl0p/+GvbIqk
         fLjfVlEKB+zrMui7gpV13nIlDPisHHFYZ2lTkkrCFLmLuZOvIn3ibiR52HXfATT3V1
         IyDF3p/GtG1qSC3/GEfiE/qoD0mzPDEGbedNFcgfyq3Jyxgj9AUl9OD+Hidw7pG07J
         Q2QkkavLa0bZA==
From:   Conor Dooley <conor@kernel.org>
To:     linux-riscv@lists.indradead.org,
        Conor Dooley <conor.dooley@microchip.com>
Cc:     conor@kernel.org, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Daire McNamara <daire.mcnamara@microchip.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Emil Renner Berthing <kernel@esmil.dk>,
        Jisheng Zhang <jszhang@kernel.org>,
        Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
        Chen Wang <unicorn_wang@outlook.com>,
        devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-sunxi@lists.linux.dev, linux-renesas-soc@vger.kernel.org
Subject: Re: (subset) [PATCH v3 0/6] riscv,isa-extensions additions
Date:   Sun, 15 Oct 2023 13:22:02 +0100
Message-Id: <20231015-qualifier-campus-97bf09059d51@spud>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231009-approve-verbalize-ce9324858e76@wendy>
References: <20231009-approve-verbalize-ce9324858e76@wendy>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=openpgp-sha256; l=870; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=JxLsg/nX2rHAa/nDvg2BonZ/j7ra8ax29aRGRmkFUGU=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDKnaN9MXZh9OfZttW3bgD9O9h39Tj8kd+3X1nVVa3eZTJ Yyh/zXzOkpZGMQ4GGTFFFkSb/e1SK3/47LDuectzBxWJpAhDFycAjCRacwM/93VTu1Mu3pe8cfd nZ0eCnMezgzT645bJ35u6ZRQL6/Pi0IYGVbu/cq9Z+JE6QsdR6fxuVx5UaU/rTfZWmCVugDX7tA 3fOwA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Conor Dooley <conor.dooley@microchip.com>

On Mon, 09 Oct 2023 10:37:44 +0100, Conor Dooley wrote:
> Now with the RFC tag dropped. There are no changes here from "RFC v2",
> other than the addition of tags that were provided along the way. I have
> not added "Zfh" to the T-Head based stuff, as I can't actually read the
> documentation that would show that they're encoding-for-encoding
> compatible with the standard extension, since it is apparently only in
> Chinese.
> 
> [...]

The first 3 applied to riscv-dt-for-next, I expect the rest to go via
their respective platform maintainers.

[1/6] riscv: dts: microchip: convert isa detection to new properties
      https://git.kernel.org/conor/c/561add0da6d3
[2/6] riscv: dts: sifive: convert isa detection to new properties
      https://git.kernel.org/conor/c/a54f42722e49
[3/6] riscv: dts: starfive: convert isa detection to new properties
      https://git.kernel.org/conor/c/81b5948cf1a7

Thanks,
Conor.
