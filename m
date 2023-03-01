Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2F6D76A6B7A
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  1 Mar 2023 12:13:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229564AbjCALNJ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 1 Mar 2023 06:13:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229437AbjCALNI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 1 Mar 2023 06:13:08 -0500
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::221])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8B3F17CD9;
        Wed,  1 Mar 2023 03:13:06 -0800 (PST)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 4CF86240016;
        Wed,  1 Mar 2023 11:13:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1677669185;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=sJZEoYqQLRPD+xLjYPKC6oXqTgjLrKQArh3n1niOSu0=;
        b=ARaycLaNQg8uRmLugwUn5Oi6H1ZhgtNCM2NH9WlquNnhadWbHY+2+KgG05QzTtAqimqDAW
        O4cuQjL6BSHWT6bxA+kYub/DnTJSy7y/Dlq/IH3a24nubxFFM2J8TzTLsa4VzrARcOeojH
        1HeTObL4Qkj7+2mYNzp7/ZkipPK5NlsZ2rTcPG3Nm2W0+J6GhEbMwxqxyZnnXMZPQbMcC/
        nr4cl2mf+kPsp4mzRDIfzW9mjnxvgbgnU6yFwXuKlZjvrgXcfsH1kGxds8pXwLKAM4ol7k
        mfoDOExG7f7ggVCmPD6QxMIOlnt2Osw3sYfE+Eih28/yhIgfk1yVJ7V4jIw3UQ==
Date:   Wed, 1 Mar 2023 12:13:03 +0100
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Ralph Siemsen <ralph.siemsen@linaro.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH 2/4] clk: renesas: r9a06g032: drop unused fields
Message-ID: <20230301121303.0e79bb83@xps-13>
In-Reply-To: <20230227183937.377612-3-ralph.siemsen@linaro.org>
References: <20230227183937.377612-1-ralph.siemsen@linaro.org>
        <20230227183937.377612-3-ralph.siemsen@linaro.org>
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

ralph.siemsen@linaro.org wrote on Mon, 27 Feb 2023 13:39:34 -0500:

> Drop three unused fields from the clock descriptor structure, and update
> the macros for filling such structures accordingly.
>=20
> The values for such fields are kept in the source code, now unused, in
> case they are needed later.
>=20
> Signed-off-by: Ralph Siemsen <ralph.siemsen@linaro.org>

Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>

Thanks,
Miqu=C3=A8l
