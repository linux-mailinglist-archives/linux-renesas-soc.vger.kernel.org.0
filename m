Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8671147C4BE
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Dec 2021 18:10:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240218AbhLURK0 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 21 Dec 2021 12:10:26 -0500
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:45589 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240185AbhLURKZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 21 Dec 2021 12:10:25 -0500
Received: (Authenticated sender: miquel.raynal@bootlin.com)
        by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 7BE5FE000A;
        Tue, 21 Dec 2021 17:10:21 +0000 (UTC)
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Tudor Ambarus <Tudor.Ambarus@microchip.com>,
        Pratyush Yadav <p.yadav@ti.com>,
        Michael Walle <michael@walle.cc>, linux-mtd@lists.infradead.org
Cc:     Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        Milan Stevanovic <milan.stevanovic@se.com>,
        Jimmy Lalande <jimmy.lalande@se.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        linux-renesas-soc@vger.kernel.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Gareth Williams <gareth.williams.jx@renesas.com>,
        Phil Edworthy <phil.edworthy@renesas.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Wolfram Sang <wsa@kernel.org>,
        Chris Brandt <Chris.Brandt@renesas.com>,
        Ralph Siemsen <ralph.siemsen@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v6 1/4] dt-bindings: mtd: renesas: Describe Renesas R-Car Gen3 & RZ/N1 NAND controller
Date:   Tue, 21 Dec 2021 18:10:21 +0100
Message-Id: <20211221171021.20101-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20211217142033.353599-2-miquel.raynal@bootlin.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'6b85a71cace75c9e06eb02f76216be1e26530058'
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, 2021-12-17 at 14:20:30 UTC, Miquel Raynal wrote:
> Add a Yaml description for this Renesas NAND controller.
> 
> As this controller is embedded on different SoC families, provide:
> * a family-specific "r-car-gen3" compatible and a more specific
>   "r8a77951" one
> * a family-specific "rzn1" compatible and a more specific "r9a06g032"
>   one
> 
> More compatibles can be added later if new SoCs with this controller
> must be supported.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Acked-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next.

Miquel
