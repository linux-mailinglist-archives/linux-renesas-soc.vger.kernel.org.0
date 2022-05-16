Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C4156528AC0
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 May 2022 18:43:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343774AbiEPQnL (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 16 May 2022 12:43:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242151AbiEPQnJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 16 May 2022 12:43:09 -0400
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::223])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54C513C49B;
        Mon, 16 May 2022 09:43:08 -0700 (PDT)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 6579760004;
        Mon, 16 May 2022 16:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1652719386;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=0iV/a6Ib38YBJ+tsMjvV/v6P/KYjuhqVAUWfGIXMCG8=;
        b=SLJwzD1nBkFyKO84RbgQ7W+kj73nor3EbLFUOBxtaV7+rGIDGox1Dk3xXF5eYy0QG7lPxC
        i1cIFNxyGEswajhhWx6qQLT8z7xC71eOEDGT3D6AcEFB34344PFLkDQT3IktUalyXQo1Ty
        vwbzOlBv0LvNs1YKvRofb4HlES9OW1wcWitEAK2u6ATLGkeh2h4VPdni7iO8u6yqwyCn/A
        mDNAbVEvYd0I53SW2UZiOX9vNj1vRzEZPg1CEfby3zBFZcWWxvhzfI3oJXdl4g559h3Wjb
        supYD9jw1aX9QVf+0b80to7C9kPvfahqN0lGnltr5P5V2fJMeYDsPJLiPK4wOw==
Date:   Mon, 16 May 2022 18:43:01 +0200
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     linux-renesas-soc@vger.kernel.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Gareth Williams <gareth.williams.jx@renesas.com>,
        Phil Edworthy <phil.edworthy@renesas.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Tudor Ambarus <Tudor.Ambarus@microchip.com>,
        Pratyush Yadav <p.yadav@ti.com>,
        Michael Walle <michael@walle.cc>,
        <linux-mtd@lists.infradead.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        devicetree@vger.kernel.org,
        Milan Stevanovic <milan.stevanovic@se.com>,
        Jimmy Lalande <jimmy.lalande@se.com>,
        Pascal Eberhard <pascal.eberhard@se.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Herve Codina <herve.codina@bootlin.com>,
        Clement Leger <clement.leger@bootlin.com>
Subject: Re: [PATCH v4 0/2] mtd: rawnand: renesas: Runtime PM use
Message-ID: <20220516184301.7f0288de@xps-13>
In-Reply-To: <20220513104957.257721-1-miquel.raynal@bootlin.com>
References: <20220513104957.257721-1-miquel.raynal@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi,

miquel.raynal@bootlin.com wrote on Fri, 13 May 2022 12:49:55 +0200:

> There was a small mistake when first introducing this controller driver:
> the power-domain property was missing in the device tree because there
> was only one controller supported at this time (UART) and this is a
> Synopsis IP which did not support power domains. The idea is to always
> use these power domains when available, so let's add it to the bindings,
> the DT and use it from the driver through the runtimpe PM API instead of
> doing raw clk API calls.
>=20
> Changes in v4:
> * Use pm_runtime_resume_and_get() instead of pm_runtime_get_sync().
>=20
> Changes in v3:
> * Moved the pm_runtime calls earlier in the probe to avoid possible
>   register accesses while the clocks have not yet been enabled.
> =20
> Changes in v2:
> * Dropped the DT patch merged by Geert.
> * Used devm_pm_runtime_enable() instead of pm_runtime_enable() and
>   dropped the pm_runtime_disable() calls.
> * Used pm_runtime_resume_and_get() instead of pm_runtime_get_sync().
> * Collected the tags on the bindings.
>=20
> Miquel Raynal (2):
>   dt-bindings: mtd: renesas: Fix the NAND controller description
>   mtd: rawnand: renesas: Use runtime PM instead of the raw clock API
>=20
>  .../bindings/mtd/renesas-nandc.yaml           |  5 ++
>  .../mtd/nand/raw/renesas-nand-controller.c    | 51 +++++++++----------
>  2 files changed, 28 insertions(+), 28 deletions(-)
>=20

Series applied on nand/next.

Thanks,
Miqu=C3=A8l
