Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A6B116A7C7D
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  2 Mar 2023 09:23:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229705AbjCBIXi (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 2 Mar 2023 03:23:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229681AbjCBIXi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 2 Mar 2023 03:23:38 -0500
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::222])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41FA0EF99;
        Thu,  2 Mar 2023 00:23:30 -0800 (PST)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 286C740012;
        Thu,  2 Mar 2023 08:23:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1677745408;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=XgLFmbBI3bm6LjHxBdmCtW4GZDhA73P3Vkt9Vt1OCgs=;
        b=jvO69VWOHeQSbr8g5KLcQ6DgaEKEaQbbwBr3iOKxa01wpdSI5R1ryrPd73p32Rcz5DvM0h
        zPmNGjyfvS3ev4DuB0PoRSKHIZYscNmRsWB0zKX3xFt1HaeffYz6sfpp3VHF87iDT44U7J
        O1ROa1Kd6HbTP+U3ot363+4STv9ahNy0HRikkP+eYttDqL9pGBNhoqvajDGLKWB516cQth
        lKCj+mLOa6610A1s+Q127X4re8U7IfIRWtZGQ2WfwSMi/HAeR95vmJO2m8087+WkDqipGf
        XebTz/zmGus8gPOp9B9QV2oy7uhhGc4z5gZ03eK2mLmb+KisSbHKN/U6DPyIVw==
Date:   Thu, 2 Mar 2023 09:23:27 +0100
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Ralph Siemsen <ralph.siemsen@linaro.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH v2 4/4] clk: renesas: r9a06g032: improve clock tables
Message-ID: <20230302092327.234a360e@xps-13>
In-Reply-To: <20230301215520.828455-5-ralph.siemsen@linaro.org>
References: <20230301215520.828455-1-ralph.siemsen@linaro.org>
        <20230301215520.828455-5-ralph.siemsen@linaro.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Ralph,

ralph.siemsen@linaro.org wrote on Wed,  1 Mar 2023 16:55:20 -0500:

> Each entry in the clock table specifies a number of individual bits in
> registers, for contolling clock reset, gaiting, etc. These reg/bit were
> packed into a u16 to save space. The combined value is difficult to
> understand when reviewing the clock table entries.
>=20
> Introduce a "struct regbit" which still occupies only 16 bits, but
> allows the register and bit values to be specified explicitly. Convert
> all previous uses of u16 for reg/bit into "struct regbit".
>=20
> The bulk of this patch converts the clock table to use struct regbit,
> making use of the RB() helper macro. The conversion was automated by
> script, and as a further verification, the compiled binary of the table
> was compared before/after the change (with objdump -D).
>=20
> The clk_rdesc_set() function now checks for zero reg/bit internally.
> This allows callers of that function to remove those checks.
>=20
> Signed-off-by: Ralph Siemsen <ralph.siemsen@linaro.org>

Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>

Thanks,
Miqu=C3=A8l
