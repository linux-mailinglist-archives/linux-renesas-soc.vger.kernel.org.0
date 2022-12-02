Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9AAF76407F1
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  2 Dec 2022 14:51:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233396AbiLBNvB (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 2 Dec 2022 08:51:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232450AbiLBNvB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 2 Dec 2022 08:51:01 -0500
Received: from mail.3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 284BCD15AF
        for <linux-renesas-soc@vger.kernel.org>; Fri,  2 Dec 2022 05:51:00 -0800 (PST)
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.3ffe.de (Postfix) with ESMTPSA id BB32388;
        Fri,  2 Dec 2022 14:50:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
        t=1669989054;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=tilAL8aqBQUyn2WnIvAxQ51aF8srqNrDTY4JFIBpU7s=;
        b=gsQHzKvfjfX2hKQWxAG3U8OlLn79D3YMj7KHWD5ykMD9WlPkF+l9mW+6kTMTdq23i/eDpf
        fCP5yYx9aBwrdmm2ViFz4emjfUW6MtAAsdYqxrCjc/G2jk+6Xt+dQUrTdaZVnWexMC0NMH
        HtubyqWNYsgZjz05u2RPlREyQ53Rr+kczS9kx3QHPRMOTtPe1ULYDuNw8w4beh/tEbirMH
        P/4xv8Xy6DSrI1m2lV24RbYNLwueQGyANcZIXY+U/4KbTRFt2R5QDrzWl0Ac3cuYTC/Bu0
        /a3fPtRVhRkS8ZFpk7O2qhhF09n8VFzbFJuL9Lf//znZlRcZ9AuQQLR6cG8adA==
MIME-Version: 1.0
Date:   Fri, 02 Dec 2022 14:50:54 +0100
From:   Michael Walle <michael@walle.cc>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Tudor Ambarus <tudor.ambarus@microchip.com>,
        Pratyush Yadav <pratyush@kernel.org>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: mtd: jedec,spi-nor: Document support for
 more MT25QU parts
In-Reply-To: <363186079b4269891073f620e3e2353cf7d2559a.1669988238.git.geert+renesas@glider.be>
References: <363186079b4269891073f620e3e2353cf7d2559a.1669988238.git.geert+renesas@glider.be>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <1503a3857107e3a4f34e0c7fb5dada39@walle.cc>
X-Sender: michael@walle.cc
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Am 2022-12-02 14:37, schrieb Geert Uytterhoeven:
> Document support for the Micron MT25QU256A and MT25QU512A Serial NOR
> FLASHes.
> 
> Merge the new entries with the existing entry for MT25QU02G.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> mt25qu512a is already in active use, causing "make dtbs_check" errors.
> mt25qu256a is supported by the Linux spi-nor driver, but there are no
> upstream users yet.

Is it encouraged to use the specific compatible with SPI-NOR flashes?
As far as I know it isn't. The spi-nor subsys tries hard to identify
any flashes at runtime and any additional information in the device tree
is used as a last resort (just for flashes which doesn't support the
read jedec id command yet). And usually boards have different sources
for flash chips, so hardcoding a particular part in the device tree
doesn't make sense.

just my 2 cents,
-michael
