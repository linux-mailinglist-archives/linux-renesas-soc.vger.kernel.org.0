Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1AC7C75C198
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Jul 2023 10:28:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229713AbjGUI2M (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 21 Jul 2023 04:28:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229945AbjGUI2L (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 21 Jul 2023 04:28:11 -0400
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BADAF271F;
        Fri, 21 Jul 2023 01:28:06 -0700 (PDT)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 14019C000B;
        Fri, 21 Jul 2023 08:28:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1689928085;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=6oK8s2+9bUabRHihoIYVqFABjBAIRG/KLAax2RRr0NI=;
        b=ZZkWysdJVJ17zwfnwJ57XB20BrEBMG78ozub8Ea5dL3qWVve+zdtr4+0dOqkspZr0QM1F3
        WzUFt1cHGdBl6T6cbELu1H7+nQJk1sYjzKXETztEHDdF0yzPEH5chftbGkf4tVbXoaOhSb
        V4mqB84YFgluRoYZEZlqbKcellemdZVq/gqafvK5AXZqeDh8pUjg30hC/d5LM8Uu0ekPGu
        BX3LF5INv1l92lJkLC34i6nmERwaPx7eUYsbpobshi3w0r8t5wgWVyBv+vyvSdS3JcxlUN
        USBqh1mldsQnQtAvtrZYYqMmT5elz7134K17ukmqA55jK+S8JAiPibp4c3UJZw==
Date:   Fri, 21 Jul 2023 10:28:02 +0200
From:   Luca Ceresoli <luca.ceresoli@bootlin.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org,
        Marek Vasut <marek.vasut+renesas@mailbox.org>
Subject: Re: [PATCH v2 1/2] clk: vc5: Use i2c_get_match_data() instead of
 device_get_match_data()
Message-ID: <20230721102802.41eeaf12@booty>
In-Reply-To: <20230721070019.96627-2-biju.das.jz@bp.renesas.com>
References: <20230721070019.96627-1-biju.das.jz@bp.renesas.com>
        <20230721070019.96627-2-biju.das.jz@bp.renesas.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-Sasl: luca.ceresoli@bootlin.com
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello Biju,

On Fri, 21 Jul 2023 08:00:18 +0100
Biju Das <biju.das.jz@bp.renesas.com> wrote:

> The device_get_match_data(), is to get match data for firmware interfaces
> such as just OF/ACPI. This driver has I2C matching table as well. Use
> i2c_get_match_data() to get match data for I2C, ACPI and DT-based
> matching.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v1->v2:
>  * Added Rb tags from Geert and Marek.
>  * Removed error check as all tables have data pointers.
>  * Retained Rb tag as the change is trivial.

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
