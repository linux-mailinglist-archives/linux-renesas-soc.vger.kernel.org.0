Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CB7DE6FB067
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 May 2023 14:43:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233974AbjEHMno (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 8 May 2023 08:43:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233767AbjEHMnn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 8 May 2023 08:43:43 -0400
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E629CD;
        Mon,  8 May 2023 05:43:41 -0700 (PDT)
Received: from booty (unknown [77.244.183.192])
        (Authenticated sender: luca.ceresoli@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 75D33FF809;
        Mon,  8 May 2023 12:43:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1683549820;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=RbjRHco8Ak/CTXhOe8RXPCJs2cHCtcL51xq1+hKdFy4=;
        b=Neyx9Vp0qz/3VIDON07izOewMYxIeVnKdolOU/ssIXQYpJnAyiXn0tofdoqicNsknaPUMx
        FawjKqgXXczy53uCZV/YA/PgWdt/6BbwzT7+FN5Zr9D78H+hTncDp0dPFcyywLNg7Y0K6u
        9oFnx8w7o8ySox5nhtU27KqXpgcjMmfmlS3YVXLguqcLzP6KfongoVjM0NyuM4ohsBhUI0
        CfKmJUk0moOtQ9EbWEXYGGGBiRIothXdRfPAyXmXv/UBVYPo3fhWvIivqYLJDdw6r7jzGj
        pX/bpnuqaVQrux7AThg7zyF+vD5IIMadx4XQn93egFJzZ5D2whG+ypPF3oabeQ==
Date:   Mon, 8 May 2023 14:43:37 +0200
From:   Luca Ceresoli <luca.ceresoli@bootlin.com>
To:     Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc:     linux-clk@vger.kernel.org,
        Alex Helms <alexander.helms.jy@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Stephen Boyd <sboyd@kernel.org>, Tom Rix <trix@redhat.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/2] clk: vc5: Use device_get_match_data() instead of
 of_device_get_match_data()
Message-ID: <20230508144337.2f3341bd@booty>
In-Reply-To: <20230507134148.16530-1-marek.vasut+renesas@mailbox.org>
References: <20230507134148.16530-1-marek.vasut+renesas@mailbox.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Sun,  7 May 2023 15:41:47 +0200
Marek Vasut <marek.vasut+renesas@mailbox.org> wrote:

> Use device_get_match_data() which, unlike of_device_get_match_data(),
> is compatible with other firmware interfaces than just OF.
> 
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> ---
> Cc: Alex Helms <alexander.helms.jy@renesas.com>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>
> Cc: Magnus Damm <magnus.damm@gmail.com>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Nathan Chancellor <nathan@kernel.org>
> Cc: Nick Desaulniers <ndesaulniers@google.com>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: Tom Rix <trix@redhat.com>
> Cc: linux-clk@vger.kernel.org
> Cc: linux-renesas-soc@vger.kernel.org

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
