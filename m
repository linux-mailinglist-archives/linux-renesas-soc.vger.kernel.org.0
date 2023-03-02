Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0CCAC6A7C7A
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  2 Mar 2023 09:23:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229699AbjCBIXW (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 2 Mar 2023 03:23:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229681AbjCBIXU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 2 Mar 2023 03:23:20 -0500
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::225])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43412EC46;
        Thu,  2 Mar 2023 00:23:12 -0800 (PST)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 275471C0002;
        Thu,  2 Mar 2023 08:23:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1677745390;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=e0TPMdu3lJujwE1hK/YIyo6osAvtcMRM4DqvClnEmJc=;
        b=Xr2H28/1CFwgoyvtzNCPGcNIU/Dg57Td+kKfO4UYRJ0eYDauuLfW0phSAhl3YbrrxK3mVz
        DUYEBpLl0j9DGzGfSTSLr04NYrkPO4fxLm1VAqf00VLa1++OWwL+ja8jIZD0yQq1kmVo7p
        ICkrDIpPTZi1I41rpni1Zbx8y/LkiAE9g9vMx/AGkeR2kvrN7Dmrk2klAg+QEs+8J4GL/p
        lVb9svwnWtyxJI4XgbB21NJUN6cl1Ieewhy3FMcwRuD9IYHTFTrW7Q5siaEcXX5o4iclPj
        67HSMUWom1yDn22wMSAivLlPPEaw+p3CzfYibhSwA+dV1P3wIHtiNiciUQWR6w==
Date:   Thu, 2 Mar 2023 09:23:08 +0100
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Ralph Siemsen <ralph.siemsen@linaro.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH v2 3/4] clk: renesas: r9a06g032: document structs
Message-ID: <20230302092308.5eaedec3@xps-13>
In-Reply-To: <20230301215520.828455-4-ralph.siemsen@linaro.org>
References: <20230301215520.828455-1-ralph.siemsen@linaro.org>
        <20230301215520.828455-4-ralph.siemsen@linaro.org>
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

ralph.siemsen@linaro.org wrote on Wed,  1 Mar 2023 16:55:19 -0500:

> Add some kerneldoc comments for the structures.
>=20
> Signed-off-by: Ralph Siemsen <ralph.siemsen@linaro.org>

Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>

Thanks,
Miqu=C3=A8l
