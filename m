Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1FEEF509D8D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 Apr 2022 12:24:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1388270AbiDUKYh (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 21 Apr 2022 06:24:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230060AbiDUKYh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 21 Apr 2022 06:24:37 -0400
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::228])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7EF2215710;
        Thu, 21 Apr 2022 03:21:47 -0700 (PDT)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 345C41BF208;
        Thu, 21 Apr 2022 10:21:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1650536505;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=antY8mJyNO4wQBqR3uhtpfl8UVLsbiKHfwQvj/nrXBE=;
        b=MizrVC0d3AH9cTYec4CMizEnMZBfdshC1OT5apx/5Rh858NfSbxvjpTLm5caHiYV+Gf984
        ubKrF0mhnBF4dxqMItBUVT8AR2MUB42fPekEbcw3E3NGtg3nWFg/JllBS9xkmKe8rcKQ+H
        /2m0lPVQBBmJ6IiYgjl/CQt59HZ4jKdWeq91gmFi3doqeDjEhV6sWa4elpzN1ZcGUSdaL9
        ESDNSUZhXTNgOXfrkOohwpf5oWHQgRz5UK6z1bKHG9e9sQEg/onvZhXgONczp/qBxHFu4M
        h/vCgrPxaQC2iVpwOiCu4/6CfX+EjRiLyaskZv/a7HAHq3LKDWSKVBavhV2cqQ==
Date:   Thu, 21 Apr 2022 12:21:43 +0200
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-renesas-soc@vger.kernel.org, linux-serial@vger.kernel.org,
        Milan Stevanovic <milan.stevanovic@se.com>,
        Jimmy Lalande <jimmy.lalande@se.com>,
        Pascal Eberhard <pascal.eberhard@se.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Herve Codina <herve.codina@bootlin.com>,
        Clement Leger <clement.leger@bootlin.com>,
        Ilpo Jarvinen <ilpo.jarvinen@linux.intel.com>
Subject: Re: [PATCH v6 11/12] bestla: Enable DMA, UART3 and UART4
Message-ID: <20220421122143.7526d676@xps13>
In-Reply-To: <20220421095323.101811-12-miquel.raynal@bootlin.com>
References: <20220421095323.101811-1-miquel.raynal@bootlin.com>
        <20220421095323.101811-12-miquel.raynal@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello,

miquel.raynal@bootlin.com wrote on Thu, 21 Apr 2022 11:53:22 +0200:

> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Please ignore these two dts patches, they were meant for testing
purposes only, sorry for the noise.

Thanks,
Miqu=C3=A8l

> ---
>  .../boot/dts/r9a06g032-rzn1d400-bestla.dts    | 35 +++++++++++++++++++
>  1 file changed, 35 insertions(+)
